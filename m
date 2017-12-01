From: Erick Chen <erick.chen@spreadtrum.com>
Subject: [PATCH 2/2] regulator: sc2731: Add regulator driver to support Spreadtrum SC2731 PMIC
Date: Fri, 1 Dec 2017 16:58:16 +0800
Message-ID: <75a6a48f603a25d744ef46287e036975b0203608.1512118703.git.erick.chen@spreadtrum.com>
References: <f6d8ff765f4864e5b6ace1f022202d8793a7becf.1512118703.git.erick.chen@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f6d8ff765f4864e5b6ace1f022202d8793a7becf.1512118703.git.erick.chen@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, baolin.wang@linaro.org, baolin.wang@spreadtrum.com, erick.chen@spreadtrum.com
List-Id: devicetree@vger.kernel.org

Add regulator driver for Spreadtrum SC2731 device.
It has 17 general purpose LDOs, BUCKs generator and
digital output to control regulators.

Signed-off-by: Erick Chen <erick.chen@spreadtrum.com>
Reviewed-by: Baolin Wang <baolin.wang@spreadtrum.com>
---
 drivers/regulator/Kconfig            |    7 +
 drivers/regulator/Makefile           |    1 +
 drivers/regulator/sc2731-regulator.c |  276 ++++++++++++++++++++++++++++++++++
 3 files changed, 284 insertions(+)
 create mode 100644 drivers/regulator/sc2731-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 96cd55f..b27417c 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -744,6 +744,13 @@ config REGULATOR_S5M8767
 	 via I2C bus. S5M8767A have 9 Bucks and 28 LDOs output and
 	 supports DVS mode with 8bits of output voltage control.
 
+config REGULATOR_SC2731
+	tristate "Spreadtrum SC2731 power regulator driver"
+	depends on MFD_SC27XX_PMIC || COMPILE_TEST
+	help
+	  This driver provides support for the voltage regulators on the
+	  SC2731 PMIC.
+
 config REGULATOR_SKY81452
 	tristate "Skyworks Solutions SKY81452 voltage regulator"
 	depends on MFD_SKY81452
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 80ffc57..19fea09 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -95,6 +95,7 @@ obj-$(CONFIG_REGULATOR_RT5033)	+= rt5033-regulator.o
 obj-$(CONFIG_REGULATOR_S2MPA01) += s2mpa01.o
 obj-$(CONFIG_REGULATOR_S2MPS11) += s2mps11.o
 obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
+obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_STM32_VREFBUF) += stm32-vrefbuf.o
 obj-$(CONFIG_REGULATOR_STW481X_VMMC) += stw481x-vmmc.o
