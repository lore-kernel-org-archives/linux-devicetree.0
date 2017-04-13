From: Nandor Han <nandor.han@ge.com>
Subject: [PATCH v2 3/4] doc,dts - add XRA1403 DTS binding documentation
Date: Thu, 13 Apr 2017 13:27:50 +0300
Message-ID: <0d970c6a929597804eae3577ed24f57ee23b820a.1492077070.git.nandor.han@ge.com>
References: <cover.1492077070.git.nandor.han@ge.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1492077070.git.nandor.han@ge.com>
In-Reply-To: <cover.1492077070.git.nandor.han@ge.com>
References: <cover.1492077070.git.nandor.han@ge.com>
Sender: linux-gpio-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, davem@davemloft.net, geert@linux-m68k.org, mchehab@kernel.org, daniel.vetter@ffwll.ch, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Nandor Han <nandor.han@ge.com>
List-Id: devicetree@vger.kernel.org

Add the XRA1403 DTS binding documentation.

Signed-off-by: Nandor Han <nandor.han@ge.com>
---
 .../devicetree/bindings/gpio/gpio-xra1403.txt      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xra1403.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xra1403.txt b/Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
new file mode 100644
index 0000000..e13cc39
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
@@ -0,0 +1,46 @@
+GPIO Driver for XRA1403 16-BIT GPIO Expander With Reset Input from EXAR
+
+The XRA1403 is an 16-bit GPIO expander with an SPI interface. Features available:
+	- Individually programmable inputs:
+		- Internal pull-up resistors
+		- Polarity inversion
+		- Individual interrupt enable
+		- Rising edge and/or Falling edge interrupt
+		- Input filter
+	- Individually programmable outputs
+		- Output Level Control
+		- Output Three-State Control
+
+Properties
+----------
+Check documentation for SPI and GPIO controllers regarding properties needed to configure the node.
+
+	- compatible = "exar,xra1403".
+	- reg - SPI id of the device.
+	- gpio-controller - marks the node as gpio.
+	- #gpio-cells - should be two where the first cell is the pin number
+		and the second one is used for optional parameters.
+
+Optional properties:
+-------------------
+	- reset-gpios: in case available used to control the device reset line.
+	- interrupt-controller - marks the node as interrupt controller.
+	- #interrupt-cells - should be two and represents the number of cells
+		needed to encode interrupt source.
+
+Example
+--------
+
+	gpioxra0: gpio@2 {
+		compatible = "exar,xra1403";
+		reg = <2>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <1000000>;
+	};
-- 
2.10.1

