From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [2/2] libfdt: Rework/cleanup fdt_next_tag()
Date: Fri, 6 Feb 2009 14:03:24 +1100
Message-ID: <20090206030324.GH18397@yookeroo.seuss>
References: <20090206024929.GC18397@yookeroo.seuss>
	<20090206030156.GG18397@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090206030156.GG18397-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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

Currently, callers of fdt_next_tag() must usually follow the call with
some sort of call to fdt_offset_ptr() to verify that the blob isn't
truncated in the middle of the tag data they're going to process.
This is a bit silly, since fdt_next_tag() generally has to call
fdt_offset_ptr() on at least some of the data following the tag for
its own operation.

This patch alters fdt_next_tag() to always use fdt_offset_ptr() to
verify the data between its starting offset and the offset it returns
in nextoffset.  This simplifies fdt_get_property() which no longer has
to verify itself that the property data is all present.

At the same time, I neaten and clarify the error handling for
fdt_next_tag().  Previously, fdt_next_tag() could return -1 instead of
a tag value in some circumstances - which almost none of the callers
checked for.  Also, fdt_next_tag() could return FDT_END either because
it encountered an FDT_END tag, or because it reached the end of the
structure block - no way was provided to tell between these cases.

With this patch, fdt_next_tag() always returns FDT_END with a negative
value in nextoffset for an error.  This means the several places which
loop looking for FDT_END will still work correctly - they only need to
check for errors at the end.  The errors which fdt_next_tag() can
report are:
	- -FDT_ERR_TRUNCATED if it reached the end of the structure
	   block instead of finding a tag.

	- -FDT_BADSTRUCTURE if a bad tag was encountered, or if the
           tag data couldn't be verified with fdt_offset_ptr().

This patch also updates the callers of fdt_next_tag(), where
appropriate, to make use of the new error reporting.

Finally, the prototype for the long gone _fdt_next_tag() is removed
from libfdt_internal.h.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 libfdt/fdt.c             |   46 +++++++++++++++++++++++++++++-----------------
 libfdt/fdt_ro.c          |   33 +++++++++------------------------
 libfdt/fdt_rw.c          |    2 ++
 libfdt/fdt_sw.c          |    9 ++++-----
 libfdt/libfdt_internal.h |    1 -
 5 files changed, 44 insertions(+), 47 deletions(-)

Index: dtc/libfdt/fdt.c
===================================================================
--- dtc.orig/libfdt/fdt.c	2009-02-06 13:47:44.000000000 +1100
+++ dtc/libfdt/fdt.c	2009-02-06 13:47:55.000000000 +1100
@@ -90,42 +90,53 @@ const void *fdt_offset_ptr(const void *f
 	return p;
 }
 
-uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset)
+uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 {
 	const uint32_t *tagp, *lenp;
 	uint32_t tag;
+	int offset = startoffset;
 	const char *p;
 
-	if (offset % FDT_TAGSIZE)
-		return -1;
-
+	*nextoffset = -FDT_ERR_TRUNCATED;
 	tagp = fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
-	if (! tagp)
+	if (!tagp)
 		return FDT_END; /* premature end */
 	tag = fdt32_to_cpu(*tagp);
 	offset += FDT_TAGSIZE;
 
+	*nextoffset = -FDT_ERR_BADSTRUCTURE;
 	switch (tag) {
 	case FDT_BEGIN_NODE:
 		/* skip name */
 		do {
 			p = fdt_offset_ptr(fdt, offset++, 1);
 		} while (p && (*p != '\0'));
-		if (! p)
-			return FDT_END;
+		if (!p)
+			return FDT_END; /* premature end */
 		break;
+
 	case FDT_PROP:
 		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
-		if (! lenp)
-			return FDT_END;
-		/* skip name offset, length and value */
-		offset += 2*FDT_TAGSIZE + fdt32_to_cpu(*lenp);
+		if (!lenp)
+			return FDT_END; /* premature end */
+		/* skip-name offset, length and value */
+		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
+			+ fdt32_to_cpu(*lenp);
+		break;
+
+	case FDT_END:
+	case FDT_END_NODE:
+	case FDT_NOP:
 		break;
+
+	default:
+		return FDT_END;
 	}
 
-	if (nextoffset)
-		*nextoffset = FDT_TAGALIGN(offset);
+	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
+		return FDT_END; /* premature end */
 
+	*nextoffset = FDT_TAGALIGN(offset);
 	return tag;
 }
 
@@ -167,10 +178,11 @@ int fdt_next_node(const void *fdt, int o
 			break;
 
 		case FDT_END:
-			return -FDT_ERR_NOTFOUND;
-
-		default:
-			return -FDT_ERR_BADSTRUCTURE;
+			if ((nextoffset >= 0)
+			    || ((nextoffset == -FDT_ERR_TRUNCATED) && !depth))
+				return -FDT_ERR_NOTFOUND;
+			else
+				return nextoffset;
 		}
 	} while (tag != FDT_BEGIN_NODE);
 
