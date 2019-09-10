From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 2/3] dt-bindings: gpio: Add binding document for xylon logicvc-gpio
Date: Tue, 10 Sep 2019 17:28:54 +0200
Message-ID: <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org

The Xylon LogiCVC display controller exports some GPIOs, which are
exposed as a dedicated driver.

This introduces the associated device-tree bindings documentation.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../bindings/gpio/xylon,logicvc-gpio.txt      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt
new file mode 100644
index 000000000000..4835659cb90b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt
@@ -0,0 +1,48 @@
+Xylon LogiCVC GPIO controller
+
+The Xylon LogiCVC is a display controller that contains a number of GPIO pins,
+meant to be used for controlling display-related signals.
+
+In practice, the GPIOs can be used for any purpose they might be needed for.
+
+The controller exposes GPIOs from the display and power control registers,
+which are mapped by the driver as follows:
+- GPIO[4:0] (display control) mapped to index 0-4
+- EN_BLIGHT (power control) mapped to index 5
+- EN_VDD (power control) mapped to index 6
+- EN_VEE (power control) mapped to index 7
+- V_EN (power control) mapped to index 8
+
+The driver was implemented and tested for version 3.02.a of the controller,
+but should be compatible with version 4 as well.
+
+Required properties:
+- compatible: Should contain "xylon,logicvc-3.02.a-gpio".
+- gpio-controller: Marks the device node as a gpio controller.
+- #gpio-cells: Should be 2. The first cell is the pin number and
+  the second cell is used to specify the gpio polarity:
+    0 = Active high,
+    1 = Active low.
+- gpio,syscon-dev: Syscon phandle representing the logicvc instance.
+
+Example:
+
+	logicvc: logicvc@43c00000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0x43c00000 0x6000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		logicvc_gpio: display-gpio@40 {
+			compatible = "xylon,logicvc-3.02.a-gpio";
+			reg = <0x40 0x40>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&logicvc>;
+		};
+	};
+
+Note: the device-tree node should either be declared as a child of the logicvc
+syscon node or the syscon node should be precised with the gpio,syscon-dev
+property. Both are shown in the example above.
-- 
2.23.0
