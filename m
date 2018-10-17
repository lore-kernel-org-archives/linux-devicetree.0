From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V2 4/6] usb: ohci-platform: Add support for Broadcom STB SoC's
Date: Wed, 17 Oct 2018 18:29:07 -0400
Message-ID: <1539815349-24126-5-git-send-email-alcooperx@gmail.com>
References: <1539815349-24126-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539815349-24126-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@
List-Id: devicetree@vger.kernel.org

Add support for Broadcom STB SoC's to the ohci platform driver.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/host/ohci-platform.c | 35 +++++++++++++++++++++++++++++------
 include/linux/usb/ohci_pdriver.h |  1 +
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 65a1c3fdc88c..363d6fa676a5 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -99,12 +100,24 @@ static int ohci_platform_probe(struct platform_device *dev)
 	if (usb_disabled())
 		return -ENODEV;
 
-	/*
-	 * Use reasonable defaults so platforms don't have to provide these
-	 * with DT probing on ARM.
-	 */
-	if (!pdata)
-		pdata = &ohci_platform_defaults;
+	if (!pdata) {
+		const struct usb_ohci_pdata *match_pdata;
+
+		match_pdata = of_device_get_match_data(&dev->dev);
+		if (match_pdata) {
+			pdata = devm_kzalloc(&dev->dev, sizeof(*pdata),
+					     GFP_KERNEL);
+			if (!pdata)
+				return -ENOMEM;
+			*pdata = *match_pdata;
+		} else {
+			/*
+			 * Use reasonable defaults so platforms don't have
+			 * to provide these with DT probing on ARM.
+			 */
+			pdata = &ohci_platform_defaults;
+		}
+	}
 
 	err = dma_coerce_mask_and_coherent(&dev->dev, DMA_BIT_MASK(32));
 	if (err)
@@ -177,6 +190,8 @@ static int ohci_platform_probe(struct platform_device *dev)
 		ohci->flags |= OHCI_QUIRK_FRAME_NO;
 	if (pdata->num_ports)
 		ohci->num_ports = pdata->num_ports;
+	if (pdata->suspend_without_phy_exit)
+		hcd->suspend_without_phy_exit = 1;
 
 #ifndef CONFIG_USB_OHCI_BIG_ENDIAN_MMIO
 	if (ohci->flags & OHCI_QUIRK_BE_MMIO) {
@@ -305,10 +320,18 @@ static int ohci_platform_resume(struct device *dev)
 }
 #endif /* CONFIG_PM_SLEEP */
 
+static const struct usb_ohci_pdata ohci_plat_brcm_bcm7445_ohci = {
+	.power_on =		ohci_platform_power_on,
+	.power_suspend =	ohci_platform_power_off,
+	.power_off =		ohci_platform_power_off,
+	.suspend_without_phy_exit = 1,
+};
+
 static const struct of_device_id ohci_platform_ids[] = {
 	{ .compatible = "generic-ohci", },
 	{ .compatible = "cavium,octeon-6335-ohci", },
 	{ .compatible = "ti,ohci-omap3", },
+	{ .compatible = "brcm,bcm7445-ohci", &ohci_plat_brcm_bcm7445_ohci},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ohci_platform_ids);
diff --git a/include/linux/usb/ohci_pdriver.h b/include/linux/usb/ohci_pdriver.h
index 7eb16cf587ee..16b24ea1e3bb 100644
--- a/include/linux/usb/ohci_pdriver.h
+++ b/include/linux/usb/ohci_pdriver.h
@@ -35,6 +35,7 @@ struct usb_ohci_pdata {
 	unsigned	big_endian_desc:1;
 	unsigned	big_endian_mmio:1;
 	unsigned	no_big_frame_no:1;
+	unsigned	suspend_without_phy_exit:1;
 	unsigned int	num_ports;
 
 	/* Turn on all power and clocks */
-- 
1.9.0.138.g2de3478
