From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 02/14] fdt: Add function to get a config string from device
 tree
Date: Thu, 25 Oct 2012 19:30:59 -0700
Message-ID: <1351218671-15228-3-git-send-email-sjg@chromium.org>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351218671-15228-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a function to look up a configuration string such as board name
and returns its value. We look in the "/config" node for this.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/fdtdec.h |   10 ++++++++++
 lib/fdtdec.c     |   28 ++++++++++++++++++----------
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index d880fe8..e828662 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -367,6 +367,16 @@ int fdtdec_setup_gpio(struct fdt_gpio_state *gpio);
 int fdtdec_get_config_int(const void *blob, const char *prop_name,
 		int default_val);
 
+/**
+ * Look in the FDT for a config item with the given name and return its value
+ * as a string.
+ *
+ * @param blob          FDT blob
+ * @param prop_name     property name to look up
+ * @returns property string, NULL on error.
+ */
+char *fdtdec_get_config_string(const void *blob, const char *prop_name);
+
 /*
  * Look up a property in a node and return its contents in a byte
  * array of given length. The property must have at least enough data for
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 1f50022..2d60c8a 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -513,16 +513,6 @@ const u8 *fdtdec_locate_byte_array(const void *blob, int node,
 	return cell;
 }
 
-/**
- * Look in the FDT for a config item with the given name and return its value
- * as a 32-bit integer. The property must have at least 4 bytes of data. The
- * value of the first cell is returned.
- *
- * @param blob		FDT blob to use
- * @param prop_name	Node property name
- * @param default_val	default value to return if the property is not found
- * @return integer value, if found, or default_val if not
- */
 int fdtdec_get_config_int(const void *blob, const char *prop_name,
 		int default_val)
 {
@@ -534,3 +524,21 @@ int fdtdec_get_config_int(const void *blob, const char *prop_name,
 		return default_val;
 	return fdtdec_get_int(blob, config_node, prop_name, default_val);
 }
+
+char *fdtdec_get_config_string(const void *blob, const char *prop_name)
+{
+	const char *nodep;
+	int nodeoffset;
+	int len;
+
+	debug("%s: %s\n", __func__, prop_name);
+	nodeoffset = fdt_path_offset(blob, "/config");
+	if (nodeoffset < 0)
+		return NULL;
+
+	nodep = fdt_getprop(blob, nodeoffset, prop_name, &len);
+	if (!nodep)
+		return NULL;
+
+	return (char *)nodep;
+}
-- 
1.7.7.3
