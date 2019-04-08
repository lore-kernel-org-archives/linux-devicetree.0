Return-Path: <SRS0=Lg6y=SK=analog.com=Michael.Hennerich@kernel.org>
From: <michael.hennerich@analog.com>
Subject: [PATCH v2 2/2] power: supply: ltc3651-charger: Fix device name (rename files)
Date: Mon, 8 Apr 2019 13:17:20 +0200
Message-ID: <1554722240-22183-2-git-send-email-michael.hennerich@analog.com>
In-Reply-To: <1554722240-22183-1-git-send-email-michael.hennerich@analog.com>
References: <1554722240-22183-1-git-send-email-michael.hennerich@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
To: mike.looijmans@topic.nl, sre@kernel.org, robh+dt@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, robin.getz@analog.com, Michael Hennerich <michael.hennerich@analog.com>
List-ID: <devicetree@vger.kernel.org>

From: Michael Hennerich <michael.hennerich@analog.com>

rename only - no functional changes

Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
---
 .../bindings/power/supply/lt3651-charger.txt       |  29 +++
 .../bindings/power/supply/ltc3651-charger.txt      |  29 ---
 drivers/power/supply/Makefile                      |   2 +-
 drivers/power/supply/lt3651-charger.c              | 207 +++++++++++++++++++++
 drivers/power/supply/ltc3651-charger.c             | 207 ---------------------
 5 files changed, 237 insertions(+), 237 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/supply/lt3651-charger.txt
 delete mode 100644 Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
 create mode 100644 drivers/power/supply/lt3651-charger.c
 delete mode 100644 drivers/power/supply/ltc3651-charger.c

diff --git a/Documentation/devicetree/bindings/power/supply/lt3651-charger.txt b/Documentation/devicetree/bindings/power/supply/lt3651-charger.txt
new file mode 100644
index 0000000..40811ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/lt3651-charger.txt
@@ -0,0 +1,29 @@
+Analog Devices LT3651 Charger Power Supply bindings: lt3651-charger
+
+Required properties:
+- compatible: Should contain one of the following:
+ * "lltc,ltc3651-charger", (DEPRECATED: Use "lltc,lt3651-charger")
+ * "lltc,lt3651-charger"
+ - lltc,acpr-gpios: Connect to ACPR output. See remark below.
+
+Optional properties:
+ - lltc,fault-gpios: Connect to FAULT output. See remark below.
+ - lltc,chrg-gpios: Connect to CHRG output. See remark below.
+
+The lt3651 outputs are open-drain type and active low. The driver assumes the
+GPIO reports "active" when the output is asserted, so if the pins have been
+connected directly, the GPIO flags should be set to active low also.
+
+The driver will attempt to aquire interrupts for all GPIOs to detect changes in
+line state. If the system is not capabale of providing interrupts, the driver
+cannot report changes and userspace will need to periodically read the sysfs
+attributes to detect changes.
+
+Example:
+
+	charger: battery-charger {
+		compatible = "lltc,lt3651-charger";
+		lltc,acpr-gpios = <&gpio0 68 GPIO_ACTIVE_LOW>;
+		lltc,fault-gpios = <&gpio0 64 GPIO_ACTIVE_LOW>;
+		lltc,chrg-gpios = <&gpio0 63 GPIO_ACTIVE_LOW>;
+	};
diff --git a/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt b/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
deleted file mode 100644
index 40811ff..0000000
--- a/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Analog Devices LT3651 Charger Power Supply bindings: lt3651-charger
-
-Required properties:
-- compatible: Should contain one of the following:
- * "lltc,ltc3651-charger", (DEPRECATED: Use "lltc,lt3651-charger")
- * "lltc,lt3651-charger"
- - lltc,acpr-gpios: Connect to ACPR output. See remark below.
-
-Optional properties:
- - lltc,fault-gpios: Connect to FAULT output. See remark below.
- - lltc,chrg-gpios: Connect to CHRG output. See remark below.
-
-The lt3651 outputs are open-drain type and active low. The driver assumes the
-GPIO reports "active" when the output is asserted, so if the pins have been
-connected directly, the GPIO flags should be set to active low also.
-
-The driver will attempt to aquire interrupts for all GPIOs to detect changes in
-line state. If the system is not capabale of providing interrupts, the driver
-cannot report changes and userspace will need to periodically read the sysfs
-attributes to detect changes.
-
-Example:
-
-	charger: battery-charger {
-		compatible = "lltc,lt3651-charger";
-		lltc,acpr-gpios = <&gpio0 68 GPIO_ACTIVE_LOW>;
-		lltc,fault-gpios = <&gpio0 64 GPIO_ACTIVE_LOW>;
-		lltc,chrg-gpios = <&gpio0 63 GPIO_ACTIVE_LOW>;
-	};
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 714c602..a2b3ab1 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -67,7 +67,7 @@ obj-$(CONFIG_CHARGER_LP8727)	+= lp8727_charger.o
 obj-$(CONFIG_CHARGER_LP8788)	+= lp8788-charger.o
 obj-$(CONFIG_CHARGER_GPIO)	+= gpio-charger.o
 obj-$(CONFIG_CHARGER_MANAGER)	+= charger-manager.o
