From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/2] regulator: max77620: Add support for device specific ramp rate setting
Date: Fri, 22 Apr 2016 18:09:41 +0530
Message-ID: <1461328781-22768-2-git-send-email-ldewangan@nvidia.com>
References: <1461328781-22768-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461328781-22768-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

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

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
This patch is based on discussion on earlier patch:
 regulator: DT: Add support to scale ramp delay based on platform behavior
The last point of the discussion is to have device specific ramp setting
property to configure the device.
---
 drivers/regulator/max77620-regulator.c | 83 +++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 27 deletions(-)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index 6f82b97..232377d 100644
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
2.1.4
