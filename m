From: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] regulator: max77620: add support to configure MPOK
Date: Wed, 16 Nov 2016 17:22:40 +0530
Message-ID: <1479297161-7705-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, svelpula-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding support to configure regulator POK mapping bit
to control nRST_IO and GPIO1 POK function.

Signed-off-by: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/max77620-regulator.c | 39 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/max77620.h           |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index a1b49a6..973bed1 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -81,6 +81,7 @@ struct max77620_regulator_pdata {
 	int suspend_fps_pd_slot;
 	int suspend_fps_pu_slot;
 	int current_mode;
+	int power_ok;
 	int ramp_rate_setting;
 };
 
@@ -351,11 +352,44 @@ static int max77620_set_slew_rate(struct max77620_regulator *pmic, int id,
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
+	if (chip->chip_id == MAX20024) {
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
+				dev_err(pmic->dev,
+					"Reg 0x%02x update failed %d\n",
+					rinfo->cfg_addr, ret);
+				return ret;
+			}
+		}
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
@@ -595,6 +629,9 @@ static int max77620_of_parse_cb(struct device_node *np,
 			np, "maxim,suspend-fps-power-down-slot", &pval);
 	rpdata->suspend_fps_pd_slot = (!ret) ? pval : -1;
 
+	ret = of_property_read_u32(np, "maxim,power-ok-control", &pval);
+	rpdata->power_ok = (!ret) ? pval : -1;
+
 	ret = of_property_read_u32(np, "maxim,ramp-rate-setting", &pval);
 	rpdata->ramp_rate_setting = (!ret) ? pval : 0;
 
@@ -807,6 +844,8 @@ static int max77620_regulator_resume(struct device *dev)
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
