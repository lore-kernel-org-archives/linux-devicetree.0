From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 1/2 v2] USB: dwc3-exynos: Add support for device tree
Date: Thu, 12 Jul 2012 11:30:02 +0530
Message-ID: <1342072803-15939-2-git-send-email-gautam.vivek@samsung.com>
References: <1342072803-15939-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1342072803-15939-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: l.majewski@samsung.com, a.kesavan@samsung.com, prashanth.g@samsung.com, kmpark@infradead.org, joshi@samsung.com, jg1.han@samsung.com, jy0922.shim@samsung.com, sshtylyov@mvista.com, olofj@google.com
List-Id: devicetree@vger.kernel.org

This patch adds support to parse probe data for
dwc3 driver for exynos using device tree

Signed-off-by: Praveen Paneri <p.paneri@samsung.com>
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index d190301..9ae91b7 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -20,6 +20,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/clk.h>
+#include <linux/of.h>
 
 #include "core.h"
 
@@ -30,6 +31,8 @@ struct dwc3_exynos {
 	struct clk		*clk;
 };
 
+static u64 dwc3_exynos_dma_mask = DMA_BIT_MASK(32);
+
 static int __devinit dwc3_exynos_probe(struct platform_device *pdev)
 {
 	struct dwc3_exynos_data	*pdata = pdev->dev.platform_data;
@@ -46,6 +49,16 @@ static int __devinit dwc3_exynos_probe(struct platform_device *pdev)
 		goto err0;
 	}
 
+	/*
+	 * Right now device-tree probed devices don't get dma_mask set.
+	 * Since shared usb code relies on it, set it here for now.
+	 * Once we move to full device tree support this will vanish off.
+	 */
+	if (!pdev->dev.dma_mask)
+		pdev->dev.dma_mask = &dwc3_exynos_dma_mask;
+	if (!pdev->dev.coherent_dma_mask)
+		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
+
 	platform_set_drvdata(pdev, exynos);
 
 	devid = dwc3_get_device_id();
@@ -135,11 +148,20 @@ static int __devexit dwc3_exynos_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id exynos_xhci_match[] = {
+	{ .compatible = "samsung,exynos-xhci" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_xhci_match);
+#endif
+
 static struct platform_driver dwc3_exynos_driver = {
 	.probe		= dwc3_exynos_probe,
 	.remove		= __devexit_p(dwc3_exynos_remove),
 	.driver		= {
 		.name	= "exynos-dwc3",
+		.of_match_table = of_match_ptr(exynos_xhci_match),
 	},
 };
 
-- 
1.7.0.4
