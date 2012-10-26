From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 04/14] fdt: Add function for decoding multiple gpios globally
 available
Date: Thu, 25 Oct 2012 19:31:01 -0700
Message-ID: <1351218671-15228-5-git-send-email-sjg@chromium.org>
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

Samsung's SDHCI bindings require multiple gpios to be parsed and
configured at a time. Export the already available fdtdec_decode_gpios
for this purpose.

Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Commit-Ready: Che-Liang Chiou <clchiou-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/fdtdec.h |   16 ++++++++++++++++
 lib/fdtdec.c     |    5 ++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 341e6a1..e70714b 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -345,6 +345,22 @@ int fdtdec_decode_gpio(const void *blob, int node, const char *prop_name,
 		struct fdt_gpio_state *gpio);
 
 /**
+ * Decode a list of GPIOs from an FDT. This creates a list of GPIOs with no
+ * terminating item.
+ *
+ * @param blob         FDT blob to use
+ * @param node         Node to look at
+ * @param prop_name    Node property name
+ * @param gpio         Array of gpio elements to fill from FDT. This will be
+ *                     untouched if either 0 or an error is returned
+ * @param max_count    Maximum number of elements allowed
+ * @return number of GPIOs read if ok, -FDT_ERR_BADLAYOUT if max_count would
+ * be exceeded, or -FDT_ERR_NOTFOUND if the property is missing.
+ */
+int fdtdec_decode_gpios(const void *blob, int node, const char *prop_name,
+		struct fdt_gpio_state *gpio, int max_count);
+
+/**
  * Set up a GPIO pin according to the provided gpio information. At present this
  * just requests the GPIO.
  *
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 5570972..32f03cc 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -426,9 +426,8 @@ int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
  * @return number of GPIOs read if ok, -FDT_ERR_BADLAYOUT if max_count would
  * be exceeded, or -FDT_ERR_NOTFOUND if the property is missing.
  */
-static int fdtdec_decode_gpios(const void *blob, int node,
-		const char *prop_name, struct fdt_gpio_state *gpio,
-		int max_count)
+int fdtdec_decode_gpios(const void *blob, int node, const char *prop_name,
+		struct fdt_gpio_state *gpio, int max_count)
 {
 	const struct fdt_property *prop;
 	const u32 *cell;
-- 
1.7.7.3
