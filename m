From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 3/5] gpio: use new gpio_set_config() helper in more places
Date: Thu,  7 Feb 2019 17:28:57 +0100
Message-ID: <20190207162859.26252-4-thomas.petazzoni@bootlin.com>
References: <20190207162859.26252-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207162859.26252-1-thomas.petazzoni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

As suggested by Linus Walleij, let's use the new gpio_set_config()
helper in gpiod_set_debounce() and gpiod_set_transitory().

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cf8a4402fef1..9762a836fec9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2762,7 +2762,7 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 	}
 
 	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, debounce);
-	return chip->set_config(chip, gpio_chip_hwgpio(desc), config);
+	return gpio_set_config(chip, gpio_chip_hwgpio(desc), config);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 
@@ -2799,7 +2799,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
 					  !transitory);
 	gpio = gpio_chip_hwgpio(desc);
-	rc = chip->set_config(chip, gpio, packed);
+	rc = gpio_set_config(chip, gpio, packed);
 	if (rc == -ENOTSUPP) {
 		dev_dbg(&desc->gdev->dev, "Persistence not supported for GPIO %d\n",
 				gpio);
-- 
2.20.1
