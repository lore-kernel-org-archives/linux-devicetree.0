From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] Introduce fdt_setprop_placeholder() method
Date: Thu, 27 Jul 2017 19:33:11 +0300
Message-ID: <1501173191-652-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In some cases you need to add a property but the contents of it
are not known at creation time, merely the extend of it.

This method allows you to create a property of a given size
which will be set to zero while a pointer to the property data
will be provided.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 libfdt/fdt_rw.c | 20 +++++++++++++++++---
 libfdt/libfdt.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 8b487f6..5c3a2bb 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -269,8 +269,8 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name)
 	return 0;
 }
 
-int fdt_setprop(void *fdt, int nodeoffset, const char *name,
-		const void *val, int len)
+int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
+			    int len, void **prop_data)
 {
 	struct fdt_property *prop;
 	int err;
@@ -283,8 +283,22 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
 	if (err)
 		return err;
 
+	*prop_data = prop->data;
+	return 0;
+}
+
+int fdt_setprop(void *fdt, int nodeoffset, const char *name,
+		const void *val, int len)
+{
+	void *prop_data;
+	int err;
+
+	err = fdt_setprop_placeholder(fdt, nodeoffset, name, len, &prop_data);
+	if (err)
+		return err;
+
 	if (len)
-		memcpy(prop->data, val, len);
+		memcpy(prop_data, val, len);
 	return 0;
 }
 
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index a248b1b..313c72a 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1449,6 +1449,37 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
 		const void *val, int len);
 
 /**
+ * fdt_setprop _placeholder - allocate space for a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @len: length of the property value
+ * @prop_data: return pointer to property data
+ *
+ * fdt_setprop_placeholer() allocates the named property in the given node.
+ * If the property exists it is resized. In either case a pointer to the
+ * property data is returned.
+ *
+ * This function may insert or delete data from the blob, and will
+ * therefore change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
+			    int len, void **prop_data);
+
+/**
  * fdt_setprop_u32 - set a property to a 32-bit integer
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node whose property to change
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