-obj-$(CONFIG_CHARGER_LT3651)	+= ltc3651-charger.o
+obj-$(CONFIG_CHARGER_LT3651)	+= lt3651-charger.o
 obj-$(CONFIG_CHARGER_MAX14577)	+= max14577_charger.o
 obj-$(CONFIG_CHARGER_DETECTOR_MAX14656)	+= max14656_charger_detector.o
 obj-$(CONFIG_CHARGER_MAX77693)	+= max77693_charger.o
diff --git a/drivers/power/supply/lt3651-charger.c b/drivers/power/supply/lt3651-charger.c
new file mode 100644
index 0000000..8de500f
--- /dev/null
+++ b/drivers/power/supply/lt3651-charger.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  Driver for Analog Devices (Linear Technology) LT3651 charger IC.
+ *  Copyright (C) 2017, Topic Embedded Products
+ */
+
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+
+struct lt3651_charger {
+	struct power_supply *charger;
+	struct power_supply_desc charger_desc;
+	struct gpio_desc *acpr_gpio;
+	struct gpio_desc *fault_gpio;
+	struct gpio_desc *chrg_gpio;
+};
+
+static irqreturn_t lt3651_charger_irq(int irq, void *devid)
+{
+	struct power_supply *charger = devid;
+
+	power_supply_changed(charger);
+
+	return IRQ_HANDLED;
+}
+
+static inline struct lt3651_charger *psy_to_lt3651_charger(
+	struct power_supply *psy)
+{
+	return power_supply_get_drvdata(psy);
+}
+
+static int lt3651_charger_get_property(struct power_supply *psy,
+		enum power_supply_property psp, union power_supply_propval *val)
+{
+	struct lt3651_charger *lt3651_charger = psy_to_lt3651_charger(psy);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		if (!lt3651_charger->chrg_gpio) {
+			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
+			break;
+		}
+		if (gpiod_get_value(lt3651_charger->chrg_gpio))
+			val->intval = POWER_SUPPLY_STATUS_CHARGING;
+		else
+			val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
+	case POWER_SUPPLY_PROP_ONLINE:
+		val->intval = gpiod_get_value(lt3651_charger->acpr_gpio);
+		break;
+	case POWER_SUPPLY_PROP_HEALTH:
+		if (!lt3651_charger->fault_gpio) {
+			val->intval = POWER_SUPPLY_HEALTH_UNKNOWN;
+			break;
+		}
+		if (!gpiod_get_value(lt3651_charger->fault_gpio)) {
+			val->intval = POWER_SUPPLY_HEALTH_GOOD;
+			break;
+		}
+		/*
+		 * If the fault pin is active, the chrg pin explains the type
+		 * of failure.
+		 */
+		if (!lt3651_charger->chrg_gpio) {
+			val->intval = POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
+			break;
+		}
+		val->intval = gpiod_get_value(lt3651_charger->chrg_gpio) ?
+				POWER_SUPPLY_HEALTH_OVERHEAT :
+				POWER_SUPPLY_HEALTH_DEAD;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static enum power_supply_property lt3651_charger_properties[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_HEALTH,
+};
+
+static int lt3651_charger_probe(struct platform_device *pdev)
+{
+	struct power_supply_config psy_cfg = {};
+	struct lt3651_charger *lt3651_charger;
+	struct power_supply_desc *charger_desc;
+	int ret;
+
+	lt3651_charger = devm_kzalloc(&pdev->dev, sizeof(*lt3651_charger),
+					GFP_KERNEL);
+	if (!lt3651_charger)
+		return -ENOMEM;
+
+	lt3651_charger->acpr_gpio = devm_gpiod_get(&pdev->dev,
+					"lltc,acpr", GPIOD_IN);
+	if (IS_ERR(lt3651_charger->acpr_gpio)) {
+		ret = PTR_ERR(lt3651_charger->acpr_gpio);
+		dev_err(&pdev->dev, "Failed to acquire acpr GPIO: %d\n", ret);
+		return ret;
+	}
+	lt3651_charger->fault_gpio = devm_gpiod_get_optional(&pdev->dev,
+					"lltc,fault", GPIOD_IN);
+	if (IS_ERR(lt3651_charger->fault_gpio)) {
+		ret = PTR_ERR(lt3651_charger->fault_gpio);
+		dev_err(&pdev->dev, "Failed to acquire fault GPIO: %d\n", ret);
+		return ret;
+	}
+	lt3651_charger->chrg_gpio = devm_gpiod_get_optional(&pdev->dev,
+					"lltc,chrg", GPIOD_IN);
+	if (IS_ERR(lt3651_charger->chrg_gpio)) {
+		ret = PTR_ERR(lt3651_charger->chrg_gpio);
+		dev_err(&pdev->dev, "Failed to acquire chrg GPIO: %d\n", ret);
+		return ret;
+	}
+
+	charger_desc = &lt3651_charger->charger_desc;
+	charger_desc->name = pdev->dev.of_node->name;
+	charger_desc->type = POWER_SUPPLY_TYPE_MAINS;
+	charger_desc->properties = lt3651_charger_properties;
+	charger_desc->num_properties = ARRAY_SIZE(lt3651_charger_properties);
+	charger_desc->get_property = lt3651_charger_get_property;
+	psy_cfg.of_node = pdev->dev.of_node;
+	psy_cfg.drv_data = lt3651_charger;
+
+	lt3651_charger->charger = devm_power_supply_register(&pdev->dev,
+						      charger_desc, &psy_cfg);
+	if (IS_ERR(lt3651_charger->charger)) {
+		ret = PTR_ERR(lt3651_charger->charger);
+		dev_err(&pdev->dev, "Failed to register power supply: %d\n",
+			ret);
+		return ret;
+	}
+
+	/*
+	 * Acquire IRQs for the GPIO pins if possible. If the system does not
+	 * support IRQs on these pins, userspace will have to poll the sysfs
+	 * files manually.
+	 */
+	if (lt3651_charger->acpr_gpio) {
+		ret = gpiod_to_irq(lt3651_charger->acpr_gpio);
+		if (ret >= 0)
+			ret = devm_request_any_context_irq(&pdev->dev, ret,
+				lt3651_charger_irq,
+				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+				dev_name(&pdev->dev), lt3651_charger->charger);
+		if (ret < 0)
+			dev_warn(&pdev->dev, "Failed to request acpr irq\n");
+	}
+	if (lt3651_charger->fault_gpio) {
+		ret = gpiod_to_irq(lt3651_charger->fault_gpio);
+		if (ret >= 0)
+			ret = devm_request_any_context_irq(&pdev->dev, ret,
+				lt3651_charger_irq,
+				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+				dev_name(&pdev->dev), lt3651_charger->charger);
+		if (ret < 0)
+			dev_warn(&pdev->dev, "Failed to request fault irq\n");
+	}
+	if (lt3651_charger->chrg_gpio) {
+		ret = gpiod_to_irq(lt3651_charger->chrg_gpio);
+		if (ret >= 0)
+			ret = devm_request_any_context_irq(&pdev->dev, ret,
+				lt3651_charger_irq,
+				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+				dev_name(&pdev->dev), lt3651_charger->charger);
+		if (ret < 0)
+			dev_warn(&pdev->dev, "Failed to request chrg irq\n");
+	}
+
+	platform_set_drvdata(pdev, lt3651_charger);
+
+	return 0;
+}
+
+static const struct of_device_id lt3651_charger_match[] = {
+	{ .compatible = "lltc,ltc3651-charger" }, /* DEPRECATED */
+	{ .compatible = "lltc,lt3651-charger" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lt3651_charger_match);
+
+static struct platform_driver lt3651_charger_driver = {
+	.probe = lt3651_charger_probe,
+	.driver = {
+		.name = "lt3651-charger",
+		.of_match_table = lt3651_charger_match,
+	},
+};
+
+module_platform_driver(lt3651_charger_driver);
+
+MODULE_AUTHOR("Mike Looijmans <mike.looijmans@topic.nl>");
+MODULE_DESCRIPTION("Driver for LT3651 charger");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:lt3651-charger");
diff --git a/drivers/power/supply/ltc3651-charger.c b/drivers/power/supply/ltc3651-charger.c
deleted file mode 100644
index 8de500f..0000000
--- a/drivers/power/supply/ltc3651-charger.c
+++ /dev/null
@@ -1,207 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- *  Driver for Analog Devices (Linear Technology) LT3651 charger IC.
- *  Copyright (C) 2017, Topic Embedded Products
- */
-
-#include <linux/device.h>
-#include <linux/gpio/consumer.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/power_supply.h>
-#include <linux/slab.h>
-#include <linux/of.h>
-
-struct lt3651_charger {
-	struct power_supply *charger;
-	struct power_supply_desc charger_desc;
-	struct gpio_desc *acpr_gpio;
-	struct gpio_desc *fault_gpio;
-	struct gpio_desc *chrg_gpio;
-};
-
-static irqreturn_t lt3651_charger_irq(int irq, void *devid)
-{
-	struct power_supply *charger = devid;
-
-	power_supply_changed(charger);
-
-	return IRQ_HANDLED;
-}
-
-static inline struct lt3651_charger *psy_to_lt3651_charger(
-	struct power_supply *psy)
-{
-	return power_supply_get_drvdata(psy);
-}
-
-static int lt3651_charger_get_property(struct power_supply *psy,
-		enum power_supply_property psp, union power_supply_propval *val)
-{
-	struct lt3651_charger *lt3651_charger = psy_to_lt3651_charger(psy);
-
-	switch (psp) {
-	case POWER_SUPPLY_PROP_STATUS:
-		if (!lt3651_charger->chrg_gpio) {
-			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
-			break;
-		}
-		if (gpiod_get_value(lt3651_charger->chrg_gpio))
-			val->intval = POWER_SUPPLY_STATUS_CHARGING;
-		else
-			val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
-		break;
-	case POWER_SUPPLY_PROP_ONLINE:
-		val->intval = gpiod_get_value(lt3651_charger->acpr_gpio);
-		break;
-	case POWER_SUPPLY_PROP_HEALTH:
-		if (!lt3651_charger->fault_gpio) {
-			val->intval = POWER_SUPPLY_HEALTH_UNKNOWN;
-			break;
-		}
-		if (!gpiod_get_value(lt3651_charger->fault_gpio)) {
-			val->intval = POWER_SUPPLY_HEALTH_GOOD;
-			break;
-		}
-		/*
-		 * If the fault pin is active, the chrg pin explains the type
-		 * of failure.
-		 */
-		if (!lt3651_charger->chrg_gpio) {
-			val->intval = POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
-			break;
-		}
-		val->intval = gpiod_get_value(lt3651_charger->chrg_gpio) ?
-				POWER_SUPPLY_HEALTH_OVERHEAT :
-				POWER_SUPPLY_HEALTH_DEAD;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static enum power_supply_property lt3651_charger_properties[] = {
-	POWER_SUPPLY_PROP_STATUS,
-	POWER_SUPPLY_PROP_ONLINE,
-	POWER_SUPPLY_PROP_HEALTH,
-};
-
-static int lt3651_charger_probe(struct platform_device *pdev)
-{
-	struct power_supply_config psy_cfg = {};
-	struct lt3651_charger *lt3651_charger;
-	struct power_supply_desc *charger_desc;
-	int ret;
-
-	lt3651_charger = devm_kzalloc(&pdev->dev, sizeof(*lt3651_charger),
-					GFP_KERNEL);
-	if (!lt3651_charger)
-		return -ENOMEM;
-
-	lt3651_charger->acpr_gpio = devm_gpiod_get(&pdev->dev,
-					"lltc,acpr", GPIOD_IN);
-	if (IS_ERR(lt3651_charger->acpr_gpio)) {
-		ret = PTR_ERR(lt3651_charger->acpr_gpio);
-		dev_err(&pdev->dev, "Failed to acquire acpr GPIO: %d\n", ret);
-		return ret;
-	}
-	lt3651_charger->fault_gpio = devm_gpiod_get_optional(&pdev->dev,
-					"lltc,fault", GPIOD_IN);
-	if (IS_ERR(lt3651_charger->fault_gpio)) {
-		ret = PTR_ERR(lt3651_charger->fault_gpio);
-		dev_err(&pdev->dev, "Failed to acquire fault GPIO: %d\n", ret);
-		return ret;
-	}
-	lt3651_charger->chrg_gpio = devm_gpiod_get_optional(&pdev->dev,
-					"lltc,chrg", GPIOD_IN);
-	if (IS_ERR(lt3651_charger->chrg_gpio)) {
-		ret = PTR_ERR(lt3651_charger->chrg_gpio);
-		dev_err(&pdev->dev, "Failed to acquire chrg GPIO: %d\n", ret);
-		return ret;
-	}
-
-	charger_desc = &lt3651_charger->charger_desc;
-	charger_desc->name = pdev->dev.of_node->name;
-	charger_desc->type = POWER_SUPPLY_TYPE_MAINS;
-	charger_desc->properties = lt3651_charger_properties;
-	charger_desc->num_properties = ARRAY_SIZE(lt3651_charger_properties);
-	charger_desc->get_property = lt3651_charger_get_property;
-	psy_cfg.of_node = pdev->dev.of_node;
-	psy_cfg.drv_data = lt3651_charger;
-
-	lt3651_charger->charger = devm_power_supply_register(&pdev->dev,
-						      charger_desc, &psy_cfg);
-	if (IS_ERR(lt3651_charger->charger)) {
-		ret = PTR_ERR(lt3651_charger->charger);
-		dev_err(&pdev->dev, "Failed to register power supply: %d\n",
-			ret);
-		return ret;
-	}
-
-	/*
-	 * Acquire IRQs for the GPIO pins if possible. If the system does not
-	 * support IRQs on these pins, userspace will have to poll the sysfs
-	 * files manually.
-	 */
-	if (lt3651_charger->acpr_gpio) {
-		ret = gpiod_to_irq(lt3651_charger->acpr_gpio);
-		if (ret >= 0)
-			ret = devm_request_any_context_irq(&pdev->dev, ret,
-				lt3651_charger_irq,
-				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
-				dev_name(&pdev->dev), lt3651_charger->charger);
-		if (ret < 0)
-			dev_warn(&pdev->dev, "Failed to request acpr irq\n");
-	}
-	if (lt3651_charger->fault_gpio) {
-		ret = gpiod_to_irq(lt3651_charger->fault_gpio);
-		if (ret >= 0)
-			ret = devm_request_any_context_irq(&pdev->dev, ret,
-				lt3651_charger_irq,
-				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
-				dev_name(&pdev->dev), lt3651_charger->charger);
-		if (ret < 0)
-			dev_warn(&pdev->dev, "Failed to request fault irq\n");
-	}
-	if (lt3651_charger->chrg_gpio) {
-		ret = gpiod_to_irq(lt3651_charger->chrg_gpio);
-		if (ret >= 0)
-			ret = devm_request_any_context_irq(&pdev->dev, ret,
-				lt3651_charger_irq,
-				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
-				dev_name(&pdev->dev), lt3651_charger->charger);
-		if (ret < 0)
-			dev_warn(&pdev->dev, "Failed to request chrg irq\n");
-	}
-
-	platform_set_drvdata(pdev, lt3651_charger);
-
-	return 0;
-}
-
-static const struct of_device_id lt3651_charger_match[] = {
-	{ .compatible = "lltc,ltc3651-charger" }, /* DEPRECATED */
-	{ .compatible = "lltc,lt3651-charger" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, lt3651_charger_match);
-
-static struct platform_driver lt3651_charger_driver = {
-	.probe = lt3651_charger_probe,
-	.driver = {
-		.name = "lt3651-charger",
-		.of_match_table = lt3651_charger_match,
-	},
-};
-
-module_platform_driver(lt3651_charger_driver);
-
-MODULE_AUTHOR("Mike Looijmans <mike.looijmans@topic.nl>");
-MODULE_DESCRIPTION("Driver for LT3651 charger");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:lt3651-charger");
-- 
2.7.4
