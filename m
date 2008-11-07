From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: libfdt: Property iteration
Date: Fri, 7 Nov 2008 13:54:44 +1100
Message-ID: <20081107025444.GK6692@yookeroo.seuss>
References: <20081027221441.GA8763@ld0162-tx32.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081027221441.GA8763-VKaLA/mbEU932VTgPCOETVjVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 27, 2008 at 05:14:41PM -0500, Scott Wood wrote:
> A while back when discussing property iterators
> (http://ozlabs.org/pipermail/linuxppc-dev/2008-January/049891.html), you
> said that you'd prefer not to expose property offsets, because more
> common uses would be affected by changing offsets.  I'm looking again at
> this, and was wondering what alternative and would-be-broken use cases
> you were thinking of?

Hrm, well I didn't have things in mind all that precisely.  I was just
thinking that it's fairly common to grab a node, then manipulate
various properties within it in a more-or-less random-access sort of
way.

Whereas when finding nodes, ofetn one tends to work down the tree to a
particular node, and the only things you're interested in keeping tabs
on (for a little while at least) are some of the ancestors of this
node - whose offsets are guaranteed not to be messed with by
manipulations within the descendant.

> We could operate on property indices or names at an efficiency cost. 
> Most nodes should be small enough that the cost isn't too much, but I'd
> like to know which use cases really need it.  The ones I'd use it for
> involve reading from one tree and adding to another, so moving offsets
> aren't an issue.

I don't think indices buy us much over offsets.  They can still change
with node insertions or deletions.

> Even in a use case where one makes in-place changes while iterating over
> properties, changes to the property currently being iterated over should
> only move later properties -- the next call to fdt_next_prop would be
> based on the start of the property that was modified, which did not
> change.

That's true; unless you delete the property entirely.  Inserting an
unrelated property is also potentially dangerous, though from the
looks of it we always insert properties at the end in libfdt, so that
should work ok.

Fwiw, I (somewhat reluctantly) accepted the need for property offsets,
in the prototype patch for property iteration I had.  I was going to
polish it up and push it out, but got sidetracked by other things.
I've included it below, maybe you'll get to the polishing before I do.

Index: dtc/libfdt/fdt.c
===================================================================
--- dtc.orig/libfdt/fdt.c	2008-02-14 11:20:40.000000000 +1100
+++ dtc/libfdt/fdt.c	2008-02-14 14:17:19.000000000 +1100
@@ -90,6 +90,31 @@
 	return p;
 }
 
+const struct fdt_property *_fdt_offset_property(const void *fdt, int offset,
+					       int *lenp)
+{
+	const struct fdt_property *prop;
+	int len;
+
+	if (lenp)
+		*lenp = -FDT_ERR_BADSTRUCTURE;
+
+	prop = fdt_offset_ptr(fdt, offset, sizeof(*prop));
+	if (!prop)
+		return NULL;
+
+	len = fdt32_to_cpu(prop->len);
+
+	prop = fdt_offset_ptr(fdt, offset, sizeof(*prop)+len);
+	if (!prop)
+		return NULL;
+
+	if (lenp)
+		*lenp = len;
+
+	return prop;
+}
+
 uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset)
 {
 	const uint32_t *tagp, *lenp;
@@ -170,6 +195,46 @@
 	return offset;
 }
 
