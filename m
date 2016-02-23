From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 4/4] gpio: Add parsing of DT GPIO line-names
Date: Tue, 23 Feb 2016 08:54:49 +0100
Message-ID: <1456214089-13954-4-git-send-email-mpa@pengutronix.de>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Markus Pargmann <mpa@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This patch reuses the DT bindings that are already in place for the
gpio-hogging mechanism. These bindings define line-name properties for
GPIOs inside the gpio-chip device node.

of_parse_own_gpio() now sets the gpio descriptor name using the newly
introduced gpiod_set_name(). It checks for name collisions within a GPIO
chip to avoid GPIOs with the same name that are exported over the same
GPIO character device.

The GPIO flags that describe the GPIO state are not required anymore in
general but are checked if the gpio-hog property was found.

This can be used to use the line names from the schematic. Example of lsgpio on
a modified i.MX6s Riotboard:

	GPIO chip: gpiochip0, "209c000.gpio", 32 GPIO lines
		line 0: unnamed unlabeled
		line 1: unnamed unlabeled
		line 2: SD2_WP "wp" [kernel output open-drain]
		line 3: GPIO_3_CLK unlabeled
		line 4: SD2_CD "cd" [kernel output open-drain]
		...

The modified DT:
	 &gpio1 {
		sd2_wp {
			gpios = <2 0>;
			line-name = "SD2_WP";
		};

		gpio_3_clk {
			gpios = <3 0>;
			line-name = "GPIO_3_CLK";
		};

		sd2_cd {
			gpios = <4 0>;
			line-name = "SD2_CD";
		};
	};

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib-of.c | 37 +++++++++++++++++++---------------
 drivers/gpio/gpiolib.c    | 51 +++++++++++++++++++++++++++++++++++++++--------
 drivers/gpio/gpiolib.h    |  5 +++--
 3 files changed, 67 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 42a4bb7cf49a..e206b305ae56 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -121,7 +121,6 @@ EXPORT_SYMBOL(of_get_named_gpio_flags);
 /**
  * of_parse_own_gpio() - Get a GPIO hog descriptor, names and flags for GPIO API
  * @np:		device node to get GPIO from
- * @name:	GPIO line name
  * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
  *		of_parse_own_gpio()
  * @dflags:	gpiod_flags - optional GPIO initialization flags
@@ -130,7 +129,6 @@ EXPORT_SYMBOL(of_get_named_gpio_flags);
  * value on the error condition.
  */
 static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
-					   const char **name,
 					   enum gpio_lookup_flags *lflags,
 					   enum gpiod_flags *dflags)
 {
@@ -141,6 +139,7 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	};
 	u32 tmp;
 	int i, ret;
+	const char *name = NULL;
 
 	chip_np = np->parent;
 	if (!chip_np)
@@ -183,14 +182,15 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 		*dflags |= GPIOD_OUT_LOW;
 	else if (of_property_read_bool(np, "output-high"))
 		*dflags |= GPIOD_OUT_HIGH;
-	else {
-		pr_warn("GPIO line %d (%s): no hogging state specified, bailing out\n",
-			desc_to_gpio(gg_data.out_gpio), np->name);
-		return ERR_PTR(-EINVAL);
-	}
 
-	if (name && of_property_read_string(np, "line-name", name))
-		*name = np->name;
+	if (of_property_read_string(np, "line-name", &name))
+		name = np->name;
+	ret = gpiod_set_name(gg_data.out_gpio, name);
+	if (ret) {
+		pr_err("Failed setting GPIO line name %s for GPIO %d.\n", name,
+		       desc_to_gpio(gg_data.out_gpio));
+		return ERR_PTR(ret);
+	}
 
 	return gg_data.out_gpio;
 }
@@ -206,20 +206,25 @@ static void of_gpiochip_scan_gpios(struct gpio_chip *chip)
 {
 	struct gpio_desc *desc = NULL;
 	struct device_node *np;
-	const char *name;
 	enum gpio_lookup_flags lflags;
 	enum gpiod_flags dflags;
 
 	for_each_child_of_node(chip->of_node, np) {
-		if (!of_property_read_bool(np, "gpio-hog"))
-			continue;
-
-		desc = of_parse_own_gpio(np, &name, &lflags, &dflags);
+		desc = of_parse_own_gpio(np, &lflags, &dflags);
 		if (IS_ERR(desc))
 			continue;
 
-		if (gpiod_hog(desc, name, lflags, dflags))
-			continue;
+		if (of_property_read_bool(np, "gpio-hog")) {
+			if (!dflags) {
+				pr_warn("GPIO line %d (%s): no hogging state specified, bailing out\n",
+					desc_to_gpio(desc),
+					desc->name);
+				continue;
+			}
+			printk("%s:%d  %s lflags %x dflags %x\n", __FILE__, __LINE__, __func__, lflags, dflags);
+			if (gpiod_hog(desc, lflags, dflags))
+				continue;
+		}
 	}
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3580c0de9d5a..0750e6b2868a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -770,6 +770,42 @@ static struct gpio_chip *find_chip_by_name(const char *name)
 	return gpiochip_find((void *)name, gpiochip_match_name);
 }
 
