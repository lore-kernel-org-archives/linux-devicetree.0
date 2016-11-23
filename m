From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: max77620: add support to configure MPOK" to the regulator tree
Date: Wed, 23 Nov 2016 16:31:33 +0000
Message-ID: <E1c9aSL-0006bY-FS@debutante>
References: <1479405276-26452-1-git-send-email-vreddytalla@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479405276-26452-1-git-send-email-vreddytalla@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>lee.jones@linaro.org, lgirdwood@gmail.combroonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ldewangan@nvidia.com, svelpula@nvidia.com, vreddytalla@nvidia.com
List-Id: devicetree@vger.kernel.org

The patch

   regulator: max77620: add support to configure MPOK

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

>From 383d0fca7035a12f1201277d33e8fc87c9d60c9a Mon Sep 17 00:00:00 2001
From: Venkat Reddy Talla <vreddytalla@nvidia.com>
Date: Thu, 17 Nov 2016 23:24:35 +0530
Subject: [PATCH] regulator: max77620: add support to configure MPOK

Adding support to configure regulator POK mapping bit
to control nRST_IO and GPIO1 POK function.
In  tegra based platform which uses MAX20024 pmic, when
some of regulators are configured FPS_NONE(flexible power sequencer)
causes PMIC GPIO1 to go low which lead to various other rails turning off,
to avoid this MPOK bit of those regulators need to be set to 0
so that PMIC GPIO1 will not go low.

Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/max77620-regulator.c | 46 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/max77620.h           |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index c39a56b41901..d088a7c79e60 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -80,6 +80,7 @@ struct max77620_regulator_pdata {
 	int suspend_fps_pd_slot;
 	int suspend_fps_pu_slot;
 	int current_mode;
+	int power_ok;
 	int ramp_rate_setting;
 };
 
@@ -350,11 +351,48 @@ static int max77620_set_slew_rate(struct max77620_regulator *pmic, int id,
 	return 0;
 }
 
+static int max77620_config_power_ok(struct max77620_regulator *pmic, int id)
+{
+	struct max77620_regulator_pdata *rpdata = &pmic->reg_pdata[id];
+	struct max77620_regulator_info *rinfo = pmic->rinfo[id];
+	struct max77620_chip *chip = dev_get_drvdata(pmic->dev->parent);
+	u8 val, mask;
+	int ret;
+
+	switch (chip->chip_id) {
+	case MAX20024:
+		if (rpdata->power_ok >= 0) {
+			if (rinfo->type == MAX77620_REGULATOR_TYPE_SD)
+				mask = MAX20024_SD_CFG1_MPOK_MASK;
+			else
+				mask = MAX20024_LDO_CFG2_MPOK_MASK;
+
+			val = rpdata->power_ok ? mask : 0;
+
+			ret = regmap_update_bits(pmic->rmap, rinfo->cfg_addr,
+						 mask, val);
+			if (ret < 0) {
+				dev_err(pmic->dev, "Reg 0x%02x update failed %d\n",
+					rinfo->cfg_addr, ret);
+				return ret;
+			}
+		}
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int max77620_init_pmic(struct max77620_regulator *pmic, int id)
 {
 	struct max77620_regulator_pdata *rpdata = &pmic->reg_pdata[id];
 	int ret;
 
+	max77620_config_power_ok(pmic, id);
+
 	/* Update power mode */
 	ret = max77620_regulator_get_power_mode(pmic, id);
 	if (ret < 0)
@@ -594,6 +632,12 @@ static int max77620_of_parse_cb(struct device_node *np,
 			np, "maxim,suspend-fps-power-down-slot", &pval);
 	rpdata->suspend_fps_pd_slot = (!ret) ? pval : -1;
 
+	ret = of_property_read_u32(np, "maxim,power-ok-control", &pval);
+	if (!ret)
+		rpdata->power_ok = pval;
+	else
+		rpdata->power_ok = -1;
+
 	ret = of_property_read_u32(np, "maxim,ramp-rate-setting", &pval);
 	rpdata->ramp_rate_setting = (!ret) ? pval : 0;
 
@@ -806,6 +850,8 @@ static int max77620_regulator_resume(struct device *dev)
 	for (id = 0; id < MAX77620_NUM_REGS; id++) {
 		reg_pdata = &pmic->reg_pdata[id];
 
+		max77620_config_power_ok(pmic, id);
+
 		max77620_regulator_set_fps_slots(pmic, id, false);
 		if (reg_pdata->active_fps_src < 0)
 			continue;
diff --git a/include/linux/mfd/max77620.h b/include/linux/mfd/max77620.h
index 3ca0af07fc78..ad2a9a852aea 100644
--- a/include/linux/mfd/max77620.h
+++ b/include/linux/mfd/max77620.h
@@ -180,6 +180,7 @@
 #define MAX77620_SD_CFG1_FPWM_SD_MASK		BIT(2)
 #define MAX77620_SD_CFG1_FPWM_SD_SKIP		0
 #define MAX77620_SD_CFG1_FPWM_SD_FPWM		BIT(2)
+#define MAX20024_SD_CFG1_MPOK_MASK		BIT(1)
 #define MAX77620_SD_CFG1_FSRADE_SD_MASK		BIT(0)
 #define MAX77620_SD_CFG1_FSRADE_SD_DISABLE	0
 #define MAX77620_SD_CFG1_FSRADE_SD_ENABLE	BIT(0)
@@ -187,6 +188,7 @@
 /* LDO_CNFG2 */
 #define MAX77620_LDO_POWER_MODE_MASK		0xC0
 #define MAX77620_LDO_POWER_MODE_SHIFT		6
+#define MAX20024_LDO_CFG2_MPOK_MASK		BIT(2)
 #define MAX77620_LDO_CFG2_ADE_MASK		BIT(1)
 #define MAX77620_LDO_CFG2_ADE_DISABLE		0
 #define MAX77620_LDO_CFG2_ADE_ENABLE		BIT(1)
-- 
2.10.2
