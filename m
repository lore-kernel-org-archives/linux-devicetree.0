Return-Path: <SRS0=fTn5=JD=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 1/5] dt-bindings: leds: Add bindings for lltc,lt3593
Date: Sun, 17 Jun 2018 13:49:25 +0200
Message-Id: <20180617114929.719-1-daniel@zonque.org>
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/leds/leds-lt3593.txt  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lt3593.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lt3593.txt b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
new file mode 100644
index 000000000000..0a7035acda8f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
@@ -0,0 +1,25 @@
+Bindings for Linear Technologies LT3593 LED controller
+
+Required properties:
+- compatible : should be "lltc,lt3593".
+- label: A label for the LED.
+
+Optional properties:
+- linux,default-trigger :  (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+- default-state:  (optional) The initial state of the LED.
+  see Documentation/devicetree/bindings/leds/common.txt
+
+The controller only suports one LED, hence the properties are all set
+in the root node of the device. If multiple chips of this kind are
+found in a design, each one needs to be handled by its own device node.
+
+Example:
+
+led-controller {
+	compatible = "lltc,lt3593";
+	label = "led-stripe";
+	gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+	linux,default-trigger = "heartbeat";
+};
+
-- 
2.17.1
