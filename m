Return-Path: <SRS0=oUNg=JE=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 1/5] dt-bindings: leds: Add bindings for lltc,lt3593
Date: Mon, 18 Jun 2018 21:42:57 +0200
Message-Id: <20180618194301.5667-2-daniel@zonque.org>
In-Reply-To: <20180618194301.5667-1-daniel@zonque.org>
References: <20180618194301.5667-1-daniel@zonque.org>
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

This patch add the bindings document for LT3593 LED drivers.
The binding is kept consistent with other LED driver bindings in that it
stores all the LED-specific properties in its own subnode. As the hardware
only supports once channel, there can consequently only be one sub-node.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/leds/leds-lt3593.txt  | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lt3593.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lt3593.txt b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
new file mode 100644
index 000000000000..9e7f308404f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
@@ -0,0 +1,35 @@
+Bindings for Linear Technologies LT3593 LED controller
+
+Required properties:
+- compatible:	Should be "lltc,lt3593".
+
+The hardware supports only one LED. The properties of this LED are
+configured in a sub-node in the device node.
+
+Required sub-node properties:
+- gpios:	A handle to the GPIO that is connected to the 'CTRL'
+		pin of the chip.
+
+Optional sub-node properties:
+- label:	A label for the LED. If none is given, the LED will be
+		named "lt3595::".
+- linux,default-trigger: The default trigger for the LED.
+			See Documentation/devicetree/bindings/leds/common.txt
+- default-state:	The initial state of the LED.
+			See Documentation/devicetree/bindings/leds/common.txt
+
+If multiple chips of this type are found in a design, each one needs to
+be handled by its own device node.
+
+Example:
+
+led-controller {
+	compatible = "lltc,lt3593";
+
+	led {
+		label = "white:backlight";
+		gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+		default-state = "on";
+	};
+};
+
-- 
2.17.1
