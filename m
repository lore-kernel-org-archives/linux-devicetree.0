From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/3] regulator: mt6351: Add support for MT6351 regulator
Date: Wed, 9 Aug 2017 10:31:04 +0800
Message-ID: <1502245865-11403-3-git-send-email-mars.cheng@mediatek.com>
References: <1502245865-11403-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1502245865-11403-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Jimmy-YJ.Huang" <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Jimmy-YJ.Huang" <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

The MT6351 is a regulator found on boards based on MediaTek MT6797 and
probably other SoCs. It is a so called pmic and connects as a slave to
SoC using SPI, wrapped inside the pmic-wrapper.

Signed-off-by: Jimmy-YJ.Huang <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/regulator/Kconfig                  |    9 +
 drivers/regulator/Makefile                 |    1 +
 drivers/regulator/mt6351-regulator.c       |  458 ++++++++++++++++++++++++++++
 include/linux/regulator/mt6351-regulator.h |   66 ++++
 4 files changed, 534 insertions(+)
 create mode 100644 drivers/regulator/mt6351-regulator.c
 create mode 100644 include/linux/regulator/mt6351-regulator.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 99b9362..1d84ddb 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -559,6 +559,15 @@ config REGULATOR_MT6323
 	  This driver supports the control of different power rails of device
 	  through regulator interface.
 
+config REGULATOR_MT6351
+	tristate "MediaTek MT6351 PMIC"
+	depends on MFD_MT6397
+	help
+	  Say y here to select this option to enable the power regulator of
+	  MediaTek MT6351 PMIC.
+	  This driver supports the control of different power rails of device
+	  through regulator interface.
+
 config REGULATOR_MT6397
 	tristate "MediaTek MT6397 PMIC"
 	depends on MFD_MT6397
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 95b1e86..fe301cf 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_REGULATOR_MC13892) += mc13892-regulator.o
 obj-$(CONFIG_REGULATOR_MC13XXX_CORE) +=  mc13xxx-regulator-core.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
