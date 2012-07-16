From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 2/2 v3] USB: dwc3-exynos: Add vbus setup function to the exynos
 dwc3 glue layer
Date: Mon, 16 Jul 2012 11:27:39 +0530
Message-ID: <1342418259-23802-3-git-send-email-gautam.vivek@samsung.com>
References: <1342418259-23802-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1342418259-23802-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: l.majewski@samsung.com, a.kesavan@samsung.com, prashanth.g@samsung.com, kmpark@infradead.org, joshi@samsung.com, olofj@google.com, thomas.abraham@linaro.org, sshtylyov@mvista.com, av.tikhomirov@samsung.com
List-Id: devicetree@vger.kernel.org

This patch retrieves and configures the vbus control gpio via
the device tree. The suspend/resume callbacks will be later
modified for vbus control.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 drivers/usb/dwc3/dwc3-exynos.c |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index a293c69..9b0238f 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -20,6 +20,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_gpio.h>
 
 #include "core.h"
 
@@ -30,6 +31,28 @@ struct dwc3_exynos {
 	struct clk		*clk;
 };
 
+static int dwc3_setup_vbus_gpio(struct platform_device *pdev)
+{
+	int err;
+	int gpio;
+
+	if (!pdev->dev.of_node)
+		return 0;
+
+	gpio = of_get_named_gpio(pdev->dev.of_node,
+				"samsung,vbus-gpio", 0);
+	if (!gpio_is_valid(gpio))
+		return 0;
+
+	err = gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "dwc3_vbus_gpio");
+	if (err) {
+		dev_err(&pdev->dev, "can't request dwc3 vbus gpio %d", gpio);
+		return err;
+	}
+
+	return err;
+}
+
 static u64 dwc3_exynos_dma_mask = DMA_BIT_MASK(32);
 
 static int __devinit dwc3_exynos_probe(struct platform_device *pdev)
@@ -58,6 +81,8 @@ static int __devinit dwc3_exynos_probe(struct platform_device *pdev)
 	if (!pdev->dev.coherent_dma_mask)
 		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 
+	dwc3_setup_vbus_gpio(pdev);
+
 	platform_set_drvdata(pdev, exynos);
 
 	devid = dwc3_get_device_id();
-- 
1.7.0.4
