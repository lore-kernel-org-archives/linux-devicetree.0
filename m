From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RfC v3 5/7] pinctrl: meson: improve meson_get_bank and export
 it
Date: Wed, 17 May 2017 22:16:55 +0200
Message-ID: <b7b35b6f-ff70-3a6f-c9b7-5ca4a23293e1@gmail.com>
References: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <16950080-b19d-e25c-fb48-bc79cfe4acc0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Export meson_get_bank because it's needed for the GPIO IRQ controller.
To avoid potential name conflicts rename it to meson_pinctrl_get_bank.

In addition simplify it by returning the pointer directly and using
a ERR_PTR in case of an error.

Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2:
- add this patch to the series
v3:
- no changes
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
2.13.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
