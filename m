From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 2/2] regulator: Add support for stm32 power regulators
Date: Mon, 8 Apr 2019 15:24:08 +0000
Message-ID: <1554737044-9460-3-git-send-email-p.paillet@st.com>
References: <1554737044-9460-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554737044-9460-1-git-send-email-p.paillet@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

Add support for 1V1 1V8 USB3V3 power regulators.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 drivers/regulator/Kconfig     |   7 ++
 drivers/regulator/Makefile    |   1 +
 drivers/regulator/stm32-pwr.c | 193 ++++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 201 insertions(+)
 create mode 100644 drivers/regulator/stm32-pwr.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index c4dc2bc..26e6e26 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -840,6 +840,13 @@ config REGULATOR_STM32_VREFBUF
 	  This driver can also be built as a module. If so, the module
 	  will be called stm32-vrefbuf.
=20
+config REGULATOR_STM32_PWR
+	bool "STMicroelectronics STM32 PWR"
+	depends on ARCH_STM32
+	help
+	  This driver supports internal regulators (1V1, 1V8, 3V3) in the
+	  STMicroelectronics STM32 chips.
+
 config REGULATOR_STPMIC1
 	tristate "STMicroelectronics STPMIC1 PMIC Regulators"
 	depends on MFD_STPMIC1
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 1169f8a..93f5384 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -105,6 +105,7 @@ obj-$(CONFIG_REGULATOR_S5M8767) +=3D s5m8767.o
 obj-$(CONFIG_REGULATOR_SC2731) +=3D sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) +=3D sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_STM32_VREFBUF) +=3D stm32-vrefbuf.o
+obj-$(CONFIG_REGULATOR_STM32_PWR) +=3D stm32-pwr.o
 obj-$(CONFIG_REGULATOR_STPMIC1) +=3D stpmic1_regulator.o
 obj-$(CONFIG_REGULATOR_STW481X_VMMC) +=3D stw481x-vmmc.o
 obj-$(CONFIG_REGULATOR_SY8106A) +=3D sy8106a-regulator.o