diff --git a/drivers/regulator/sc2731-regulator.c b/drivers/regulator/sc2731-regulator.c
new file mode 100644
index 0000000..e56448a
--- /dev/null
+++ b/drivers/regulator/sc2731-regulator.c
@@ -0,0 +1,276 @@
+/*
+ * Copyright (C) 2017 Spreadtrum Communications Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+/*
+ * SC2731 regulator lock register
+ */
+#define SC2731_PWR_WR_PROT_VALUE	0xf0c
+#define SC2731_WR_UNLOCK		0x6e7f
+
+/*
+ * SC2731 enable register
+ */
+#define SC2731_POWER_PD_SW		0xc28
+#define SC2731_LDO_CAMA0_PD		0xcfc
+#define SC2731_LDO_CAMA1_PD		0xd04
+#define SC2731_LDO_CAMMOT_PD		0xd0c
+#define SC2731_LDO_VLDO_PD		0xd6c
+#define SC2731_LDO_EMMCCORE_PD		0xd2c
+#define SC2731_LDO_SDCORE_PD		0xd74
+#define SC2731_LDO_SDIO_PD		0xd70
+#define SC2731_LDO_WIFIPA_PD		0xd4c
+#define SC2731_LDO_USB33_PD		0xd5c
+#define SC2731_LDO_CAMD0_PD		0xd7c
+#define SC2731_LDO_CAMD1_PD		0xd84
+#define SC2731_LDO_CON_PD		0xd8c
+#define SC2731_LDO_CAMIO_PD		0xd94
+#define SC2731_LDO_SRAM_PD		0xd78
+
+/*
+ * SC2731 enable mask
+ */
+#define SC2731_DCDC_CPU0_PD_MASK	BIT(4)
+#define SC2731_DCDC_CPU1_PD_MASK	BIT(3)
+#define SC2731_DCDC_RF_PD_MASK		BIT(11)
+#define SC2731_LDO_CAMA0_PD_MASK	BIT(0)
+#define SC2731_LDO_CAMA1_PD_MASK	BIT(0)
+#define SC2731_LDO_CAMMOT_PD_MASK	BIT(0)
+#define SC2731_LDO_VLDO_PD_MASK		BIT(0)
+#define SC2731_LDO_EMMCCORE_PD_MASK	BIT(0)
+#define SC2731_LDO_SDCORE_PD_MASK	BIT(0)
+#define SC2731_LDO_SDIO_PD_MASK		BIT(0)
+#define SC2731_LDO_WIFIPA_PD_MASK	BIT(0)
+#define SC2731_LDO_USB33_PD_MASK	BIT(0)
+#define SC2731_LDO_CAMD0_PD_MASK	BIT(0)
+#define SC2731_LDO_CAMD1_PD_MASK	BIT(0)
+#define SC2731_LDO_CON_PD_MASK		BIT(0)
+#define SC2731_LDO_CAMIO_PD_MASK	BIT(0)
+#define SC2731_LDO_SRAM_PD_MASK		BIT(0)
+
+/*
+ * SC2731 vsel register
+ */
+#define SC2731_DCDC_CPU0_VOL		0xc54
+#define SC2731_DCDC_CPU1_VOL		0xc64
+#define SC2731_DCDC_RF_VOL		0xcb8
+#define SC2731_LDO_CAMA0_VOL		0xd00
+#define SC2731_LDO_CAMA1_VOL		0xd08
+#define SC2731_LDO_CAMMOT_VOL		0xd10
+#define SC2731_LDO_VLDO_VOL		0xd28
+#define SC2731_LDO_EMMCCORE_VOL		0xd30
+#define SC2731_LDO_SDCORE_VOL		0xd38
+#define SC2731_LDO_SDIO_VOL		0xd40
+#define SC2731_LDO_WIFIPA_VOL		0xd50
+#define SC2731_LDO_USB33_VOL		0xd60
+#define SC2731_LDO_CAMD0_VOL		0xd80
+#define SC2731_LDO_CAMD1_VOL		0xd88
+#define SC2731_LDO_CON_VOL		0xd90
+#define SC2731_LDO_CAMIO_VOL		0xd98
+#define SC2731_LDO_SRAM_VOL		0xdB0
+
+/*
+ * SC2731 vsel register mask
+ */
+#define SC2731_DCDC_CPU0_VOL_MASK	GENMASK(8, 0)
+#define SC2731_DCDC_CPU1_VOL_MASK	GENMASK(8, 0)
+#define SC2731_DCDC_RF_VOL_MASK		GENMASK(8, 0)
+#define SC2731_LDO_CAMA0_VOL_MASK	GENMASK(7, 0)
+#define SC2731_LDO_CAMA1_VOL_MASK	GENMASK(7, 0)
+#define SC2731_LDO_CAMMOT_VOL_MASK	GENMASK(7, 0)
+#define SC2731_LDO_VLDO_VOL_MASK	GENMASK(7, 0)
+#define SC2731_LDO_EMMCCORE_VOL_MASK	GENMASK(7, 0)
+#define SC2731_LDO_SDCORE_VOL_MASK	GENMASK(7, 0)
+#define SC2731_LDO_SDIO_VOL_MASK	GENMASK(7, 0)
+#define SC2731_LDO_WIFIPA_VOL_MASK	GENMASK(7, 0)
+#define SC2731_LDO_USB33_VOL_MASK	GENMASK(7, 0)
+#define SC2731_LDO_CAMD0_VOL_MASK	GENMASK(6, 0)
+#define SC2731_LDO_CAMD1_VOL_MASK	GENMASK(6, 0)
+#define SC2731_LDO_CON_VOL_MASK		GENMASK(6, 0)
+#define SC2731_LDO_CAMIO_VOL_MASK	GENMASK(6, 0)
+#define SC2731_LDO_SRAM_VOL_MASK	GENMASK(6, 0)
+
+enum sc2731_regulator_id {
+	SC2731_BUCK_CPU0,
+	SC2731_BUCK_CPU1,
+	SC2731_BUCK_RF,
+	SC2731_LDO_CAMA0,
+	SC2731_LDO_CAMA1,
+	SC2731_LDO_CAMMOT,
+	SC2731_LDO_VLDO,
+	SC2731_LDO_EMMCCORE,
+	SC2731_LDO_SDCORE,
+	SC2731_LDO_SDIO,
+	SC2731_LDO_WIFIPA,
+	SC2731_LDO_USB33,
+	SC2731_LDO_CAMD0,
+	SC2731_LDO_CAMD1,
+	SC2731_LDO_CON,
+	SC2731_LDO_CAMIO,
+	SC2731_LDO_SRAM,
+};
+
+static const struct regulator_ops sc2731_regu_linear_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+};
+
+#define SC2731_REGU_LINEAR(_id, en_reg, en_mask, vreg, vmask,	\
+			  vstep, vmin, vmax) {			\
+	.name			= #_id,				\
+	.of_match		= of_match_ptr(#_id),		\
+	.ops			= &sc2731_regu_linear_ops,	\
+	.regulators_node	= of_match_ptr("regulators"),	\
+	.type			= REGULATOR_VOLTAGE,		\
+	.id			= SC2731_##_id,			\
+	.owner			= THIS_MODULE,			\
+	.min_uV			= vmin,				\
+	.n_voltages		= ((vmax) - (vmin)) / (vstep) + 1,	\
+	.uV_step		= vstep,			\
+	.enable_is_inverted	= true,				\
+	.enable_val		= 0,				\
+	.enable_reg		= en_reg,			\
+	.enable_mask		= en_mask,			\
+	.vsel_reg		= vreg,				\
+	.vsel_mask		= vmask,			\
+}
+
+static struct regulator_desc regulators[] = {
+	SC2731_REGU_LINEAR(BUCK_CPU0, SC2731_POWER_PD_SW,
+			   SC2731_DCDC_CPU0_PD_MASK, SC2731_DCDC_CPU0_VOL,
+			   SC2731_DCDC_CPU0_VOL_MASK, 3125, 400000, 1996875),
+	SC2731_REGU_LINEAR(BUCK_CPU1, SC2731_POWER_PD_SW,
+			   SC2731_DCDC_CPU1_PD_MASK, SC2731_DCDC_CPU1_VOL,
+			   SC2731_DCDC_CPU1_VOL_MASK, 3125, 400000, 1996875),
+	SC2731_REGU_LINEAR(BUCK_RF, SC2731_POWER_PD_SW, SC2731_DCDC_RF_PD_MASK,
+			   SC2731_DCDC_RF_VOL, SC2731_DCDC_RF_VOL_MASK,
+			   3125, 600000, 2196875),
+	SC2731_REGU_LINEAR(LDO_CAMA0, SC2731_LDO_CAMA0_PD,
+			   SC2731_LDO_CAMA0_PD_MASK, SC2731_LDO_CAMA0_VOL,
+			   SC2731_LDO_CAMA0_VOL_MASK, 10000, 1200000, 3750000),
+	SC2731_REGU_LINEAR(LDO_CAMA1, SC2731_LDO_CAMA1_PD,
+			   SC2731_LDO_CAMA1_PD_MASK, SC2731_LDO_CAMA1_VOL,
+			   SC2731_LDO_CAMA1_VOL_MASK, 10000, 1200000, 3750000),
+	SC2731_REGU_LINEAR(LDO_CAMMOT, SC2731_LDO_CAMMOT_PD,
+			   SC2731_LDO_CAMMOT_PD_MASK, SC2731_LDO_CAMMOT_VOL,
+			   SC2731_LDO_CAMMOT_VOL_MASK, 10000, 1200000, 3750000),
+	SC2731_REGU_LINEAR(LDO_VLDO, SC2731_LDO_VLDO_PD,
+			   SC2731_LDO_VLDO_PD_MASK, SC2731_LDO_VLDO_VOL,
+			   SC2731_LDO_VLDO_VOL_MASK, 10000, 1200000, 3750000),
+	SC2731_REGU_LINEAR(LDO_EMMCCORE, SC2731_LDO_EMMCCORE_PD,
+			   SC2731_LDO_EMMCCORE_PD_MASK, SC2731_LDO_EMMCCORE_VOL,
+			   SC2731_LDO_EMMCCORE_VOL_MASK, 10000, 1200000,
+			   3750000),
+	SC2731_REGU_LINEAR(LDO_SDCORE, SC2731_LDO_SDCORE_PD,
+			   SC2731_LDO_SDCORE_PD_MASK, SC2731_LDO_SDCORE_VOL,
+			   SC2731_LDO_SDCORE_VOL_MASK, 10000, 1200000, 3750000),
+	SC2731_REGU_LINEAR(LDO_SDIO, SC2731_LDO_SDIO_PD,
+			   SC2731_LDO_SDIO_PD_MASK, SC2731_LDO_SDIO_VOL,
+			   SC2731_LDO_SDIO_VOL_MASK, 10000, 1200000, 3750000),
+	SC2731_REGU_LINEAR(LDO_WIFIPA, SC2731_LDO_WIFIPA_PD,
+			   SC2731_LDO_WIFIPA_PD_MASK, SC2731_LDO_WIFIPA_VOL,
+			   SC2731_LDO_WIFIPA_VOL_MASK, 10000, 1200000, 3750000),
+	SC2731_REGU_LINEAR(LDO_USB33, SC2731_LDO_USB33_PD,
+			   SC2731_LDO_USB33_PD_MASK, SC2731_LDO_USB33_VOL,
+			   SC2731_LDO_USB33_VOL_MASK, 10000, 1200000, 3750000),
+	SC2731_REGU_LINEAR(LDO_CAMD0, SC2731_LDO_CAMD0_PD,
+			   SC2731_LDO_CAMD0_PD_MASK, SC2731_LDO_CAMD0_VOL,
+			   SC2731_LDO_CAMD0_VOL_MASK, 6250, 1000000, 1793750),
+	SC2731_REGU_LINEAR(LDO_CAMD1, SC2731_LDO_CAMD1_PD,
+			   SC2731_LDO_CAMD1_PD_MASK, SC2731_LDO_CAMD1_VOL,
+			   SC2731_LDO_CAMD1_VOL_MASK, 6250, 1000000, 1793750),
+	SC2731_REGU_LINEAR(LDO_CON, SC2731_LDO_CON_PD,
+			   SC2731_LDO_CON_PD_MASK, SC2731_LDO_CON_VOL,
+			   SC2731_LDO_CON_VOL_MASK, 6250, 1000000, 1793750),
+	SC2731_REGU_LINEAR(LDO_CAMIO, SC2731_LDO_CAMIO_PD,
+			   SC2731_LDO_CAMIO_PD_MASK, SC2731_LDO_CAMIO_VOL,
+			   SC2731_LDO_CAMIO_VOL_MASK, 6250, 1000000, 1793750),
+	SC2731_REGU_LINEAR(LDO_SRAM, SC2731_LDO_SRAM_PD,
+			   SC2731_LDO_SRAM_PD_MASK, SC2731_LDO_SRAM_VOL,
+			   SC2731_LDO_SRAM_VOL_MASK, 6250, 1000000, 1793750),
+};
+
+static int sc2731_regulator_unlock(struct regmap *regmap)
+{
+	return regmap_write(regmap, SC2731_PWR_WR_PROT_VALUE,
+			    SC2731_WR_UNLOCK);
+}
+
+static int sc2731_regulator_probe(struct platform_device *pdev)
+{
+	int i, ret;
+	struct regmap *regmap;
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap) {
+		dev_err(&pdev->dev, "failed to get regmap.\n");
+		return -ENODEV;
+	}
+
+	ret = sc2731_regulator_unlock(regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to release regulator lock\n");
+		return ret;
+	}
+
+	config.dev = &pdev->dev;
+	config.regmap = regmap;
+
+	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
+		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "failed to register regulator %s\n",
+				regulators[i].name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static const struct of_device_id sc2731_regulator_of_match[] = {
+	{.compatible = "sprd,sc2731-regulator",},
+	{}
+};
+MODULE_DEVICE_TABLE(of, sc2731_regulator_of_match);
+
+static struct platform_driver sc2731_regulator_driver = {
+	.driver = {
+		.name = "sc2731-regulator",
+		.of_match_table = sc2731_regulator_of_match,
+	},
+	.probe = sc2731_regulator_probe,
+};
+
+static int __init sc2731_regulator_init(void)
+{
+	return platform_driver_register(&sc2731_regulator_driver);
+}
+
+static void __exit sc2731_regulator_exit(void)
+{
+	platform_driver_unregister(&sc2731_regulator_driver);
+}
+
+subsys_initcall(sc2731_regulator_init);
+module_exit(sc2731_regulator_exit);
+
+MODULE_AUTHOR("Chen Junhui <erick.chen@spreadtrum.com>");
+MODULE_DESCRIPTION("Spreadtrum SC2731 regulator driver");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5
