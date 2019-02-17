Return-Path: <SRS0=whS5=QY=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V6 1/9] dt-binding: can: mcp25xxfd: document device tree bindings
Date: Sun, 17 Feb 2019 11:01:54 +0000
Message-Id: <20190217110202.31986-2-kernel@martin.sperl.org>
In-Reply-To: <20190217110202.31986-1-kernel@martin.sperl.org>
References: <20190217110202.31986-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>
List-ID: <devicetree@vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

Add device-tree bindings for Microcip CanFD Controller mcp2517fd

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
Reviewed-by: Rob Herring <robh@kernel.org>
--
Changelog:
  V1 -> V2: new more generic name based on feedback from microchip
            cleanup of dt custom properties removing (most) gpio functions
  V2 -> V3: added vendor-prefix for gpio-opendrain
            s/_/-/
            added gpio-controller
  V3 -> V4: resend
            added: Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/net/can/microchip,mcp25xxfd.txt       | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.txt

diff --git a/Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.txt b/Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.txt
new file mode 100644
index 000000000000..b388b3eb3905
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.txt
@@ -0,0 +1,32 @@
+* Microchip MCP2517 stand-alone CAN controller device tree bindings
+
+Required properties:
+ - compatible: Should be one of the following:
+   - "microchip,mcp2517fd" for MCP2517fd.
+ - reg: SPI chip select.
+ - clocks: The clock feeding the CAN controller.
+ - interrupt-parent: The parent interrupt controller.
+ - interrupts: Should contain IRQ line for the CAN controller.
+ - gpio-controller: Marks the device node as a GPIO controller
+
+Optional properties:
+ - vdd-supply: Regulator that powers the CAN controller.
+ - xceiver-supply: Regulator that powers the CAN transceiver.
+ - microchip,clock-out-div = <0|1|2|4|10>: Clock output pin divider
+					   0 = Start of Frame output
+					   default: 10
+ - microchip,clock-div2: bool: divide the internal clock by 2
+ - microchip,gpio-open-drain: bool: enable open-drain for all pins
+                                    (except cantx)
+
+Example:
+	can0: can@1 {
+		compatible = "microchip,mcp2517fd";
+		reg = <1>;
+		clocks = <&clk24m>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <13 0x8>;
+		vdd-supply = <&reg5v0>;
+		xceiver-supply = <&reg5v0>;
+		gpio-controller;
+	};
--
2.11.0
