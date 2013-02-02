From: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] watchdog: ath79_wdt: add device tree matching
Date: Sat,  2 Feb 2013 10:34:54 +0100
Message-ID: <1359797694-29958-1-git-send-email-juhosg@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Signed-off-by: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 .../devicetree/bindings/watchdog/qca-ar7130-wdt.txt       |   13 +++++++++++++
 drivers/watchdog/ath79_wdt.c                              |   11 +++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/qca-ar7130-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/qca-ar7130-wdt.txt b/Documentation/devicetree/bindings/watchdog/qca-ar7130-wdt.txt
new file mode 100644
index 0000000..7a89e5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/qca-ar7130-wdt.txt
@@ -0,0 +1,13 @@
+* Qualcomm Atheros AR7130 Watchdog Timer (WDT) Controller
+
+Required properties:
+- compatible: must be "qca,ar7130-wdt"
+- reg: physical base address of the controller and length of memory mapped
+  region.
+
+Example:
+
+wdt@18060008 {
+	compatible = "qca,ar9330-wdt", "qca,ar7130-wdt";
+	reg = <0x18060008 0x8>;
+};
diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
index e786f64..8987990 100644
--- a/drivers/watchdog/ath79_wdt.c
+++ b/drivers/watchdog/ath79_wdt.c
@@ -33,6 +33,8 @@
 #include <linux/watchdog.h>
 #include <linux/clk.h>
 #include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 
 #define DRIVER_NAME	"ath79-wdt"
 
@@ -308,6 +310,14 @@ static void ath97_wdt_shutdown(struct platform_device *pdev)
 	ath79_wdt_disable();
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id ath79_wdt_match[] = {
+	{ .compatible = "qca,ar7130-wdt" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ath79_wdt_match);
+#endif
+
 static struct platform_driver ath79_wdt_driver = {
 	.probe		= ath79_wdt_probe,
 	.remove		= ath79_wdt_remove,
@@ -315,6 +325,7 @@ static struct platform_driver ath79_wdt_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(ath79_wdt_match),
 	},
 };
 
-- 
1.7.10
