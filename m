From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] Introduce fdt_get_path_len() method
Date: Thu, 13 Jul 2017 00:23:32 +0300
Message-ID: <1499894612-25643-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This method returns the length of the full path of the node so that
it may be used without having to call fdt_get_path() using a worst
case sized buffer.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 libfdt/fdt_ro.c | 28 ++++++++++++++++++++++++++++
 libfdt/libfdt.h | 22 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 08de2cc..8b67f2f 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -438,6 +438,34 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 	return offset; /* error from fdt_next_node() */
 }
 
+int fdt_get_path_len(const void *fdt, int nodeoffset)
+{
+	int len = 0, namelen;
+	const char *name;
+
+	FDT_CHECK_HEADER(fdt);
+
+	for (;;) {
+		name = fdt_get_name(fdt, nodeoffset, &namelen);
+		if (!name)
+			return namelen;
+
+		/* root? we're done */
+		if (namelen == 0)
+			break;
+
+		nodeoffset = fdt_parent_offset(fdt, nodeoffset);
+		if (nodeoffset < 0)
+			return nodeoffset;
+		len += namelen + 1;
+	}
+
+	/* in case of root pretend it's "/" */
+	if (len == 0)
+		len++;
+	return len;
+}
+
 int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
 				 int supernodedepth, int *nodedepth)
 {
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index e01c645..2c0b570 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -765,6 +765,28 @@ const char *fdt_get_alias(const void *fdt, const char *name);
 int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
 
 /**
+ * fdt_get_path_len - determine the length of the full path of a node
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose path to find
+ *
+ * fdt_get_path_len() computes the size of the full path of the node at
+ * offset nodeoffset.
+ *
+ * NOTE: This function is expensive, as it must scan the device tree
+ * structure from the start to nodeoffset.
+ *
+ * returns:
+ *	> 0, on success
+ *		length of the full path of the node
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE, standard meanings
+ */
+int fdt_get_path_len(const void *fdt, int nodeoffset);
+
+/**
  * fdt_supernode_atdepth_offset - find a specific ancestor of a node
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node whose parent to find
-- 
2.1.4
