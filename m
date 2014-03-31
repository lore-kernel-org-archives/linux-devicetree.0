From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 3/6] regulator: arizona-ldo1: Add processing of init_data from device tree
Date: Mon, 31 Mar 2014 12:59:44 +0100
Message-ID: <1396267187-30580-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1396267187-30580-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396267187-30580-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/regulator/arizona-ldo1.c |   47 +++++++++++++++++++++++++++++++++++--
 1 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/arizona-ldo1.c b/drivers/regulator/arizona-ldo1.c
index 211af83..e23a95f 100644
--- a/drivers/regulator/arizona-ldo1.c
+++ b/drivers/regulator/arizona-ldo1.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
 #include <linux/gpio.h>
 #include <linux/slab.h>
 
@@ -179,19 +180,56 @@ static const struct regulator_init_data arizona_ldo1_default = {
 };
 
 #ifdef CONFIG_OF
-static int arizona_ldo1_of_get_pdata(struct arizona *arizona)
+static int arizona_ldo1_of_get_pdata(struct arizona *arizona,
+				     struct regulator_config *config)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
+	struct arizona_ldo1 *ldo1 = config->driver_data;
+	struct device_node *init_node, *dcvdd_node;
+	struct regulator_init_data *init_data;
 
 	arizona_of_get_named_gpio(arizona, "wlf,ldoena", true, &pdata->ldoena);
 
+	init_node = of_get_child_by_name(arizona->dev->of_node, "ldo1");
+	dcvdd_node = of_parse_phandle(arizona->dev->of_node, "DCVDD-supply", 0);
+
+	if (init_node) {
+		config->of_node = init_node;
+
+		init_data = of_get_regulator_init_data(arizona->dev, init_node);
+
+		if (init_data) {
+			init_data->consumer_supplies = &ldo1->supply;
+			init_data->num_consumer_supplies = 1;
+
+			if (dcvdd_node && dcvdd_node != init_node)
+				arizona->external_dcvdd = true;
+
+			pdata->ldo1 = init_data;
+		}
+	} else if (dcvdd_node) {
+		arizona->external_dcvdd = true;
+	}
+
+	of_node_put(dcvdd_node);
+
 	return 0;
 }
+
+static void arizona_ldo1_of_put_pdata(struct regulator_config *config)
+{
+	of_node_put(config->of_node);
+}
 #else
-static inline int arizona_ldo1_of_get_pdata(struct arizona *arizona)
+static inline int arizona_ldo1_of_get_pdata(struct arizona *arizona,
+					    struct regulator_config *config)
 {
 	return 0;
 }
+
+static inline void arizona_ldo1_of_put_pdata(struct regulator_config *config)
+{
+}
 #endif
 
 static int arizona_ldo1_probe(struct platform_device *pdev)
@@ -236,7 +274,7 @@ static int arizona_ldo1_probe(struct platform_device *pdev)
 	config.regmap = arizona->regmap;
 
 	if (!dev_get_platdata(arizona->dev)) {
-		ret = arizona_ldo1_of_get_pdata(arizona);
+		ret = arizona_ldo1_of_get_pdata(arizona, &config);
 		if (ret < 0)
 			return ret;
 	}
@@ -263,6 +301,9 @@ static int arizona_ldo1_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (!dev_get_platdata(arizona->dev))
+		arizona_ldo1_of_put_pdata(&config);
+
 	platform_set_drvdata(pdev, ldo1);
 
 	return 0;
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
