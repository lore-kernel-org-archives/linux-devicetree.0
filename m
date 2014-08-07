From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 2/5] usb: host: ohci-st: Add OHCI driver support for ST STB devices
Date: Thu,  7 Aug 2014 16:21:41 +0100
Message-ID: <1407424904-19251-3-git-send-email-peter.griffin@linaro.org>
References: <1407424904-19251-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1407424904-19251-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the glue code required to ensure the on-chip OHCI
controller works on STi consumer electronics SoC's from STMicroelectron=
ics.

It mainly manages the setting and enabling of the relevant clocks and m=
anages
the reset / power signals to the IP block.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/usb/host/Kconfig   |   8 ++
 drivers/usb/host/Makefile  |   1 +
 drivers/usb/host/ohci-st.c | 337 +++++++++++++++++++++++++++++++++++++=
++++++++
 3 files changed, 346 insertions(+)
 create mode 100644 drivers/usb/host/ohci-st.c

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 03314f8..4b577f6 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -753,6 +753,14 @@ config USB_HCD_SSB
=20
 	  If unsure, say N.
=20
+config USB_HCD_ST
+	tristate "ST USB driver for ST SoC Series"
+	depends on ARCH_STI && OF
+	select GENERIC_PHY
+	help
+	  Enable support for the on-chip OHCI & EHCI controller found on
+	  STMicroelectronics consumer electronics SoC's.
+
 config USB_HCD_TEST_MODE
 	bool "HCD test mode support"
 	---help---
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index af89a90..df7e5ac 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -74,3 +74,4 @@ obj-$(CONFIG_USB_HCD_SSB)	+=3D ssb-hcd.o
 obj-$(CONFIG_USB_FUSBH200_HCD)	+=3D fusbh200-hcd.o
 obj-$(CONFIG_USB_FOTG210_HCD)	+=3D fotg210-hcd.o
 obj-$(CONFIG_USB_MAX3421_HCD)	+=3D max3421-hcd.o
+obj-$(CONFIG_USB_HCD_ST)	+=3D ehci-st.o ohci-st.o
diff --git a/drivers/usb/host/ohci-st.c b/drivers/usb/host/ohci-st.c
new file mode 100644
index 0000000..263132a
--- /dev/null
+++ b/drivers/usb/host/ohci-st.c
@@ -0,0 +1,337 @@
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
+	int clk, ret;
+
+	ret =3D reset_control_deassert(priv->pwr);
+	if (ret)
+		return ret;
+
+	ret =3D reset_control_deassert(priv->rst);
+	if (ret)
+		goto err_assert_power;
+
+	/* some SoCs don't have a dedicated 48Mhz clock, but those that do
+	   need the rate to be explicitly set */
+	if (priv->clk48) {
+		ret =3D clk_set_rate(priv->clk48, 48000000);
+		if (ret)
+			goto err_assert_reset;
+	}
+
+	for (clk =3D 0; clk < USB_MAX_CLKS && priv->clks[clk]; clk++) {
+		ret =3D clk_prepare_enable(priv->clks[clk]);
+		if (ret)
+			goto err_disable_clks;
+	}
+
+	ret =3D phy_init(priv->phy);
+	if (ret)
+		goto err_disable_clks;
+
+	ret =3D phy_power_on(priv->phy);
+	if (ret)
+		goto err_exit_phy;
+
+	return 0;
+
+err_exit_phy:
+	phy_exit(priv->phy);
+err_disable_clks:
+	while (--clk >=3D 0)
+		clk_disable_unprepare(priv->clks[clk]);
+err_assert_reset:
+	reset_control_assert(priv->rst);
+err_assert_power:
+	reset_control_assert(priv->pwr);
+
+	return ret;
+}
+
+static void st_ohci_platform_power_off(struct platform_device *dev)
+{
+	struct usb_hcd *hcd =3D platform_get_drvdata(dev);
+	struct st_platform_priv *priv =3D hcd_to_ohci_priv(hcd);
+
+	int clk;
+
+	reset_control_assert(priv->pwr);
+
+	reset_control_assert(priv->rst);
+
+	phy_power_off(priv->phy);
+
+	phy_exit(priv->phy);
+
+	for (clk =3D USB_MAX_CLKS - 1; clk >=3D 0; clk--)
+		if (priv->clks[clk])
+			clk_disable_unprepare(priv->clks[clk]);
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
+	struct usb_ohci_pdata *pdata =3D &ohci_platform_defaults;
+	struct st_platform_priv *priv;
+	struct ohci_hcd *ohci;
+	int err, irq, clk =3D 0;
+
+	if (usb_disabled())
+		return -ENODEV;
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
+	priv->phy =3D devm_phy_get(&dev->dev, "usb");
+	if (IS_ERR(priv->phy)) {
+		err =3D PTR_ERR(priv->phy);
+		goto err_put_hcd;
+	}
+
+	for (clk =3D 0; clk < USB_MAX_CLKS; clk++) {
+		priv->clks[clk] =3D of_clk_get(dev->dev.of_node, clk);
+		if (IS_ERR(priv->clks[clk])) {
+			err =3D PTR_ERR(priv->clks[clk]);
+			if (err =3D=3D -EPROBE_DEFER)
+				goto err_put_clks;
+			priv->clks[clk] =3D NULL;
+			break;
+		}
+	}
+
+	/* some SoCs don't have a dedicated 48Mhz clock, but those that
+	   do need the rate to be explicitly set */
+	priv->clk48 =3D devm_clk_get(&dev->dev, "clk48");
+	if (IS_ERR(priv->clk48)) {
+		dev_info(&dev->dev, "48MHz clk not found\n");
+		priv->clk48 =3D NULL;
+	}
+
+	priv->pwr =3D devm_reset_control_get_optional(&dev->dev, "power");
+	if (IS_ERR(priv->pwr)) {
+		err =3D PTR_ERR(priv->pwr);
+		goto err_put_clks;
+	}
+
+	priv->rst =3D devm_reset_control_get_optional(&dev->dev, "softreset")=
;
+	if (IS_ERR(priv->rst)) {
+		err =3D PTR_ERR(priv->rst);
+		goto err_put_clks;
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
