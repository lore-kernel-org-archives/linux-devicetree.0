From: Venkat Reddy Talla <vreddytalla@nvidia.com>
Subject: [PATCH v2 1/2] regulator: max77620: add support to configure MPOK
Date: Thu, 17 Nov 2016 23:24:35 +0530
Message-ID: <1479405276-26452-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ldewangan@nvidia.com, svelpula@nvidia.com, vreddytalla@nvidia.com
List-Id: devicetree@vger.kernel.org

Adding support to configure regulator POK mapping bit
to control nRST_IO and GPIO1 POK function.
In  tegra based platform which uses MAX20024 pmic, when
some of regulators are configured FPS_NONE(flexible power sequencer)
causes PMIC GPIO1 to go low which lead to various other rails turning off,
to avoid this MPOK bit of those regulators need to be set to 0
so that PMIC GPIO1 will not go low.

Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>

---
changes in v2:
- updated commit message for the patch
- address review comments
---
 drivers/regulator/max77620-regulator.c | 46 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/max77620.h           |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index a1b49a6..850b14c 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -81,6 +81,7 @@ struct max77620_regulator_pdata {
 	int suspend_fps_pd_slot;
 	int suspend_fps_pu_slot;
 	int current_mode;
+	int power_ok;
 	int ramp_rate_setting;
 };
 
@@ -351,11 +352,48 @@ static int max77620_set_slew_rate(struct max77620_regulator *pmic, int id,
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
@@ -595,6 +633,12 @@ static int max77620_of_parse_cb(struct device_node *np,
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
 
@@ -807,6 +851,8 @@ static int max77620_regulator_resume(struct device *dev)
 	for (id = 0; id < MAX77620_NUM_REGS; id++) {
 		reg_pdata = &pmic->reg_pdata[id];
 
+		max77620_config_power_ok(pmic, id);
+
 		max77620_regulator_set_fps_slots(pmic, id, false);
 		if (reg_pdata->active_fps_src < 0)
 			continue;
diff --git a/include/linux/mfd/max77620.h b/include/linux/mfd/max77620.h
index 3ca0af07..ad2a9a8 100644
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
2.1.4
