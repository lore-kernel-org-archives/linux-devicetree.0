From: <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: patch "phy: Add support for Qualcomm's USB HSIC phy" added to usb-next
Date: Tue, 31 Jan 2017 15:27:09 +0100
Message-ID: <148587282917094@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    phy: Add support for Qualcomm's USB HSIC phy

to my usb git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
in the usb-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


>From 605b8652f7f005452c89db1e6cef085479da2f16 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Wed, 25 Jan 2017 14:32:44 -0800
Subject: phy: Add support for Qualcomm's USB HSIC phy

The HSIC USB controller on qcom SoCs has an integrated all
digital phy controlled via the ULPI viewport.

Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/phy/qcom,usb-hsic-phy.txt  |  65 +++++++++
 drivers/phy/Kconfig                                |   7 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-qcom-usb-hsic.c                    | 160 +++++++++++++++++++++
 4 files changed, 233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt
 create mode 100644 drivers/phy/phy-qcom-usb-hsic.c

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt b/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt
new file mode 100644
index 000000000000..3c7cb2be4b12
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt
@@ -0,0 +1,65 @@
+Qualcomm's USB HSIC PHY
+
+PROPERTIES
+
+- compatible:
+    Usage: required
+    Value type: <string>
+    Definition: Should contain "qcom,usb-hsic-phy" and more specifically one of the
+		following:
+
+			"qcom,usb-hsic-phy-mdm9615"
+			"qcom,usb-hsic-phy-msm8974"
+
+- #phy-cells:
+    Usage: required
+    Value type: <u32>
+    Definition: Should contain 0
+
+- clocks:
+    Usage: required
+    Value type: <prop-encoded-array>
+    Definition: Should contain clock specifier for phy, calibration and
+                a calibration sleep clock
+
+- clock-names:
+    Usage: required
+    Value type: <stringlist>
+    Definition: Should contain "phy, "cal" and "cal_sleep"
+
+- pinctrl-names:
+    Usage: required
+    Value type: <stringlist>
+    Definition: Should contain "init" and "default" in that order
+
+- pinctrl-0:
+    Usage: required
+    Value type: <prop-encoded-array>
+    Definition: List of pinctrl settings to apply to keep HSIC pins in a glitch
+                free state
+
+- pinctrl-1:
+    Usage: required
+    Value type: <prop-encoded-array>
+    Definition: List of pinctrl settings to apply to mux out the HSIC pins
+
+EXAMPLE
+
+usb-controller {
+	ulpi {
+		phy {
+			compatible = "qcom,usb-hsic-phy-msm8974",
+				     "qcom,usb-hsic-phy";
+			#phy-cells = <0>;
+			pinctrl-names = "init", "default";
+			pinctrl-0 = <&hsic_sleep>;
+			pinctrl-1 = <&hsic_default>;
+			clocks = <&gcc GCC_USB_HSIC_CLK>,
+				 <&gcc GCC_USB_HSIC_IO_CAL_CLK>,
+				 <&gcc GCC_USB_HSIC_IO_CAL_SLEEP_CLK>;
+			clock-names = "phy", "cal", "cal_sleep";
+			assigned-clocks = <&gcc GCC_USB_HSIC_IO_CAL_CLK>;
+			assigned-clock-rates = <960000>;
+		};
+	};
+};
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index e8eb7f225a88..a430a64981d5 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -437,6 +437,13 @@ config PHY_QCOM_UFS
 	help
 	  Support for UFS PHY on QCOM chipsets.
 
+config PHY_QCOM_USB_HSIC
+	tristate "Qualcomm USB HSIC ULPI PHY module"
+	depends on USB_ULPI_BUS
+	select GENERIC_PHY
+	help
+	  Support for the USB HSIC ULPI compliant PHY on QCOM chipsets.
+
 config PHY_TUSB1210
 	tristate "TI TUSB1210 ULPI PHY module"
 	depends on USB_ULPI_BUS
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 65eb2f436a41..c43c9df5d301 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_PHY_STIH407_USB)		+= phy-stih407-usb.o
 obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs.o
 obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs-qmp-20nm.o
 obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs-qmp-14nm.o
+obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
 obj-$(CONFIG_PHY_TUSB1210)		+= phy-tusb1210.o
 obj-$(CONFIG_PHY_BRCM_SATA)		+= phy-brcm-sata.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