+int _fdt_next_property(const void *fdt, int offset)
+{
+	uint32_t tag;
+	int nextoffset;
+	int err;
+
+	if ((err = fdt_check_header(fdt)) != 0)
+		return err;
+
+	if (offset % FDT_TAGSIZE)
+		return -FDT_ERR_BADOFFSET;
+
+	tag = fdt_next_tag(fdt, offset, &nextoffset);
+	if ((tag != FDT_BEGIN_NODE) && (tag != FDT_PROP))
+		return -FDT_ERR_BADOFFSET;
+
+	do {
+		offset = nextoffset;
+
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		switch (tag) {
+		case FDT_END:
+			return -FDT_ERR_TRUNCATED;
+
+		case FDT_BEGIN_NODE:
+		case FDT_END_NODE:
+		case FDT_NOP:
+			break;
+
+		case FDT_PROP:
+			return offset;
+
+		default:
+			return -FDT_ERR_BADSTRUCTURE;
+		}
+	} while (tag == FDT_NOP);
+
+	return -FDT_ERR_NOTFOUND;
+}
+
 const char *_fdt_find_string(const char *strtab, int tabsize, const char *s)
 {
 	int len = strlen(s) + 1;
Index: dtc/libfdt/fdt_ro.c
===================================================================
--- dtc.orig/libfdt/fdt_ro.c	2008-02-14 11:20:40.000000000 +1100
+++ dtc/libfdt/fdt_ro.c	2008-02-14 13:18:21.000000000 +1100
@@ -190,68 +190,22 @@
 					    int nodeoffset,
 					    const char *name, int *lenp)
 {
-	uint32_t tag;
 	const struct fdt_property *prop;
-	int namestroff;
-	int offset, nextoffset;
-	int err;
+	const char *pname;
+	int offset = nodeoffset;
 
-	if ((err = fdt_check_header(fdt)) != 0)
-		goto fail;
-
-	err = -FDT_ERR_BADOFFSET;
-	if (nodeoffset % FDT_TAGSIZE)
-		goto fail;
-
-	tag = fdt_next_tag(fdt, nodeoffset, &nextoffset);
-	if (tag != FDT_BEGIN_NODE)
-		goto fail;
-
-	do {
-		offset = nextoffset;
-
-		tag = fdt_next_tag(fdt, offset, &nextoffset);
-		switch (tag) {
-		case FDT_END:
-			err = -FDT_ERR_TRUNCATED;
-			goto fail;
-
-		case FDT_BEGIN_NODE:
-		case FDT_END_NODE:
-		case FDT_NOP:
-			break;
-
-		case FDT_PROP:
-			err = -FDT_ERR_BADSTRUCTURE;
-			prop = fdt_offset_ptr(fdt, offset, sizeof(*prop));
-			if (! prop)
-				goto fail;
-			namestroff = fdt32_to_cpu(prop->nameoff);
-			if (streq(fdt_string(fdt, namestroff), name)) {
-				/* Found it! */
-				int len = fdt32_to_cpu(prop->len);
-				prop = fdt_offset_ptr(fdt, offset,
-						      sizeof(*prop)+len);
-				if (! prop)
-					goto fail;
-
-				if (lenp)
-					*lenp = len;
-
-				return prop;
-			}
-			break;
-
-		default:
-			err = -FDT_ERR_BADSTRUCTURE;
-			goto fail;
-		}
-	} while ((tag != FDT_BEGIN_NODE) && (tag != FDT_END_NODE));
+	while ((offset = _fdt_next_property(fdt, offset)) >= 0) {
+		prop = fdt_offset_property(fdt, offset, lenp);
+		if (!prop)
+			return NULL;
+		pname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
+		if (streq(pname, name))
+			/* Found it! */
+			return prop;
+	}
 
-	err = -FDT_ERR_NOTFOUND;
- fail:
 	if (lenp)
-		*lenp = err;
+		*lenp = offset;
 	return NULL;
 }
 
Index: dtc/libfdt/libfdt_internal.h
===================================================================
--- dtc.orig/libfdt/libfdt_internal.h	2008-02-14 11:20:40.000000000 +1100
+++ dtc/libfdt/libfdt_internal.h	2008-02-14 13:18:21.000000000 +1100
@@ -59,6 +59,7 @@
 #define streq(p, q)	(strcmp((p), (q)) == 0)
 
 uint32_t _fdt_next_tag(const void *fdt, int startoffset, int *nextoffset);
+int _fdt_next_property(const void *fdt, int offset);
 const char *_fdt_find_string(const char *strtab, int tabsize, const char *s);
 int _fdt_node_end_offset(void *fdt, int nodeoffset);
 
Index: dtc/libfdt/libfdt.h
===================================================================
--- dtc.orig/libfdt/libfdt.h	2008-02-14 11:20:40.000000000 +1100
+++ dtc/libfdt/libfdt.h	2008-02-14 14:19:20.000000000 +1100
@@ -128,6 +128,9 @@
 	return (void *)fdt_offset_ptr(fdt, offset, checklen);
 }
 
+const struct fdt_property *_fdt_offset_property(const void *fdt, int offset,
+						int *lenp);
+
 uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
 
 /**********************************************************************/
@@ -136,6 +139,11 @@
 
 int fdt_next_node(const void *fdt, int offset, int *depth);
 
+#define for_each_property(fdt, node, prop, len) \
+	for (int _off = fdt_next_property((fdt), (node)); \
+	     (_off >= 0) && \
+		     (((prop) = fdt_offset_property((fdt), _off, &(len))) >= 0);)
+
 /**********************************************************************/
 /* General functions                                                  */
 /**********************************************************************/
@@ -256,6 +264,7 @@
  */
 int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size);
 
+
 /**
  * fdt_subnode_offset_namelen - find a subnode based on substring
  * @fdt: pointer to the device tree blob


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
