From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 3/3 v2] USB: ehci-s5p: Add vbus setup function to the s5p ehci
 glue layer
Date: Thu, 12 Jul 2012 11:25:12 +0530
Message-ID: <1342072512-29945-4-git-send-email-gautam.vivek@samsung.com>
References: <1342072512-29945-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1342072512-29945-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: l.majewski@samsung.com, a.kesavan@samsung.com, prashanth.g@samsung.com, kmpark@infradead.org, joshi@samsung.com, jg1.han@samsung.com, jy0922.shim@samsung.com, sshtylyov@mvista.com, olofj@google.com
List-Id: devicetree@vger.kernel.org

From: Abhilash Kesavan <a.kesavan@samsung.com>

This patch retrieves and configures the vbus control gpio via
the device tree. The suspend/resume callbacks will be later
modified for vbus control.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index 52d0049..9f9870c 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/of_gpio.h>
 #include <plat/ehci.h>
 #include <plat/usb-phy.h>
 
@@ -64,6 +65,28 @@ static const struct hc_driver s5p_ehci_hc_driver = {
 	.clear_tt_buffer_complete	= ehci_clear_tt_buffer_complete,
 };
 
+static int s5p_ehci_setup_gpio(struct platform_device *pdev)
+{
+	int err;
+	int gpio;
+
+	if (!pdev->dev.of_node)
+		return 0;
+
+	gpio = of_get_named_gpio(pdev->dev.of_node,
+			"samsung,vbus-gpio", 0);
+	if (!gpio_is_valid(gpio))
+		return 0;
+
+	err = gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "ehci_vbus_gpio");
+	if (err) {
+		dev_err(&pdev->dev, "can't request ehci vbus gpio %d", gpio);
+		return err;
+	}
+
+	return err;
+}
+
 static u64 ehci_s5p_dma_mask = DMA_BIT_MASK(32);
 
 static int __devinit s5p_ehci_probe(struct platform_device *pdev)
@@ -92,6 +115,8 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 	if (!pdev->dev.coherent_dma_mask)
 		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 
+	s5p_ehci_setup_gpio(pdev);
+
 	s5p_ehci = kzalloc(sizeof(struct s5p_ehci_hcd), GFP_KERNEL);
 	if (!s5p_ehci)
 		return -ENOMEM;
-- 
1.7.0.4
