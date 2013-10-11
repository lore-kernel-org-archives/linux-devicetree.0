From: Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
Subject: [PATCH] gpio: add export with name from dts
Date: Fri, 11 Oct 2013 13:03:40 +0200
Message-ID: <1381489420-12578-1-git-send-email-jiri.prchal@aksignal.cz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add export possibility to sysfs with given name in device tree.
Rebased from older unapplyed patch: [PATCH] owrt: GPIO: add gpio_export_with_name.

Signed-off-by: Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
---
 Documentation/devicetree/bindings/gpio/gpio.txt |   61 +++++++++++++++++++++++
 drivers/gpio/gpiolib-of.c                       |   61 +++++++++++++++++++++++
 drivers/gpio/gpiolib.c                          |   27 ++++++----
 include/asm-generic/gpio.h                      |    6 ++-
 include/linux/gpio.h                            |   23 ++++++++-
 5 files changed, 166 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 6cec6ff..03c4ef5 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -117,3 +117,64 @@ Example:
 Here, a single GPIO controller has GPIOs 0..9 routed to pin controller
 pinctrl1's pins 20..29, and GPIOs 10..19 routed to pin controller pinctrl2's
 pins 50..59.
+
+
+3) gpio-export
+--------------
+
+gpio-export will allow you to automatically export gpio
+
+required properties:
+- compatible: Should be "gpio-export"
+
+in each child node will reprensent a gpio or if no name is specified
+a list of gpio to export
+
+required properties:
+- gpios: gpio to export
+
+optional properties:
+ - gpio-export,name: export name
+ - gpio-export,output: to set the as output with default value
+ 		       if no present gpio as input
+ - pio-export,direction_may_change: boolean to allow the direction to be controllable
+
+Example:
+
+
+gpio_export {
+	compatible = "gpio-export";
+	#size-cells = <0>;
+
+	in {
+		gpio-export,name = "in";
+		gpios = <&pioC 20 0>;
+	};
+
+	out {
+		gpio-export,name = "out";
+		gpio-export,output = <1>;
+		gpio-export,direction_may_change;
+		gpios = <&pioC 21 0>;
+	};
+
+	in_out {
+		gpio-export,name = "in_out";
+		gpio-export,direction_may_change;
+		gpios = <&pioC 21 0>;
+	};
+
+	gpios_in {
+		gpios = <&pioB 0 0
+			 &pioB 3 0
+			 &pioC 4 0>;
+		gpio-export,direction_may_change;
+	};
+
+	gpios_out {
+		gpios = <&pioB 1 0
+			 &pioB 2 0
+			 &pioC 3 0>;
+		gpio-export,output = <1>;
+	};
+};
\ No newline at end of file
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 0dfaf20..1a43d8b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -21,6 +21,8 @@
 #include <linux/of_gpio.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
 
 /* Private data structure for of_gpiochip_find_and_xlate */
 struct gg_data {
@@ -243,3 +245,62 @@ void of_gpiochip_remove(struct gpio_chip *chip)
 	if (chip->of_node)
 		of_node_put(chip->of_node);
 }
+
+static struct of_device_id gpio_export_ids[] = {
+	{ .compatible = "gpio-export" },
+	{ /* sentinel */ }
+};
+
+static int __init of_gpio_export_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *cnp;
+	u32 val;
+	int nb = 0;
+
+	for_each_child_of_node(np, cnp) {
+		const char *name = NULL;
+		int gpio;
+		bool dmc;
+		int max_gpio = 1;
+		int i;
+
+		of_property_read_string(cnp, "gpio-export,name", &name);
+
+		if (!name)
+			max_gpio = of_gpio_count(cnp);
+
+		for (i = 0; i < max_gpio; i++) {
+			gpio = of_get_gpio(cnp, i);
+			if (devm_gpio_request(&pdev->dev, gpio, name ? name : of_node_full_name(np)))
+				continue;
+
+			if (!of_property_read_u32(cnp, "gpio-export,output", &val))
+				gpio_direction_output(gpio, val);
+			else
+				gpio_direction_input(gpio);
+
+			dmc = of_property_read_bool(np, "gpio-export,direction_may_change");
+			gpio_export_with_name(gpio, dmc, name);
+			nb++;
+		}
+	}
+
+	dev_info(&pdev->dev, "%d gpio(s) exported\n", nb);
+
+	return 0;
+}
+
+static struct platform_driver gpio_export_driver = {
+	.driver		= {
+		.name		= "gpio-export",
+		.owner	= THIS_MODULE,
+		.of_match_table	= of_match_ptr(gpio_export_ids),
+	},
+};
+
+static int __init of_gpio_export_init(void)
+{
+	return platform_driver_probe(&gpio_export_driver, of_gpio_export_probe);
+}
+device_initcall(of_gpio_export_init);
\ No newline at end of file
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 86ef346..c7494d1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -96,7 +96,8 @@ static int gpiod_get_value(const struct gpio_desc *desc);
 static void gpiod_set_value(struct gpio_desc *desc, int value);
 static int gpiod_cansleep(const struct gpio_desc *desc);
 static int gpiod_to_irq(const struct gpio_desc *desc);
