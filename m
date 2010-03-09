From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: libfdt: Implement property iteration functions
Date: Tue, 9 Mar 2010 17:39:14 +1100
Message-ID: <20100309063914.GA11655@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

For ages, we've been talking about adding functions to libfdt to allow
iteration through properties.  So, finally, here are some.

I got bogged down on this for a long time because I didn't want to
expose offsets directly to properties to the callers.  But without
that, attempting to make reasonable iteration functions just became
horrible.  So eventually, I settled on an interface which does now
expose property offsets.  fdt_first_property_offset() and
fdt_next_property_offset() are used to step through the offsets of the
properties starting from a particularly node offset.  The details of
the property at each offset can then be retrieved with either
fdt_get_property_by_offset() or fdt_getprop_by_offset() which have
interfaces similar to fdt_get_property() and fdt_getprop()
respectively.

No explicit testcases are included, but we do use the new functions to
reimplement the existing fdt_get_property() function.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/libfdt/libfdt.h
===================================================================
--- dtc.orig/libfdt/libfdt.h	2010-03-01 14:21:49.188385823 +1100
+++ dtc/libfdt/libfdt.h	2010-03-09 17:35:36.582984236 +1100
@@ -343,6 +343,75 @@ int fdt_path_offset(const void *fdt, con
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *lenp);
 
 /**
+ * fdt_first_property_offset - find the offset of a node's first property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: structure block offset of a node
+ *
+ * fdt_first_property_offset() finds the first property of the node at
+ * the given structure block offset.
+ *
+ * returns:
+ *	structure block offset of the property (>=0), on success
+ *	-FDT_ERR_NOTFOUND, if the requested node has no properties
+ *	-FDT_ERR_BADOFFSET, if nodeoffset did not point to an FDT_BEGIN_NODE tag
+ *      -FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings.
+ */
+int fdt_first_property_offset(const void *fdt, int nodeoffset);
+
+/**
+ * fdt_next_property_offset - step through a node's properties
+ * @fdt: pointer to the device tree blob
+ * @offset: structure block offset of a property
+ *
+ * fdt_next_property_offset() finds the property immediately after the
+ * one at the given structure block offset.  This will be a property
+ * of the same node as the given property.
+ *
+ * returns:
+ *	structure block offset of the next property (>=0), on success
+ *	-FDT_ERR_NOTFOUND, if the given property is the last in its node
+ *	-FDT_ERR_BADOFFSET, if nodeoffset did not point to an FDT_PROP tag
+ *      -FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings.
+ */
+int fdt_next_property_offset(const void *fdt, int offset);
+
+/**
+ * fdt_get_property_by_offset - retrieve the property at a given offset
+ * @fdt: pointer to the device tree blob
+ * @offset: offset of the property to retrieve
+ * @lenp: pointer to an integer variable (will be overwritten) or NULL
+ *
+ * fdt_get_property_by_offset() retrieves a pointer to the
+ * fdt_property structure within the device tree blob at the given
+ * offset.  If lenp is non-NULL, the length of the property value is
+ * also returned, in the integer pointed to by lenp.
+ *
+ * returns:
+ *	pointer to the structure representing the property
+ *		if lenp is non-NULL, *lenp contains the length of the property
+ *		value (>=0)
+ *	NULL, on error
+ *		if lenp is non-NULL, *lenp contains an error code (<0):
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_PROP tag
+ *		-FDT_ERR_BADMAGIC,
+ *		-FDT_ERR_BADVERSION,
+ *		-FDT_ERR_BADSTATE,
+ *		-FDT_ERR_BADSTRUCTURE,
+ *		-FDT_ERR_TRUNCATED, standard meanings
+ */
+const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
+						      int offset,
+						      int *lenp);
+
+/**
  * fdt_get_property_namelen - find a property based on substring
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node whose property to find
@@ -396,6 +465,40 @@ static inline struct fdt_property *fdt_g
 }
 
 /**
+ * fdt_getprop_by_offset - retrieve the value of a property at a given offset
+ * @fdt: pointer to the device tree blob
+ * @ffset: offset of the property to read
+ * @namep: pointer to a string variable (will be overwritten) or NULL
+ * @lenp: pointer to an integer variable (will be overwritten) or NULL
+ *
+ * fdt_getprop_by_offset() retrieves a pointer to the value of the
+ * property at structure block offset 'offset' (this will be a pointer
+ * to within the device blob itself, not a copy of the value).  If
+ * lenp is non-NULL, the length of the property value is also
+ * returned, in the integer pointed to by lenp.  If namep is non-NULL,
+ * the property's namne will also be returned in the char * pointed to
+ * by namep (this will be a pointer to within the device tree's string
+ * block, not a new copy of the name).
+ *
+ * returns:
+ *	pointer to the property's value
+ *		if lenp is non-NULL, *lenp contains the length of the property
+ *		value (>=0)
+ *		if namep is non-NULL *namep contiains a pointer to the property
+ *		name.
+ *	NULL, on error
+ *		if lenp is non-NULL, *lenp contains an error code (<0):
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_PROP tag
+ *		-FDT_ERR_BADMAGIC,
+ *		-FDT_ERR_BADVERSION,
+ *		-FDT_ERR_BADSTATE,
+ *		-FDT_ERR_BADSTRUCTURE,
+ *		-FDT_ERR_TRUNCATED, standard meanings
+ */
+const void *fdt_getprop_by_offset(const void *fdt, int offset,
+				  const char **namep, int *lenp);
+
+/**
  * fdt_getprop_namelen - get property value based on substring
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node whose property to find
Index: dtc/libfdt/fdt_ro.c
===================================================================
--- dtc.orig/libfdt/fdt_ro.c	2010-03-09 10:48:19.867110161 +1100
+++ dtc/libfdt/fdt_ro.c	2010-03-09 15:49:40.791373387 +1100
@@ -105,6 +105,30 @@ int fdt_num_mem_rsv(const void *fdt)
 	return i;
 }
 
+static int _nextprop(const void *fdt, int offset)
+{
+	uint32_t tag;
+	int nextoffset;
+
+	do {
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+
+		switch (tag) {
+		case FDT_END:
+			if (nextoffset >= 0)
+				return -FDT_ERR_BADSTRUCTURE;
+			else
+				return nextoffset;
+
+		case FDT_PROP:
+			return offset;
+		}
+		offset = nextoffset;
+	} while (tag == FDT_NOP);
+
+	return -FDT_ERR_NOTFOUND;
+}
+
 int fdt_subnode_offset_namelen(const void *fdt, int offset,
 			       const char *name, int namelen)
 {
@@ -194,52 +218,66 @@ const char *fdt_get_name(const void *fdt
 	return NULL;
 }
 
-const struct fdt_property *fdt_get_property_namelen(const void *fdt,
-						    int nodeoffset,
-						    const char *name,
-						    int namelen, int *lenp)
+int fdt_first_property_offset(const void *fdt, int nodeoffset)
+{
+	int offset;
+
+	if ((offset = _fdt_check_node_offset(fdt, nodeoffset)) < 0)
+		return offset;
+
+	return _nextprop(fdt, offset);
+}
+
+int fdt_next_property_offset(const void *fdt, int offset)
+{
+	if ((offset = _fdt_check_prop_offset(fdt, offset)) < 0)
+		return offset;
+
+	return _nextprop(fdt, offset);
+}
+
+const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
+						      int offset,
+						      int *lenp)
 {
-	uint32_t tag;
-	const struct fdt_property *prop;
-	int offset, nextoffset;
 	int err;
+	const struct fdt_property *prop;
 
-	if (((err = fdt_check_header(fdt)) != 0)
-	    || ((err = _fdt_check_node_offset(fdt, nodeoffset)) < 0))
-			goto fail;
+	if ((err = _fdt_check_prop_offset(fdt, offset)) < 0) {
+		if (lenp)
+			*lenp = err;
+		return NULL;
+	}
 
-	nextoffset = err;
-	do {
-		offset = nextoffset;
+	prop = _fdt_offset_ptr(fdt, offset);
 
-		tag = fdt_next_tag(fdt, offset, &nextoffset);
-		switch (tag) {
-		case FDT_END:
-			if (nextoffset < 0)
-				err = nextoffset;
-			else
-				/* FDT_END tag with unclosed nodes */
-				err = -FDT_ERR_BADSTRUCTURE;
-			goto fail;
+	if (lenp)
+		*lenp = fdt32_to_cpu(prop->len);
 
