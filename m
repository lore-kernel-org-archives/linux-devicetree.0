From: Venkat Reddy Talla <vreddytalla@nvidia.com>
Subject: [PATCH v2 1/2] extcon: gpio: add device tree support for extcon-gpio
Date: Wed, 25 May 2016 17:05:32 +0530
Message-ID: <1464176133-10742-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: devicetree@vger.kernel.org

Adding device tree support for extcon-gpio driver.

Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>

---
changes in v2:
- using gpio flag cell to handle gpio active state
- change dts property name gpio to gpios
- removed prefix for debounce
---
---
 drivers/extcon/extcon-gpio.c       | 80 +++++++++++++++++++++++++++++++++++---
 include/linux/extcon/extcon-gpio.h |  4 +-
 2 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index d023789..f29032c 100644
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
@@ -90,21 +92,80 @@ static int gpio_extcon_init(struct device *dev, struct gpio_extcon_data *data)
 	return 0;
 }
 
+static struct gpio_extcon_pdata *gpio_extcon_of_pdata(
+		struct platform_device *pdev)
+{
+	struct gpio_extcon_pdata *pdata;
+	struct device_node *np = pdev->dev.of_node;
+	enum of_gpio_flags flags;
+	int gpio;
+	u32 pval;
+	int ret;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	gpio = of_get_named_gpio_flags(np, "gpios", 0, &flags);
+	if (gpio < 0)
+		return ERR_PTR(gpio);
+
+	pdata->gpio = gpio;
+
+	if (flags & OF_GPIO_ACTIVE_LOW)
+		pdata->gpio_active_low = 1;
+
+	ret = of_property_read_u32(np, "extcon-gpio,irq-flags", &pval);
+	if (!ret)
+		pdata->irq_flags = pval;
+	else
+		pdata->irq_flags = IRQF_TRIGGER_RISING |
+					IRQF_TRIGGER_FALLING;
+
+	ret = of_property_read_u32(np, "debounce-ms", &pval);
+	if (!ret)
+		pdata->debounce = pval;
+
+	pdata->extcon_cable_cnt = of_property_count_u32_elems(np,
+					"extcon-gpio,cable-names");
+	if (pdata->extcon_cable_cnt <= 0) {
+		dev_err(&pdev->dev, "not found out cable names\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	pdata->extcon_id = devm_kzalloc(&pdev->dev,
+			(pdata->extcon_cable_cnt) *
+			sizeof(*pdata->extcon_id), GFP_KERNEL);
+	if (!pdata->extcon_id)
+		return ERR_PTR(-ENOMEM);
+
+	ret = of_property_read_u32_array(np, "extcon-gpio,cable-names",
+			pdata->extcon_id, pdata->extcon_cable_cnt);
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
+	if (!pdata->irq_flags || !pdata->extcon_id)
+		return -EINVAL;
+
 	data->pdata = pdata;
 
 	/* Initialize the gpio */
@@ -113,7 +174,7 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Allocate the memory of extcon devie and register extcon device */
-	data->edev = devm_extcon_dev_allocate(&pdev->dev, &pdata->extcon_id);
+	data->edev = devm_extcon_dev_allocate(&pdev->dev, pdata->extcon_id);
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
index 7cacafb..1914894 100644
--- a/include/linux/extcon/extcon-gpio.h
+++ b/include/linux/extcon/extcon-gpio.h
@@ -31,15 +31,17 @@
  *			If false, high state of gpio means active.
  * @debounce:		Debounce time for GPIO IRQ in ms.
  * @irq_flags:		IRQ Flags (e.g., IRQF_TRIGGER_LOW).
+ * extcon_cable_cnt:    External cable count.
  * @check_on_resume:	Boolean describing whether to check the state of gpio
  *			while resuming from sleep.
  */
 struct gpio_extcon_pdata {
-	unsigned int extcon_id;
+	unsigned int *extcon_id;
 	unsigned gpio;
 	bool gpio_active_low;
 	unsigned long debounce;
 	unsigned long irq_flags;
+	int extcon_cable_cnt;
 
 	bool check_on_resume;
 };
-- 
2.1.4
