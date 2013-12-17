From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/5] regulator: s5m8767: Do not use sec_reg* regmap helpers
Date: Tue, 17 Dec 2013 14:23:18 +0100
Message-ID: <1387286601-21646-3-git-send-email-k.kozlowski@samsung.com>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1387286601-21646-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Amit Daniel Kachhap <amit.daniel-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Replace calls to sec_reg* helpers with direct usage of regmap API. The
sec_reg* helpers are error-prone as they mix u8 with unsigned int and
order of some of parameters (val and mask in sec_reg_update()).

Also the helpers do not give any way of useful abstraction as they just
call corresponding regmap function.

This patch replaces:
 - sec_reg_read() with regmap_read(),
 - sec_reg_write() with regmap_write(),
 - sec_reg_update() with regmap_update_bits().

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/regulator/s5m8767.c |   71 +++++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 30 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 10b4b6a5b08e..d7164bb75d3e 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -23,6 +23,7 @@
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/regulator/of_regulator.h>
+#include <linux/regmap.h>
 
 #define S5M8767_OPMODE_NORMAL_MODE 0x1
 
@@ -226,7 +227,7 @@ static int s5m8767_reg_is_enabled(struct regulator_dev *rdev)
 	else if (ret)
 		return ret;
 
-	ret = sec_reg_read(s5m8767->iodev, reg, &val);
+	ret = regmap_read(s5m8767->iodev->regmap_pmic, reg, &val);
 	if (ret)
 		return ret;
 
@@ -243,21 +244,21 @@ static int s5m8767_reg_enable(struct regulator_dev *rdev)
 	if (ret)
 		return ret;
 
-	return sec_reg_update(s5m8767->iodev, reg, enable_ctrl,
-			S5M8767_ENCTRL_MASK);
+	return regmap_update_bits(s5m8767->iodev->regmap_pmic, reg,
+			S5M8767_ENCTRL_MASK, enable_ctrl);
 }
 
 static int s5m8767_reg_disable(struct regulator_dev *rdev)
 {
 	struct s5m8767_info *s5m8767 = rdev_get_drvdata(rdev);
-	int ret, reg;
-	int mask = S5M8767_ENCTRL_MASK, enable_ctrl;
+	int ret, reg, enable_ctrl;
 
 	ret = s5m8767_get_register(rdev, &reg, &enable_ctrl);
 	if (ret)
 		return ret;
 
-	return sec_reg_update(s5m8767->iodev, reg, ~mask, mask);
+	return regmap_update_bits(s5m8767->iodev->regmap_pmic, reg,
+			S5M8767_ENCTRL_MASK, ~S5M8767_ENCTRL_MASK);
 }
 
 static int s5m8767_get_vsel_reg(int reg_id, struct s5m8767_info *s5m8767)
@@ -749,17 +750,20 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 	buck_init = s5m8767_convert_voltage_to_sel(&buck_voltage_val2,
 						   pdata->buck2_init);
 
-	sec_reg_write(s5m8767->iodev, S5M8767_REG_BUCK2DVS2, buck_init);
+	regmap_write(s5m8767->iodev->regmap_pmic, S5M8767_REG_BUCK2DVS2,
+			buck_init);
 
 	buck_init = s5m8767_convert_voltage_to_sel(&buck_voltage_val2,
 						   pdata->buck3_init);
 
-	sec_reg_write(s5m8767->iodev, S5M8767_REG_BUCK3DVS2, buck_init);
+	regmap_write(s5m8767->iodev->regmap_pmic, S5M8767_REG_BUCK3DVS2,
+			buck_init);
 
 	buck_init = s5m8767_convert_voltage_to_sel(&buck_voltage_val2,
 						   pdata->buck4_init);
 