-		case FDT_PROP:
-			prop = _fdt_offset_ptr(fdt, offset);
-			if (_fdt_string_eq(fdt, fdt32_to_cpu(prop->nameoff),
-					   name, namelen)) {
-				/* Found it! */
-				if (lenp)
-					*lenp = fdt32_to_cpu(prop->len);
+	return prop;
+}
 
-				return prop;
-			}
+const struct fdt_property *fdt_get_property_namelen(const void *fdt,
+						    int offset,
+						    const char *name,
+						    int namelen, int *lenp)
+{
+	for (offset = fdt_first_property_offset(fdt, offset);
+	     (offset >= 0);
+	     (offset = fdt_next_property_offset(fdt, offset))) {
+		const struct fdt_property *prop;
+
+		if (!(prop = fdt_get_property_by_offset(fdt, offset, lenp))) {
+			offset = -FDT_ERR_INTERNAL;
 			break;
 		}
-	} while ((tag != FDT_BEGIN_NODE) && (tag != FDT_END_NODE));
+		if (_fdt_string_eq(fdt, fdt32_to_cpu(prop->nameoff),
+				   name, namelen))
+			return prop;
+	}
 
-	err = -FDT_ERR_NOTFOUND;
- fail:
 	if (lenp)
-		*lenp = err;
+		*lenp = offset;
 	return NULL;
 }
 
