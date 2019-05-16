From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/2] pinctrl: meson: add output support in pinconf
Date: Thu, 16 May 2019 17:13:39 +0200
Message-ID: <20190516151339.25846-3-jbrunet@baylibre.com>
References: <20190516151339.25846-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516151339.25846-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add pinconf support for PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_OUTPUT
in the meson pinctrl driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 182 ++++++++++++++++++--------
 1 file changed, 127 insertions(+), 55 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 33b4b141baac..410eb7559016 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -174,6 +174,88 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 	return 0;
 }
 
+static int meson_pinconf_set_gpio_bit(struct meson_pinctrl *pc,
+				      unsigned int pin,
+				      unsigned int reg_type,
+				      bool arg)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit;
+	int ret;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, reg_type, &reg, &bit);
+	return regmap_update_bits(pc->reg_gpio, reg, BIT(bit),
+				  arg ? BIT(bit) : 0);
+}
+
+static int meson_pinconf_get_gpio_bit(struct meson_pinctrl *pc,
+				      unsigned int pin,
+				      unsigned int reg_type)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit, val;
+	int ret;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, reg_type, &reg, &bit);
+	ret = regmap_read(pc->reg_gpio, reg, &val);
+	if (ret)
+		return ret;
+
+	return BIT(bit) & val ? 1 : 0;
+}
+
+static int meson_pinconf_set_output(struct meson_pinctrl *pc,
+				    unsigned int pin,
+				    bool out)
+{
+	return meson_pinconf_set_gpio_bit(pc, pin, REG_DIR, !out);
+}
+
+static int meson_pinconf_get_output(struct meson_pinctrl *pc,
+				    unsigned int pin)
+{
+	int ret = meson_pinconf_get_gpio_bit(pc, pin, REG_DIR);
+
+	if (ret < 0)
+		return ret;
+
+	return !ret;
+}
+
+static int meson_pinconf_set_drive(struct meson_pinctrl *pc,
+				   unsigned int pin,
+				   bool high)
+{
+	return meson_pinconf_set_gpio_bit(pc, pin, REG_OUT, high);
+}
+
+static int meson_pinconf_get_drive(struct meson_pinctrl *pc,
+				   unsigned int pin)
+{
+	return meson_pinconf_get_gpio_bit(pc, pin, REG_OUT);
+}
+
+static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
+					  unsigned int pin,
+					  bool high)
+{
+	int ret;
+
+	ret = meson_pinconf_set_output(pc, pin, true);
+	if (ret)
+		return ret;
+
+	return meson_pinconf_set_drive(pc, pin, high);
+}
+
 static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
 				      unsigned int pin)
 {
@@ -267,39 +349,48 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	enum pin_config_param param;
-	unsigned int drive_strength_ua;
+	unsigned int arg = 0;
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 
+		switch (param) {
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		case PIN_CONFIG_OUTPUT_ENABLE:
+		case PIN_CONFIG_OUTPUT:
+			arg = pinconf_to_config_argument(configs[i]);
+			break;
+
+		default:
+			break;
+		}
+
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
 			ret = meson_pinconf_disable_bias(pc, pin);
-			if (ret)
-				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
 			ret = meson_pinconf_enable_bias(pc, pin, true);
-			if (ret)
-				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			ret = meson_pinconf_enable_bias(pc, pin, false);
-			if (ret)
-				return ret;
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
-			drive_strength_ua =
-				pinconf_to_config_argument(configs[i]);
-			ret = meson_pinconf_set_drive_strength
-				(pc, pin, drive_strength_ua);
-			if (ret)
-				return ret;
+			ret = meson_pinconf_set_drive_strength(pc, pin, arg);
+			break;
+		case PIN_CONFIG_OUTPUT_ENABLE:
+			ret = meson_pinconf_set_output(pc, pin, arg);
+			break;
+		case PIN_CONFIG_OUTPUT:
+			ret = meson_pinconf_set_output_drive(pc, pin, arg);
 			break;
 		default:
-			return -ENOTSUPP;
+			ret = -ENOTSUPP;
 		}
+
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -403,6 +494,24 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 		if (ret)
 			return ret;
 		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		ret = meson_pinconf_get_output(pc, pin);
+		if (ret <= 0)
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_OUTPUT:
+		ret = meson_pinconf_get_output(pc, pin);
+		if (ret <= 0)
+			return -EINVAL;
+
+		ret = meson_pinconf_get_drive(pc, pin);
+		if (ret < 0)
+			return -EINVAL;
+
+		arg = ret;
+		break;
+
 	default:
 		return -ENOTSUPP;
 	}
@@ -447,56 +556,19 @@ static const struct pinconf_ops meson_pinconf_ops = {
 
 static int meson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
-	struct meson_pinctrl *pc = gpiochip_get_data(chip);
-	unsigned int reg, bit;
-	struct meson_bank *bank;
-	int ret;
-
-	ret = meson_get_bank(pc, gpio, &bank);
-	if (ret)
-		return ret;
-
-	meson_calc_reg_and_bit(bank, gpio, REG_DIR, &reg, &bit);
-
-	return regmap_update_bits(pc->reg_gpio, reg, BIT(bit), BIT(bit));
+	return meson_pinconf_set_output(gpiochip_get_data(chip), gpio, false);
 }
 
 static int meson_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 				       int value)
 {
-	struct meson_pinctrl *pc = gpiochip_get_data(chip);
-	unsigned int reg, bit;
-	struct meson_bank *bank;
-	int ret;
-
-	ret = meson_get_bank(pc, gpio, &bank);
-	if (ret)
-		return ret;
-
-	meson_calc_reg_and_bit(bank, gpio, REG_DIR, &reg, &bit);
-	ret = regmap_update_bits(pc->reg_gpio, reg, BIT(bit), 0);
-	if (ret)
-		return ret;
-
-	meson_calc_reg_and_bit(bank, gpio, REG_OUT, &reg, &bit);
-	return regmap_update_bits(pc->reg_gpio, reg, BIT(bit),
-				  value ? BIT(bit) : 0);
+	return meson_pinconf_set_output_drive(gpiochip_get_data(chip),
+					      gpio, value);
 }
 
 static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 {
-	struct meson_pinctrl *pc = gpiochip_get_data(chip);
-	unsigned int reg, bit;
-	struct meson_bank *bank;
-	int ret;
-
-	ret = meson_get_bank(pc, gpio, &bank);
-	if (ret)
-		return;
-
-	meson_calc_reg_and_bit(bank, gpio, REG_OUT, &reg, &bit);
-	regmap_update_bits(pc->reg_gpio, reg, BIT(bit),
-			   value ? BIT(bit) : 0);
+	meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
 }
 
 static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
-- 
2.20.1
