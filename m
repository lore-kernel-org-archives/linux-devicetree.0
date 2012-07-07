From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v9 REBASE 9/9] usb: chipidea: add imx platform driver
Date: Sat, 7 Jul 2012 22:56:48 +0800
Message-ID: <1341673008-29808-10-git-send-email-richard.zhao@freescale.com>
References: <1341673008-29808-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341673008-29808-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch supports only the host-mode functionality so far.

Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Tested-by: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/usb/ci13xxx-imx.txt        |   18 ++
 drivers/usb/chipidea/Makefile                      |    3 +
 drivers/usb/chipidea/ci13xxx_imx.c                 |  198 ++++++++++++++++++++
 3 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
 create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c

diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
new file mode 100644
index 0000000..2c29041
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
@@ -0,0 +1,18 @@
+* Freescale i.MX ci13xxx usb controllers
+
+Required properties:
+- compatible: Should be "fsl,imx27-usb"
+- reg: Should contain registers location and length
+- interrupts: Should contain controller interrupt
+
+Optional properties:
+- fsl,usbphy: phandler of usb phy that connects to the only one port
+- vbus-supply: regulator for vbus
+
+Examples:
+usb@02184000 { /* USB OTG */
+	compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
+	reg = <0x02184000 0x200>;
+	interrupts = <0 43 0x04>;
+	fsl,usbphy = <&usbphy1>;
+};
diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makefile
index b69900a..5c66d9c 100644
--- a/drivers/usb/chipidea/Makefile
+++ b/drivers/usb/chipidea/Makefile
@@ -14,3 +14,6 @@ ifneq ($(CONFIG_PCI),)
 	obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_pci.o
 endif
 
+ifneq ($(CONFIG_OF_DEVICE),)
+	obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_imx.o
+endif
diff --git a/drivers/usb/chipidea/ci13xxx_imx.c b/drivers/usb/chipidea/ci13xxx_imx.c
new file mode 100644
index 0000000..ef60d06
--- /dev/null
+++ b/drivers/usb/chipidea/ci13xxx_imx.c
@@ -0,0 +1,198 @@
+/*
+ * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright (C) 2012 Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
+ * on behalf of DENX Software Engineering GmbH
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/dma-mapping.h>
+#include <linux/usb/chipidea.h>
+#include <linux/clk.h>
+#include <linux/regulator/consumer.h>
+
+#include "ci.h"
+
+#define pdev_to_phy(pdev) \
+	((struct usb_phy *)platform_get_drvdata(pdev))
+
+struct ci13xxx_imx_data {
+	struct device_node *phy_np;
+	struct usb_phy *phy;
+	struct platform_device *ci_pdev;
+	struct clk *clk;
+	struct regulator *reg_vbus;
+};
+
+static struct ci13xxx_platform_data ci13xxx_imx_platdata __devinitdata  = {
+	.name			= "ci13xxx_imx",
+	.flags			= CI13XXX_REQUIRE_TRANSCEIVER |
+				  CI13XXX_PULLUP_ON_VBUS |
+				  CI13XXX_DISABLE_STREAMING,
+	.capoffset		= DEF_CAPOFFSET,
+};
+
+static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
+{
+	struct ci13xxx_imx_data *data;
+	struct platform_device *plat_ci, *phy_pdev;
+	struct device_node *phy_np;
+	struct resource *res;
+	struct regulator *reg_vbus;
+	int ret;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		dev_err(&pdev->dev, "Failed to allocate CI13xxx-IMX data!\n");
+		return -ENOMEM;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "Can't get device resources!\n");
+		return -ENOENT;
+	}
+
+	data->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(data->clk)) {
+		dev_err(&pdev->dev,
+			"Failed to get clock, err=%ld\n", PTR_ERR(data->clk));
+		return PTR_ERR(data->clk);
+	}
+
+	ret = clk_prepare_enable(data->clk);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to prepare or enable clock, err=%d\n", ret);
+		return ret;
+	}
+
+	phy_np = of_parse_phandle(pdev->dev.of_node, "fsl,usbphy", 0);
+	if (phy_np) {
+		data->phy_np = phy_np;
+		phy_pdev = of_find_device_by_node(phy_np);
+		if (phy_pdev) {
+			struct usb_phy *phy;
+			phy = pdev_to_phy(phy_pdev);
+			if (phy &&
+			    try_module_get(phy_pdev->dev.driver->owner)) {
+				usb_phy_init(phy);
+				data->phy = phy;
+			}
+		}
+	}
+
+	/* we only support host now, so enable vbus here */
+	reg_vbus = devm_regulator_get(&pdev->dev, "vbus");
+	if (!IS_ERR(reg_vbus)) {
+		ret = regulator_enable(reg_vbus);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to enable vbus regulator, err=%d\n",
+				ret);
+			goto put_np;
+		}
+		data->reg_vbus = reg_vbus;
+	} else {
+		reg_vbus = NULL;
+	}
+
+	ci13xxx_imx_platdata.phy = data->phy;
+
+	if (!pdev->dev.dma_mask) {
+		pdev->dev.dma_mask = devm_kzalloc(&pdev->dev,
+				      sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
+		if (!pdev->dev.dma_mask) {
+			ret = -ENOMEM;
+			dev_err(&pdev->dev, "Failed to alloc dma_mask!\n");
+			goto err;
+		}
+		*pdev->dev.dma_mask = DMA_BIT_MASK(32);
+		dma_set_coherent_mask(&pdev->dev, *pdev->dev.dma_mask);
+	}
+	plat_ci = ci13xxx_add_device(&pdev->dev,
+				pdev->resource, pdev->num_resources,
+				&ci13xxx_imx_platdata);
+	if (IS_ERR(plat_ci)) {
+		ret = PTR_ERR(plat_ci);
+		dev_err(&pdev->dev,
+			"Can't register ci_hdrc platform device, err=%d\n",
+			ret);
+		goto err;
+	}
+
+	data->ci_pdev = plat_ci;
+	platform_set_drvdata(pdev, data);
+
+	pm_runtime_no_callbacks(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+
+err:
+	if (reg_vbus)
+		regulator_disable(reg_vbus);
+put_np:
+	if (phy_np)
+		of_node_put(phy_np);
+	clk_disable_unprepare(data->clk);
+	return ret;
+}
+
+static int __devexit ci13xxx_imx_remove(struct platform_device *pdev)
+{
+	struct ci13xxx_imx_data *data = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	ci13xxx_remove_device(data->ci_pdev);
+
+	if (data->reg_vbus)
+		regulator_disable(data->reg_vbus);
+
+	if (data->phy) {
+		usb_phy_shutdown(data->phy);
+		module_put(data->phy->dev->driver->owner);
+	}
+
+	of_node_put(data->phy_np);
+
+	clk_disable_unprepare(data->clk);
+
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+static const struct of_device_id ci13xxx_imx_dt_ids[] = {
+	{ .compatible = "fsl,imx27-usb", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ci13xxx_imx_dt_ids);
+
+static struct platform_driver ci13xxx_imx_driver = {
+	.probe = ci13xxx_imx_probe,
+	.remove = __devexit_p(ci13xxx_imx_remove),
+	.driver = {
+		.name = "imx_usb",
+		.owner = THIS_MODULE,
+		.of_match_table = ci13xxx_imx_dt_ids,
+	 },
+};
+
+module_platform_driver(ci13xxx_imx_driver);
+
+MODULE_ALIAS("platform:imx-usb");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("CI13xxx i.MX USB binding");
+MODULE_AUTHOR("Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>");
+MODULE_AUTHOR("Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>");
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
