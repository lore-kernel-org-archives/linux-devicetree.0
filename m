From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 1/9] fdt: Add fdtdec functions to read byte array
Date: Mon, 16 Jan 2012 22:11:14 -0800
Message-ID: <1326780682-10260-2-git-send-email-sjg@chromium.org>
References: <1326780682-10260-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326780682-10260-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Anton Staff <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Sometimes we don't need a full cell for each value. This provides
a simple function to read a byte array, both with and without
copying it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Use correct name for get_prop_check_min_len() function

 include/fdtdec.h |   32 ++++++++++++++++++++++++++++++++
 lib/fdtdec.c     |   24 ++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 64e2f88..9fd4e38 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -325,3 +325,35 @@ int fdtdec_setup_gpio(struct fdt_gpio_state *gpio);
  * @return
  */
 int fdtdec_decode_periph_id(const void *blob, int node);
+
+/*
+ * Look up a property in a node and return its contents in a byte
+ * array of given length. The property must have at least enough data for
+ * the array (count bytes). It may have more, but this will be ignored.
+ *
+ * @param blob		FDT blob
+ * @param node		node to examine
+ * @param prop_name	name of property to find
+ * @param array		array to fill with data
+ * @param count		number of array elements
+ * @return 0 if ok, or -FDT_ERR_MISSING if the property is not found,
+ *		or -FDT_ERR_BADLAYOUT if not enough data
+ */
+int fdtdec_get_byte_array(const void *blob, int node, const char *prop_name,
+		u8 *array, int count);
+
+/**
+ * Look up a property in a node and return a pointer to its contents as a
+ * byte array of given length. The property must have at least enough data
+ * for the array (count bytes). It may have more, but this will be ignored.
+ * The data is not copied.
+ *
+ * @param blob		FDT blob
+ * @param node		node to examine
+ * @param prop_name	name of property to find
+ * @param count		number of array elements
+ * @return pointer to byte array if found, or NULL if the property is not
+ *		found or there is not enough data
+ */
+const u8 *fdtdec_locate_byte_array(const void *blob, int node,
+			     const char *prop_name, int count);
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index db377c7..140310d 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -462,3 +462,27 @@ int fdtdec_decode_periph_id(const void *blob, int node)
 
 	return cell[1];
 }
+
+int fdtdec_get_byte_array(const void *blob, int node, const char *prop_name,
+		u8 *array, int count)
+{
+	const u8 *cell;
+	int err;
+
+	cell = get_prop_check_min_len(blob, node, prop_name, count, &err);
+	if (!err)
+		memcpy(array, cell, count);
+	return err;
+}
+
+const u8 *fdtdec_locate_byte_array(const void *blob, int node,
+			     const char *prop_name, int count)
+{
+	const u8 *cell;
+	int err;
+
+	cell = get_prop_check_min_len(blob, node, prop_name, count, &err);
+	if (err)
+		return NULL;
+	return cell;
+}
-- 
1.7.7.3
