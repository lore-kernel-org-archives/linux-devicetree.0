From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v4 1/6] usb: chipidea: usbmisc: rename file, struct and functions to usbmisc_imx
Date: Tue, 27 Nov 2012 17:16:56 +0100
Message-ID: <1354033021-10585-2-git-send-email-m.grzeschik@pengutronix.de>
References: <1354033021-10585-1-git-send-email-m.grzeschik@pengutronix.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354033021-10585-1-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This driver will be used for every Freescale SoC which has this misc
memory layout to control the basic usb handling. So better name this
driver, function and struct names in a more generic way.

Reported-by: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Changes since v1:
* added Makefile change to be build as well
* moved this patch infront all other

 drivers/usb/chipidea/Makefile                      |    2 +-
 .../chipidea/{usbmisc_imx6q.c => usbmisc_imx.c}    |   38 ++++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)
 rename drivers/usb/chipidea/{usbmisc_imx6q.c => usbmisc_imx.c} (75%)

diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makefile
index 11f513c..146ecd7 100644
--- a/drivers/usb/chipidea/Makefile
+++ b/drivers/usb/chipidea/Makefile
@@ -17,5 +17,5 @@ ifneq ($(CONFIG_PCI),)
 endif
 
 ifneq ($(CONFIG_OF_DEVICE),)
-	obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_imx.o usbmisc_imx6q.o
+	obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_imx.o usbmisc_imx.o
 endif
diff --git a/drivers/usb/chipidea/usbmisc_imx6q.c b/drivers/usb/chipidea/usbmisc_imx.c
similarity index 75%
rename from drivers/usb/chipidea/usbmisc_imx6q.c
rename to drivers/usb/chipidea/usbmisc_imx.c
index 416e3fc..5da379a 100644
--- a/drivers/usb/chipidea/usbmisc_imx6q.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -21,14 +21,14 @@
 
 #define BM_OVER_CUR_DIS		BIT(7)
 
-struct imx6q_usbmisc {
+struct imx_usbmisc {
 	void __iomem *base;
 	spinlock_t lock;
 	struct clk *clk;
 	struct usbmisc_usb_device usbdev[USB_DEV_MAX];
 };
 
-static struct imx6q_usbmisc *usbmisc;
+static struct imx_usbmisc *usbmisc;
 
 static struct usbmisc_usb_device *get_usbdev(struct device *dev)
 {
@@ -77,15 +77,15 @@ static const struct usbmisc_ops imx6q_usbmisc_ops = {
 	.init = usbmisc_imx6q_init,
 };
 
-static const struct of_device_id usbmisc_imx6q_dt_ids[] = {
+static const struct of_device_id usbmisc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx6q-usbmisc"},
 	{ /* sentinel */ }
 };
 
-static int __devinit usbmisc_imx6q_probe(struct platform_device *pdev)
+static int __devinit usbmisc_imx_probe(struct platform_device *pdev)
 {
 	struct resource	*res;
-	struct imx6q_usbmisc *data;
+	struct imx_usbmisc *data;
 	int ret;
 
 	if (usbmisc)
@@ -127,36 +127,36 @@ static int __devinit usbmisc_imx6q_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __devexit usbmisc_imx6q_remove(struct platform_device *pdev)
+static int __devexit usbmisc_imx_remove(struct platform_device *pdev)
 {
 	usbmisc_unset_ops(&imx6q_usbmisc_ops);
 	clk_disable_unprepare(usbmisc->clk);
 	return 0;
 }
 
-static struct platform_driver usbmisc_imx6q_driver = {
-	.probe = usbmisc_imx6q_probe,
-	.remove = __devexit_p(usbmisc_imx6q_remove),
+static struct platform_driver usbmisc_imx_driver = {
+	.probe = usbmisc_imx_probe,
+	.remove = __devexit_p(usbmisc_imx_remove),
 	.driver = {
-		.name = "usbmisc_imx6q",
+		.name = "usbmisc_imx",
 		.owner = THIS_MODULE,
-		.of_match_table = usbmisc_imx6q_dt_ids,
+		.of_match_table = usbmisc_imx_dt_ids,
 	 },
 };
 
-int __init usbmisc_imx6q_drv_init(void)
+int __init usbmisc_imx_drv_init(void)
 {
-	return platform_driver_register(&usbmisc_imx6q_driver);
+	return platform_driver_register(&usbmisc_imx_driver);
 }
-subsys_initcall(usbmisc_imx6q_drv_init);
+subsys_initcall(usbmisc_imx_drv_init);
 
-void __exit usbmisc_imx6q_drv_exit(void)
+void __exit usbmisc_imx_drv_exit(void)
 {
-	platform_driver_unregister(&usbmisc_imx6q_driver);
+	platform_driver_unregister(&usbmisc_imx_driver);
 }
-module_exit(usbmisc_imx6q_drv_exit);
+module_exit(usbmisc_imx_drv_exit);
 
-MODULE_ALIAS("platform:usbmisc-imx6q");
+MODULE_ALIAS("platform:usbmisc-imx");
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("driver for imx6q usb non-core registers");
+MODULE_DESCRIPTION("driver for imx usb non-core registers");
 MODULE_AUTHOR("Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>");
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
