From: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] libfdt: Add support for appending the values to a existing
 property
Date: Wed, 28 Sep 2011 11:58:50 +0800
Message-ID: <1317182330-9280-1-git-send-email-Minghuan.Lian@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some properties may contain multiple values, these values may need
to be added to the property respectively. this patch provides this
functionality. The main purpose of fdt_append_prop() is to append
the values to a existing property, or create a new property if it
dose not exist.

Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 libfdt/fdt_rw.c |   27 +++++++++++++++++++++++++++
 libfdt/libfdt.h |   30 ++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 994037b..0ee578e 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -289,6 +289,33 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
 	return 0;
 }
 
+int fdt_append_prop(void *fdt, int nodeoffset, const char *name,
+		    const void *val, int len)
+{
+	struct fdt_property *prop;
+	int err, oldlen, newlen;
+
+	FDT_RW_CHECK_HEADER(fdt);
+
+	prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
+	if (prop) {
+		newlen = len + oldlen;
+		err = _fdt_splice_struct(fdt, prop->data,
+					 FDT_TAGALIGN(oldlen),
+					 FDT_TAGALIGN(newlen));
+		if (err)
+			return err;
+		prop->len = cpu_to_fdt32(newlen);
+		memcpy(prop->data + oldlen, val, len);
+	} else {
+		err = _fdt_add_property(fdt, nodeoffset, name, len, &prop);
+		if (err)
+			return err;
+		memcpy(prop->data, val, len);
+	}
+	return 0;
+}
+
 int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 {
 	struct fdt_property *prop;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 55f3eb3..ff4161b 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1068,6 +1068,36 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
 		const void *val, int len);
 
 /**
+ * fdt_append_prop - append or create a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to append
+ * @val: pointer to data to append to the property value
+ * @len: length of the property value
+ *
+ * fdt_append_prop() appends the value to the named property in the given
+ * node, creating the property if it does not already exist.
+ *
+ * This function may change data from the blob, and will
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
+int fdt_append_prop(void *fdt, int nodeoffset, const char *name,
+		    const void *val, int len);
+
+/**
  * fdt_setprop_cell - set a property to a single cell value
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node whose property to change
-- 
1.7.0.4
