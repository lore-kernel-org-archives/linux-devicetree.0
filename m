From: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] extcon: gpio: add device tree support for extcon-gpio
Date: Tue, 3 May 2016 11:19:50 +0530
Message-ID: <1462254591-8907-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding device tree support for extcon-gpio driver.

Signed-off-by: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/extcon/extcon-gpio.c       | 80 +++++++++++++++++++++++++++++++++++---
 include/linux/extcon/extcon-gpio.h |  2 +
 2 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index d023789..b7fae7e 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -28,6 +28,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
 
 struct gpio_extcon_data {
 	struct extcon_dev *edev;
@@ -90,21 +92,79 @@ static int gpio_extcon_init(struct device *dev, struct gpio_extcon_data *data)
 	return 0;
 }
 
+static struct gpio_extcon_pdata *gpio_extcon_of_pdata(
+		struct platform_device *pdev)
+{
+	struct gpio_extcon_pdata *pdata;
+	struct device_node *np = pdev->dev.of_node;
+	int gpio;
+	u32 pval;
+	int ret;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	gpio = of_get_named_gpio(np, "gpio", 0);
+	if (gpio < 0)
+		return ERR_PTR(gpio);
+
+	pdata->gpio = gpio;
+
+	ret = of_property_read_u32(np, "extcon-gpio,irq-flags", &pval);
+	if (!ret)
+		pdata->irq_flags = pval;
+	else
+		pdata->irq_flags = IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING;
+
+	ret = of_property_read_u32(np, "extcon-gpio,debounce", &pval);
+	if (!ret)
+		pdata->debounce = pval;
+
+	pdata->gpio_active_low = of_property_read_bool(np,
+				"extcon-gpio,connection-state-low");
+
+	pdata->extcon_cable_cnt = of_property_count_u32_elems(np,
+						"extcon-gpio,cable-names");
+	if (pdata->extcon_cable_cnt <= 0) {
+		dev_err(&pdev->dev, "not found out cable names\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	pdata->extcon_cable_names = devm_kzalloc(&pdev->dev,
+			(pdata->extcon_cable_cnt) *
+			sizeof(*pdata->extcon_cable_names), GFP_KERNEL);
+	if (!pdata->extcon_cable_names)
+		return ERR_PTR(-ENOMEM);
+
+	ret = of_property_read_u32_array(np, "extcon-gpio,cable-names",
+			pdata->extcon_cable_names, pdata->extcon_cable_cnt);
+	if (ret)
+		return ERR_PTR(-EINVAL);
+
+	return pdata;
+}
+
 static int gpio_extcon_probe(struct platform_device *pdev)
 {
 	struct gpio_extcon_pdata *pdata = dev_get_platdata(&pdev->dev);
 	struct gpio_extcon_data *data;
 	int ret;
 
-	if (!pdata)
-		return -EBUSY;
-	if (!pdata->irq_flags || pdata->extcon_id > EXTCON_NONE)
-		return -EINVAL;
-
 	data = devm_kzalloc(&pdev->dev, sizeof(struct gpio_extcon_data),
 				   GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+
+	if (!pdata && pdev->dev.of_node)
+		pdata = gpio_extcon_of_pdata(pdev);
+
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	if (!pdata->irq_flags || !pdata->extcon_cable_names)
+		return -EINVAL;
+
 	data->pdata = pdata;
 
 	/* Initialize the gpio */
@@ -113,7 +173,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Allocate the memory of extcon devie and register extcon device */
-	data->edev = devm_extcon_dev_allocate(&pdev->dev, &pdata->extcon_id);
+	data->edev = devm_extcon_dev_allocate(&pdev->dev,
+				pdata->extcon_cable_names);
 	if (IS_ERR(data->edev)) {
 		dev_err(&pdev->dev, "failed to allocate extcon device\n");
 		return -ENOMEM;
@@ -167,12 +228,19 @@ static int gpio_extcon_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(gpio_extcon_pm_ops, NULL, gpio_extcon_resume);
 
+static const struct of_device_id of_extcon_gpio_tbl[] = {
+	{ .compatible = "extcon-gpio", },
+	{ /* end */ }
+};
+MODULE_DEVICE_TABLE(of, of_extcon_gpio_tbl);
+
 static struct platform_driver gpio_extcon_driver = {
 	.probe		= gpio_extcon_probe,
 	.remove		= gpio_extcon_remove,
 	.driver		= {
 		.name	= "extcon-gpio",
 		.pm	= &gpio_extcon_pm_ops,
+		.of_match_table = of_extcon_gpio_tbl,
 	},
 };
 
diff --git a/include/linux/extcon/extcon-gpio.h b/include/linux/extcon/extcon-gpio.h
index 7cacafb..c27df9b 100644
--- a/include/linux/extcon/extcon-gpio.h
+++ b/include/linux/extcon/extcon-gpio.h
@@ -36,6 +36,8 @@
  */
 struct gpio_extcon_pdata {
 	unsigned int extcon_id;
+	unsigned int *extcon_cable_names;
+	int extcon_cable_cnt;
 	unsigned gpio;
 	bool gpio_active_low;
 	unsigned long debounce;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
