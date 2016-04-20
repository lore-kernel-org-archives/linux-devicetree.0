From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: of: make it possible to name GPIO lines
Date: Thu, 21 Apr 2016 00:16:40 +0200
Message-ID: <1461190600-20955-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make it possible to name the producer side of a GPIO line using
a "gpio-names" property array, modeled on the "clock-names"
property from the clock bindings.

This naming is especially useful for:

- Debugging: lines are named after function, not just opaque
  offset numbers.

- Exploration: systems where some or all GPIO lines are available
  to end users, such as prototyping, one-off's "makerspace usecases"
  users are helped by the names of the GPIO lines when tinkering.
  This usecase has been surfacing recently.

The gpio-names attribute is completely optional.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Make the naming function return void: we continue at all times
  and always return 0 anyway.
- Fix a return value check.

This has been discussed at some length now.

Why we are not using hogs: these are consumer side, not producer
side. The gpio-controller in DT (gpio_chip in Linux) is a
producer, not a consumer.

This patch is not about assigning initial values to GPIO lines.
That is an orthogonal usecase. This is just about naming lines.
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 19 +++++++++++++
 drivers/gpio/gpiolib-of.c                       | 38 +++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index c88d2ccb05ca..6b371ab6098e 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -152,6 +152,21 @@ additional bitmask is needed to specify which GPIOs are actually in use,
 and which are dummies. The bindings for this case has not yet been
 specified, but should be specified if/when such hardware appears.
 
+Optionally, a GPIO controller may have a "gpio-names" property. This is
+an array of strings defining the names of the GPIO lines going out of the
+GPIO controller. This name should be the most meaningful producer name
+for the system, such as a rail name indicating the usage. Package names
+such as pin name are discouraged: such lines have opaque names (since they
+are by definition generic purpose) and such names are usually not very
+helpful. For example "MMC-CD", "Red LED Vdd" and "ethernet reset" are
+reasonable line names as they describe what the line is used for. "GPIO0"
+is not a good name to give to a GPIO line. Placeholders are discouraged:
+rather use the "" (blank string) if the use of the GPIO line is undefined
+in your design. The names are assigned starting from line offset 0 from
+left to right from the passed array. An incomplete array (where the number
+of passed named are less than ngpios) will still be used up until the last
+provided valid line index.
+
 Example:
 
 gpio-controller@00000000 {
@@ -160,6 +175,10 @@ gpio-controller@00000000 {
 	gpio-controller;
 	#gpio-cells = <2>;
 	ngpios = <18>;
+	gpio-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
+		"LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
+		"Row A", "Row B", "Row C", "Row D", "NMI button",
+		"poweroff", "reset";
 }
 
 The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index d81dbd8e90d9..430159df5d73 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -196,6 +196,40 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 }
 
 /**
+ * of_gpiochip_set_names() - set up the names of the lines
+ * @chip: GPIO chip whose lines should be named, if possible
+ */
+static void of_gpiochip_set_names(struct gpio_chip *gc)
+{
+	struct gpio_device *gdev = gc->gpiodev;
+	struct device_node *np = gc->of_node;
+	int i;
+	int nstrings;
+
+	/* Do we even have the "gpio-names" property */
+	if (!of_property_read_bool(np, "gpio-names"))
+		return;
+
+	nstrings = of_property_count_strings(np, "gpio-names");
+	for (i = 0; i < nstrings; i++) {
+		const char *name;
+		int ret;
+
+		ret = of_property_read_string_index(np,
+						    "gpio-names",
+						    i,
+						    &name);
+		if (!ret)
+			gdev->descs[i].name = name;
+
+		/* Empty strings are OK */
+		if (ret < 0 && ret != -ENODATA)
+			dev_err(&gdev->dev, "unable to name line %d\n",
+				i);
+	}
+}
+
+/**
  * of_gpiochip_scan_gpios - Scan gpio-controller for gpio definitions
  * @chip:	gpio chip to act on
  *
@@ -445,6 +479,10 @@ int of_gpiochip_add(struct gpio_chip *chip)
 	if (status)
 		return status;
 
+	/* If the chip defines names itself, these take precedence */
+	if (!chip->names)
+		of_gpiochip_set_names(chip);
+
 	of_node_get(chip->of_node);
 
 	return of_gpiochip_scan_gpios(chip);
-- 
2.4.11

