From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 2/6] regulator: of: Add enable GPIO configuration function
Date: Wed, 22 Jun 2016 17:25:54 +0900
Message-ID: <20160622082558.20935-3-acourbot@nvidia.com>
References: <20160622082558.20935-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160622082558.20935-1-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

Several regulator drivers are using an enable GPIO with similar DT
properties, yet each driver is parsing these properties its own way. Add
the of_get_regulator_gpio_config() function which is able to parse all
known properties and update the regulator_config accordingly.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/regulator/of_regulator.c       | 52 ++++++++++++++++++++++++++++++++++
 include/linux/regulator/of_regulator.h | 14 +++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index cd828dbf9d52..f1cff511320b 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/of_regulator.h>
@@ -350,3 +351,54 @@ struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 
 	return init_data;
 }
+
+int of_get_regulator_gpio_config(struct device *dev, struct device_node *np,
+				 const char *prop,
+				 struct regulator_config *cfg)
+{
+	enum of_gpio_flags flags;
+	bool active_high;
+	int ena_gpio;
+
+	/* Do we have an enable GPIO property? */
+	ena_gpio = of_get_named_gpio_flags(np, prop, 0, &flags);
+	if (!gpio_is_valid(ena_gpio)) {
+		/* No enable GPIO defined, nothing to do */
+		if (ena_gpio == -ENOENT)
+			return 0;
+
+		if (ena_gpio != -EPROBE_DEFER)
+			dev_err(dev, "error getting enable GPIO: %d\n",
+				ena_gpio);
+		return ena_gpio;
+	}
+
+	cfg->ena_gpio_initialized = true;
+	cfg->ena_gpio = ena_gpio;
+
+	/* Is GPIO active-low? */
+	active_high = of_property_read_bool(np, "enable-active-high");
+	cfg->ena_gpio_invert = of_property_read_bool(np, "enable-active-high") ?
+				false : !!(flags & OF_GPIO_ACTIVE_LOW);
+
+	/* Should GPIO be set? */
+	if (of_property_read_bool(np, "regulator-boot-on") ||
+	    of_property_read_bool(np, "regulator-always-on") ||
+	    of_property_read_bool(np, "enable-at-boot")) {
+		if (cfg->ena_gpio_invert)
+			cfg->ena_gpio_flags |= GPIOF_OUT_INIT_LOW;
+		else
+			cfg->ena_gpio_flags |= GPIOF_OUT_INIT_HIGH;
+	} else {
+		if (cfg->ena_gpio_invert)
+			cfg->ena_gpio_flags |= GPIOF_OUT_INIT_HIGH;
+		else
+			cfg->ena_gpio_flags |= GPIOF_OUT_INIT_LOW;
+	}
+
+	if (of_property_read_bool(np, "gpio_open_drain"))
+		cfg->ena_gpio_flags |= GPIOF_OPEN_DRAIN;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_get_regulator_gpio_config);
diff --git a/include/linux/regulator/of_regulator.h b/include/linux/regulator/of_regulator.h
index 763953f7e3b8..eb4f1b6a26ba 100644
--- a/include/linux/regulator/of_regulator.h
+++ b/include/linux/regulator/of_regulator.h
@@ -7,6 +7,7 @@
 #define __LINUX_OF_REG_H
 
 struct regulator_desc;
+struct regulator_config;
 
 struct of_regulator_match {
 	const char *name;
@@ -24,6 +25,10 @@ extern struct regulator_init_data
 extern int of_regulator_match(struct device *dev, struct device_node *node,
 			      struct of_regulator_match *matches,
 			      unsigned int num_matches);
+extern int of_get_regulator_gpio_config(struct device *dev,
+					struct device_node *node,
+					const char *prop,
+					struct regulator_config *config);
 #else
 static inline struct regulator_init_data
 	*of_get_regulator_init_data(struct device *dev,
@@ -40,6 +45,15 @@ static inline int of_regulator_match(struct device *dev,
 {
 	return 0;
 }
+
+static inline int of_get_regulator_gpio_config(struct device *dev,
+					       struct device_node *node,
+					       const char *prop,
+					       struct regulator_config *config)
+{
+	return 0;
+}
+
 #endif /* CONFIG_OF */
 
 #endif /* __LINUX_OF_REG_H */
-- 
2.8.3
