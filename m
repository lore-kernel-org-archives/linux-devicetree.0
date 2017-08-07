From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] gpio: 74x164: handling enable-gpios
Date: Mon,  7 Aug 2017 20:27:13 +0800
Message-ID: <1502108833-10317-2-git-send-email-peng.fan@nxp.com>
References: <1502108833-10317-1-git-send-email-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502108833-10317-1-git-send-email-peng.fan@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
List-Id: devicetree@vger.kernel.org

To 74hc595 and 74lv595, there is an OE(low active) input pin.
To some boards, this pin is controller by GPIO, so handling
this pin in driver. When driver probe, use GPIOD_OUT_LOW flag
when requesting the gpio, so OE is set to low when probe.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-74x164.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index a6607fa..e44422c 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -23,6 +23,7 @@ struct gen_74x164_chip {
 	struct gpio_chip	gpio_chip;
 	struct mutex		lock;
 	u32			registers;
+	struct gpio_desc	*enable_gpio;
 	/*
 	 * Since the registers are chained, every byte sent will make
 	 * the previous byte shift to the next register in the
@@ -142,6 +143,12 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->gpio_chip.parent = &spi->dev;
 	chip->gpio_chip.owner = THIS_MODULE;
 
+	chip->enable_gpio = devm_gpiod_get(&spi->dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(chip->enable_gpio)) {
+		dev_dbg(&spi->dev, "No enable-gpios property\n");
+		chip->enable_gpio = NULL;
+	}
+
 	mutex_init(&chip->lock);
 
 	ret = __gen_74x164_write_config(chip);
@@ -164,6 +171,8 @@ static int gen_74x164_remove(struct spi_device *spi)
 {
 	struct gen_74x164_chip *chip = spi_get_drvdata(spi);
 
+	if (chip->enable_gpio)
+		gpiod_set_value(chip->enable_gpio, 0);
 	gpiochip_remove(&chip->gpio_chip);
 	mutex_destroy(&chip->lock);
 
-- 
2.6.6
