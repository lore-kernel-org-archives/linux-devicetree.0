From: David Bauer <mail@david-bauer.net>
Subject: [PATCH] gpio: 74x164: add lines-initial-states property
Date: Wed, 15 Aug 2018 22:18:54 +0200
Message-ID: <20180815201855.29738-1-mail@david-bauer.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: David Bauer <mail@david-bauer.net>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the ability to define the initial state of each output line on
device probe.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 Documentation/devicetree/bindings/gpio/gpio-74x164.txt | 5 +++++
 drivers/gpio/gpio-74x164.c                             | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
index 2a97553d8d76..580b18065ad3 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
@@ -14,6 +14,11 @@ Required properties:
 
 Optional properties:
 - enable-gpios: GPIO connected to the OE (Output Enable) pin.
+- lines-initial-states: Bitmask that specifies the initial state of
+  each line. When a bit is set to zero, the corresponding output line
+  is initialized LOW. When a bit is set to one, the corresponding
+  output line is initialized HIGH. In case this property is not
+  defined, all lines will be initialized as LOW.
 
 Example:
 
diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index fb7b620763a2..275310a0a538 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -150,6 +150,9 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->gpio_chip.parent = &spi->dev;
 	chip->gpio_chip.owner = THIS_MODULE;
 
+	of_property_read_u8_array(spi->dev.of_node, "lines-initial-states",
+				  chip->buffer, chip->registers);
+
 	mutex_init(&chip->lock);
 
 	ret = __gen_74x164_write_config(chip);
-- 
2.18.0
