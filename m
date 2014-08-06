From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 3/6] usb: host: ohci-st: Add OHCI driver support for ST STB devices
Date: Wed,  6 Aug 2014 18:03:06 +0100
Message-ID: <1407344589-24863-4-git-send-email-peter.griffin@linaro.org>
References: <1407344589-24863-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1407344589-24863-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, arnd@arndb.de
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the glue code required to ensure the on-chip OHCI
controller works on STi consumer electronics SoC's from STMicroelectron=
ics.

It mainly manages the setting and enabling of the relevant clocks and m=
anages
the reset / power signals to the IP block.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/usb/host/Kconfig   |   7 ++
 drivers/usb/host/Makefile  |   1 +
 drivers/usb/host/ohci-st.c | 302 +++++++++++++++++++++++++++++++++++++=
++++++++
 3 files changed, 310 insertions(+)
 create mode 100644 drivers/usb/host/ohci-st.c

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 800969a..339aed9 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -529,6 +529,13 @@ config USB_OHCI_EXYNOS
 	help
 	 Enable support for the Samsung Exynos SOC's on-chip OHCI controller.
=20
+config USB_OHCI_ST
+	tristate "OHCI support for ST SoC Series"
+	depends on ARCH_STI && OF
+	help
+	 Enable support for the on-chip OHCI controller found on
+	 STMicroelectronics consumer electronics SoC's.
+
 config USB_CNS3XXX_OHCI
 	bool "Cavium CNS3XXX OHCI Module (DEPRECATED)"
 	depends on ARCH_CNS3XXX
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 877f7e2..12f7afd 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_USB_OHCI_HCD)	+=3D ohci-hcd.o
 obj-$(CONFIG_USB_OHCI_HCD_PCI)	+=3D ohci-pci.o
 obj-$(CONFIG_USB_OHCI_HCD_PLATFORM)	+=3D ohci-platform.o
 obj-$(CONFIG_USB_OHCI_EXYNOS)	+=3D ohci-exynos.o
+obj-$(CONFIG_USB_OHCI_ST)		+=3D ohci-st.o usb-st-common.o
 obj-$(CONFIG_USB_OHCI_HCD_OMAP1)	+=3D ohci-omap.o
 obj-$(CONFIG_USB_OHCI_HCD_OMAP3)	+=3D ohci-omap3.o
 obj-$(CONFIG_USB_OHCI_HCD_SPEAR)	+=3D ohci-spear.o
