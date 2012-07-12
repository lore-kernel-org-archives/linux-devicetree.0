From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3 v2] USB: ehci-s5p: Add support for device tree
Date: Thu, 12 Jul 2012 11:25:11 +0530
Message-ID: <1342072512-29945-3-git-send-email-gautam.vivek@samsung.com>
References: <1342072512-29945-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1342072512-29945-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support to parse probe data for
ehci driver for exynos using device tree

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index c474cec..52d0049 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <plat/ehci.h>
 #include <plat/usb-phy.h>
@@ -63,6 +64,8 @@ static const struct hc_driver s5p_ehci_hc_driver = {
 	.clear_tt_buffer_complete	= ehci_clear_tt_buffer_complete,
 };
 
+static u64 ehci_s5p_dma_mask = DMA_BIT_MASK(32);
+
 static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 {
 	struct s5p_ehci_platdata *pdata;
@@ -79,6 +82,16 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/*
+	 * Right now device-tree probed devices don't get dma_mask set.
+	 * Since shared usb code relies on it, set it here for now.
+	 * Once we move to full device tree support this will vanish off.
+	 */
+	if (!pdev->dev.dma_mask)
+		pdev->dev.dma_mask = &ehci_s5p_dma_mask;
+	if (!pdev->dev.coherent_dma_mask)
+		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
+
 	s5p_ehci = kzalloc(sizeof(struct s5p_ehci_hcd), GFP_KERNEL);
 	if (!s5p_ehci)
 		return -ENOMEM;
@@ -298,6 +311,14 @@ static int s5p_ehci_resume(struct device *dev)
 #define s5p_ehci_resume		NULL
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id exynos_ehci_match[] = {
+	{ .compatible = "samsung,exynos-ehci" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_ehci_match);
+#endif
+
 static const struct dev_pm_ops s5p_ehci_pm_ops = {
 	.suspend	= s5p_ehci_suspend,
 	.resume		= s5p_ehci_resume,
@@ -311,6 +332,7 @@ static struct platform_driver s5p_ehci_driver = {
 		.name	= "s5p-ehci",
 		.owner	= THIS_MODULE,
 		.pm	= &s5p_ehci_pm_ops,
+		.of_match_table = of_match_ptr(exynos_ehci_match),
 	}
 };
 
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
