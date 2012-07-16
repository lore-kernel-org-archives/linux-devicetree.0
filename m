From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2 v3] USB: dwc3-exynos: Add support for device tree
Date: Mon, 16 Jul 2012 11:27:38 +0530
Message-ID: <1342418259-23802-2-git-send-email-gautam.vivek@samsung.com>
References: <1342418259-23802-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1342418259-23802-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support to parse probe data for
dwc3 driver for exynos using device tree

Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/dwc3/dwc3-exynos.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index b8f0038..a293c69 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -19,6 +19,7 @@
 #include <linux/platform_data/dwc3-exynos.h>
 #include <linux/dma-mapping.h>
 #include <linux/clk.h>
+#include <linux/of.h>
 
 #include "core.h"
 
@@ -29,6 +30,8 @@ struct dwc3_exynos {
 	struct clk		*clk;
 };
 
+static u64 dwc3_exynos_dma_mask = DMA_BIT_MASK(32);
+
 static int __devinit dwc3_exynos_probe(struct platform_device *pdev)
 {
 	struct dwc3_exynos_data	*pdata = pdev->dev.platform_data;
@@ -45,6 +48,16 @@ static int __devinit dwc3_exynos_probe(struct platform_device *pdev)
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
@@ -134,11 +147,20 @@ static int __devexit dwc3_exynos_remove(struct platform_device *pdev)
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

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
