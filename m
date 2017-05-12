From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 5/6] pintrl: meson: improve meson_get_bank and export it
Date: Fri, 12 May 2017 21:14:12 +0200
Message-ID: <6bc65c7e-6a4e-3375-2d4f-dad75ed2ec9a@gmail.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

Export meson_get_bank because it's needed for the GPIO IRQ controller.
To avoid potential name conflicts rename it to meson_pinctrl_get_bank.

In addition simplify it by returning the pointer directly and using
a ERR_PTR in case of an error.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- add this patch to the series
---
 drivers/pinctrl/meson/pinctrl-meson.c | 59 +++++++++++++++--------------------
 drivers/pinctrl/meson/pinctrl-meson.h |  3 ++
 2 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 66ed70c1..39ad9861 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -63,28 +63,24 @@
 #include "pinctrl-meson.h"
 
 /**
- * meson_get_bank() - find the bank containing a given pin
+ * meson_pinctrl_get_bank() - find the bank containing a given pin
  *
  * @pc:		the pinctrl instance
  * @pin:	the pin number
- * @bank:	the found bank
  *
- * Return:	0 on success, a negative value on error
+ * Return:	the found bank or an ERR_PTR
  */
-static int meson_get_bank(struct meson_pinctrl *pc, unsigned int pin,
-			  struct meson_bank **bank)
+struct meson_bank *meson_pinctrl_get_bank(const struct meson_pinctrl *pc,
+					  unsigned int pin)
 {
+	struct meson_bank *bank = pc->data->banks;
 	int i;
 
-	for (i = 0; i < pc->data->num_banks; i++) {
-		if (pin >= pc->data->banks[i].first &&
-		    pin <= pc->data->banks[i].last) {
-			*bank = &pc->data->banks[i];
-			return 0;
-		}
-	}
+	for (i = 0; i < pc->data->num_banks; i++, bank++)
+		if (pin >= bank->first && pin <= bank->last)
+			return bank;
 
-	return -EINVAL;
+	return ERR_PTR(-EINVAL);
 }
 
 /**
@@ -261,9 +257,9 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 	unsigned int reg, bit;
 	int i, ret;
 
-	ret = meson_get_bank(pc, pin, &bank);
-	if (ret)
-		return ret;
+	bank = meson_pinctrl_get_bank(pc, pin);
+	if (IS_ERR(bank))
+		return PTR_ERR(bank);
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
@@ -324,9 +320,9 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
 	unsigned int reg, bit, val;
 	int ret, conf;
 
-	ret = meson_get_bank(pc, pin, &bank);
-	if (ret)
-		return ret;
+	bank = meson_pinctrl_get_bank(pc, pin);
+	if (IS_ERR(bank))
+		return PTR_ERR(bank);
 
 	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
 
@@ -427,12 +423,11 @@ static int meson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	struct meson_pinctrl *pc = gpiochip_get_data(chip);
 	unsigned int reg, bit, pin;
 	struct meson_bank *bank;
-	int ret;
 
 	pin = pc->data->pin_base + gpio;
-	ret = meson_get_bank(pc, pin, &bank);
-	if (ret)
-		return ret;
+	bank = meson_pinctrl_get_bank(pc, pin);
+	if (IS_ERR(bank))
+		return PTR_ERR(bank);
 
 	meson_calc_reg_and_bit(bank, pin, REG_DIR, &reg, &bit);
 
@@ -448,9 +443,9 @@ static int meson_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 	int ret;
 
 	pin = pc->data->pin_base + gpio;
-	ret = meson_get_bank(pc, pin, &bank);
-	if (ret)
-		return ret;
+	bank = meson_pinctrl_get_bank(pc, pin);
+	if (IS_ERR(bank))
+		return PTR_ERR(bank);
 
 	meson_calc_reg_and_bit(bank, pin, REG_DIR, &reg, &bit);
 	ret = regmap_update_bits(pc->reg_gpio, reg, BIT(bit), 0);
@@ -467,11 +462,10 @@ static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 	struct meson_pinctrl *pc = gpiochip_get_data(chip);
 	unsigned int reg, bit, pin;
 	struct meson_bank *bank;
-	int ret;
 
 	pin = pc->data->pin_base + gpio;
-	ret = meson_get_bank(pc, pin, &bank);
-	if (ret)
+	bank = meson_pinctrl_get_bank(pc, pin);
+	if (IS_ERR(bank))
 		return;
 
 	meson_calc_reg_and_bit(bank, pin, REG_OUT, &reg, &bit);
@@ -484,12 +478,11 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	struct meson_pinctrl *pc = gpiochip_get_data(chip);
 	unsigned int reg, bit, val, pin;
 	struct meson_bank *bank;
-	int ret;
 
 	pin = pc->data->pin_base + gpio;
-	ret = meson_get_bank(pc, pin, &bank);
-	if (ret)
-		return ret;
+	bank = meson_pinctrl_get_bank(pc, pin);
+	if (IS_ERR(bank))
+		return PTR_ERR(bank);
 
 	meson_calc_reg_and_bit(bank, pin, REG_IN, &reg, &bit);
 	regmap_read(pc->reg_gpio, reg, &val);
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 890f296f..40b56aff 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -176,3 +176,6 @@ extern struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data;
 extern struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data;
 extern struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data;
 extern struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data;
+
+struct meson_bank *meson_pinctrl_get_bank(const struct meson_pinctrl *pc,
+					  unsigned int pin);
-- 
2.12.2


