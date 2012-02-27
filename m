From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 02/20] fdt: Add functions to access phandles,
	arrays and bools
Date: Mon, 27 Feb 2012 12:52:35 -0800
Message-ID: <1330375973-10681-3-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <twarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

Add a function to look up a property which is a phandle in a node, and
another to read a fixed-length integer array from an fdt property.
Also add a function to read boolean properties, although there is no
actual boolean type in U-Boot.

Signed-off-by: Simon Glass <sjg@chromium.org>
Acked-by: Gerald Van Baren <vanbaren@cideas.com>
Acked-by: Stephen Warren <swarren@nvidia.com>
---

 include/fdtdec.h |   39 +++++++++++++++++++++++++++++++
 lib/fdtdec.c     |   67 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 01badd4..047f603 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -188,3 +188,42 @@ int fdtdec_find_aliases_for_id(const void *blob, const char *name,
  * @return compatible string for that id
  */
 const char *fdtdec_get_compatible(enum fdt_compat_id id);
+
+/* Look up a phandle and follow it to its node. Then return the offset
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
index 846ec3f..977528b 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -269,3 +269,70 @@ int fdtdec_check_fdt(void)
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
1.7.7.3
