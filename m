Return-Path: <SRS0=+QUj=Y5=aosc.xyz=icenowy@kernel.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH] fbdev: ssd1307fb: allow reset-gpios is missing
Date: Sun, 15 Jan 2017 19:21:46 +0800
Message-Id: <20170115112146.1787-1-icenowy@aosc.xyz>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, Icenowy Zheng <icenowy@aosc.xyz>
List-ID: <devicetree@vger.kernel.org>

Currently some SSD1306 OLED modules are sold without a reset pin (only
VCC, GND, SCK, SDA four pins).

Add support for missing reset-gpios property.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 .../devicetree/bindings/display/ssd1307fb.txt      |  2 +-
 drivers/video/fbdev/ssd1307fb.c                    | 34 ++++++++++++----------
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ssd1307fb.txt b/Documentation/devicetree/bindings/display/ssd1307fb.txt
index eb31ed47a283..a4541b13b706 100644
--- a/Documentation/devicetree/bindings/display/ssd1307fb.txt
+++ b/Documentation/devicetree/bindings/display/ssd1307fb.txt
@@ -8,13 +8,13 @@ Required properties:
          0x3c or 0x3d
   - pwm: Should contain the pwm to use according to the OF device tree PWM
          specification [0]. Only required for the ssd1307.
-  - reset-gpios: Should contain the GPIO used to reset the OLED display
   - solomon,height: Height in pixel of the screen driven by the controller
   - solomon,width: Width in pixel of the screen driven by the controller
   - solomon,page-offset: Offset of pages (band of 8 pixels) that the screen is
     mapped to.
 
 Optional properties:
+  - reset-gpios: Should contain the GPIO used to reset the OLED display
   - reset-active-low: Is the reset gpio is active on physical low?
   - solomon,segment-no-remap: Display needs normal (non-inverted) data column
                               to segment mapping
diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 2925d5ce8d3e..e2b51a091ed4 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -563,8 +563,8 @@ static int ssd1307fb_probe(struct i2c_client *client,
 
 	par->reset = of_get_named_gpio(client->dev.of_node,
 					 "reset-gpios", 0);
-	if (!gpio_is_valid(par->reset)) {
-		ret = -EINVAL;
+	if (!gpio_is_valid(par->reset) && par->reset != -ENOENT) {
+		ret = par->reset;
 		goto fb_alloc_error;
 	}
 
@@ -642,23 +642,27 @@ static int ssd1307fb_probe(struct i2c_client *client,
 
 	fb_deferred_io_init(info);
 
-	ret = devm_gpio_request_one(&client->dev, par->reset,
-				    GPIOF_OUT_INIT_HIGH,
-				    "oled-reset");
-	if (ret) {
-		dev_err(&client->dev,
-			"failed to request gpio %d: %d\n",
-			par->reset, ret);
-		goto reset_oled_error;
+	if (par->reset != -ENOENT) {
+		ret = devm_gpio_request_one(&client->dev, par->reset,
+					    GPIOF_OUT_INIT_HIGH,
+					    "oled-reset");
+		if (ret) {
+			dev_err(&client->dev,
+				"failed to request gpio %d: %d\n",
+				par->reset, ret);
+			goto reset_oled_error;
+		}
 	}
 
 	i2c_set_clientdata(client, info);
 
-	/* Reset the screen */
-	gpio_set_value(par->reset, 0);
-	udelay(4);
-	gpio_set_value(par->reset, 1);
-	udelay(4);
+	if (par->reset != -ENOENT) {
+		/* Reset the screen */
+		gpio_set_value(par->reset, 0);
+		udelay(4);
+		gpio_set_value(par->reset, 1);
+		udelay(4);
+	}
 
 	ret = ssd1307fb_init(par);
 	if (ret)
-- 
2.11.0