@@ -263,6 +301,19 @@ const void *fdt_getprop_namelen(const vo
 	return prop->data;
 }
 
+const void *fdt_getprop_by_offset(const void *fdt, int offset,
+				  const char **namep, int *lenp)
+{
+	const struct fdt_property *prop;
+
+	prop = fdt_get_property_by_offset(fdt, offset, lenp);
+	if (!prop)
+		return NULL;
+	if (namep)
+		*namep = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
+	return prop->data;
+}
+
 const void *fdt_getprop(const void *fdt, int nodeoffset,
 			const char *name, int *lenp)
 {
Index: dtc/libfdt/fdt.c
===================================================================
--- dtc.orig/libfdt/fdt.c	2010-03-09 10:48:19.835109791 +1100
+++ dtc/libfdt/fdt.c	2010-03-09 15:22:01.743164531 +1100
@@ -149,6 +149,15 @@ int _fdt_check_node_offset(const void *f
 	return offset;
 }
 
+int _fdt_check_prop_offset(const void *fdt, int offset)
+{
+	if ((offset < 0) || (offset % FDT_TAGSIZE)
+	    || (fdt_next_tag(fdt, offset, &offset) != FDT_PROP))
+		return -FDT_ERR_BADOFFSET;
+
+	return offset;
+}
+
 int fdt_next_node(const void *fdt, int offset, int *depth)
 {
 	int nextoffset = 0;
Index: dtc/libfdt/libfdt_internal.h
===================================================================
--- dtc.orig/libfdt/libfdt_internal.h	2010-03-09 15:23:12.214109947 +1100
+++ dtc/libfdt/libfdt_internal.h	2010-03-09 15:23:16.351175258 +1100
@@ -63,6 +63,7 @@
 	}
 
 int _fdt_check_node_offset(const void *fdt, int offset);
+int _fdt_check_prop_offset(const void *fdt, int offset);
 const char *_fdt_find_string(const char *strtab, int tabsize, const char *s);
 int _fdt_node_end_offset(void *fdt, int nodeoffset);
 


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