+static struct gpio_desc *gpiodev_find_gpiod_by_name(struct gpio_device *gdev,
+						    const char *name)
+{
+	int i;
+
+	for (i = 0; i != gdev->ngpio; ++i) {
+		struct gpio_desc *desc = &gdev->descs[i];
+
+		if (desc->name && !strcmp(desc->name, name))
+			return desc;
+	}
+
+	return NULL;
+}
+
+/**
+ * gpid_set_name() - sets the name of a gpio descriptor
+ * @desc: the gpio descriptor
+ * @name: the name pointer that is assigned. It is internally not copied.
+ *
+ * This function sets a new name for the GPIO. It checks for collisions with
+ * other GPIOs with the same name within the gpio chip. It returns 0 on success
+ * or -EEXIST if the name is already used within the GPIO chip.
+ */
+int gpiod_set_name(struct gpio_desc *desc, const char *name)
+{
+	struct gpio_desc *coll = gpiodev_find_gpiod_by_name(desc->gdev, name);
+
+	if (coll)
+		return -EEXIST;
+
+	desc->name = name;
+
+	return 0;
+}
+
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 
 /*
@@ -2600,13 +2636,12 @@ EXPORT_SYMBOL_GPL(gpiod_get_index_optional);
 /**
  * gpiod_hog - Hog the specified GPIO desc given the provided flags
  * @desc:	gpio whose value will be assigned
- * @name:	gpio line name
  * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
  *		of_get_gpio_hog()
  * @dflags:	gpiod_flags - optional GPIO initialization flags
  */
-int gpiod_hog(struct gpio_desc *desc, const char *name,
-	      unsigned long lflags, enum gpiod_flags dflags)
+int gpiod_hog(struct gpio_desc *desc, unsigned long lflags,
+	      enum gpiod_flags dflags)
 {
 	struct gpio_chip *chip;
 	struct gpio_desc *local_desc;
@@ -2618,17 +2653,17 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 
 	gpiod_parse_flags(desc, lflags);
 
-	local_desc = gpiochip_request_own_desc(chip, hwnum, name);
+	local_desc = gpiochip_request_own_desc(chip, hwnum, desc->name);
 	if (IS_ERR(local_desc)) {
 		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed\n",
-		       name, chip->label, hwnum);
+		       desc->name, chip->label, hwnum);
 		return PTR_ERR(local_desc);
 	}
 
-	status = gpiod_configure_flags(desc, name, dflags);
+	status = gpiod_configure_flags(desc, desc->name, dflags);
 	if (status < 0) {
 		pr_err("setup of hog GPIO %s (chip %s, offset %d) failed\n",
-		       name, chip->label, hwnum);
+		       desc->name, chip->label, hwnum);
 		gpiochip_free_own_desc(desc);
 		return status;
 	}
@@ -2637,7 +2672,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	set_bit(FLAG_IS_HOGGED, &desc->flags);
 
 	pr_info("GPIO line %d (%s) hogged as %s%s\n",
-		desc_to_gpio(desc), name,
+		desc_to_gpio(desc), desc->name,
 		(dflags&GPIOD_FLAGS_BIT_DIR_OUT) ? "output" : "input",
 		(dflags&GPIOD_FLAGS_BIT_DIR_OUT) ?
 		  (dflags&GPIOD_FLAGS_BIT_DIR_VAL) ? "/high" : "/low":"");
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index e30e5fdb1214..2d8372f4251e 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -167,8 +167,9 @@ struct gpio_desc {
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
-int gpiod_hog(struct gpio_desc *desc, const char *name,
-		unsigned long lflags, enum gpiod_flags dflags);
+int gpiod_hog(struct gpio_desc *desc, unsigned long lflags,
+	      enum gpiod_flags dflags);
+int gpiod_set_name(struct gpio_desc *desc, const char *name);
 
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
-- 
2.7.0

