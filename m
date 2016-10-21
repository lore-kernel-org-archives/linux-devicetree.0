From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] gpio: mcp23s08: Add option to configure pullups.
Date: Fri, 21 Oct 2016 17:00:35 +0200
Message-ID: <1477062035-30825-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Default is without pullups, but if property is specified in DT and the bit
is set, set a pullup on GPIO-n.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt | 1 +
 drivers/gpio/gpio-mcp23s08.c                             | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
index c934106..40306b1 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
@@ -57,6 +57,7 @@ Optional device specific properties:
         On devices with only one interrupt output this property is useless.
 - microchip,irq-active-high: Sets the INTPOL flag in the IOCON register. This
         configures the IRQ output polarity as active high.
+- microchip,pullups : If n-th bit is set, set a pullup on GPIO-n.
 
 Example I2C (with interrupt):
 gpiom1: gpio@20 {
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 99d37b5..0cedf82 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -766,7 +766,8 @@ static int mcp230xx_probe(struct i2c_client *client,
 	if (match) {
 		pdata = &local_pdata;
 		pdata->base = -1;
-		pdata->chip[0].pullups = 0;
+		of_property_read_u32(client->dev.of_node, "microchip,pullups",
+				     &pdata->chip[0].pullups);
 		pdata->irq_controller =	of_property_read_bool(
 					client->dev.of_node,
 					"interrupt-controller");
-- 
2.1.0
