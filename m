From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: sc2731: Add regulator driver to support Spreadtrum SC2731 PMIC" to the regulator tree
Date: Tue,  5 Dec 2017 12:48:47 +0000 (GMT)
Message-ID: <20171205124847.6D8DE44006B@finisterre.ee.mobilebroadband>
References: <78c65665948c11d0abc410a11cb1ecfd7c81f237.1512455819.git.erick.chen@spreadtrum.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <78c65665948c11d0abc410a11cb1ecfd7c81f237.1512455819.git.erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.orglinux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: sc2731: Add regulator driver to support Spreadtrum SC2731 PMIC

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 433c9bb77b8131ef340148565996b3818fbf2f23 Mon Sep 17 00:00:00 2001
From: Erick Chen <erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Date: Tue, 5 Dec 2017 14:35:46 +0800
Subject: [PATCH] regulator: sc2731: Add regulator driver to support Spreadtrum
 SC2731 PMIC

Add regulator driver for Spreadtrum SC2731 device.
It has 17 general purpose LDOs, BUCKs generator and
digital output to control regulators.

Signed-off-by: Erick Chen <erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Reviewed-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/Kconfig            |   7 +
 drivers/regulator/Makefile           |   1 +
 drivers/regulator/sc2731-regulator.c | 256 +++++++++++++++++++++++++++++++++++
 3 files changed, 264 insertions(+)
 create mode 100644 drivers/regulator/sc2731-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 96cd55f9e3c5..b27417ca188a 100644
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
index 80ffc57a9ca3..19fea09ba10a 100644
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
index 000000000000..794fcd504b3d
--- /dev/null
+++ b/drivers/regulator/sc2731-regulator.c
@@ -0,0 +1,256 @@
+ //SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017 Spreadtrum Communications Inc.
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
+static struct platform_driver sc2731_regulator_driver = {
+	.driver = {
+		.name = "sc27xx-regulator",
+	},
+	.probe = sc2731_regulator_probe,
+};
+
+module_platform_driver(sc2731_regulator_driver);
+
+MODULE_AUTHOR("Chen Junhui <erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>");
+MODULE_DESCRIPTION("Spreadtrum SC2731 regulator driver");
+MODULE_LICENSE("GPL v2");
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