diff --git a/drivers/usb/host/ohci-st.c b/drivers/usb/host/ohci-st.c
new file mode 100644
index 0000000..dfaa616
--- /dev/null
+++ b/drivers/usb/host/ohci-st.c
@@ -0,0 +1,302 @@
+/*
+ * ST OHCI driver
+ *
+ * Copyright (C) 2014 STMicroelectronics =E2=80=93 All Rights Reserved
+ *
+ * Author: Peter Griffin <peter.griffin@linaro.org>
+ *
+ * Derived from ohci-platform.c
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/hrtimer.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/usb/ohci_pdriver.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+
+#include "ohci.h"
+#include "usb-st-common.h"
+
+#define DRIVER_DESC "OHCI STMicroelectronics driver"
+
+#define hcd_to_ohci_priv(h) ((struct st_platform_priv *)hcd_to_ohci(h)=
->priv)
+
+static const char hcd_name[] =3D "ohci-st";
+
+static int st_ohci_platform_power_on(struct platform_device *dev)
+{
+	struct usb_hcd *hcd =3D platform_get_drvdata(dev);
+	struct st_platform_priv *priv =3D hcd_to_ohci_priv(hcd);
+
+	return st_usb_platform_power_on(priv);
+}
+
+static void st_ohci_platform_power_off(struct platform_device *dev)
+{
+	struct usb_hcd *hcd =3D platform_get_drvdata(dev);
+	struct st_platform_priv *priv =3D hcd_to_ohci_priv(hcd);
+
+	return st_usb_platform_power_off(priv);
+}
+
+static struct hc_driver __read_mostly ohci_platform_hc_driver;
+
+static const struct ohci_driver_overrides platform_overrides __initcon=
st =3D {
+	.product_desc =3D		"ST OHCI controller",
+	.extra_priv_size =3D	sizeof(struct st_platform_priv),
+};
+
+static struct usb_ohci_pdata ohci_platform_defaults =3D {
+	.power_on =3D		st_ohci_platform_power_on,
+	.power_suspend =3D	st_ohci_platform_power_off,
+	.power_off =3D		st_ohci_platform_power_off,
+};
+
+static int st_ohci_platform_probe(struct platform_device *dev)
+{
+	struct usb_hcd *hcd;
+	struct resource *res_mem;
+	struct usb_ohci_pdata *pdata =3D dev_get_platdata(&dev->dev);
+	struct st_platform_priv *priv;
+	struct ohci_hcd *ohci;
+	int err, irq, clk =3D 0;
+
+	if (usb_disabled())
+		return -ENODEV;
+
+	/*
+	 * Use reasonable defaults so platforms don't have to provide these
+	 * with DT probing on ARM.
+	 */
+	if (!pdata)
+		pdata =3D &ohci_platform_defaults;
+
+	err =3D dma_coerce_mask_and_coherent(&dev->dev, DMA_BIT_MASK(32));
+	if (err)
+		return err;
+
+	irq =3D platform_get_irq(dev, 0);
+	if (irq < 0) {
+		dev_err(&dev->dev, "no irq provided");
+		return irq;
+	}
+
+	res_mem =3D platform_get_resource(dev, IORESOURCE_MEM, 0);
+	if (!res_mem) {
+		dev_err(&dev->dev, "no memory resource provided");
+		return -ENXIO;
+	}
+
+	hcd =3D usb_create_hcd(&ohci_platform_hc_driver, &dev->dev,
+			dev_name(&dev->dev));
+	if (!hcd)
+		return -ENOMEM;
+
+	platform_set_drvdata(dev, hcd);
+	dev->dev.platform_data =3D pdata;
+	priv =3D hcd_to_ohci_priv(hcd);
+	ohci =3D hcd_to_ohci(hcd);
+
+	if (pdata =3D=3D &ohci_platform_defaults && dev->dev.of_node) {
+
+		priv->phy =3D devm_phy_get(&dev->dev, "usb");
+		if (IS_ERR(priv->phy)) {
+			err =3D PTR_ERR(priv->phy);
+			if (err =3D=3D -EPROBE_DEFER)
+				goto err_put_hcd;
+			priv->phy =3D NULL;
+		}
+
+		for (clk =3D 0; clk < USB_MAX_CLKS; clk++) {
+			priv->clks[clk] =3D of_clk_get(dev->dev.of_node, clk);
+			if (IS_ERR(priv->clks[clk])) {
+				err =3D PTR_ERR(priv->clks[clk]);
+				if (err =3D=3D -EPROBE_DEFER)
+					goto err_put_clks;
+				priv->clks[clk] =3D NULL;
+				break;
+			}
+		}
+
+		/* some SoCs don't have a dedicated 48Mhz clock, but those that
+		   do need the rate to be explicitly set */
+		priv->clk48 =3D devm_clk_get(&dev->dev, "clk48");
+		if (IS_ERR(priv->clk48)) {
+			dev_info(&dev->dev, "48MHz clk not found\n");
+			priv->clk48 =3D NULL;
+		}
+	}
+
+	priv->rst =3D devm_reset_control_get_optional(&dev->dev, "power");
+	if (IS_ERR(priv->pwr)) {
+		err =3D PTR_ERR(priv->pwr);
+		if (err =3D=3D -EPROBE_DEFER)
+			goto err_put_clks;
+		priv->rst =3D NULL;
+	}
+
+	priv->rst =3D devm_reset_control_get_optional(&dev->dev, "softreset")=
;
+	if (IS_ERR(priv->rst)) {
+		err =3D PTR_ERR(priv->rst);
+		if (err =3D=3D -EPROBE_DEFER)
+			goto err_put_clks;
+		priv->rst =3D NULL;
+	}
+
+	if (pdata->power_on) {
+		err =3D pdata->power_on(dev);
+		if (err < 0)
+			goto err_power;
+	}
+
+	hcd->rsrc_start =3D res_mem->start;
+	hcd->rsrc_len =3D resource_size(res_mem);
+
+	hcd->regs =3D devm_ioremap_resource(&dev->dev, res_mem);
+	if (IS_ERR(hcd->regs)) {
+		err =3D PTR_ERR(hcd->regs);
+		goto err_power;
+	}
+	err =3D usb_add_hcd(hcd, irq, IRQF_SHARED);
+	if (err)
+		goto err_power;
+
+	device_wakeup_enable(hcd->self.controller);
+
+	platform_set_drvdata(dev, hcd);
+
+	return err;
+
+err_power:
+	if (pdata->power_off)
+		pdata->power_off(dev);
+
+err_put_clks:
+	while (--clk >=3D 0)
+		clk_put(priv->clks[clk]);
+err_put_hcd:
+	if (pdata =3D=3D &ohci_platform_defaults)
+		dev->dev.platform_data =3D NULL;
+
+	usb_put_hcd(hcd);
+
+	return err;
+}
+
+static int st_ohci_platform_remove(struct platform_device *dev)
+{
+	struct usb_hcd *hcd =3D platform_get_drvdata(dev);
+	struct usb_ohci_pdata *pdata =3D dev_get_platdata(&dev->dev);
+	struct st_platform_priv *priv =3D hcd_to_ohci_priv(hcd);
+	int clk;
+
+	usb_remove_hcd(hcd);
+
+	if (pdata->power_off)
+		pdata->power_off(dev);
+
+
+	for (clk =3D 0; clk < USB_MAX_CLKS && priv->clks[clk]; clk++)
+		clk_put(priv->clks[clk]);
+
+	usb_put_hcd(hcd);
+
+	if (pdata =3D=3D &ohci_platform_defaults)
+		dev->dev.platform_data =3D NULL;
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+
+static int st_ohci_suspend(struct device *dev)
+{
+	struct usb_hcd *hcd =3D dev_get_drvdata(dev);
+	struct usb_ohci_pdata *pdata =3D dev->platform_data;
+	struct platform_device *pdev =3D
+		container_of(dev, struct platform_device, dev);
+	bool do_wakeup =3D device_may_wakeup(dev);
+	int ret;
+
+	ret =3D ohci_suspend(hcd, do_wakeup);
+	if (ret)
+		return ret;
+
+	if (pdata->power_suspend)
+		pdata->power_suspend(pdev);
+
+	return ret;
+}
+
+static int st_ohci_resume(struct device *dev)
+{
+	struct usb_hcd *hcd =3D dev_get_drvdata(dev);
+	struct usb_ohci_pdata *pdata =3D dev_get_platdata(dev);
+	struct platform_device *pdev =3D
+		container_of(dev, struct platform_device, dev);
+	int err;
+
+	if (pdata->power_on) {
+		err =3D pdata->power_on(pdev);
+		if (err < 0)
+			return err;
+	}
+
+	ohci_resume(hcd, false);
+	return 0;
+}
+
+#endif /* CONFIG_PM */
+
+static SIMPLE_DEV_PM_OPS(st_ohci_pm_ops, st_ohci_suspend, st_ohci_resu=
me);
+
+static const struct of_device_id st_ohci_platform_ids[] =3D {
+	{ .compatible =3D "st,st-ohci-300x", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, st_ohci_platform_ids);
+
+static struct platform_driver ohci_platform_driver =3D {
+	.probe		=3D st_ohci_platform_probe,
+	.remove		=3D st_ohci_platform_remove,
+	.shutdown	=3D usb_hcd_platform_shutdown,
+	.driver		=3D {
+		.name	=3D "st-ohci",
+		.pm	=3D &st_ohci_pm_ops,
+		.of_match_table =3D st_ohci_platform_ids,
+	}
+};
+
+static int __init ohci_platform_init(void)
+{
+	if (usb_disabled())
+		return -ENODEV;
+
+	pr_info("%s: " DRIVER_DESC "\n", hcd_name);
+
+	ohci_init_driver(&ohci_platform_hc_driver, &platform_overrides);
+	return platform_driver_register(&ohci_platform_driver);
+}
+module_init(ohci_platform_init);
+
+static void __exit ohci_platform_cleanup(void)
+{
+	platform_driver_unregister(&ohci_platform_driver);
+}
+module_exit(ohci_platform_cleanup);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Peter Griffin <peter.griffin@linaro.org>");
+MODULE_LICENSE("GPL");
--=20
1.9.1
