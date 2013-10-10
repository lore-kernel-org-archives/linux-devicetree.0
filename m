From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] regulator: s5m8767: Modify parsing method of the voltage
 table of buck2/3/4
Date: Thu, 10 Oct 2013 10:41:36 +0900
Message-ID: <1381369296-17101-2-git-send-email-cw00.choi@samsung.com>
References: <1381369296-17101-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1381369296-17101-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The s5m8767 regulator driver parse always the voltage table of buck2/3/4.
If gpio_dvs feature isn't used and dts haven't included the voltage table
of buck2/3/4, s5m8767 regulator driver return error and file probe state.

This patch check only voltage table of buck on s5m8767_pmic_dt_parse_pdata()
if buck[2-4]_gpiodvs is true.

Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/regulator/s5m8767.c | 54 +++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index cb6cdb3..29999c0 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -522,7 +522,7 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 	struct device_node *pmic_np, *regulators_np, *reg_np;
 	struct sec_regulator_data *rdata;
 	struct sec_opmode_data *rmode;
-	unsigned int i, dvs_voltage_nr = 1, ret;
+	unsigned int i, dvs_voltage_nr = 8, ret;
 
 	pmic_np = iodev->dev->of_node;
 	if (!pmic_np) {
@@ -586,15 +586,39 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 		rmode++;
 	}
 
-	if (of_get_property(pmic_np, "s5m8767,pmic-buck2-uses-gpio-dvs", NULL))
+	if (of_get_property(pmic_np, "s5m8767,pmic-buck2-uses-gpio-dvs", NULL)) {
 		pdata->buck2_gpiodvs = true;
 
-	if (of_get_property(pmic_np, "s5m8767,pmic-buck3-uses-gpio-dvs", NULL))
+		if (of_property_read_u32_array(pmic_np,
+				"s5m8767,pmic-buck2-dvs-voltage",
+				pdata->buck2_voltage, dvs_voltage_nr)) {
+			dev_err(iodev->dev, "buck2 voltages not specified\n");
+			return -EINVAL;
+		}
+	}
+
+	if (of_get_property(pmic_np, "s5m8767,pmic-buck3-uses-gpio-dvs", NULL)) {
 		pdata->buck3_gpiodvs = true;
 
-	if (of_get_property(pmic_np, "s5m8767,pmic-buck4-uses-gpio-dvs", NULL))
+		if (of_property_read_u32_array(pmic_np,
+				"s5m8767,pmic-buck3-dvs-voltage",
+				pdata->buck3_voltage, dvs_voltage_nr)) {
+			dev_err(iodev->dev, "buck3 voltages not specified\n");
+			return -EINVAL;
+		}
+	}
+
+	if (of_get_property(pmic_np, "s5m8767,pmic-buck4-uses-gpio-dvs", NULL)) {
 		pdata->buck4_gpiodvs = true;
 
+		if (of_property_read_u32_array(pmic_np,
+				"s5m8767,pmic-buck4-dvs-voltage",
+				pdata->buck4_voltage, dvs_voltage_nr)) {
+			dev_err(iodev->dev, "buck4 voltages not specified\n");
+			return -EINVAL;
+		}
+	}
+
 	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
 						pdata->buck4_gpiodvs) {
 		ret = s5m8767_pmic_dt_parse_dvs_gpio(iodev, pdata, pmic_np);
@@ -612,34 +636,12 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 				"invalid value for default dvs index, use 0\n");
 			}
 		}
-		dvs_voltage_nr = 8;
 	}
 
 	ret = s5m8767_pmic_dt_parse_ds_gpio(iodev, pdata, pmic_np);
 	if (ret)
 		return -EINVAL;
 
-	if (of_property_read_u32_array(pmic_np,
-				"s5m8767,pmic-buck2-dvs-voltage",
-				pdata->buck2_voltage, dvs_voltage_nr)) {
-		dev_err(iodev->dev, "buck2 voltages not specified\n");
-		return -EINVAL;
-	}
-
-	if (of_property_read_u32_array(pmic_np,
-				"s5m8767,pmic-buck3-dvs-voltage",
-				pdata->buck3_voltage, dvs_voltage_nr)) {
-		dev_err(iodev->dev, "buck3 voltages not specified\n");
-		return -EINVAL;
-	}
-
-	if (of_property_read_u32_array(pmic_np,
-				"s5m8767,pmic-buck4-dvs-voltage",
-				pdata->buck4_voltage, dvs_voltage_nr)) {
-		dev_err(iodev->dev, "buck4 voltages not specified\n");
-		return -EINVAL;
-	}
-
 	if (of_get_property(pmic_np, "s5m8767,pmic-buck2-ramp-enable", NULL))
 		pdata->buck2_ramp_enable = true;
 
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