-static int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
+static int gpiod_export_with_name(struct gpio_desc *desc,
+				  bool direction_may_change, const char *name);
 static int gpiod_export_link(struct device *dev, const char *name,
 			     struct gpio_desc *desc);
 static int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int value);
@@ -674,7 +675,7 @@ static ssize_t export_store(struct class *class,
 			status = -ENODEV;
 		goto done;
 	}
-	status = gpiod_export(desc, true);
+	status = gpiod_export_with_name(desc, true, NULL);
 	if (status < 0)
 		gpiod_free(desc);
 	else
@@ -736,9 +737,10 @@ static struct class gpio_class = {
 
 
 /**
- * gpio_export - export a GPIO through sysfs
+ * gpiod_export_with_name - export a GPIO through sysfs
  * @gpio: gpio to make available, already requested
  * @direction_may_change: true if userspace may change gpio direction
+ * @name: gpio name
  * Context: arch_initcall or later
  *
  * When drivers want to make a GPIO accessible to userspace after they
@@ -750,7 +752,8 @@ static struct class gpio_class = {
  *
  * Returns zero on success, else an error.
  */
-static int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
+int gpiod_export_with_name(struct gpio_desc *desc, bool direction_may_change,
+			  const char *name)
 {
 	unsigned long		flags;
 	int			status;
@@ -788,7 +791,9 @@ static int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	offset = gpio_chip_hwgpio(desc);
-	if (desc->chip->names && desc->chip->names[offset])
+	if (name)
+		ioname = name;
+	else if (desc->chip->names && desc->chip->names[offset])
 		ioname = desc->chip->names[offset];
 
 	dev = device_create(&gpio_class, desc->chip->dev, MKDEV(0, 0),
@@ -829,11 +834,13 @@ fail_unlock:
 	return status;
 }
 
-int gpio_export(unsigned gpio, bool direction_may_change)
+int gpio_export_with_name(unsigned gpio, bool direction_may_change,
+			  const char *name)
 {
-	return gpiod_export(gpio_to_desc(gpio), direction_may_change);
+	return gpiod_export_with_name(gpio_to_desc(gpio), direction_may_change,
+				      name);
 }
-EXPORT_SYMBOL_GPL(gpio_export);
+EXPORT_SYMBOL_GPL(gpio_export_with_name);
 
 static int match_export(struct device *dev, const void *data)
 {
@@ -1531,7 +1538,9 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 		goto free_gpio;
 
 	if (flags & GPIOF_EXPORT) {
-		err = gpiod_export(desc, flags & GPIOF_EXPORT_CHANGEABLE);
+		err = gpiod_export_with_name(desc,
+					     flags & GPIOF_EXPORT_CHANGEABLE,
+					     NULL);
 		if (err)
 			goto free_gpio;
 	}
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index bde6469..d0970e3 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -202,7 +202,8 @@ extern void gpio_free_array(const struct gpio *array, size_t num);
  * A sysfs interface can be exported by individual drivers if they want,
  * but more typically is configured entirely from userspace.
  */
-extern int gpio_export(unsigned gpio, bool direction_may_change);
+extern int gpio_export_with_name(unsigned gpio, bool direction_may_change,
+				 const char *name);
 extern int gpio_export_link(struct device *dev, const char *name,
 			unsigned gpio);
 extern int gpio_sysfs_set_active_low(unsigned gpio, int value);
@@ -284,7 +285,8 @@ struct device;
 
 /* sysfs support is only available with gpiolib, where it's optional */
 
-static inline int gpio_export(unsigned gpio, bool direction_may_change)
+static inline int gpio_export_with_name(unsigned gpio, bool direction_may_change,
+					const char *name)
 {
 	return -ENOSYS;
 }
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 552e3f4..12a6cd2 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -169,7 +169,8 @@ static inline void gpio_set_value_cansleep(unsigned gpio, int value)
 	WARN_ON(1);
 }
 
-static inline int gpio_export(unsigned gpio, bool direction_may_change)
+static inline int gpio_export_with_name(unsigned gpio, bool direction_may_change,
+					const char *name)
 {
 	/* GPIO can never have been requested or set as {in,out}put */
 	WARN_ON(1);
@@ -236,4 +237,24 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
 			  unsigned long flags, const char *label);
 void devm_gpio_free(struct device *dev, unsigned int gpio);
 
+/**
+ * gpio_export - export a GPIO through sysfs
+ * @gpio: gpio to make available, already requested
+ * @direction_may_change: true if userspace may change gpio direction
+ * Context: arch_initcall or later
+ *
+ * When drivers want to make a GPIO accessible to userspace after they
+ * have requested it -- perhaps while debugging, or as part of their
+ * public interface -- they may use this routine.  If the GPIO can
+ * change direction (some can't) and the caller allows it, userspace
+ * will see "direction" sysfs attribute which may be used to change
+ * the gpio's direction.  A "value" attribute will always be provided.
+ *
+ * Returns zero on success, else an error.
+ */
+static inline int gpio_export(unsigned gpio,bool direction_may_change)
+{
+	return gpio_export_with_name(gpio, direction_may_change, NULL);
+}
+
 #endif /* __LINUX_GPIO_H */
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
