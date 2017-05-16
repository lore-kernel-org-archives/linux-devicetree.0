From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 2/3] gpio: arizona: Add support for GPIOs that need to be maintained
Date: Tue, 16 May 2017 16:31:53 +0100
Message-ID: <1494948714-15203-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1494948714-15203-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494948714-15203-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Arizona devices only maintain the state of output GPIOs whilst the
CODEC is active, this can cause issues if the CODEC suspends whilst
something is relying on the state of one of its GPIOs. However, in
many systems the CODEC GPIOs are used for audio related features
and thus the state of the GPIOs is unimportant whilst the CODEC is
suspended. Often keeping the CODEC resumed in such a system would
incur a power impact that is unacceptable.

Allow the user to select whether a GPIO output should keep the
CODEC resumed, by adding a flag through the second cell of the GPIO
specifier in device tree.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/gpio/gpio-arizona.c | 59 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index cd23fd7..2d86776 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -12,10 +12,12 @@
  *
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/gpio.h>
+#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/seq_file.h>
@@ -27,15 +29,30 @@
 struct arizona_gpio {
 	struct arizona *arizona;
 	struct gpio_chip gpio_chip;
+	int status[ARIZONA_MAX_GPIO];
 };
 
 static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
+	int status = arizona_gpio->status[offset];
+	bool change;
+	int ret;
 
-	return regmap_update_bits(arizona->regmap, ARIZONA_GPIO1_CTRL + offset,
-				  ARIZONA_GPN_DIR, ARIZONA_GPN_DIR);
+	ret = regmap_update_bits_check(arizona->regmap,
+				       ARIZONA_GPIO1_CTRL + offset,
+				       ARIZONA_GPN_DIR, ARIZONA_GPN_DIR,
+				       &change);
+	if (ret < 0)
+		return ret;
+
+	if (change && !(status & GPIO_SLEEP_MAY_LOOSE_VALUE)) {
+		pm_runtime_mark_last_busy(chip->parent);
+		pm_runtime_put_autosuspend(chip->parent);
+	}
+
+	return 0;
 }
 
 static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -85,6 +102,21 @@ static int arizona_gpio_direction_out(struct gpio_chip *chip,
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
+	int status = arizona_gpio->status[offset];
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(arizona->regmap, ARIZONA_GPIO1_CTRL + offset, &val);
+	if (ret < 0)
+		return ret;
+
+	if ((val & ARIZONA_GPN_DIR) && !(status & GPIO_SLEEP_MAY_LOOSE_VALUE)) {
+		ret = pm_runtime_get_sync(chip->parent);
+		if (ret < 0) {
+			dev_err(chip->parent, "Failed to resume: %d\n", ret);
+			return ret;
+		}
+	}
 
 	if (value)
 		value = ARIZONA_GPN_LVL;
@@ -105,6 +137,25 @@ static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 			   ARIZONA_GPN_LVL, value);
 }
 
+#ifdef CONFIG_OF_GPIO
+static int arizona_gpio_of_xlate(struct gpio_chip *chip,
+				 const struct of_phandle_args *gpiospec,
+				 u32 *flags)
+{
+	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
+	int offset;
+
+	offset = of_gpio_simple_xlate(chip, gpiospec, flags);
+	if (offset < 0)
+		return offset;
+
+	if (flags)
+		arizona_gpio->status[offset] = *flags;
+
+	return offset;
+}
+#endif
+
 static const struct gpio_chip template_chip = {
 	.label			= "arizona",
 	.owner			= THIS_MODULE,
@@ -132,6 +183,8 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	arizona_gpio->gpio_chip.parent = &pdev->dev;
 #ifdef CONFIG_OF_GPIO
 	arizona_gpio->gpio_chip.of_node = arizona->dev->of_node;
+	arizona_gpio->gpio_chip.of_xlate = arizona_gpio_of_xlate;
+	arizona_gpio->gpio_chip.of_gpio_n_cells = 2;
 #endif
 
 	switch (arizona->type) {
@@ -158,6 +211,8 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	else
 		arizona_gpio->gpio_chip.base = -1;
 
+	pm_runtime_enable(&pdev->dev);
+
 	ret = devm_gpiochip_add_data(&pdev->dev, &arizona_gpio->gpio_chip,
 				     arizona_gpio);
 	if (ret < 0) {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