diff --git a/drivers/regulator/stm32-pwr.c b/drivers/regulator/stm32-pwr.c
new file mode 100644
index 0000000..166dc44
--- /dev/null
+++ b/drivers/regulator/stm32-pwr.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) STMicroelectronics 2019
+// Authors: Gabriel Fernandez <gabriel.fernandez@st.com>
+//          Pascal Paillet <p.paillet@st.com>.
+
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+/*
+ * Registers description
+ */
+#define REG_PWR_CR3 0x0C
+
+#define USB_3_3_EN BIT(24)
+#define USB_3_3_RDY BIT(26)
+#define REG_1_8_EN BIT(28)
+#define REG_1_8_RDY BIT(29)
+#define REG_1_1_EN BIT(30)
+#define REG_1_1_RDY BIT(31)
+
+/* list of supported regulators */
+enum {
+	PWR_REG11,
+	PWR_REG18,
+	PWR_USB33,
+	STM32PWR_REG_NUM_REGS
+};
+
+u32 ready_mask_table[STM32PWR_REG_NUM_REGS] =3D {
+	[PWR_REG11] =3D REG_1_1_RDY,
+	[PWR_REG18] =3D REG_1_8_RDY,
+	[PWR_USB33] =3D USB_3_3_RDY,
+};
+
+struct stm32_pwr_reg {
+	void __iomem *base;
+	const struct regulator_desc *desc;
+	u32 ready_mask;
+};
+
+int stm32_pwr_reg_is_enabled(struct regulator_dev *rdev)
+{
+	struct stm32_pwr_reg *priv =3D rdev_get_drvdata(rdev);
+	u32 val;
+
+	val =3D readl_relaxed(priv->base + REG_PWR_CR3);
+
+	return (val & priv->ready_mask);
+}
+
+static int stm32_pwr_reg_enable(struct regulator_dev *rdev)
+{
+	struct stm32_pwr_reg *priv =3D rdev_get_drvdata(rdev);
+	int ret;
+	u32 val;
+
+	val =3D readl_relaxed(priv->base + REG_PWR_CR3);
+	val |=3D priv->desc->enable_mask;
+	writel_relaxed(val, priv->base + REG_PWR_CR3);
+
+	/* use an arbitrary timeout of 20ms */
+	ret =3D readx_poll_timeout(stm32_pwr_reg_is_enabled, rdev, val, val,
+				 100, 20 * 1000);
+	if (ret)
+		dev_err(&rdev->dev, "regulator enable timed out!\n");
+
+	return ret;
+}
+
+static int stm32_pwr_reg_disable(struct regulator_dev *rdev)
+{
+	struct stm32_pwr_reg *priv =3D rdev_get_drvdata(rdev);
+	int ret;
+	u32 val;
+
+	val =3D readl_relaxed(priv->base + REG_PWR_CR3);
+	val &=3D ~priv->desc->enable_mask;
+	writel_relaxed(val, priv->base + REG_PWR_CR3);
+
+	/* use an arbitrary timeout of 20ms */
+	ret =3D readx_poll_timeout(stm32_pwr_reg_is_enabled, rdev, val, !val,
+				 100, 20 * 1000);
+	if (ret)
+		dev_err(&rdev->dev, "regulator disable timed out!\n");
+
+	return ret;
+}
+
+static const struct regulator_ops stm32_pwr_reg_ops =3D {
+	.list_voltage	=3D regulator_list_voltage_linear,
+	.enable		=3D stm32_pwr_reg_enable,
+	.disable	=3D stm32_pwr_reg_disable,
+	.is_enabled	=3D stm32_pwr_reg_is_enabled,
+};
+
+#define PWR_REG(_id, _name, _volt, _en, _supply) \
+	[_id] =3D { \
+		.id =3D _id, \
+		.name =3D _name, \
+		.n_voltages =3D 1, \
+		.type =3D REGULATOR_VOLTAGE, \
+		.min_uV =3D _volt, \
+		.fixed_uV =3D _volt, \
+		.ops =3D &stm32_pwr_reg_ops, \
+		.enable_mask =3D _en, \
+		.owner =3D THIS_MODULE, \
+		.supply_name =3D _supply, \
+	} \
+
+static const struct regulator_desc stm32_pwr_desc[] =3D {
+	PWR_REG(PWR_REG11, "reg11", 1100000, REG_1_1_EN, "vdd"),
+	PWR_REG(PWR_REG18, "reg18", 1800000, REG_1_8_EN, "vdd"),
+	PWR_REG(PWR_USB33, "usb33", 3300000, USB_3_3_EN, "vdd_3v3_usbfs"),
+};
+
+static struct of_regulator_match stm32_pwr_reg_matches[] =3D {
+	{ .name =3D "reg11", },
+	{ .name =3D "reg18", },
+	{ .name =3D "usb33", },
+};
+
+static int stm32_pwr_regulator_probe(struct platform_device *pdev)
+{
+	struct device_node *np =3D pdev->dev.of_node;
+	struct stm32_pwr_reg *priv;
+	void __iomem *base;
+	struct regulator_dev *rdev;
+	struct regulator_config config =3D { };
+	int i, ret =3D 0;
+
+	base =3D of_iomap(np, 0);
+	if (IS_ERR(base)) {
+		dev_err(&pdev->dev, "Unable to map IO memory\n");
+		return PTR_ERR(base);
+	}
+
+	of_regulator_match(&pdev->dev, np, stm32_pwr_reg_matches,
+			   STM32PWR_REG_NUM_REGS);
+
+	config.dev =3D &pdev->dev;
+
+	for (i =3D 0; i < STM32PWR_REG_NUM_REGS; i++) {
+		struct of_regulator_match *match =3D &stm32_pwr_reg_matches[i];
+
+		priv =3D devm_kzalloc(&pdev->dev, sizeof(struct stm32_pwr_reg),
+				    GFP_KERNEL);
+		if (!priv)
+			return -ENOMEM;
+		priv->base =3D base;
+		priv->desc =3D &stm32_pwr_desc[i];
+		priv->ready_mask =3D ready_mask_table[i];
+
+		config.init_data =3D match->init_data;
+		config.of_node =3D match->of_node;
+		config.driver_data =3D priv;
+
+		rdev =3D devm_regulator_register(&pdev->dev,
+					       &stm32_pwr_desc[i],
+					       &config);
+		if (IS_ERR(rdev)) {
+			ret =3D PTR_ERR(rdev);
+			dev_err(&pdev->dev,
+				"Failed to register regulator: %d\n", ret);
+			break;
+		}
+	}
+	return ret;
+}
+
+static const struct of_device_id stm32_pwr_of_match[] =3D {
+	{ .compatible =3D "st,stm32mp1,pwr-reg", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, stm32_pwr_of_match);
+
+static struct platform_driver stm32_pwr_driver =3D {
+	.probe =3D stm32_pwr_regulator_probe,
+	.driver =3D {
+		.name  =3D "stm32-pwr-regulator",
+		.of_match_table =3D of_match_ptr(stm32_pwr_of_match),
+	},
+};
+module_platform_driver(stm32_pwr_driver);
+
+MODULE_DESCRIPTION("STM32MP1 PWR voltage regulator driver");
+MODULE_AUTHOR("Gabriel Fernandez <gabriel.fernandez@st.com>");
+MODULE_LICENSE("GPL v2");
--=20
1.9.1
