From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 39/42] drivers/of: Unflatten nodes equal or deeper than specified level
Date: Thu,  4 Jun 2015 16:42:08 +1000
Message-ID: <1433400131-18429-40-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433400131-18429-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

unflatten_dt_node() is called recursively to unflatten FDT nodes
with the assumption that FDT blob has only one root node, which
isn't true when the FDT blob represents device sub-tree. The
patch improves the function to supporting device sub-tree that
have multiple root nodes:

   * Rename original unflatten_dt_node() to __unflatten_dt_node().
   * Wrapper unflatten_dt_node() calls __unflatten_dt_node() with
     adjusted current node depth to 1 to avoid underflow.

Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
v5:
  * Split from PATCH[v4 19/21]
  * Fixed "line over 80 characters" from checkpatch.pl
---
 drivers/of/fdt.c | 56 ++++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index cde35c5d01..b87c157 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -28,6 +28,8 @@
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
 
+static int cur_node_depth;
+
 /*
  * of_fdt_limit_memory - limit the number of regions in the /memory node
  * @limit: maximum entries
@@ -161,27 +163,26 @@ static void *unflatten_dt_alloc(void **mem, unsigned long size,
 }
 
 /**
- * unflatten_dt_node - Alloc and populate a device_node from the flat tree
+ * __unflatten_dt_node - Alloc and populate a device_node from the flat tree
  * @blob: The parent device tree blob
  * @mem: Memory chunk to use for allocating device nodes and properties
  * @p: pointer to node in flat tree
  * @dad: Parent struct device_node
  * @fpsize: Size of the node path up at the current depth.
  */
-static void * unflatten_dt_node(void *blob,
-				void *mem,
-				int *poffset,
-				struct device_node *dad,
-				struct device_node **nodepp,
-				unsigned long fpsize,
-				bool dryrun)
+static void *__unflatten_dt_node(void *blob,
+				 void *mem,
+				 int *poffset,
+				 struct device_node *dad,
+				 struct device_node **nodepp,
+				 unsigned long fpsize,
+				 bool dryrun)
 {
 	const __be32 *p;
 	struct device_node *np;
 	struct property *pp, **prev_pp = NULL;
 	const char *pathp;
 	unsigned int l, allocl;
-	static int depth = 0;
 	int old_depth;
 	int offset;
 	int has_name = 0;
@@ -334,13 +335,19 @@ static void * unflatten_dt_node(void *blob,
 			np->type = "<NULL>";
 	}
 
-	old_depth = depth;
-	*poffset = fdt_next_node(blob, *poffset, &depth);
-	if (depth < 0)
-		depth = 0;
-	while (*poffset > 0 && depth > old_depth)
-		mem = unflatten_dt_node(blob, mem, poffset, np, NULL,
-					fpsize, dryrun);
+	old_depth = cur_node_depth;
+	*poffset = fdt_next_node(blob, *poffset, &cur_node_depth);
+	while (*poffset > 0) {
+		if (cur_node_depth < old_depth)
+			break;
+
+		if (cur_node_depth == old_depth)
+			mem = __unflatten_dt_node(blob, mem, poffset,
+						  dad, NULL, fpsize, dryrun);
+		else if (cur_node_depth > old_depth)
+			mem = __unflatten_dt_node(blob, mem, poffset,
+						  np, NULL, fpsize, dryrun);
+	}
 
 	if (*poffset < 0 && *poffset != -FDT_ERR_NOTFOUND)
 		pr_err("unflatten: error %d processing FDT\n", *poffset);
@@ -366,6 +373,18 @@ static void * unflatten_dt_node(void *blob,
 	return mem;
 }
 
+static void *unflatten_dt_node(void *blob,
+			       void *mem,
+			       int *poffset,
+			       struct device_node *dad,
+			       struct device_node **nodepp,
+			       bool dryrun)
+{
+	cur_node_depth = 1;
+	return __unflatten_dt_node(blob, mem, poffset,
+				   dad, nodepp, 0, dryrun);
+}
+
 /**
  * __unflatten_device_tree - create tree of device_nodes from flat blob
  *
@@ -405,7 +424,8 @@ static void __unflatten_device_tree(void *blob,
 
 	/* First pass, scan for size */
 	start = 0;
-	size = (unsigned long)unflatten_dt_node(blob, NULL, &start, NULL, NULL, 0, true);
+	size = (unsigned long)unflatten_dt_node(blob, NULL, &start,
+						NULL, NULL, true);
 	size = ALIGN(size, 4);
 
 	pr_debug("  size is %lx, allocating...\n", size);
@@ -420,7 +440,7 @@ static void __unflatten_device_tree(void *blob,
 
 	/* Second pass, do actual unflattening */
 	start = 0;
-	unflatten_dt_node(blob, mem, &start, NULL, mynodes, 0, false);
+	unflatten_dt_node(blob, mem, &start, NULL, mynodes, false);
 	if (be32_to_cpup(mem + size) != 0xdeadbeef)
 		pr_warning("End of tree marker overwritten: %08x\n",
 			   be32_to_cpup(mem + size));
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
