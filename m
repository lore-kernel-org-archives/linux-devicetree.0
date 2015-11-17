From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH v3 2/2] gpiolib: Add GPIO initialization
Date: Tue, 17 Nov 2015 11:07:58 +0100
Message-ID: <1447754878-21099-3-git-send-email-mpa@pengutronix.de>
References: <1447754878-21099-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1447754878-21099-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This functions adds a way to initialize a GPIO without hogging it.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib-of.c | 13 ++++++++-----
 drivers/gpio/gpiolib.c    | 24 ++++++++++++++++++++++++
 drivers/gpio/gpiolib.h    |  2 ++
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 5fe34a9df3e6..48cdc22eabf2 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -211,15 +211,18 @@ static void of_gpiochip_scan_gpios(struct gpio_chip *chip)
 	enum gpiod_flags dflags;
 
 	for_each_child_of_node(chip->of_node, np) {
-		if (!of_property_read_bool(np, "gpio-hog"))
-			continue;
 
 		desc = of_parse_own_gpio(np, &name, &lflags, &dflags);
-		if (IS_ERR(desc))
+		if (IS_ERR(desc) || !dflags)
 			continue;
 
-		if (gpiod_hog(desc, name, lflags, dflags))
-			continue;
+		if (of_property_read_bool(np, "gpio-hog"))
+			gpiod_hog(desc, name, lflags, dflags);
+		else if (of_property_read_bool(np, "gpio-initval"))
+			gpiod_initialize(desc, lflags, dflags);
+		else
+			dev_dbg(chip->dev, "GPIO line %d (%s): neither gpio-hog nor gpio-initval found.\n",
+				desc_to_gpio(desc), np->name);
 	}
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a18f00fc1bb8..3b35f2fafeb2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2329,6 +2329,30 @@ static void gpiochip_free_hogs(struct gpio_chip *chip)
 }
 
 /**
+ * gpiod_initialize - Initialize a GPIO with a given value
+ * @desc:	gpio whose value will be assigned
+ * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
+ *		of_get_gpio_hog()
+ * @dflags:	gpiod_flags - optional GPIO initialization flags
+ *
+ * This is used to initialize GPIOs that were defined in DT
+ */
+int gpiod_initialize(struct gpio_desc *desc, unsigned long lflags,
+		     enum gpiod_flags dflags)
+{
+	int status;
+
+	status = gpiod_configure_flags(desc, NULL, dflags);
+	if (status < 0) {
+		pr_err("initial setup of GPIO (chip %s, offset %d) failed\n",
+		       gpiod_to_chip(desc)->label, gpio_chip_hwgpio(desc));
+		return status;
+	}
+
+	return 0;
+}
+
+/**
  * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
  * @dev:	GPIO consumer, can be NULL for system-global GPIOs
  * @con_id:	function within the GPIO consumer
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 98ab08c0aa2d..4abf53a5e651 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -107,6 +107,8 @@ int gpiod_request(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 		unsigned long lflags, enum gpiod_flags dflags);
+int gpiod_initialize(struct gpio_desc *desc, unsigned long lflags,
+		     enum gpiod_flags dflags);
 
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
-- 
2.6.2

