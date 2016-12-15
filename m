From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [RESEND PATCHv3 2/2] regulator: fixed: Handle optional overcurrent pin
Date: Thu, 15 Dec 2016 12:28:56 +0100
Message-ID: <20161215112856.9541-3-ahaslam@baylibre.com>
References: <20161215112856.9541-1-ahaslam@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161215112856.9541-1-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fixed regulators (ex. TPS2087D) may have a over current pin that
is activated on over current. Consumers may be interested to know
about over current events to take appropriate actions.

Allow the fix regulator to take in an optional gpio pin for over
current and send the respective event to the consumer.

Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 drivers/regulator/fixed.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index a43b0e8..06ed2f6 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -33,10 +33,12 @@
 #include <linux/acpi.h>
 #include <linux/property.h>
 #include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
 
 struct fixed_voltage_data {
 	struct regulator_desc desc;
 	struct regulator_dev *dev;
+	struct gpio_desc *oc_gpio;
 };
 
 
@@ -135,7 +137,36 @@ acpi_get_fixed_voltage_config(struct device *dev,
 	return config;
 }
 
+static irqreturn_t reg_fixed_overcurrent_irq(int irq, void *data)
+{
+	struct fixed_voltage_data *drvdata = data;
+
+	regulator_notifier_call_chain(drvdata->dev,
+				REGULATOR_EVENT_OVER_CURRENT, NULL);
+
+	return IRQ_HANDLED;
+}
+
+static int reg_fixed_get_error_flags(struct regulator_dev *dev,
+					unsigned int *flags)
+{
+	struct fixed_voltage_data *drvdata = rdev_get_drvdata(dev);
+	int oc_value;
+
+	*flags = 0;
+
+	if (!drvdata->oc_gpio)
+		return 0;
+
+	oc_value = gpiod_get_value_cansleep(drvdata->oc_gpio);
+	if (oc_value)
+		*flags = REGULATOR_ERROR_OVER_CURRENT;
+
+	return 0;
+}
+
 static struct regulator_ops fixed_voltage_ops = {
+	.get_error_flags = reg_fixed_get_error_flags,
 };
 
 static int reg_fixed_voltage_probe(struct platform_device *pdev)
@@ -143,6 +174,7 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 	struct fixed_voltage_config *config;
 	struct fixed_voltage_data *drvdata;
 	struct regulator_config cfg = { };
+	unsigned long irqflags = IRQF_ONESHOT;
 	int ret;
 
 	drvdata = devm_kzalloc(&pdev->dev, sizeof(struct fixed_voltage_data),
@@ -221,6 +253,33 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 	cfg.driver_data = drvdata;
 	cfg.of_node = pdev->dev.of_node;
 
+
+	drvdata->oc_gpio = devm_gpiod_get_optional(&pdev->dev, "over-current",
+						GPIOF_DIR_IN);
+	if (IS_ERR(drvdata->oc_gpio)) {
+		ret = PTR_ERR(drvdata->oc_gpio);
+		dev_err(&pdev->dev,
+			"Failed to get over current gpio: %d\n", ret);
+		return ret;
+	}
+
+	if (drvdata->oc_gpio) {
+		if (gpiod_is_active_low(drvdata->oc_gpio))
+			irqflags |= IRQF_TRIGGER_FALLING;
+		else
+			irqflags |= IRQF_TRIGGER_RISING;
+
+		ret = devm_request_threaded_irq(&pdev->dev,
+				gpiod_to_irq(drvdata->oc_gpio), NULL,
+				reg_fixed_overcurrent_irq, irqflags,
+				"over_current", drvdata);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to request irq: %d\n", ret);
+			return ret;
+		}
+	}
+
 	drvdata->dev = devm_regulator_register(&pdev->dev, &drvdata->desc,
 					       &cfg);
 	if (IS_ERR(drvdata->dev)) {
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
