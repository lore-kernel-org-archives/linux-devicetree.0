From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 3/5] gpio: arizona: Add support for GPIOs that need to be maintained
Date: Tue, 23 May 2017 15:47:30 +0100
Message-ID: <1495550852-3672-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.wolfsonmicro.com, frowand.list@gmail.com, ldewangan@nvidia.com
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

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

Changes since v1:
 - Use the new gpiolib features to determine if the pin is
   persistent or not.

Thanks,
Charles

 drivers/gpio/gpio-arizona.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index cd23fd7..d4e6ba0 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -33,9 +33,23 @@ static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
+	bool persistent = gpiochip_line_is_persistent(chip, offset);
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
+	if (change && persistent) {
+		pm_runtime_mark_last_busy(chip->parent);
+		pm_runtime_put_autosuspend(chip->parent);
+	}
+
+	return 0;
 }
 
 static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -85,6 +99,21 @@ static int arizona_gpio_direction_out(struct gpio_chip *chip,
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
+	bool persistent = gpiochip_line_is_persistent(chip, offset);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(arizona->regmap, ARIZONA_GPIO1_CTRL + offset, &val);
+	if (ret < 0)
+		return ret;
+
+	if ((val & ARIZONA_GPN_DIR) && persistent) {
+		ret = pm_runtime_get_sync(chip->parent);
+		if (ret < 0) {
+			dev_err(chip->parent, "Failed to resume: %d\n", ret);
+			return ret;
+		}
+	}
 
 	if (value)
 		value = ARIZONA_GPN_LVL;
@@ -158,6 +187,8 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	else
 		arizona_gpio->gpio_chip.base = -1;
 
+	pm_runtime_enable(&pdev->dev);
+
 	ret = devm_gpiochip_add_data(&pdev->dev, &arizona_gpio->gpio_chip,
 				     arizona_gpio);
 	if (ret < 0) {
-- 
2.1.4