Index: dtc/libfdt/fdt_rw.c
===================================================================
--- dtc.orig/libfdt/fdt_rw.c	2009-02-06 13:47:44.000000000 +1100
+++ dtc/libfdt/fdt_rw.c	2009-02-06 13:47:55.000000000 +1100
@@ -406,6 +406,8 @@ int fdt_open_into(const void *fdt, void 
 		struct_size = 0;
 		while (fdt_next_tag(fdt, struct_size, &struct_size) != FDT_END)
 			;
+		if (struct_size < 0)
+			return struct_size;
 	}
 
 	if (!_fdt_blocks_misordered(fdt, mem_rsv_size, struct_size)) {
Index: dtc/libfdt/fdt_sw.c
===================================================================
--- dtc.orig/libfdt/fdt_sw.c	2009-02-06 13:47:44.000000000 +1100
+++ dtc/libfdt/fdt_sw.c	2009-02-06 13:47:55.000000000 +1100
@@ -82,7 +82,7 @@ static void *_fdt_grab_space(void *fdt, 
 		return NULL;
 
 	fdt_set_size_dt_struct(fdt, offset + len);
-	return fdt_offset_ptr_w(fdt, offset, len);
+	return _fdt_offset_ptr_w(fdt, offset);
 }
 
 int fdt_create(void *buf, int bufsize)
@@ -237,18 +237,17 @@ int fdt_finish(void *fdt)
 	while ((tag = fdt_next_tag(fdt, offset, &nextoffset)) != FDT_END) {
 		if (tag == FDT_PROP) {
 			struct fdt_property *prop =
-				fdt_offset_ptr_w(fdt, offset, sizeof(*prop));
+				_fdt_offset_ptr_w(fdt, offset);
 			int nameoff;
 
-			if (! prop)
-				return -FDT_ERR_BADSTRUCTURE;
-
 			nameoff = fdt32_to_cpu(prop->nameoff);
 			nameoff += fdt_size_dt_strings(fdt);
 			prop->nameoff = cpu_to_fdt32(nameoff);
 		}
 		offset = nextoffset;
 	}
+	if (nextoffset < 0)
+		return nextoffset;
 
 	/* Finally, adjust the header */
 	fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));
Index: dtc/libfdt/fdt_ro.c
===================================================================
--- dtc.orig/libfdt/fdt_ro.c	2009-02-06 13:47:44.000000000 +1100
+++ dtc/libfdt/fdt_ro.c	2009-02-06 13:47:55.000000000 +1100
@@ -201,7 +201,6 @@ const struct fdt_property *fdt_get_prope
 {
 	uint32_t tag;
 	const struct fdt_property *prop;
-	int namestroff;
 	int offset, nextoffset;
 	int err;
 
@@ -216,38 +215,24 @@ const struct fdt_property *fdt_get_prope
 		tag = fdt_next_tag(fdt, offset, &nextoffset);
 		switch (tag) {
 		case FDT_END:
-			err = -FDT_ERR_TRUNCATED;
+			if (nextoffset < 0)
+				err = nextoffset;
+			else
+				/* FDT_END tag with unclosed nodes */
+				err = -FDT_ERR_BADSTRUCTURE;
 			goto fail;
 
-		case FDT_BEGIN_NODE:
-		case FDT_END_NODE:
-		case FDT_NOP:
-			break;
-
 		case FDT_PROP:
-			err = -FDT_ERR_BADSTRUCTURE;
-			prop = fdt_offset_ptr(fdt, offset, sizeof(*prop));
-			if (! prop)
-				goto fail;
-			namestroff = fdt32_to_cpu(prop->nameoff);
-			if (_fdt_string_eq(fdt, namestroff, name, namelen)) {
+			prop = _fdt_offset_ptr(fdt, offset);
+			if (_fdt_string_eq(fdt, fdt32_to_cpu(prop->nameoff),
+					   name, namelen)) {
 				/* Found it! */
-				int len = fdt32_to_cpu(prop->len);
-				prop = fdt_offset_ptr(fdt, offset,
-						      sizeof(*prop)+len);
-				if (! prop)
-					goto fail;
-
 				if (lenp)
-					*lenp = len;
+					*lenp = fdt32_to_cpu(prop->len);
 
 				return prop;
 			}
 			break;
-
-		default:
-			err = -FDT_ERR_BADSTRUCTURE;
-			goto fail;
 		}
 	} while ((tag != FDT_BEGIN_NODE) && (tag != FDT_END_NODE));
 
Index: dtc/libfdt/libfdt_internal.h
===================================================================
--- dtc.orig/libfdt/libfdt_internal.h	2009-02-06 13:47:44.000000000 +1100
+++ dtc/libfdt/libfdt_internal.h	2009-02-06 13:47:55.000000000 +1100
@@ -62,7 +62,6 @@
 			return err; \
 	}
 
-uint32_t _fdt_next_tag(const void *fdt, int startoffset, int *nextoffset);
 int _fdt_check_node_offset(const void *fdt, int offset);
 const char *_fdt_find_string(const char *strtab, int tabsize, const char *s);
 int _fdt_node_end_offset(void *fdt, int nodeoffset);


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
