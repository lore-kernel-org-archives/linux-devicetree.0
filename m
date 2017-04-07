From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 2/2] gpio: arizona: Add support for GPIOs that need to be maintained
Date: Fri, 7 Apr 2017 13:38:45 +0100
Message-ID: <1491568725-14882-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1491568725-14882-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491568725-14882-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, lee.jones@linaro.org
Cc: gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
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
specifier in device tree. The default behaviour remains the same with
the GPIO not forcing the CODEC to remain active and losing state, so
as to not cause power regressions on existing systems.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/gpio/gpio-arizona.c | 52 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 60b3102..027a70a 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -24,15 +24,27 @@
 #include <linux/mfd/arizona/pdata.h>
 #include <linux/mfd/arizona/registers.h>
 
+#define ARIZONA_GP_STATE_OUTPUT   0x00000001
+
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
+
+	status &= (ARIZONA_GP_MAINTAIN | ARIZONA_GP_STATE_OUTPUT);
+	if (status == (ARIZONA_GP_MAINTAIN | ARIZONA_GP_STATE_OUTPUT)) {
+		arizona_gpio->status[offset] &= ~ARIZONA_GP_STATE_OUTPUT;
+
+		pm_runtime_mark_last_busy(chip->parent);
+		pm_runtime_put_autosuspend(chip->parent);
+	}
 
 	return regmap_update_bits(arizona->regmap, ARIZONA_GPIO1_CTRL + offset,
 				  ARIZONA_GPN_DIR, ARIZONA_GPN_DIR);
@@ -85,6 +97,19 @@ static int arizona_gpio_direction_out(struct gpio_chip *chip,
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
+	int status = arizona_gpio->status[offset];
+	int ret;
+
+	status &= (ARIZONA_GP_MAINTAIN | ARIZONA_GP_STATE_OUTPUT);
+	if (status == ARIZONA_GP_MAINTAIN) {
+		arizona_gpio->status[offset] |= ARIZONA_GP_STATE_OUTPUT;
+
+		ret = pm_runtime_get_sync(chip->parent);
+		if (ret < 0) {
+			dev_err(chip->parent, "Failed to resume: %d\n", ret);
+			return ret;
+		}
+	}
 
 	if (value)
 		value = ARIZONA_GPN_LVL;
@@ -105,6 +130,29 @@ static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 			   ARIZONA_GPN_LVL, value);
 }
 
+static int arizona_gpio_of_xlate(struct gpio_chip *chip,
+				 const struct of_phandle_args *gpiospec,
+				 u32 *flags)
+{
+	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
+	u32 offset = gpiospec->args[0];
+	u32 bits = gpiospec->args[1];
+
+	if (gpiospec->args_count < chip->of_gpio_n_cells)
+		return -EINVAL;
+
+	if (offset >= chip->ngpio)
+		return -EINVAL;
+
+	if (flags)
+		*flags = bits & ~ARIZONA_GP_MAINTAIN;
+
+	if (bits & ARIZONA_GP_MAINTAIN)
+		arizona_gpio->status[offset] |= ARIZONA_GP_MAINTAIN;
+
+	return offset;
+}
+
 static const struct gpio_chip template_chip = {
 	.label			= "arizona",
 	.owner			= THIS_MODULE,
@@ -113,6 +161,8 @@ static const struct gpio_chip template_chip = {
 	.direction_output	= arizona_gpio_direction_out,
 	.set			= arizona_gpio_set,
 	.can_sleep		= true,
+	.of_xlate		= arizona_gpio_of_xlate,
+	.of_gpio_n_cells	= 2,
 };
 
 static int arizona_gpio_probe(struct platform_device *pdev)
@@ -158,6 +208,8 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	else
 		arizona_gpio->gpio_chip.base = -1;
 
+	pm_runtime_enable(&pdev->dev);
+
 	ret = devm_gpiochip_add_data(&pdev->dev, &arizona_gpio->gpio_chip,
 				     arizona_gpio);
 	if (ret < 0) {
-- 
2.1.4
