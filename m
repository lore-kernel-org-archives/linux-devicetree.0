From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 02/16] fdt: Add functions to access phandles,
 arrays and bools
Date: Tue,  6 Dec 2011 17:24:01 -0800
Message-ID: <1323221055-20113-3-git-send-email-sjg@chromium.org>
References: <1323221055-20113-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323221055-20113-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a function to look up a property which is a phandle in a node, and
another to read a fixed-length integer array from an fdt property.
Also add a function to read boolean properties, although there is no
actual boolean type in U-Boot.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 include/fdtdec.h |   40 ++++++++++++++++++++++++++++++++
 lib/fdtdec.c     |   67 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 49dbac4..c414131 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -141,3 +141,43 @@ int fdtdec_get_is_enabled(const void *blob, int node);
  * if not.
  */
 int fdtdec_check_fdt(void);
+
+/**
+ * Look up a phandle and follow it to its node. Then return the offset
+ * of that node.
+ *
+ * @param blob		FDT blob
+ * @param node		node to examine
+ * @param prop_name	name of property to find
+ * @return node offset if found, -ve error code on error
+ */
+int fdtdec_lookup_phandle(const void *blob, int node, const char *prop_name);
+
+/**
+ * Look up a property in a node and return its contents in an integer
+ * array of given length. The property must have at least enough data for
+ * the array (4*count bytes). It may have more, but this will be ignored.
+ *
+ * @param blob		FDT blob
+ * @param node		node to examine
+ * @param prop_name	name of property to find
+ * @param array		array to fill with data
+ * @param count		number of array elements
+ * @return 0 if ok, or -FDT_ERR_NOTFOUND if the property is not found,
+ *		or -FDT_ERR_BADLAYOUT if not enough data
+ */
+int fdtdec_get_int_array(const void *blob, int node, const char *prop_name,
+		u32 *array, int count);
+
+/**
+ * Look up a boolean property in a node and return it.
+ *
+ * A boolean properly is true if present in the device tree and false if not
+ * present, regardless of its value.
+ *
+ * @param blob	FDT blob
+ * @param node	node to examine
+ * @param prop_name	name of property to find
+ * @return 1 if the properly is present; 0 if it isn't present
+ */
+int fdtdec_get_bool(const void *blob, int node, const char *prop_name);
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 55bbfc8..ca6a698 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -155,3 +155,70 @@ int fdtdec_check_fdt(void)
 			"binary or define CONFIG_OF_EMBED\n");
 	return 0;
 }
+
+int fdtdec_lookup_phandle(const void *blob, int node, const char *prop_name)
+{
+	const u32 *phandle;
+	int lookup;
+
+	phandle = fdt_getprop(blob, node, prop_name, NULL);
+	if (!phandle)
+		return -FDT_ERR_NOTFOUND;
+
+	lookup = fdt_node_offset_by_phandle(blob, fdt32_to_cpu(*phandle));
+	return lookup;
+}
+
+/**
+ * Look up a property in a node and check that it has a minimum length.
+ *
+ * @param blob		FDT blob
+ * @param node		node to examine
+ * @param prop_name	name of property to find
+ * @param min_len	minimum property length in bytes
+ * @param err		0 if ok, or -FDT_ERR_NOTFOUND if the property is not
+			found, or -FDT_ERR_BADLAYOUT if not enough data
+ * @return pointer to cell, which is only valid if err == 0
+ */
+static const void *get_prop_check_min_len(const void *blob, int node,
+		const char *prop_name, int min_len, int *err)
+{
+	const void *cell;
+	int len;
+
+	debug("%s: %s\n", __func__, prop_name);
+	cell = fdt_getprop(blob, node, prop_name, &len);
+	if (!cell)
+		*err = -FDT_ERR_NOTFOUND;
+	else if (len < min_len)
+		*err = -FDT_ERR_BADLAYOUT;
+	else
+		*err = 0;
+	return cell;
+}
+
+int fdtdec_get_int_array(const void *blob, int node, const char *prop_name,
+		u32 *array, int count)
+{
+	const u32 *cell;
+	int i, err = 0;
+
+	debug("%s: %s\n", __func__, prop_name);
+	cell = get_prop_check_min_len(blob, node, prop_name,
+				      sizeof(u32) * count, &err);
+	if (!err) {
+		for (i = 0; i < count; i++)
+			array[i] = fdt32_to_cpu(cell[i]);
+	}
+	return err;
+}
+
+int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
+{
+	const s32 *cell;
+	int len;
+
+	debug("%s: %s\n", __func__, prop_name);
+	cell = fdt_getprop(blob, node, prop_name, &len);
+	return cell != NULL;
+}
-- 
1.7.3.1
