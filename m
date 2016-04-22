From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: max77620: Add support for device specific ramp rate setting" to the regulator tree
Date: Fri, 22 Apr 2016 16:27:33 +0100
Message-ID: <E1atczV-0007ld-RC@debutante>
References: <1461328781-22768-2-git-send-email-ldewangan@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461328781-22768-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: max77620: Add support for device specific ramp rate setting

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

>From 5aa43599daddbe972f955b2357c76866a6f92973 Mon Sep 17 00:00:00 2001
From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Fri, 22 Apr 2016 18:09:41 +0530
Subject: [PATCH] regulator: max77620: Add support for device specific ramp
 rate setting

Maxim advertised the ramp rate of the rail with some recommended
design specification like output capacitance of rail should be
2.2uF. This make sure that current change in the rail is within
maximum current limit and hence meet the advertised ramp rate.

If there is variation in design which causes the rail current to
change more that maximum current limit then device applies the
current limit. In this case, ramp rate is different than advertised
ramp rate.

Add device specific settings for ramp rate which need to be configure
on device register when measure ramp rate on platform is deviated from
advertised ramp rate. In this case, all delay time calculation for
voltage change is done with measured ramp rate and device ramp rate
is used for configuring the device register.

If measured ramp rate in the platform is same as advertised ramp rate
then regulator-ramp-delay is used for the device register configuration
and ramp time calculation for voltage change.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/max77620-regulator.c | 83 +++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 27 deletions(-)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index 73a3356a5c19..321e804aeab0 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -81,6 +81,7 @@ struct max77620_regulator_pdata {
 	int suspend_fps_pd_slot;
 	int suspend_fps_pu_slot;
 	int current_mode;
+	int ramp_rate_setting;
 };
 
 struct max77620_regulator {
@@ -307,6 +308,43 @@ static int max77620_read_slew_rate(struct max77620_regulator *pmic, int id)
 	return 0;
 }
 
+static int max77620_set_slew_rate(struct max77620_regulator *pmic, int id,
+				  int slew_rate)
+{
+	struct max77620_regulator_info *rinfo = pmic->rinfo[id];
+	unsigned int val;
+	int ret;
+	u8 mask;
+
+	if (rinfo->type == MAX77620_REGULATOR_TYPE_SD) {
+		if (slew_rate <= 13750)
+			val = 0;
+		else if (slew_rate <= 27500)
+			val = 1;
+		else if (slew_rate <= 55000)
+			val = 2;
+		else
+			val = 3;
+		val <<= MAX77620_SD_SR_SHIFT;
+		mask = MAX77620_SD_SR_MASK;
+	} else {
+		if (slew_rate <= 5000)
+			val = 1;
+		else
+			val = 0;
+		mask = MAX77620_LDO_SLEW_RATE_MASK;
+	}
+
+	ret = regmap_update_bits(pmic->rmap, rinfo->cfg_addr, mask, val);
+	if (ret < 0) {
+		dev_err(pmic->dev, "Regulator %d slew rate set failed: %d\n",
+			id, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int max77620_init_pmic(struct max77620_regulator *pmic, int id)
 {
 	struct max77620_regulator_pdata *rpdata = &pmic->reg_pdata[id];
@@ -351,6 +389,13 @@ static int max77620_init_pmic(struct max77620_regulator *pmic, int id)
 	if (ret < 0)
 		return ret;
 
+	if (rpdata->ramp_rate_setting) {
+		ret = max77620_set_slew_rate(pmic, id,
+					     rpdata->ramp_rate_setting);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -502,35 +547,16 @@ static int max77620_regulator_set_ramp_delay(struct regulator_dev *rdev,
 {
 	struct max77620_regulator *pmic = rdev_get_drvdata(rdev);
 	int id = rdev_get_id(rdev);
-	struct max77620_regulator_info *rinfo = pmic->rinfo[id];
-	int ret, val;
-	u8 mask;
-
-	if (rinfo->type == MAX77620_REGULATOR_TYPE_SD) {
-		if (ramp_delay <= 13750)
-			val = 0;
-		else if (ramp_delay <= 27500)
-			val = 1;
-		else if (ramp_delay <= 55000)
-			val = 2;
-		else
-			val = 3;
-		val <<= MAX77620_SD_SR_SHIFT;
-		mask = MAX77620_SD_SR_MASK;
-	} else {
-		if (ramp_delay <= 5000)
-			val = 1;
-		else
-			val = 0;
-		mask = MAX77620_LDO_SLEW_RATE_MASK;
-	}
+	struct max77620_regulator_pdata *rpdata = &pmic->reg_pdata[id];
 
-	ret = regmap_update_bits(pmic->rmap, rinfo->cfg_addr, mask, val);
-	if (ret < 0)
-		dev_err(pmic->dev, "Reg 0x%02x update failed: %d\n",
-			rinfo->cfg_addr, ret);
+	/* Device specific ramp rate setting tells that platform has
+	 * different ramp rate from advertised value. In this case,
+	 * do not configure anything and just return success.
+	 */
+	if (rpdata->ramp_rate_setting)
+		return 0;
 
-	return ret;
+	return max77620_set_slew_rate(pmic, id, ramp_delay);
 }
 
 static int max77620_of_parse_cb(struct device_node *np,
@@ -563,6 +589,9 @@ static int max77620_of_parse_cb(struct device_node *np,
 			np, "maxim,suspend-fps-power-down-slot", &pval);
 	rpdata->suspend_fps_pd_slot = (!ret) ? pval : -1;
 
+	ret = of_property_read_u32(np, "maxim,ramp-rate-setting", &pval);
+	rpdata->ramp_rate_setting = (!ret) ? pval : 0;
+
 	return max77620_init_pmic(pmic, desc->id);
 }
 
-- 
2.8.0.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
