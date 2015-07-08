From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH] usb: phy: qcom: New APQ8016/MSM8916 USB transceiver driver
Date: Wed,  8 Jul 2015 17:57:40 +0300
Message-ID: <1436367460-18526-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Driver handles PHY initialization, clock management, power
management and workarounds required after resetting the hardware.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 .../devicetree/bindings/usb/qcom,usb-8x16-phy.txt  |  76 ++++
 drivers/usb/phy/Kconfig                            |  14 +
 drivers/usb/phy/Makefile                           |   1 +
 drivers/usb/phy/phy-qcom-8x16-usb.c                | 436 +++++++++++++++++++++
 4 files changed, 527 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,usb-8x16-phy.txt
 create mode 100644 drivers/usb/phy/phy-qcom-8x16-usb.c

diff --git a/Documentation/devicetree/bindings/usb/qcom,usb-8x16-phy.txt b/Documentation/devicetree/bindings/usb/qcom,usb-8x16-phy.txt
new file mode 100644
index 0000000..2cb2168
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,usb-8x16-phy.txt
@@ -0,0 +1,76 @@
+Qualcomm's APQ8016/MSM8916 USB transceiver controller
+
+- compatible:
+    Usage: required
+    Value type: <string>
+    Definition: Should contain "qcom,usb-8x16-phy".
+
+- reg:
+    Usage: required
+    Value type: <prop-encoded-array>
+    Definition: USB PHY base address and length of the register map
+
+- clocks:
+    Usage: required
+    Value type: <prop-encoded-array>
+    Definition: See clock-bindings.txt section "consumers". List of
+                two clock specifiers for interface and core controller
+                clocks.
+
+- clock-names:
+    Usage: required
+    Value type: <string>
+    Definition: Must contain "iface" and "core" strings.
+
+- vddcx-supply:
+    Usage: required
+    Value type: <phandle>
+    Definition: phandle to the regulator VDCCX supply node.
+
+- v1p8-supply:
+    Usage: required
+    Value type: <phandle>
+    Definition: phandle to the regulator 1.8V supply node.
+
+- v3p3-supply:
+    Usage: required
+    Value type: <phandle>
+    Definition: phandle to the regulator 3.3V supply node.
+
+- resets:
+    Usage: required
+    Value type: <prop-encoded-array>
+    Definition: See reset.txt section "consumers". PHY reset specifier.
+
+- reset-names:
+    Usage: required
+    Value type: <string>
+    Definition: Must contain "phy" string.
+
+- switch-gpio:
+    Usage: optional
+    Value type: <prop-encoded-array>
+    Definition: Some boards are using Dual SPDT USB Switch, witch is
+                controlled by GPIO to de/multiplex D+/D- USB lines
+                between connectors.
+
+Example:
+	usb_phy: phy@78d9000 {
+		compatible = "qcom,usb-8x16-phy";
+		reg = <0x78d9000 0x400>;
+
+		vddcx-supply = <&pm8916_s1_corner>;
+		v1p8-supply = <&pm8916_l7>;
+		v3p3-supply = <&pm8916_l13>;
+
+		clocks = <&gcc GCC_USB_HS_AHB_CLK>,
+			     <&gcc GCC_USB_HS_SYSTEM_CLK>;
+		clock-names = "iface", "core";
+
+		resets = <&gcc GCC_USB2A_PHY_BCR>;
+		reset-names = "phy";
+
+		// D+/D- lines: 1 - Routed to HUB, 0 - Device connector
+		switch-gpio = <&pm8916_gpios 4 GPIO_ACTIVE_HIGH>;
+	};
+
diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 869c0cfcad..7d3beee 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -152,6 +152,20 @@ config USB_MSM_OTG
 	  This driver is not supported on boards like trout which
 	  has an external PHY.

+config USB_QCOM_8X16_PHY
+	tristate "Qualcomm APQ8016/MSM8916 on-chip USB PHY controller support"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on RESET_CONTROLLER
+	select USB_PHY
+	select USB_ULPI_VIEWPORT
+	help
+	  Enable this to support the USB transceiver on Qualcomm 8x16 chipsets.
+	  It handles PHY initialization, clock management, power management,
+	  and workarounds required after resetting the hardware.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called phy-qcom-8x16-usb.
+
 config USB_MV_OTG
 	tristate "Marvell USB OTG support"
 	depends on USB_EHCI_MV && USB_MV_UDC && PM
diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
index e36ab1d..19c0dcc 100644
--- a/drivers/usb/phy/Makefile
+++ b/drivers/usb/phy/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_USB_EHCI_TEGRA)		+= phy-tegra-usb.o
 obj-$(CONFIG_USB_GPIO_VBUS)		+= phy-gpio-vbus-usb.o
 obj-$(CONFIG_USB_ISP1301)		+= phy-isp1301.o
 obj-$(CONFIG_USB_MSM_OTG)		+= phy-msm-usb.o
+obj-$(CONFIG_USB_QCOM_8X16_PHY)	+= phy-qcom-8x16-usb.o
 obj-$(CONFIG_USB_MV_OTG)		+= phy-mv-usb.o
 obj-$(CONFIG_USB_MXS_PHY)		+= phy-mxs-usb.o
 obj-$(CONFIG_USB_RCAR_PHY)		+= phy-rcar-usb.o
diff --git a/drivers/usb/phy/phy-qcom-8x16-usb.c b/drivers/usb/phy/phy-qcom-8x16-usb.c
new file mode 100644
index 0000000..5d357a9
--- /dev/null
+++ b/drivers/usb/phy/phy-qcom-8x16-usb.c
@@ -0,0 +1,436 @@
+/*
+ * Copyright (c) 2015, Linaro Limited
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/extcon.h>
+#include <linux/gpio/consumer.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+#include <linux/usb/ulpi.h>
+
+#define HSPHY_AHBBURST			0x0090
+#define HSPHY_AHBMODE			0x0098
+#define HSPHY_GENCONFIG			0x009c
+#define HSPHY_GENCONFIG_2		0x00a0
+
+#define HSPHY_USBCMD			0x0140
+#define HSPHY_ULPI_VIEWPORT		0x0170
+#define HSPHY_CTRL			0x0240
+
+#define HSPHY_TXFIFO_IDLE_FORCE_DIS	BIT(4)
+#define HSPHY_SESS_VLD_CTRL_EN		BIT(7)
+#define HSPHY_POR_ASSERT		BIT(0)
+#define HSPHY_RETEN			BIT(1)
+
+#define HSPHY_SESS_VLD_CTRL		BIT(25)
+
+#define ULPI_PWR_CLK_MNG_REG		0x88
+#define ULPI_PWR_OTG_COMP_DISABLE	BIT(0)
+
+#define ULPI_MISC_A			0x96
+#define ULPI_MISC_A_VBUSVLDEXTSEL	BIT(1)
+#define ULPI_MISC_A_VBUSVLDEXT		BIT(0)
+
+#define HSPHY_3P3_MIN			3050000 /* uV */
+#define HSPHY_3P3_MAX			3300000 /* uV */
+
+#define HSPHY_1P8_MIN			1800000 /* uV */
+#define HSPHY_1P8_MAX			1800000 /* uV */
+
+#define HSPHY_VDD_MIN			5
+#define HSPHY_VDD_MAX			7
+
+struct phy_8x16 {
+	struct usb_phy			phy;
+	void __iomem			*regs;
+	struct clk			*core_clk;
+	struct clk			*iface_clk;
+	struct regulator		*v3p3;
+	struct regulator		*v1p8;
+	struct regulator		*vdd;
+
+	struct reset_control		*phy_reset;
+
+	struct extcon_specific_cable_nb vbus_cable;
+	struct notifier_block		vbus_notify;
+
+	struct gpio_desc		*switch_gpio;
+	struct notifier_block		reboot_notify;
+};
+
+static int phy_8x16_regulators_enable(struct phy_8x16 *qphy)
+{
+	int ret;
+
+	ret = regulator_set_voltage(qphy->vdd, HSPHY_VDD_MIN, HSPHY_VDD_MAX);
+	if (ret)
+		return ret;
+
+	ret = regulator_enable(qphy->vdd);
+	if (ret)
+		return ret;
+
+	ret = regulator_set_voltage(qphy->v3p3, HSPHY_3P3_MIN, HSPHY_3P3_MAX);
+	if (ret)
+		goto off_vdd;
+
+	ret = regulator_enable(qphy->v3p3);
+	if (ret)
+		goto off_vdd;
+
+	ret = regulator_set_voltage(qphy->v1p8, HSPHY_1P8_MIN, HSPHY_1P8_MAX);
+	if (ret)
+		goto off_3p3;
+
+	ret = regulator_enable(qphy->v1p8);
+	if (ret)
+		goto off_3p3;
+
+	return 0;
+
+off_3p3:
+	regulator_disable(qphy->v3p3);
+off_vdd:
+	regulator_disable(qphy->vdd);
+
+	return ret;
+}
+
+static void phy_8x16_regulators_disable(struct phy_8x16 *qphy)
+{
+	regulator_disable(qphy->v1p8);
+	regulator_disable(qphy->v3p3);
+	regulator_disable(qphy->vdd);
+}
+
+static int phy_8x16_notify_connect(struct usb_phy *phy,
+				   enum usb_device_speed speed)
+{
+	struct phy_8x16 *qphy = container_of(phy, struct phy_8x16, phy);
+	u32 val;
+
+	val = ULPI_MISC_A_VBUSVLDEXTSEL | ULPI_MISC_A_VBUSVLDEXT;
+	usb_phy_io_write(&qphy->phy, val, ULPI_SET(ULPI_MISC_A));
+
+	val = readl(qphy->regs + HSPHY_USBCMD);
+	val |= HSPHY_SESS_VLD_CTRL;
+	writel(val, qphy->regs + HSPHY_USBCMD);
+
+	return 0;
+}
+
+static int phy_8x16_notify_disconnect(struct usb_phy *phy,
+				      enum usb_device_speed speed)
+{
+	struct phy_8x16 *qphy = container_of(phy, struct phy_8x16, phy);
+	u32 val;
+
+	val = ULPI_MISC_A_VBUSVLDEXT | ULPI_MISC_A_VBUSVLDEXTSEL;
+	usb_phy_io_write(&qphy->phy, val, ULPI_CLR(ULPI_MISC_A));
+
+	val = readl(qphy->regs + HSPHY_USBCMD);
+	val &= ~HSPHY_SESS_VLD_CTRL;
+	writel(val, qphy->regs + HSPHY_USBCMD);
+
+	return 0;
+}
+
+static int phy_8x16_vbus_on(struct phy_8x16 *qphy)
+{
+	phy_8x16_notify_connect(&qphy->phy, USB_SPEED_UNKNOWN);
+
+	/* Switch D+/D- lines to Device connector */
+	gpiod_set_value_cansleep(qphy->switch_gpio, 0);
+
+	return 0;
+}
+
+static int phy_8x16_vbus_off(struct phy_8x16 *qphy)
+{
+	phy_8x16_notify_disconnect(&qphy->phy, USB_SPEED_UNKNOWN);
+
+	/* Switch D+/D- lines to USB HUB */
+	gpiod_set_value_cansleep(qphy->switch_gpio, 1);
+
+	return 0;
+}
+
+static int phy_8x16_vbus_notify(struct notifier_block *nb, unsigned long event,
+				void *ptr)
+{
+	struct phy_8x16 *qphy = container_of(nb, struct phy_8x16, vbus_notify);
+
+	if (event)
+		phy_8x16_vbus_on(qphy);
+	else
+		phy_8x16_vbus_off(qphy);
+
+	return NOTIFY_DONE;
+}
+
+static int phy_8x16_init(struct usb_phy *phy)
+{
+	struct phy_8x16 *qphy = container_of(phy, struct phy_8x16, phy);
+	u32 val, init[] = {0x44, 0x6B, 0x24, 0x13};
+	u32 addr = ULPI_EXT_VENDOR_SPECIFIC;
+	int idx, state;
+
+	for (idx = 0; idx < ARRAY_SIZE(init); idx++)
+		usb_phy_io_write(phy, init[idx], addr + idx);
+
+	reset_control_reset(qphy->phy_reset);
+
+	/* Assert USB HSPHY_POR */
+	val = readl(qphy->regs + HSPHY_CTRL);
+	val |= HSPHY_POR_ASSERT;
+	writel(val, qphy->regs + HSPHY_CTRL);
+
+	/*
+	 * wait for minimum 10 microseconds as suggested in HPG.
+	 * Use a slightly larger value since the exact value didn't
+	 * work 100% of the time.
+	 */
+	usleep_range(12, 15);
+
+	/* Deassert USB HSPHY_POR */
+	val = readl(qphy->regs + HSPHY_CTRL);
+	val &= ~HSPHY_POR_ASSERT;
+	writel(val, qphy->regs + HSPHY_CTRL);
+
+	usleep_range(10, 15);
+
+	writel(0x00, qphy->regs + HSPHY_AHBBURST);
+	writel(0x08, qphy->regs + HSPHY_AHBMODE);
+
+	/* workaround for rx buffer collision issue */
+	val = readl(qphy->regs + HSPHY_GENCONFIG);
+	val &= ~HSPHY_TXFIFO_IDLE_FORCE_DIS;
+	writel(val, qphy->regs + HSPHY_GENCONFIG);
+
+	val = readl(qphy->regs + HSPHY_GENCONFIG_2);
+	val |= HSPHY_SESS_VLD_CTRL_EN;
+	writel(val, qphy->regs + HSPHY_GENCONFIG_2);
+
+	val = ULPI_PWR_OTG_COMP_DISABLE;
+	usb_phy_io_write(phy, val, ULPI_SET(ULPI_PWR_CLK_MNG_REG));
+
+	state = extcon_get_cable_state(qphy->vbus_cable.edev, "USB");
+	if (state)
+		phy_8x16_vbus_on(qphy);
+	else
+		phy_8x16_vbus_off(qphy);
+
+	val = usb_phy_io_read(&qphy->phy, ULPI_FUNC_CTRL);
+	val &= ~ULPI_FUNC_CTRL_OPMODE_MASK;
+	val |= ULPI_FUNC_CTRL_OPMODE_NORMAL;
+	usb_phy_io_write(&qphy->phy, val, ULPI_FUNC_CTRL);
+
+	return 0;
+}
+
+static void phy_8x16_shutdown(struct usb_phy *phy)
+{
+	u32 val;
+
+	/* Put the controller in non-driving mode */
+	val = usb_phy_io_read(phy, ULPI_FUNC_CTRL);
+	val &= ~ULPI_FUNC_CTRL_OPMODE_MASK;
+	val |= ULPI_FUNC_CTRL_OPMODE_NONDRIVING;
+	usb_phy_io_write(phy, val, ULPI_FUNC_CTRL);
+}
+
+static int phy_8x16_read_devicetree(struct phy_8x16 *qphy)
+{
+	struct regulator_bulk_data regs[3];
+	struct device *dev = qphy->phy.dev;
+	int ret;
+
+	qphy->core_clk = devm_clk_get(dev, "core");
+	if (IS_ERR(qphy->core_clk))
+		return PTR_ERR(qphy->core_clk);
+
+	qphy->iface_clk = devm_clk_get(dev, "iface");
+	if (IS_ERR(qphy->iface_clk))
+		return PTR_ERR(qphy->iface_clk);
+
+	regs[0].supply = "v3p3";
+	regs[1].supply = "v1p8";
+	regs[2].supply = "vddcx";
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(regs), regs);
+	if (ret)
+		return ret;
+
+	qphy->v3p3 = regs[0].consumer;
+	qphy->v1p8 = regs[1].consumer;
+	qphy->vdd  = regs[2].consumer;
+
+	qphy->phy_reset = devm_reset_control_get(dev, "phy");
+	if (IS_ERR(qphy->phy_reset))
+		return PTR_ERR(qphy->phy_reset);
+
+	qphy->switch_gpio = devm_gpiod_get_optional(dev, "switch",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(qphy->switch_gpio))
+		return PTR_ERR(qphy->switch_gpio);
+
+	return 0;
+}
+
+static int phy_8x16_reboot_notify(struct notifier_block *this,
+				  unsigned long code, void *unused)
+{
+	struct phy_8x16 *qphy;
+
+	qphy = container_of(this, struct phy_8x16, reboot_notify);
+
+	/*
+	 * Ensure that D+/D- lines are routed to uB connector, so
+	 * we could load bootloader/kernel at next reboot_notify
+	 */
+	gpiod_set_value_cansleep(qphy->switch_gpio, 0);
+	return NOTIFY_DONE;
+}
+
+static int phy_8x16_probe(struct platform_device *pdev)
+{
+	struct extcon_dev *edev;
+	struct phy_8x16 *qphy;
+	struct resource *res;
+	struct usb_phy *phy;
+	int ret;
+
+	qphy = devm_kzalloc(&pdev->dev, sizeof(*qphy), GFP_KERNEL);
+	if (!qphy)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, qphy);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	qphy->regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!qphy->regs)
+		return -ENOMEM;
+
+	phy			= &qphy->phy;
+	phy->dev		= &pdev->dev;
+	phy->label		= dev_name(&pdev->dev);
+	phy->init		= phy_8x16_init;
+	phy->shutdown		= phy_8x16_shutdown;
+	phy->notify_connect	= phy_8x16_notify_connect;
+	phy->notify_disconnect	= phy_8x16_notify_disconnect;
+	phy->io_priv		= qphy->regs + HSPHY_ULPI_VIEWPORT;
+	phy->io_ops		= &ulpi_viewport_access_ops;
+	phy->type		= USB_PHY_TYPE_USB2;
+
+	ret = phy_8x16_read_devicetree(qphy);
+	if (ret < 0)
+		return ret;
+
+	edev = extcon_get_edev_by_phandle(phy->dev, 0);
+	if (IS_ERR(edev))
+		return PTR_ERR(edev);
+
+	ret = clk_set_rate(qphy->core_clk, INT_MAX);
+	if (ret < 0)
+		dev_dbg(phy->dev, "Can't boost core clock\n");
+
+	ret = clk_prepare_enable(qphy->core_clk);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_prepare_enable(qphy->iface_clk);
+	if (ret < 0)
+		goto off_core;
+
+	ret = phy_8x16_regulators_enable(qphy);
+	if (0 && ret)
+		goto off_clks;
+
+	qphy->vbus_notify.notifier_call = phy_8x16_vbus_notify;
+	ret = extcon_register_interest(&qphy->vbus_cable, edev->name,
+				       "USB", &qphy->vbus_notify);
+	if (ret < 0)
+		goto off_power;
+
+	ret = usb_add_phy_dev(&qphy->phy);
+	if (ret)
+		goto off_extcon;
+
+	qphy->reboot_notify.notifier_call = phy_8x16_reboot_notify;
+	register_reboot_notifier(&qphy->reboot_notify);
+
+	return 0;
+
+off_extcon:
+	extcon_unregister_interest(&qphy->vbus_cable);
+off_power:
+	phy_8x16_regulators_disable(qphy);
+off_clks:
+	clk_disable_unprepare(qphy->iface_clk);
+off_core:
+	clk_disable_unprepare(qphy->core_clk);
+	return ret;
+}
+
+static int phy_8x16_remove(struct platform_device *pdev)
+{
+	struct phy_8x16 *qphy = platform_get_drvdata(pdev);
+
+	unregister_reboot_notifier(&qphy->reboot_notify);
+	extcon_unregister_interest(&qphy->vbus_cable);
+
+	/*
+	 * Ensure that D+/D- lines are routed to uB connector, so
+	 * we could load bootloader/kernel at next reboot_notify
+	 */
+	gpiod_set_value_cansleep(qphy->switch_gpio, 0);
+
+	usb_remove_phy(&qphy->phy);
+
+	clk_disable_unprepare(qphy->iface_clk);
+	clk_disable_unprepare(qphy->core_clk);
+	phy_8x16_regulators_disable(qphy);
+	return 0;
+}
+
+static const struct of_device_id phy_8x16_dt_match[] = {
+	{ .compatible = "qcom,usb-8x16-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, phy_8x16_dt_match);
+
+static struct platform_driver phy_8x16_driver = {
+	.probe	= phy_8x16_probe,
+	.remove = phy_8x16_remove,
+	.driver = {
+		.name = "phy-qcom-8x16-usb",
+		.of_match_table = phy_8x16_dt_match,
+	},
+};
+module_platform_driver(phy_8x16_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Qualcomm APQ8016/MSM8916 chipsets USB transceiver driver");
--
1.9.1
