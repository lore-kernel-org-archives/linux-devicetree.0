From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 01/10] fdt: Add fdtdec functions to read byte
	array
Date: Tue, 17 Apr 2012 12:01:28 -0700
Message-ID: <1334689297-13489-2-git-send-email-sjg@chromium.org>
References: <1334689297-13489-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1334689297-13489-1-git-send-email-sjg@chromium.org>
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
Cc: Anton Staff <robotboy@chromium.org>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

From: Anton Staff <robotboy@chromium.org>

Sometimes we don't need a full cell for each value. This provides
a simple function to read a byte array, both with and without
copying it.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v2:
- Use correct name for get_prop_check_min_len() function

 include/fdtdec.h |   32 ++++++++++++++++++++++++++++++++
 lib/fdtdec.c     |   24 ++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 7bae2f8..5140f4a 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -350,3 +350,35 @@ int fdtdec_decode_gpio(const void *blob, int node, const char *prop_name,
  * @return 0 if all ok or gpio was FDT_GPIO_NONE; -1 on error
  */
 int fdtdec_setup_gpio(struct fdt_gpio_state *gpio);
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
index 2eb5b41..585dd6d 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -487,3 +487,27 @@ int fdtdec_setup_gpio(struct fdt_gpio_state *gpio)
 		return -1;
 	return 0;
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
