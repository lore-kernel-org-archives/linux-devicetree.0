From: Nandor Han <nandor.han@ge.com>
Subject: [PATCH 2/3] doc,dts - add XRA1403 DTS binding documentation
Date: Mon, 27 Mar 2017 09:23:01 +0300
Message-ID: <39ba92bacf48da957f8f85d5cb11d3254fe3d68f.1490595641.git.nandor.han@ge.com>
References: <cover.1490595641.git.nandor.han@ge.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1490595641.git.nandor.han@ge.com>
In-Reply-To: <cover.1490595641.git.nandor.han@ge.com>
References: <cover.1490595641.git.nandor.han@ge.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Nandor Han <nandor.han@ge.com>
List-Id: devicetree@vger.kernel.org

Add the XRA1403 DTS binding documentation.

Signed-off-by: Nandor Han <nandor.han@ge.com>
---
 .../devicetree/bindings/gpio/gpio-xra1403.txt      | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xra1403.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xra1403.txt b/Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
new file mode 100644
index 0000000..ccf5337
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
@@ -0,0 +1,37 @@
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
+	- reg = SPI id of the device.
+	- gpio-controller: mark the node as gpio.
+
+Optional properties:
+-------------------
+	- reset-gpios: in case available used to control the device reset line.
+
+Example
+--------
+
+	gpioxra0: gpio@2 {
+		compatible = "exar,xra1403";
+		reg = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <1000000>;
+		status = "okay";
+	};
-- 
2.10.1

