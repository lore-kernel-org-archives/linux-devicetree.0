From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: vt8500: Update vt8500-ehci driver to support device
 tree.
Date: Fri, 20 Jul 2012 01:31:23 +1200
Message-ID: <1342704684-4858-1-git-send-email-linux@prisktech.co.nz>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
---
 drivers/usb/host/ehci-vt8500.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/ehci-vt8500.c b/drivers/usb/host/ehci-vt8500.c
index c1eda73..4ba8f0c 100644
--- a/drivers/usb/host/ehci-vt8500.c
+++ b/drivers/usb/host/ehci-vt8500.c
@@ -16,6 +16,7 @@
  *
  */
 
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 static int ehci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
@@ -162,6 +163,12 @@ static int vt8500_ehci_drv_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id vt8500_ehci_ids[] = {
+	{ .compatible = "via,vt8500-ehci", },
+	{ .compatible = "wm,prizm-ehci", },
+	{}
+};
+
 static struct platform_driver vt8500_ehci_driver = {
 	.probe		= vt8500_ehci_drv_probe,
 	.remove		= vt8500_ehci_drv_remove,
@@ -169,7 +176,9 @@ static struct platform_driver vt8500_ehci_driver = {
 	.driver = {
 		.name	= "vt8500-ehci",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(vt8500_ehci_ids),
 	}
 };
 
 MODULE_ALIAS("platform:vt8500-ehci");
+MODULE_DEVICE_TABLE(of, vt8500_ehci_ids);
-- 
1.7.2.5