+obj-$(CONFIG_REGULATOR_MT6351)	+= mt6351-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
diff --git a/drivers/regulator/mt6351-regulator.c b/drivers/regulator/mt6351-regulator.c
new file mode 100644
index 0000000..fda1eea
--- /dev/null
+++ b/drivers/regulator/mt6351-regulator.c
@@ -0,0 +1,458 @@
+/*
+ * Copyright (c) 2017 MediaTek Inc.
+ * Author: Jimmy-Yj Huang <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/mt6397/core.h>
+#include <linux/mfd/mt6351/registers.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/mt6351-regulator.h>
+#include <linux/regulator/of_regulator.h>
+
+/*
+ * MT6351 regulators' information
+ *
+ * @desc: standard fields of regulator description.
+ * @qi: Mask for query enable signal status of regulators
+ * @vselon_reg: Register sections for hardware control mode of bucks
+ * @vselctrl_reg: Register for controlling the buck control mode.
+ * @vselctrl_mask: Mask for query buck's voltage control mode.
+ */
+struct mt6351_regulator_info {
+	struct regulator_desc desc;
+	u32 qi;
+	u32 vselon_reg;
+	u32 vselctrl_reg;
+	u32 vselctrl_mask;
+};
+
+/*
+ * MTK regulators' init data
+ *
+ * @id: chip id
+ * @size: num of regulators
+ * @regulator_info: regulator info.
+ */
+struct mt_regulator_init_data {
+	u32 id;
+	u32 size;
+	struct mt6351_regulator_info *regulator_info;
+};
+
+#define MT_BUCK(ver, match, vreg, min, max, step, volt_ranges,	\
+		enreg, vosel, vosel_mask, voselon, vosel_ctrl)		\
+[ver##_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6351_volt_range_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = ver##_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = (max - min) / step + 1,			\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.vsel_reg = vosel,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(0),					\
+	},								\
+	.qi = BIT(13),							\
+	.vselon_reg = voselon,						\
+	.vselctrl_reg = vosel_ctrl,					\
+	.vselctrl_mask = BIT(1),					\
+}
+
+#define MT_LDO(ver, match, vreg, ldo_volt_table, enreg, enbit,	\
+		vosel, vosel_mask)					\
+[ver##_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6351_volt_table_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = ver##_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ARRAY_SIZE(ldo_volt_table),		\
+		.volt_table = ldo_volt_table,				\
+		.vsel_reg = vosel,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+	},								\
+	.qi = BIT(15),							\
+}
+
+#define MT_REG_FIXED(ver, match, vreg, enreg, enbit, volt)		\
+[ver##_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6351_volt_fixed_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = ver##_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.min_uV = volt,						\
+	},								\
+	.qi = BIT(15),							\
+}
+
+static const struct regulator_linear_range buck_volt_range1[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0, 0x7f, 6250),
+};
+
+static const struct regulator_linear_range buck_volt_range2[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 0x7f, 6250),
+};
+
+static const struct regulator_linear_range buck_volt_range3[] = {
+	REGULATOR_LINEAR_RANGE(1500000, 0, 0x1f, 20000),
+};
+
+static const u32 ldo_volt_table1[] = {
+	1800000, 2200000, 2375000, 2800000,
+};
+
+static const u32 ldo_volt_table2[] = {
+	1200000, 1300000, 1700000, 1800000, 1860000, 2760000, 3000000, 3100000,
+};
+
+static const u32 ldo_volt_table3[] = {
+	3000000, 3300000,
+};
+
+static const u32 ldo_volt_table4[] = {
+	1500000, 1800000, 2500000, 2800000,
+};
+
+static const u32 ldo_volt_table5[] = {
+	3300000, 3400000, 3500000, 3600000,
+};
+
+static const u32 ldo_volt_table5_v2[] = {
+	1200000, 1000000, 1500000, 1800000, 2500000, 2800000, 3000000, 3300000,
+};
+
+static const u32 ldo_volt_table6[] = {
+	1200000, 1300000, 1500000, 1800000, 2000000, 2900000, 3000000, 3300000,
+};
+
+static const u32 ldo_volt_table6_v1[] = {
+	2500000, 2900000, 3000000, 3300000,
+};
+
+static const u32 ldo_volt_table6_v2[] = {
+	1300000, 1800000, 2900000, 3300000,
+};
+
+static const u32 ldo_volt_table7[] = {
+	1200000, 1300000, 1500000, 1800000, 2000000, 2800000, 3000000, 3300000,
+};
+
+static const u32 ldo_volt_table8[] = {
+	900000, 950000, 1000000, 1050000, 1100000, 1200000, 1210000,
+};
+
+static const u32 ldo_volt_table9[] = {
+	900000, 950000, 1000000, 1050000, 1200000, 1500000, 1800000,
+};
+
+static const u32 ldo_volt_table10[] = {
+	1000000, 1050000, 1100000, 1220000, 1300000, 1500000, 1800000, 1810000,
+};
+
+static const u32 ldo_volt_table10_v1[] = {
+	1000000, 1200000, 1300000, 1500000, 1800000, 1810000,
+};
+
+static const u32 ldo_volt_table11[] = {
+	1800000, 2900000, 3000000, 3300000,
+};
+
+static int mt6351_get_status(struct regulator_dev *rdev)
+{
+	int ret;
+	u32 regval;
+	struct mt6351_regulator_info *info = rdev_get_drvdata(rdev);
+
+	ret = regmap_read(rdev->regmap, info->desc.enable_reg, &regval);
+	if (ret != 0) {
+		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);
+		return ret;
+	}
+
+	return (regval & info->qi) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
+}
+
+static struct regulator_ops mt6351_volt_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6351_get_status,
+};
+
+static struct regulator_ops mt6351_volt_table_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6351_get_status,
+};
+
+static struct regulator_ops mt6351_volt_fixed_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6351_get_status,
+};
+
+/* The array is indexed by id(MT6351_ID_XXX) */
+static struct mt6351_regulator_info mt6351_regulators[] = {
+	MT_BUCK(MT6351, "buck_vcore", VCORE, 600000, 1393750, 6250,
+		buck_volt_range1, MT6351_BUCK_VCORE_CON2,
+		MT6351_BUCK_VCORE_CON4, 0x7f,
+		MT6351_BUCK_VCORE_CON5, MT6351_BUCK_VCORE_CON0),
+	MT_BUCK(MT6351, "buck_vgpu", VGPU, 600000, 1393750, 6250,
+		buck_volt_range1, MT6351_BUCK_VGPU_CON2,
+		MT6351_BUCK_VGPU_CON4, 0x7f,
+		MT6351_BUCK_VGPU_CON5, MT6351_BUCK_VGPU_CON0),
+	MT_BUCK(MT6351, "buck_vmodem", VMODEM, 600000, 1393750, 6250,
+		buck_volt_range1, MT6351_BUCK_VMODEM_CON2,
+		MT6351_BUCK_VMODEM_CON4, 0x7f,
+		MT6351_BUCK_VMODEM_CON5, MT6351_BUCK_VMODEM_CON0),
+	MT_BUCK(MT6351, "buck_vmd1", VMD1, 600000, 1393750, 6250,
+		buck_volt_range1, MT6351_BUCK_VMD1_CON2,
+		MT6351_BUCK_VMD1_CON4, 0x7f,
+		MT6351_BUCK_VMD1_CON5, MT6351_BUCK_VMD1_CON0),
+	MT_BUCK(MT6351, "buck_vsram_md", VSRAM_MD, 600000, 1393750, 6250,
+		buck_volt_range1, MT6351_BUCK_VSRAM_MD_CON2,
+		MT6351_BUCK_VSRAM_MD_CON4, 0x7f,
+		MT6351_BUCK_VSRAM_MD_CON5, MT6351_BUCK_VSRAM_MD_CON0),
+	MT_BUCK(MT6351, "buck_vs1", VS1, 600000, 1393750, 6250,
+		buck_volt_range1, MT6351_BUCK_VS1_CON2,
+		MT6351_BUCK_VS1_CON4, 0x7f,
+		MT6351_BUCK_VS1_CON5, MT6351_BUCK_VS1_CON0),
+	MT_BUCK(MT6351, "buck_vs2", VS2, 600000, 1393750, 6250,
+		buck_volt_range1, MT6351_BUCK_VS2_CON2,
+		MT6351_BUCK_VS2_CON4, 0x7f,
+		MT6351_BUCK_VS2_CON5, MT6351_BUCK_VS2_CON0),
+	MT_BUCK(MT6351, "buck_vpa", VPA, 600000, 1393750, 6250,
+		buck_volt_range1, MT6351_BUCK_VPA_CON2,
+		MT6351_BUCK_VPA_CON4, 0x7f,
+		MT6351_BUCK_VPA_CON5, MT6351_BUCK_VPA_CON0),
+	MT_BUCK(MT6351, "buck_vsram_proc", VSRAM_PROC, 600000, 1393750, 6250,
+		buck_volt_range1, MT6351_BUCK_VSRAM_PROC_CON2,
+		MT6351_BUCK_VSRAM_PROC_CON4, 0x7f,
+		MT6351_BUCK_VSRAM_PROC_CON5, MT6351_BUCK_VSRAM_PROC_CON0),
+	MT_LDO(MT6351, "ldo_va18", VA18, ldo_volt_table1,
+	       MT6351_VA18_ANA_CON0, 1, MT6351_LDO_VA18_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vtcxo24", VTCXO24, ldo_volt_table1,
+	       MT6351_VTCXO24_ANA_CON0, 1, MT6351_LDO_VTCXO24_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vtcxo28", VTCXO28, ldo_volt_table1,
+	       MT6351_VTCXO28_ANA_CON0, 1, MT6351_LDO_VTCXO28_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vcn28", VCN28, ldo_volt_table1,
+	       MT6351_VCN28_ANA_CON0, 1, MT6351_LDO_VCN28_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vcama", VCAMA, ldo_volt_table4,
+	       MT6351_VCAMA_ANA_CON0, 1, MT6351_LDO_VCAMA_CON0, 0x300),
+	MT_REG_FIXED(MT6351, "ldo_vusb33", VUSB33,
+		     MT6351_LDO_VUSB33_CON0, 1, 3300000),
+	MT_LDO(MT6351, "ldo_vsim1", VSIM1, ldo_volt_table2,
+	       MT6351_VSIM1_ANA_CON0, 1, MT6351_LDO_VSIM1_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vsim2", VSIM2, ldo_volt_table2,
+	       MT6351_VSIM2_ANA_CON0, 1, MT6351_LDO_VSIM2_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vemc_3v3", VEMC_3V3, ldo_volt_table3,
+	       MT6351_VEMC_ANA_CON0, 1, MT6351_LDO_VEMC_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vmch", VMCH, ldo_volt_table3,
+	       MT6351_VMCH_ANA_CON0, 1, MT6351_LDO_VMCH_CON0, 0x300),
+	MT_REG_FIXED(MT6351, "ldo_vio28", VIO28,
+		     MT6351_LDO_VIO28_CON0, 1, 2800000),
+	MT_LDO(MT6351, "ldo_vibr", VIBR, ldo_volt_table7,
+	       MT6351_VIBR_ANA_CON0, 1, MT6351_LDO_VIBR_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vcamd", VCAMD, ldo_volt_table8,
+	       MT6351_VCAMD_ANA_CON0, 1, MT6351_LDO_VCAMD_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vrf18", VRF18, ldo_volt_table10,
+	       MT6351_VRF18_ANA_CON0, 1, MT6351_LDO_VRF18_CON0, 0x300),
+	MT_REG_FIXED(MT6351, "ldo_vio18", VIO18,
+		     MT6351_LDO_VIO18_CON0, 1, 1800000),
+	MT_LDO(MT6351, "ldo_vcn18", VCN18, ldo_volt_table9,
+	       MT6351_VCN18_ANA_CON0, 1, MT6351_LDO_VCN18_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vcamio", VCAMIO, ldo_volt_table9,
+	       MT6351_VCAMIO_ANA_CON0, 1, MT6351_LDO_VCAMIO_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vxo22", VXO22, ldo_volt_table1,
+	       MT6351_VXO22_ANA_CON0, 1, MT6351_LDO_VXO22_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vrf12", VRF12, ldo_volt_table9,
+	       MT6351_VRF12_ANA_CON0, 1, MT6351_LDO_VRF12_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_va10", VA10, ldo_volt_table9,
+	       MT6351_VA10_ANA_CON0, 1, MT6351_LDO_VA10_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vdram", VDRAM, ldo_volt_table8,
+	       MT6351_VDRAM_ANA_CON0, 1, MT6351_LDO_VDRAM_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vmipi", VMIPI, ldo_volt_table9,
+	       MT6351_VMIPI_ANA_CON0, 1, MT6351_LDO_VMIPI_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vgp3", VGP3, ldo_volt_table10,
+	       MT6351_VGP3_ANA_CON0, 1, MT6351_LDO_VGP3_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vbif28", VBIF28, ldo_volt_table1,
+	       MT6351_VBIF28_ANA_CON0, 1, MT6351_LDO_VBIF28_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vefuse", VEFUSE, ldo_volt_table2,
+	       MT6351_VEFUSE_ANA_CON0, 1, MT6351_LDO_VEFUSE_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vcn33_bt", VCN33_BT, ldo_volt_table5,
+	       MT6351_VCN33_ANA_CON0, 1, MT6351_LDO_VCN33_CON0, 0x300),
+	MT_LDO(MT6351, "ldo_vcn33_wifi", VCN33_WIFI, ldo_volt_table5,
+	       MT6351_VCN33_ANA_CON0, 1, MT6351_LDO_VCN33_CON0, 0x300),
+	MT_REG_FIXED(MT6351, "ldo_vldo28", VLDO28,
+		     MT6351_LDO_VLDO28_CON3, 1, 2800000),
+	MT_LDO(MT6351, "ldo_vmc", VMC, ldo_volt_table6,
+	       MT6351_VMC_ANA_CON0, 1, MT6351_LDO_VMC_CON0, 0x300),
+	MT_REG_FIXED(MT6351, "ldo_vldo28_0", VLDO28_0,
+		     MT6351_LDO_VLDO28_CON3, 1, 2800000),
+	MT_REG_FIXED(MT6351, "ldo_vldo28_1", VLDO28_1,
+		     MT6351_LDO_VLDO28_CON4, 1, 2800000),
+};
+
+static const struct mt_regulator_init_data mt6351_regulator_init_data = {
+	.id = MT6351_HWCID,
+	.size = MT6351_MAX_REGULATOR,
+	.regulator_info = &mt6351_regulators[0],
+};
+
+static const struct platform_device_id mt6351_platform_ids[] = {
+	{"mt6351-regulator", 0},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, mt6351_platform_ids);
+
+static const struct of_device_id mt6351_of_match[] = {
+	{
+		.compatible = "mediatek,mt6351-regulator",
+		.data = &mt6351_regulator_init_data,
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(of, mt6351_of_match);
+
+static int mt6351_set_buck_vosel_reg(struct platform_device *pdev)
+{
+	const struct of_device_id *of_id;
+	struct mt6397_chip *mt6351 = dev_get_drvdata(pdev->dev.parent);
+	struct mt6351_regulator_info *mt_regulators;
+	struct mt_regulator_init_data *regulator_init_data;
+	int i;
+	u32 regval, reg;
+
+	of_id = of_match_device(mt6351_of_match, &pdev->dev);
+	if (!of_id || !of_id->data)
+		return -ENODEV;
+
+	regulator_init_data = (struct mt_regulator_init_data *)of_id->data;
+	mt_regulators = regulator_init_data->regulator_info;
+
+	for (i = 0; i < regulator_init_data->size; i++) {
+		if ((mt_regulators + i)->vselctrl_reg) {
+			reg = (mt_regulators + i)->vselctrl_reg;
+			if (regmap_read(mt6351->regmap, reg, &regval) < 0) {
+				dev_err(&pdev->dev,
+					"Failed to read buck ctrl\n");
+					return -EIO;
+			}
+
+			if (regval & (mt_regulators + i)->vselctrl_mask) {
+				(mt_regulators + i)->desc.vsel_reg =
+				(mt_regulators + i)->vselon_reg;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int mt6351_regulator_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *of_id;
+	struct mt6397_chip *mt6351 = dev_get_drvdata(pdev->dev.parent);
+	struct regulator_config config = {};
+	struct regulator_dev *rdev;
+	int i;
+	u32 reg_value, version;
+
+	of_id = of_match_device(mt6351_of_match, &pdev->dev);
+	if (!of_id || !of_id->data)
+		return -ENODEV;
+
+	regulator_init_data = (struct mt_regulator_init_data *)of_id->data;
+	mt_regulators = regulator_init_data->regulator_info;
+
+	/* Query buck controller to select activated voltage register part */
+	if (mt6351_set_buck_vosel_reg(pdev))
+		return -EIO;
+
+	/* Read PMIC chip revision to update constraints and voltage table */
+	if (regmap_read(mt6351->regmap, MT6351_HWCID, &reg_value) < 0) {
+		dev_err(&pdev->dev, "Failed to read Chip ID\n");
+		return -EIO;
+	}
+	dev_info(&pdev->dev, "Chip ID = 0x%x\n", reg_value);
+
+	version = (reg_value & 0xFF);
+	switch (version) {
+	case MT6351_REGULATOR_ID12:
+		mt6351_regulators[MT6351_ID_VMC].desc.volt_table =
+		ldo_volt_table5_v2;
+		break;
+	default:
+		break;
+	}
+
+	for (i = 0; i < regulator_init_data->size; i++) {
+		config.dev = &pdev->dev;
+		config.driver_data = (mt_regulators + i);
+		config.regmap = mt6351->regmap;
+		rdev = devm_regulator_register(&pdev->dev,
+					       &(mt_regulators + i)->desc,
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "failed to register %s\n",
+				(mt_regulators + i)->desc.name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static struct platform_driver mt6351_regulator_driver = {
+	.driver = {
+		.name = "mt6351-regulator",
+		.of_match_table = of_match_ptr(mt6351_of_match),
+	},
+	.probe = mt6351_regulator_probe,
+	.id_table = mt6351_platform_ids,
+};
+
+module_platform_driver(mt6351_regulator_driver);
+
+MODULE_AUTHOR("Jimmy-Yj Huang <Jimmy-YJ.Hunag-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>");
+MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6351 PMIC");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:mt6351-regulator");
diff --git a/include/linux/regulator/mt6351-regulator.h b/include/linux/regulator/mt6351-regulator.h
new file mode 100644
index 0000000..b8bd6a6
--- /dev/null
+++ b/include/linux/regulator/mt6351-regulator.h
@@ -0,0 +1,66 @@
+/*
+ * Copyright (c) 2017 MediaTek Inc.
+ * Author: Jimmy-Yj Huang <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __LINUX_REGULATOR_MT6351_H
+#define __LINUX_REGULATOR_MT6351_H
+
+enum {
+	MT6351_ID_VCORE = 0,
+	MT6351_ID_VGPU,
+	MT6351_ID_VMODEM,
+	MT6351_ID_VMD1,
+	MT6351_ID_VSRAM_MD,
+	MT6351_ID_VS1,
+	MT6351_ID_VS2,
+	MT6351_ID_VPA,
+	MT6351_ID_VSRAM_PROC,
+	MT6351_ID_VA18 = 9,
+	MT6351_ID_VTCXO24,
+	MT6351_ID_VTCXO28,
+	MT6351_ID_VCN28,
+	MT6351_ID_VCAMA,
+	MT6351_ID_VUSB33,
+	MT6351_ID_VSIM1,
+	MT6351_ID_VSIM2,
+	MT6351_ID_VEMC_3V3,
+	MT6351_ID_VMCH,
+	MT6351_ID_VIO28,
+	MT6351_ID_VIBR,
+	MT6351_ID_VCAMD,
+	MT6351_ID_VRF18,
+	MT6351_ID_VIO18,
+	MT6351_ID_VCN18,
+	MT6351_ID_VCAMIO,
+	MT6351_ID_VXO22,
+	MT6351_ID_VRF12,
+	MT6351_ID_VA10,
+	MT6351_ID_VDRAM,
+	MT6351_ID_VMIPI,
+	MT6351_ID_VGP3,
+	MT6351_ID_VBIF28,
+	MT6351_ID_VEFUSE,
+	MT6351_ID_VCN33_BT,
+	MT6351_ID_VCN33_WIFI,
+	MT6351_ID_VLDO28,
+	MT6351_ID_VMC,
+	MT6351_ID_VLDO28_0,
+	MT6351_ID_VLDO28_1,
+	MT6351_ID_RG_MAX,
+};
+
+#define MT6351_MAX_REGULATOR	MT6351_ID_RG_MAX
+#define MT6351_REGULATOR_ID12	0x20
+#define MT6351_REGULATOR_ID14	0x40
+
+#endif /* __LINUX_REGULATOR_MT6351_H */
-- 
1.7.9.5
