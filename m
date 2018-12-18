From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v3 1/2] dt-bindings: gpio: Add bindings for Cadence GPIO
Date: Tue, 18 Dec 2018 16:10:41 +0000
Message-ID: <20181218161042.16366-2-jank@cadence.com>
References: <20181218161042.16366-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218161042.16366-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch adds a DT binding documentation for
Cadence GPIO controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 .../devicetree/bindings/gpio/cdns,gpio.txt         | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/cdns,gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
new file mode 100644
index 000000000..c87a47827
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
@@ -0,0 +1,44 @@
+Cadence GPIO controller bindings
+
+Required properties:
+- compatible: should be "cdns,gpio-r1p02".
+- reg: the register base address and size.
+- #gpio-cells: should be 2.
+	* first cell is the GPIO number.
+	* second cell specifies the GPIO flags, as defined in
+		<dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
+		and GPIO_ACTIVE_LOW flags are supported.
+- gpio-controller: marks the device as a GPIO controller.
+- clocks: should contain one entry referencing the peripheral clock driving
+	the GPIO controller.
+
+Optional properties:
+- ngpios: integer number of gpio lines supported by this controller, up to 32.
+- interrupt-parent: phandle of the parent interrupt controller.
+- interrupts: interrupt specifier for the controllers interrupt.
+- interrupt-controller: marks the device as an interrupt controller. When
+	defined, interrupts, interrupt-parent and #interrupt-cells
+	are required.
+- interrupt-cells: should be 2.
+	* first cell is the GPIO number you want to use as an IRQ source.
+	* second cell specifies the IRQ type, as defined in
+		<dt-bindings/interrupt-controller/irq.h>.
+		Currently only level sensitive IRQs are supported.
+
+
+Example:
+	gpio0: gpio-controller@fd060000 {
+		compatible = "cdns,gpio-r1p02";
+		reg =<0xfd060000 0x1000>;
+
+		clocks = <&gpio_clk>;
+
+		interrupt-parent = <&gic>;
+		interrupts = <0 5 IRQ_TYPE_LEVEL_HIGH>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
-- 
2.15.0
