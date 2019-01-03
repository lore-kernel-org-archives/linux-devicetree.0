Return-Path: <SRS0=5pMM=PL=bootlin.com=thomas.petazzoni@kernel.org>
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 4/4] gpio: pca953x: add ->set_config implementation
Date: Thu,  3 Jan 2019 17:41:02 +0100
Message-Id: <20190103164102.31437-5-thomas.petazzoni@bootlin.com>
In-Reply-To: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

This commit adds a minimal implementation of the ->set_config() hook,
with support for the PIN_CONFIG_BIAS_PULL_UP and
PIN_CONFIG_BIAS_PULL_DOWN configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 drivers/gpio/gpio-pca953x.c | 59 +++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 82d69ab51976..f14cfb42681f 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -179,6 +179,8 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
 #define PCA957x_BANK_OUTPUT	BIT(5)
 
 #define PCAL9xxx_BANK_IN_LATCH	BIT(8 + 2)
+#define PCAL9xxx_BANK_PULL_EN	BIT(8 + 3)
+#define PCAL9xxx_BANK_PULL_SEL	BIT(8 + 4)
 #define PCAL9xxx_BANK_IRQ_MASK	BIT(8 + 5)
 #define PCAL9xxx_BANK_IRQ_STAT	BIT(8 + 6)
 
@@ -200,6 +202,8 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
  * - Extended set, above 0x40, often chip specific.
  *   - PCAL6524/PCAL9555A with custom PCAL IRQ handling:
  *     Input latch register		0x40 + 2 * bank_size	RW
+ *     Pull-up/pull-down enable reg	0x40 + 3 * bank_size    RW
+ *     Pull-up/pull-down select reg	0x40 + 4 * bank_size    RW
  *     Interrupt mask register		0x40 + 5 * bank_size	RW
  *     Interrupt status register	0x40 + 6 * bank_size	R
  *
@@ -248,7 +252,8 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 	}
 
 	if (chip->driver_data & PCA_PCAL) {
-		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_IRQ_MASK |
+		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
+			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK |
 			PCAL9xxx_BANK_IRQ_STAT;
 	}
 
@@ -269,7 +274,8 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 	}
 
 	if (chip->driver_data & PCA_PCAL)
-		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_IRQ_MASK;
+		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
+			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK;
 
 	return pca953x_check_register(chip, reg, bank);
 }
@@ -474,6 +480,54 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 	mutex_unlock(&chip->i2c_lock);
 }
 
+static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
+					 unsigned int offset,
+					 unsigned long config)
+{
+	u8 pull_en_reg = pca953x_recalc_addr(chip, PCAL953X_PULL_EN, offset,
+					     true, false);
+	u8 pull_sel_reg = pca953x_recalc_addr(chip, PCAL953X_PULL_SEL, offset,
+					      true, false);
+	u8 bit = BIT(offset % BANK_SZ);
+	int ret;
+
+	mutex_lock(&chip->i2c_lock);
+
+	/* Disable pull-up/pull-down */
+	ret = regmap_write_bits(chip->regmap, pull_en_reg, bit, 0);
+	if (ret)
+		goto exit;
+
+	/* Configure pull-up/pull-down */
+	if (config == PIN_CONFIG_BIAS_PULL_UP)
+		ret = regmap_write_bits(chip->regmap, pull_sel_reg, bit, bit);
+	else if (config == PIN_CONFIG_BIAS_PULL_DOWN)
+		ret = regmap_write_bits(chip->regmap, pull_sel_reg, bit, 0);
+	if (ret)
+		goto exit;
+
+	/* Enable pull-up/pull-down */
+	ret = regmap_write_bits(chip->regmap, pull_en_reg, bit, bit);
+
+exit:
+	mutex_unlock(&chip->i2c_lock);
+	return ret;
+}
+
+static int pca953x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+				   unsigned long config)
+{
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
+
+	switch(config) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		return pca953x_gpio_set_pull_up_down(chip, offset, config);
+	default:
+		return -ENOTSUPP;
+	}
+}
+
 static void pca953x_setup_gpio(struct pca953x_chip *chip, int gpios)
 {
 	struct gpio_chip *gc;
@@ -486,6 +540,7 @@ static void pca953x_setup_gpio(struct pca953x_chip *chip, int gpios)
 	gc->set = pca953x_gpio_set_value;
 	gc->get_direction = pca953x_gpio_get_direction;
 	gc->set_multiple = pca953x_gpio_set_multiple;
+	gc->set_config = pca953x_gpio_set_config;
 	gc->can_sleep = true;
 
 	gc->base = chip->gpio_start;
-- 
2.20.1
