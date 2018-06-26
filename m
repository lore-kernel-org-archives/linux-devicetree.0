Return-Path: <SRS0=XC2B=JM=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH] leds: lt3593: Move GPIO node from child to device node
Date: Tue, 26 Jun 2018 22:22:52 +0200
Message-Id: <20180626202252.6127-1-daniel@zonque.org>
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Move the GPIO node from the child node to the device node as it
is a property of the chip, not of the LED.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/leds/leds-lt3593.txt         | 10 ++++------
 drivers/leds/leds-lt3593.c                           | 12 ++++--------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lt3593.txt b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
index b31d427448f8..6b2cabc36c0c 100644
--- a/Documentation/devicetree/bindings/leds/leds-lt3593.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
@@ -1,15 +1,13 @@
 Bindings for Linear Technologies LT3593 LED controller
 
 Required properties:
-- compatible:	Should be "lltc,lt3593".
+- compatible:		Should be "lltc,lt3593".
+- lltc,ctrl-gpios:	A handle to the GPIO that is connected to the 'CTRL'
+			pin of the chip.
 
 The hardware supports only one LED. The properties of this LED are
 configured in a sub-node in the device node.
 
-Required sub-node properties:
-- gpios:	A handle to the GPIO that is connected to the 'CTRL'
-		pin of the chip.
-
 Optional sub-node properties:
 - label:	A label for the LED. If none is given, the LED will be
 		named "lt3595::".
@@ -25,10 +23,10 @@ Example:
 
 led-controller {
 	compatible = "lltc,lt3593";
+	lltc,ctrl-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
 
 	led {
 		label = "white:backlight";
-		gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
 		default-state = "on";
 	};
 };
diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index f6aae616242e..9d4896aa8475 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -133,6 +133,10 @@ static int lt3593_led_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	led_data->gpiod = devm_gpiod_get(dev, "lltc,ctrl", 0);
+	if (IS_ERR(led_data->gpiod))
+		return PTR_ERR(led_data->gpiod);
+
 	child = device_get_next_child_node(dev, NULL);
 
 	ret = fwnode_property_read_string(child, "label", &tmp);
@@ -156,14 +160,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
 		}
 	}
 
-	led_data->gpiod = devm_fwnode_get_gpiod_from_child(dev, NULL, child,
-							   flags,
-							   led_data->name);
-	if (IS_ERR(led_data->gpiod)) {
-		fwnode_handle_put(child);
-		return PTR_ERR(led_data->gpiod);
-	}
-
 	led_data->cdev.name = led_data->name;
 	led_data->cdev.brightness_set_blocking = lt3593_led_set;
 	led_data->cdev.brightness = state ? LED_FULL : LED_OFF;
-- 
2.17.1
