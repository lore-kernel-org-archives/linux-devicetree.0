From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 4/5] Regulator: RK808: modify for struct rk808 change
Date: Mon, 25 Aug 2014 21:37:06 +0800
Message-ID: <1408973826-23845-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The "dev" has been deleted from "struct rk808" in rk808 mfd driver
so rk808->dev should be replaced by &client->dev here.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v5: None
Changes in v4:
Adviced by Lee Jones in v2
- modify the description in Kconfig
- remove some unnecessary header files
- remove dev from struct rk808
- use enum for define RK808_ID...

Changes in v3:
- fix compile err

Changes in v2:
Adviced by Mark Browm:
- use defines for register setting value
- remove rtc alarm disable in shutdown
- remove while(1) in shutdown
- remove read 0x2f in probe

 drivers/regulator/rk808-regulator.c |   34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index 4d5041c..f00d6d8 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -296,13 +296,14 @@ static struct of_regulator_match rk808_reg_matches[] = {
 
 static int rk808_regulator_dts(struct rk808 *rk808)
 {
-	struct rk808_board *pdata = rk808->pdata;
 	struct device_node *np, *reg_np;
+	struct i2c_client *client = rk808->i2c;
+	struct rk808_board *pdata = rk808->pdata;
 	int i, ret;
 
-	np = rk808->dev->of_node;
+	np = client->dev.of_node;
 	if (!np) {
-		dev_err(rk808->dev, "could not find pmic sub-node\n");
+		dev_err(&client->dev, "could not find pmic sub-node\n");
 		return -ENXIO;
 	}
 
@@ -310,10 +311,10 @@ static int rk808_regulator_dts(struct rk808 *rk808)
 	if (!reg_np)
 		return -ENXIO;
 
-	ret = of_regulator_match(rk808->dev, reg_np, rk808_reg_matches,
+	ret = of_regulator_match(&client->dev, reg_np, rk808_reg_matches,
 				 RK808_NUM_REGULATORS);
-	if (ret  < 0) {
-		dev_err(rk808->dev,
+	if (ret < 0) {
+		dev_err(&client->dev,
 			"failed to parse regulator data: %d\n", ret);
 		return ret;
 	}
@@ -333,24 +334,17 @@ static int rk808_regulator_dts(struct rk808 *rk808)
 static int rk808_regulator_probe(struct platform_device *pdev)
 {
 	struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
-	struct rk808_board *pdata;
+	struct i2c_client *client = rk808->i2c;
+	struct rk808_board *pdata = rk808->pdata;
 	struct regulator_config config = {};
 	struct regulator_dev *rk808_rdev;
 	struct regulator_init_data *reg_data;
 	int i = 0;
 	int ret = 0;
 
-	dev_dbg(rk808->dev, "%s\n", __func__);
-
-	if (!rk808) {
-		dev_err(rk808->dev, "%s no rk808\n", __func__);
-		return -ENODEV;
-	}
-
-	pdata = rk808->pdata;
 	if (!pdata) {
-		dev_warn(rk808->dev, "%s no pdata, create it\n", __func__);
-		pdata = devm_kzalloc(rk808->dev, sizeof(*pdata), GFP_KERNEL);
+		dev_warn(&client->dev, "%s no pdata, create it\n", __func__);
+		pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
 	}
@@ -371,11 +365,11 @@ static int rk808_regulator_probe(struct platform_device *pdev)
 		if (!reg_data)
 			continue;
 
-		config.dev = rk808->dev;
+		config.dev = &client->dev;
 		config.driver_data = rk808;
 		config.regmap = rk808->regmap;
 
-		if (rk808->dev->of_node)
+		if (client->dev.of_node)
 			config.of_node = pdata->of_node[i];
 
 		reg_data->supply_regulator = rk808_reg[i].name;
@@ -384,7 +378,7 @@ static int rk808_regulator_probe(struct platform_device *pdev)
 		rk808_rdev = devm_regulator_register(&pdev->dev,
 						     &rk808_reg[i], &config);
 		if (IS_ERR(rk808_rdev)) {
-			dev_err(rk808->dev,
+			dev_err(&client->dev,
 				"failed to register %d regulator\n", i);
 			return PTR_ERR(rk808_rdev);
 		}
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
