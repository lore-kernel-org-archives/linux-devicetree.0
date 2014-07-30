From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] regulator: userspace-consumer: add DT support
Date: Wed, 30 Jul 2014 19:23:59 +0530
Message-ID: <1406728440-17837-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT support of the regulator driver userspace-consumer.
The supply names for this driver is provided through DT properties
so that proper regulator handle can be acquired.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/userspace-consumer.c | 48 ++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/regulator/userspace-consumer.c b/drivers/regulator/userspace-consumer.c
index 765acc1..91d50a2 100644
--- a/drivers/regulator/userspace-consumer.c
+++ b/drivers/regulator/userspace-consumer.c
@@ -23,6 +23,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/userspace-consumer.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 
 struct userspace_consumer_data {
 	const char *name;
@@ -105,6 +106,41 @@ static const struct attribute_group attr_group = {
 	.attrs	= attributes,
 };
 
+static struct regulator_userspace_consumer_data *get_pdata_from_dt_node(
+		struct platform_device *pdev)
+{
+	struct regulator_userspace_consumer_data *pdata;
+	struct device_node *np = pdev->dev.of_node;
+	struct property *prop;
+	const char *supply;
+	int num_supplies;
+	int count = 0;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->name = of_get_property(np, "regulator-name", NULL);
+	pdata->init_on = of_property_read_bool(np, "regulator-boot-on");
+
+	num_supplies = of_property_count_strings(np, "regulator-supplies");
+	if (num_supplies < 0) {
+		dev_err(&pdev->dev,
+			"could not parse property regulator-supplies\n");
+		return ERR_PTR(-EINVAL);
+	}
+	pdata->num_supplies = num_supplies;
+	pdata->supplies = devm_kzalloc(&pdev->dev, num_supplies *
+				sizeof(*pdata->supplies), GFP_KERNEL);
+	if (!pdata->supplies)
+		return ERR_PTR(-ENOMEM);
+
+	of_property_for_each_string(np, "regulator-supplies", prop, supply)
+		pdata->supplies[count++].supply = supply;
+
+	return pdata;
+}
+
 static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 {
 	struct regulator_userspace_consumer_data *pdata;
@@ -112,6 +148,11 @@ static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 	int ret;
 
 	pdata = dev_get_platdata(&pdev->dev);
+	if (!pdata && pdev->dev.of_node) {
+		pdata = get_pdata_from_dt_node(pdev);
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
+	}
 	if (!pdata)
 		return -EINVAL;
 
@@ -171,11 +212,18 @@ static int regulator_userspace_consumer_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id regulator_userspace_consumer_of_match[] = {
+	{ .compatible = "reg-userspace-consumer", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, regulator_userspace_consumer_of_match);
+
 static struct platform_driver regulator_userspace_consumer_driver = {
 	.probe		= regulator_userspace_consumer_probe,
 	.remove		= regulator_userspace_consumer_remove,
 	.driver		= {
 		.name		= "reg-userspace-consumer",
+		.of_match_table = regulator_userspace_consumer_of_match,
 	},
 };
 
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
