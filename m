From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 01/14] fdt: Add function to get config int from device tree
Date: Thu, 25 Oct 2012 19:30:58 -0700
Message-ID: <1351218671-15228-2-git-send-email-sjg@chromium.org>
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
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Add a function to look up a configuration item such as machine id
and return its value.

Note: The code has been taken as is from the Chromium u-boot development
tree and needs Simon Glass' sign-off.

Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/fdtdec.h |   13 +++++++++++++
 lib/fdtdec.c     |   22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 0b14075..d880fe8 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -354,6 +354,19 @@ int fdtdec_decode_gpio(const void *blob, int node, const char *prop_name,
  */
 int fdtdec_setup_gpio(struct fdt_gpio_state *gpio);
 
+/**
+ * Look in the FDT for a config item with the given name and return its value
+ * as a 32-bit integer. The property must have at least 4 bytes of data. The
+ * value of the first cell is returned.
+ *
+ * @param blob		FDT blob to use
+ * @param prop_name	Node property name
+ * @param default_val	default value to return if the property is not found
+ * @return integer value, if found, or default_val if not
+ */
+int fdtdec_get_config_int(const void *blob, const char *prop_name,
+		int default_val);
+
 /*
  * Look up a property in a node and return its contents in a byte
  * array of given length. The property must have at least enough data for
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 4c23f45..1f50022 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -512,3 +512,25 @@ const u8 *fdtdec_locate_byte_array(const void *blob, int node,
 		return NULL;
 	return cell;
 }
+
+/**
+ * Look in the FDT for a config item with the given name and return its value
+ * as a 32-bit integer. The property must have at least 4 bytes of data. The
+ * value of the first cell is returned.
+ *
+ * @param blob		FDT blob to use
+ * @param prop_name	Node property name
+ * @param default_val	default value to return if the property is not found
+ * @return integer value, if found, or default_val if not
+ */
+int fdtdec_get_config_int(const void *blob, const char *prop_name,
+		int default_val)
+{
+	int config_node;
+
+	debug("%s: %s\n", __func__, prop_name);
+	config_node = fdt_path_offset(blob, "/config");
+	if (config_node < 0)
+		return default_val;
+	return fdtdec_get_int(blob, config_node, prop_name, default_val);
+}
-- 
1.7.7.3