-	sec_reg_write(s5m8767->iodev, S5M8767_REG_BUCK4DVS2, buck_init);
+	regmap_write(s5m8767->iodev->regmap_pmic, S5M8767_REG_BUCK4DVS2,
+			buck_init);
 
 	for (i = 0; i < 8; i++) {
 		if (s5m8767->buck2_gpiodvs) {
@@ -841,43 +845,49 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 
 	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
 	   pdata->buck4_gpiodvs) {
-		sec_reg_update(s5m8767->iodev, S5M8767_REG_BUCK2CTRL,
-				(pdata->buck2_gpiodvs) ? (1 << 1) : (0 << 1),
-				1 << 1);
-		sec_reg_update(s5m8767->iodev, S5M8767_REG_BUCK3CTRL,
-				(pdata->buck3_gpiodvs) ? (1 << 1) : (0 << 1),
-				1 << 1);
-		sec_reg_update(s5m8767->iodev, S5M8767_REG_BUCK4CTRL,
-				(pdata->buck4_gpiodvs) ? (1 << 1) : (0 << 1),
-				1 << 1);
+		regmap_update_bits(s5m8767->iodev->regmap_pmic,
+				S5M8767_REG_BUCK2CTRL, 1 << 1,
+				(pdata->buck2_gpiodvs) ? (1 << 1) : (0 << 1));
+		regmap_update_bits(s5m8767->iodev->regmap_pmic,
+				S5M8767_REG_BUCK3CTRL, 1 << 1,
+				(pdata->buck3_gpiodvs) ? (1 << 1) : (0 << 1));
+		regmap_update_bits(s5m8767->iodev->regmap_pmic,
+				S5M8767_REG_BUCK4CTRL, 1 << 1,
+				(pdata->buck4_gpiodvs) ? (1 << 1) : (0 << 1));
 	}
 
 	/* Initialize GPIO DVS registers */
 	for (i = 0; i < 8; i++) {
 		if (s5m8767->buck2_gpiodvs) {
-			sec_reg_write(s5m8767->iodev, S5M8767_REG_BUCK2DVS1 + i,
-					   s5m8767->buck2_vol[i]);
+			regmap_write(s5m8767->iodev->regmap_pmic,
+					S5M8767_REG_BUCK2DVS1 + i,
+					s5m8767->buck2_vol[i]);
 		}
 
 		if (s5m8767->buck3_gpiodvs) {
-			sec_reg_write(s5m8767->iodev, S5M8767_REG_BUCK3DVS1 + i,
-					   s5m8767->buck3_vol[i]);
+			regmap_write(s5m8767->iodev->regmap_pmic,
+					S5M8767_REG_BUCK3DVS1 + i,
+					s5m8767->buck3_vol[i]);
 		}
 
 		if (s5m8767->buck4_gpiodvs) {
-			sec_reg_write(s5m8767->iodev, S5M8767_REG_BUCK4DVS1 + i,
-					   s5m8767->buck4_vol[i]);
+			regmap_write(s5m8767->iodev->regmap_pmic,
+					S5M8767_REG_BUCK4DVS1 + i,
+					s5m8767->buck4_vol[i]);
 		}
 	}
 
 	if (s5m8767->buck2_ramp)
-		sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP, 0x08, 0x08);
+		regmap_update_bits(s5m8767->iodev->regmap_pmic,
+				S5M8767_REG_DVSRAMP, 0x08, 0x08);
 
 	if (s5m8767->buck3_ramp)
-		sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP, 0x04, 0x04);
+		regmap_update_bits(s5m8767->iodev->regmap_pmic,
+				S5M8767_REG_DVSRAMP, 0x04, 0x04);
 
 	if (s5m8767->buck4_ramp)
-		sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP, 0x02, 0x02);
+		regmap_update_bits(s5m8767->iodev->regmap_pmic,
+				S5M8767_REG_DVSRAMP, 0x02, 0x02);
 
 	if (s5m8767->buck2_ramp || s5m8767->buck3_ramp
 		|| s5m8767->buck4_ramp) {
@@ -901,9 +911,10 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 		default:
 			val = S5M8767_DVS_BUCK_RAMP_10;
 		}
-		sec_reg_update(s5m8767->iodev, S5M8767_REG_DVSRAMP,
-					val << S5M8767_DVS_BUCK_RAMP_SHIFT,
-					S5M8767_DVS_BUCK_RAMP_MASK);
+		regmap_update_bits(s5m8767->iodev->regmap_pmic,
+					S5M8767_REG_DVSRAMP,
+					S5M8767_DVS_BUCK_RAMP_MASK,
+					val << S5M8767_DVS_BUCK_RAMP_SHIFT);
 	}
 
 	for (i = 0; i < pdata->num_regulators; i++) {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
