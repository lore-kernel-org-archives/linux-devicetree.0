From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] gpio: of: Add support for multiple GPIOs in a single GPIO hog
Date: Mon, 19 Dec 2016 19:21:34 +0100
Message-ID: <1482171694-18237-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

When listing multiple GPIOs in the "gpios" property of a GPIO hog, only
the first GPIO is affected.  The user is left clueless about the
disfunctioning of the other GPIOs specified.

Fix this by adding and documenting support for specifying multiple
GPIOs in a single GPIO hog.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 Documentation/devicetree/bindings/gpio/gpio.txt |  8 +++----
 drivers/gpio/gpiolib-of.c                       | 31 ++++++++++++++++---------
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 68d28f62a6f48eca..84ede036f73d09f8 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -187,10 +187,10 @@ gpio-controller's driver probe function.
 
 Each GPIO hog definition is represented as a child node of the GPIO controller.
 Required properties:
-- gpio-hog:   A property specifying that this child node represent a GPIO hog.
-- gpios:      Store the GPIO information (id, flags, ...). Shall contain the
-	      number of cells specified in its parent node (GPIO controller
-	      node).
+- gpio-hog:   A property specifying that this child node represents a GPIO hog.
+- gpios:      Store the GPIO information (id, flags, ...) for each GPIO to
+	      affect. Shall contain an integer multiple of the number of cells
+	      specified in its parent node (GPIO controller node).
 Only one of the following properties scanned in the order shown below.
 This means that when multiple properties are present they will be searched
 in the order presented below and the first match is taken as the intended
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 92b185f19232f7fc..975b9f6cf4082dfc 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -160,6 +160,7 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
  * of_parse_own_gpio() - Get a GPIO hog descriptor, names and flags for GPIO API
  * @np:		device node to get GPIO from
  * @chip:	GPIO chip whose hog is parsed
+ * @idx:	Index of the GPIO to parse
  * @name:	GPIO line name
  * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
  *		of_parse_own_gpio()
@@ -170,7 +171,7 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
  */
 static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 					   struct gpio_chip *chip,
-					   const char **name,
+					   unsigned int idx, const char **name,
 					   enum gpio_lookup_flags *lflags,
 					   enum gpiod_flags *dflags)
 {
@@ -178,6 +179,7 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	enum of_gpio_flags xlate_flags;
 	struct of_phandle_args gpiospec;
 	struct gpio_desc *desc;
+	unsigned int i;
 	u32 tmp;
 	int ret;
 
@@ -196,9 +198,12 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	gpiospec.np = chip_np;
 	gpiospec.args_count = tmp;
 
-	ret = of_property_read_u32_array(np, "gpios", gpiospec.args, tmp);
-	if (ret)
-		return ERR_PTR(ret);
+	for (i = 0; i < tmp; i++) {
+		ret = of_property_read_u32_index(np, "gpios", idx * tmp + i,
+						 &gpiospec.args[i]);
+		if (ret)
+			return ERR_PTR(ret);
+	}
 
 	desc = of_xlate_and_get_gpiod_flags(chip, &gpiospec, &xlate_flags);
 	if (IS_ERR(desc))
@@ -240,20 +245,24 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 	const char *name;
 	enum gpio_lookup_flags lflags;
 	enum gpiod_flags dflags;
+	unsigned int i;
 	int ret;
 
 	for_each_available_child_of_node(chip->of_node, np) {
 		if (!of_property_read_bool(np, "gpio-hog"))
 			continue;
 
-		desc = of_parse_own_gpio(np, chip, &name, &lflags, &dflags);
-		if (IS_ERR(desc))
-			continue;
+		for (i = 0;; i++) {
+			desc = of_parse_own_gpio(np, chip, i, &name, &lflags,
+						 &dflags);
+			if (IS_ERR(desc))
+				break;
 
-		ret = gpiod_hog(desc, name, lflags, dflags);
-		if (ret < 0) {
-			of_node_put(np);
-			return ret;
+			ret = gpiod_hog(desc, name, lflags, dflags);
+			if (ret < 0) {
+				of_node_put(np);
+				return ret;
+			}
 		}
 	}
 
-- 
1.9.1