diff --git a/drivers/phy/phy-qcom-usb-hsic.c b/drivers/phy/phy-qcom-usb-hsic.c
new file mode 100644
index 000000000000..47690f9945b9
--- /dev/null
+++ b/drivers/phy/phy-qcom-usb-hsic.c
@@ -0,0 +1,160 @@
+/**
+ * Copyright (C) 2016 Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/module.h>
+#include <linux/ulpi/driver.h>
+#include <linux/ulpi/regs.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinctrl-state.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+
+#include "ulpi_phy.h"
+
+#define ULPI_HSIC_CFG		0x30
+#define ULPI_HSIC_IO_CAL	0x33
+
+struct qcom_usb_hsic_phy {
+	struct ulpi *ulpi;
+	struct phy *phy;
+	struct pinctrl *pctl;
+	struct clk *phy_clk;
+	struct clk *cal_clk;
+	struct clk *cal_sleep_clk;
+};
+
+static int qcom_usb_hsic_phy_power_on(struct phy *phy)
+{
+	struct qcom_usb_hsic_phy *uphy = phy_get_drvdata(phy);
+	struct ulpi *ulpi = uphy->ulpi;
+	struct pinctrl_state *pins_default;
+	int ret;
+
+	ret = clk_prepare_enable(uphy->phy_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(uphy->cal_clk);
+	if (ret)
+		goto err_cal;
+
+	ret = clk_prepare_enable(uphy->cal_sleep_clk);
+	if (ret)
+		goto err_sleep;
+
+	/* Set periodic calibration interval to ~2.048sec in HSIC_IO_CAL_REG */
+	ret = ulpi_write(ulpi, ULPI_HSIC_IO_CAL, 0xff);
+	if (ret)
+		goto err_ulpi;
+
+	/* Enable periodic IO calibration in HSIC_CFG register */
+	ret = ulpi_write(ulpi, ULPI_HSIC_CFG, 0xa8);
+	if (ret)
+		goto err_ulpi;
+
+	/* Configure pins for HSIC functionality */
+	pins_default = pinctrl_lookup_state(uphy->pctl, PINCTRL_STATE_DEFAULT);
+	if (IS_ERR(pins_default))
+		return PTR_ERR(pins_default);
+
+	ret = pinctrl_select_state(uphy->pctl, pins_default);
+	if (ret)
+		goto err_ulpi;
+
+	 /* Enable HSIC mode in HSIC_CFG register */
+	ret = ulpi_write(ulpi, ULPI_SET(ULPI_HSIC_CFG), 0x01);
+	if (ret)
+		goto err_ulpi;
+
+	/* Disable auto-resume */
+	ret = ulpi_write(ulpi, ULPI_CLR(ULPI_IFC_CTRL),
+			 ULPI_IFC_CTRL_AUTORESUME);
+	if (ret)
+		goto err_ulpi;
+
+	return ret;
+err_ulpi:
+	clk_disable_unprepare(uphy->cal_sleep_clk);
+err_sleep:
+	clk_disable_unprepare(uphy->cal_clk);
+err_cal:
+	clk_disable_unprepare(uphy->phy_clk);
+	return ret;
+}
+
+static int qcom_usb_hsic_phy_power_off(struct phy *phy)
+{
+	struct qcom_usb_hsic_phy *uphy = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(uphy->cal_sleep_clk);
+	clk_disable_unprepare(uphy->cal_clk);
+	clk_disable_unprepare(uphy->phy_clk);
+
+	return 0;
+}
+
+static const struct phy_ops qcom_usb_hsic_phy_ops = {
+	.power_on = qcom_usb_hsic_phy_power_on,
+	.power_off = qcom_usb_hsic_phy_power_off,
+	.owner = THIS_MODULE,
+};
+
+static int qcom_usb_hsic_phy_probe(struct ulpi *ulpi)
+{
+	struct qcom_usb_hsic_phy *uphy;
+	struct phy_provider *p;
+	struct clk *clk;
+
+	uphy = devm_kzalloc(&ulpi->dev, sizeof(*uphy), GFP_KERNEL);
+	if (!uphy)
+		return -ENOMEM;
+	ulpi_set_drvdata(ulpi, uphy);
+
+	uphy->ulpi = ulpi;
+	uphy->pctl = devm_pinctrl_get(&ulpi->dev);
+	if (IS_ERR(uphy->pctl))
+		return PTR_ERR(uphy->pctl);
+
+	uphy->phy_clk = clk = devm_clk_get(&ulpi->dev, "phy");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	uphy->cal_clk = clk = devm_clk_get(&ulpi->dev, "cal");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	uphy->cal_sleep_clk = clk = devm_clk_get(&ulpi->dev, "cal_sleep");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	uphy->phy = devm_phy_create(&ulpi->dev, ulpi->dev.of_node,
+				    &qcom_usb_hsic_phy_ops);
+	if (IS_ERR(uphy->phy))
+		return PTR_ERR(uphy->phy);
+	phy_set_drvdata(uphy->phy, uphy);
+
+	p = devm_of_phy_provider_register(&ulpi->dev, of_phy_simple_xlate);
+	return PTR_ERR_OR_ZERO(p);
+}
+
+static const struct of_device_id qcom_usb_hsic_phy_match[] = {
+	{ .compatible = "qcom,usb-hsic-phy", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_usb_hsic_phy_match);
+
+static struct ulpi_driver qcom_usb_hsic_phy_driver = {
+	.probe = qcom_usb_hsic_phy_probe,
+	.driver = {
+		.name = "qcom_usb_hsic_phy",
+		.of_match_table = qcom_usb_hsic_phy_match,
+	},
+};
+module_ulpi_driver(qcom_usb_hsic_phy_driver);
+
+MODULE_DESCRIPTION("Qualcomm USB HSIC phy");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
