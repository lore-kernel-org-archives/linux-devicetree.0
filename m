From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 2/2] gpio: Support cascaded GPIO chip lookup for OF
Date: Fri,  3 Jun 2016 23:26:56 +0300
Message-ID: <1464985616-11821-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1464985616-11821-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464985616-11821-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robherring2@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

In certain cases it makes sense to create cascaded GPIO which
are not real GPIOs, merely point to the real backend GPIO chip.

In order to support this, cascaded of_xlate lookup need to be
performed.

For example let's take a connector that we want to abstract
having two GPIO pins from different GPIO controllers, connector
pin #0 connected to gpioA controller with offset 10 and gpioB
with 4.

In pseudo DT form this is analogous to:

	gpioA: gpioa@80000 {
		compatible = "foocorp,gpio";
		...
	};

	gpioB: gpiob@80800 {
		compatible = "foocorp,gpio";
		....
	};

	gpioC: controller_gpio {
		compatible = "cascaded-gpio";
		gpios = <&gpioA 10>, <&gpioB 5>;
	};

For example a user of gpioC (let's take a led driver) will have a
reference to gpioC like this:

	leds {
		compatible = "gpio-leds";
		led@0 {
			gpios = <&gpioC 0 GPIO_ACTIVE_HIGH>;
			...
		};
		led@1 {
			gpios = <&gpioC 1 GPIO_ACTIVE_HIGH>;
			..
		};
	};

We want the matches for gpioC to instead refer to gpioA & gpioB.

This is accomplished by a new method of_gpiochip_find() which
is an extension of the standard gpiochip_find() method.

A cascaded GPIO controller can modify the gpiospec node pointer
and arg[0] to point to the next GPIO in sequence and return -EAGAIN.
of_gpiochip_find() will restart the match using the new data
until either the final real GPIO is found or a maximum iteration
limit is reached.

In our example the cascaded-gpio driver can have a of_xlate method that
will point to gpioA/10 for gpioC/0 and gpioB/5 for gpioC/1.

Note that the cascade-gpio driver needs not to define any other member
methods since no actual reference will ever be made to it.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/gpio/gpiolib-of.c | 16 ++++----------
 drivers/gpio/gpiolib.c    | 54 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.h    | 14 ++++++++++++
 3 files changed, 72 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 50cb787..771060f 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -26,18 +26,10 @@
 
 #include "gpiolib.h"
 
-/* Private data structure for of_gpiochip_find_and_xlate */
-struct gg_data {
-	enum of_gpio_flags *flags;
-	struct of_phandle_args gpiospec;
-
-	struct gpio_desc *out_gpio;
-};
-
 /* Private function for resolving node pointer to gpio_chip */
-static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
+static int of_gpiochip_find_and_xlate(struct gpio_chip *gc,
+		struct gg_data *gg_data)
 {
-	struct gg_data *gg_data = data;
 	int ret;
 
 	if ((gc->of_node != gg_data->gpiospec.np) ||
@@ -95,7 +87,7 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		return ERR_PTR(ret);
 	}
 
-	gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
+	of_gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
 
 	of_node_put(gg_data.gpiospec.np);
 	pr_debug("%s: parsed '%s' property of node '%s[%d]' - status (%d)\n",
@@ -166,7 +158,7 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 			return ERR_PTR(ret);
 	}
 
-	gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
+	of_gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
 	if (!gg_data.out_gpio) {
 		if (np->parent == np)
 			return ERR_PTR(-ENXIO);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 24f60d2..e719499 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -884,6 +884,60 @@ struct gpio_chip *gpiochip_find(void *data,
 }
 EXPORT_SYMBOL_GPL(gpiochip_find);
 
+#ifdef CONFIG_OF_GPIO
+
+/* allow a maximum of 10 GPIO cascades (should be enough) */
+#define OF_GPIOCHIP_RETRY_COUNT_MAX	10
+
+/**
+ * of_gpiochip_find() - iterator for locating a specific gpio_chip
+ * @gg_data: data to pass to match function
+ * @callback: Callback function to check gpio_chip
+ *
+ * Similar to bus_find_device.  It returns a reference to a gpio_chip as
+ * determined by a user supplied @match callback.  The callback should return
+ * 0 if the device doesn't match and non-zero if it does.  If the callback is
+ * non-zero, this function will return to the caller and not iterate over any
+ * more gpio_chips.
+ */
+struct gpio_chip *of_gpiochip_find(struct gg_data *gg_data,
+		int (*match)(struct gpio_chip *chip, struct gg_data *gg_data))
+{
+	struct gpio_device *gdev;
+	struct gpio_chip *chip;
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&gpio_lock, flags);
+	/* always start with defer */
+	gg_data->out_gpio = ERR_PTR(-EPROBE_DEFER);
+	for (i = 0; gg_data->out_gpio == ERR_PTR(-EPROBE_DEFER) &&
+			i < OF_GPIOCHIP_RETRY_COUNT_MAX; i++) {
+
+		list_for_each_entry(gdev, &gpio_devices, list) {
+			if (match(gdev->chip, gg_data))
+				break;
+			/* again? cascaded; try agan */
+			if (gg_data->out_gpio == ERR_PTR(-EAGAIN)) {
+				/* defer is the default again */
+				gg_data->out_gpio = ERR_PTR(-EPROBE_DEFER);
+				break;
+			}
+		}
+	}
+
+	/* no match or maximum retry limit? */
+	if (&gdev->list == &gpio_devices || i >= OF_GPIOCHIP_RETRY_COUNT_MAX)
+		chip = NULL;
+	else
+		chip = gdev->chip;
+	spin_unlock_irqrestore(&gpio_lock, flags);
+
+	return chip;
+}
+EXPORT_SYMBOL_GPL(of_gpiochip_find);
+#endif
+
 static int gpiochip_match_name(struct gpio_chip *chip, void *data)
 {
 	const char *name = data;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2d9ea5e..58cbf75 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -236,4 +236,18 @@ static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 
 #endif /* CONFIG_GPIO_SYSFS */
 
+#ifdef CONFIG_OF_GPIO
+
+/* Private data structure for of_gpiochip_find_and_xlate */
+struct gg_data {
+	enum of_gpio_flags *flags;
+	struct of_phandle_args gpiospec;
+	struct gpio_desc *out_gpio;
+};
+
+extern struct gpio_chip *of_gpiochip_find(struct gg_data *gg_data,
+		int (*match)(struct gpio_chip *chip, struct gg_data *gg_data));
+
+#endif
+
 #endif /* GPIOLIB_H */
-- 
1.7.12
