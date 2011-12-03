From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 02/17] fdt: Add functions to access phandles,
 arrays and bools
Date: Fri,  2 Dec 2011 18:11:25 -0800
Message-ID: <1322878300-5551-3-git-send-email-sjg@chromium.org>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322878300-5551-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a function to look up a property which is a phandle in a node, and
another to read a fixed-length integer array from an fdt property.
Also add a function to read boolean properties, although there is no
actual boolean type in U-Boot.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Rename get_prop_len() to get_prop_check_min_len()

 include/fdtdec.h |   40 ++++++++++++++++++++++++++
 lib/fdtdec.c     |   83 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 49dbac4..974520a 100644
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
+ * present, or present with a 0 value.
+ *
+ * @param blob	FDT blob
+ * @param node	node to examine
+ * @param prop_name	name of property to find
+ * @return 1 if the properly is present; 0 if it isn't present or is 0
+ */
+int fdtdec_get_bool(const void *blob, int node, const char *prop_name);
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index a0a34e4..8f972b7 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -148,3 +148,86 @@ int fdtdec_check_fdt(void)
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
+/**
+ * Look up a boolean property in a node and return it.
+ *
+ * A boolean properly is true if present in the device tree and false if not
+ * present, or present with a 0 value.
+ *
+ * @param blob	FDT blob
+ * @param node	node to examine
+ * @param prop_name	name of property to find
+ * @return 1 if the properly is present; 0 if it isn't present or is 0
+ */
+int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
+{
+	const s32 *cell;
+	int len;
+
+	debug("%s: %s\n", __func__, prop_name);
+	cell = fdt_getprop(blob, node, prop_name, &len);
+	if (!cell)
+		return 0;
+	if (len >= sizeof(u32) && *cell == 0)
+		return 0;
+
+	return 1;
+}
-- 
1.7.3.1
