From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 07/14] fdt: Add function to read boolean property
Date: Thu, 25 Oct 2012 19:31:04 -0700
Message-ID: <1351218671-15228-8-git-send-email-sjg@chromium.org>
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
Cc: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gabe Black <gabeblack-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Gabe Black <gabeblack-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Signed-off-by: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Commit-Ready: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Commit-Ready: Gabe Black <gabeblack-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/fdtdec.h |   10 ++++++++++
 lib/fdtdec.c     |   14 ++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 3f1840c..82fdb99 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -408,6 +408,16 @@ int fdtdec_get_config_int(const void *blob, const char *prop_name,
 		int default_val);
 
 /**
+ * Look in the FDT for a config item with the given name
+ * and return whether it exists.
+ *
+ * @param blob		FDT blob
+ * @param prop_name	property name to look up
+ * @return 1, if it exists, or 0 if not
+ */
+int fdtdec_get_config_bool(const void *blob, const char *prop_name);
+
+/**
  * Look in the FDT for a config item with the given name and return its value
  * as a string.
  *
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index efe9afe..fbb2827 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -524,6 +524,20 @@ int fdtdec_get_config_int(const void *blob, const char *prop_name,
 	return fdtdec_get_int(blob, config_node, prop_name, default_val);
 }
 
+int fdtdec_get_config_bool(const void *blob, const char *prop_name)
+{
+	int config_node;
+	const void *prop;
+
+	debug("%s: %s\n", __func__, prop_name);
+	config_node = fdt_path_offset(blob, "/config");
+	if (config_node < 0)
+		return 0;
+	prop = fdt_get_property(blob, config_node, prop_name, NULL);
+
+	return prop != NULL;
+}
+
 char *fdtdec_get_config_string(const void *blob, const char *prop_name)
 {
 	const char *nodep;
-- 
1.7.7.3
