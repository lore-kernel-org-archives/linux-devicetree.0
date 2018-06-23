Return-Path: <SRS0=78dS=JJ=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 1/4] dt-bindings: input: touchscreen: add bindings for eeti touchscreen controller
Date: Sat, 23 Jun 2018 17:45:30 +0200
Message-Id: <20180623154533.26901-2-daniel@zonque.org>
In-Reply-To: <20180623154533.26901-1-daniel@zonque.org>
References: <20180623154533.26901-1-daniel@zonque.org>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Describe the bindings for EETI touchscreen controllers.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../bindings/input/touchscreen/eeti.txt       | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt b/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
new file mode 100644
index 000000000000..69c32c286ec7
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
@@ -0,0 +1,31 @@
+Bindings for EETI touchscreen controller
+
+Required properties:
+- compatible:	should be "eeti,exc3000-i2c"
+- reg:		I2C address of the chip. Should be set to <0xa>
+- interrupts:	interrupt to which the chip is connected
+
+Optional properties:
+- attn-gpios:	A handle to a GPIO to check whether interrupt is still
+		latched. This is necessary for platforms that lack
+		support for level-triggered IRQs.
+
+The following optional properties described in touchscreen.txt are
+also supported:
+
+- touchscreen-inverted-x
+- touchscreen-inverted-y
+- touchscreen-swapped-x-y
+
+Example:
+
+i2c-master {
+	touchscreen@a {
+		compatible = "eeti,exc3000-i2c";
+		reg = <0xa>;
+		interrupt-parent = <&gpio>;
+		interrupts = <123 IRQ_TYPE_EDGE_RISING>;
+		attn-gpios = <&gpio 123 GPIO_ACTIVE_HIGH>;
+	};
+};
+
-- 
2.17.1
