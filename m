From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [1/2] libfdt: Rework fdt_next_node()
Date: Tue, 11 Nov 2008 23:19:36 +1100
Message-ID: <20081111121936.GI26376@yookeroo.seuss>
References: <20081111121804.GH26376@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081111121804.GH26376-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently fdt_next_node() will find the next node in the blob
regardless of whether it is above, below or at the same level in the
tree as the starting node - the depth parameter is updated to indicate
which is the case.  When a depth parameter is supplied, this patch
makes it instead terminate immediately when it finds the END_NODE tag
for a node at depth 0.  In this case it returns the offset immediately
past the END_NODE tag.

This has a couple of advantages.  First, this slightly simplifies
fdt_subnode_offset(), which no longer needs to explicitly check that
fdt_next_node()'s iteration hasn't left the starting node.  Second,
this allows fdt_next_node() to be used to implement
_fdt_node_end_offset() considerably simplifying the latter function.

The other users of fdt_next_node() either don't need to iterate out of
the starting node, or don't pass a depth parameter at all.  Any
callers that really need to iterate out of the starting node, but keep
tracking depth can do so by biasing the initial depth value.

This is a semantic change, but I think it's very unlikely to break any
existing library users.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/libfdt/fdt.c
===================================================================
--- dtc.orig/libfdt/fdt.c	2008-11-07 17:42:53.000000000 +1100
+++ dtc/libfdt/fdt.c	2008-11-07 18:15:37.000000000 +1100
@@ -162,8 +162,8 @@ int fdt_next_node(const void *fdt, int o
 			break;
 
 		case FDT_END_NODE:
-			if (depth)
-				(*depth)--;
+			if (depth && ((--(*depth)) < 0))
+				return nextoffset;
 			break;
 
 		case FDT_END:
Index: dtc/libfdt/fdt_ro.c
===================================================================
--- dtc.orig/libfdt/fdt_ro.c	2008-11-07 17:47:14.000000000 +1100
+++ dtc/libfdt/fdt_ro.c	2008-11-07 18:17:37.000000000 +1100
@@ -108,24 +108,20 @@ int fdt_num_mem_rsv(const void *fdt)
 int fdt_subnode_offset_namelen(const void *fdt, int offset,
 			       const char *name, int namelen)
 {
-	int depth = 0;
+	int depth;
 
 	FDT_CHECK_HEADER(fdt);
 
-	for (depth = 0, offset = fdt_next_node(fdt, offset, &depth);
-	     (offset >= 0) && (depth > 0);
-	     offset = fdt_next_node(fdt, offset, &depth)) {
-		if (depth < 0)
-			return -FDT_ERR_NOTFOUND;
-		else if ((depth == 1)
-			 && _fdt_nodename_eq(fdt, offset, name, namelen))
+	for (depth = 0;
+	     (offset >= 0) && (depth >= 0);
+	     offset = fdt_next_node(fdt, offset, &depth))
+		if ((depth == 1)
+		    && _fdt_nodename_eq(fdt, offset, name, namelen))
 			return offset;
-	}
 
-	if (offset < 0)
-		return offset; /* error */
-	else
+	if (depth < 0)
 		return -FDT_ERR_NOTFOUND;
+	return offset; /* error */
 }
 
 int fdt_subnode_offset(const void *fdt, int parentoffset,
Index: dtc/libfdt/fdt_wip.c
===================================================================
--- dtc.orig/libfdt/fdt_wip.c	2008-11-07 18:16:46.000000000 +1100
+++ dtc/libfdt/fdt_wip.c	2008-11-07 18:19:14.000000000 +1100
@@ -94,41 +94,14 @@ int fdt_nop_property(void *fdt, int node
 	return 0;
 }
 
-int _fdt_node_end_offset(void *fdt, int nodeoffset)
+int _fdt_node_end_offset(void *fdt, int offset)
 {
-	int level = 0;
-	uint32_t tag;
-	int offset, nextoffset;
-
-	tag = fdt_next_tag(fdt, nodeoffset, &nextoffset);
-	if (tag != FDT_BEGIN_NODE)
-		return -FDT_ERR_BADOFFSET;
-	do {
-		offset = nextoffset;
-		tag = fdt_next_tag(fdt, offset, &nextoffset);
-
-		switch (tag) {
-		case FDT_END:
-			return offset;
-
-		case FDT_BEGIN_NODE:
-			level++;
-			break;
-
-		case FDT_END_NODE:
-			level--;
-			break;
-
-		case FDT_PROP:
-		case FDT_NOP:
-			break;
-
-		default:
-			return -FDT_ERR_BADSTRUCTURE;
-		}
-	} while (level >= 0);
+	int depth = 0;
 
-	return nextoffset;
+	while ((offset >= 0) && (depth >= 0))
+		offset = fdt_next_node(fdt, offset, &depth);
+
+	return offset;
 }
 
 int fdt_nop_node(void *fdt, int nodeoffset)

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
