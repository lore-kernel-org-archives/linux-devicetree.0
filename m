From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RESUBMIT PATCH v3 7/8] regulator: sky81452: Add compatible string for device binding
Date: Tue,  7 Oct 2014 14:11:07 +0900
Message-ID: <1412658667-8196-1-git-send-email-jack.yoo@skyworksinc.com>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412657745-7812-1-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
---
 drivers/regulator/sky81452-regulator.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/sky81452-regulator.c b/drivers/regulator/sky81452-regulator.c
index 97aff0c..f895d1b 100644
--- a/drivers/regulator/sky81452-regulator.c
+++ b/drivers/regulator/sky81452-regulator.c
@@ -68,12 +68,11 @@ static const struct regulator_desc sky81452_reg = {
 static struct regulator_init_data *sky81452_reg_parse_dt(struct device *dev)
 {
 	struct regulator_init_data *init_data;
-	struct device_node *np;
+	struct device_node *np = of_node_get(dev->of_node);
 
-	np = of_get_child_by_name(dev->parent->of_node, "regulator");
-	if (unlikely(!np)) {
+	if (!np) {
 		dev_err(dev, "regulator node not found");
-		return NULL;
+		return ERR_PTR(-ENODATA);
 	}
 
 	init_data = of_get_regulator_init_data(dev, np);
@@ -107,17 +106,28 @@ static int sky81452_reg_probe(struct platform_device *pdev)
 	config.regmap = dev_get_drvdata(dev->parent);
 
 	rdev = devm_regulator_register(dev, &sky81452_reg, &config);
-	if (IS_ERR(rdev))
+	if (IS_ERR(rdev)) {
+		dev_err(dev, "failed to register. err=%ld", PTR_ERR(rdev));
 		return PTR_ERR(rdev);
+	}
 
 	platform_set_drvdata(pdev, rdev);
 
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id sky81452_reg_of_match[] = {
+	{ .compatible = "skyworks,sky81452-regulator", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sky81452_reg_of_match);
+#endif
+
 static struct platform_driver sky81452_reg_driver = {
 	.driver = {
 		.name = "sky81452-regulator",
+		.of_match_table = of_match_ptr(sky81452_reg_of_match),
 	},
 	.probe = sky81452_reg_probe,
 };
@@ -127,4 +137,4 @@ module_platform_driver(sky81452_reg_driver);
 MODULE_DESCRIPTION("Skyworks SKY81452 Regulator driver");
 MODULE_AUTHOR("Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>");
 MODULE_LICENSE("GPL");
-MODULE_VERSION("1.0");
+MODULE_VERSION("1.2");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
