From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v1 2/5] dt-bindings: clock: renesas,r9a06g032-pinctrl: documentation
Date: Thu, 14 Jun 2018 12:00:18 +0100
Message-ID: <1528974029-29617-3-git-send-email-michel.pollet@bp.renesas.com>
References: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Renesas R9A06G032 PINCTRL node description.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
---
 .../bindings/pinctrl/renesas,r9a06g032-pinctrl.txt | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,r9a06g032-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a06g032-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,r9a06g032-pinctrl.txt
new file mode 100644
index 0000000..f63696f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a06g032-pinctrl.txt
@@ -0,0 +1,124 @@
+Renesas RZ/A1 combined Pin and GPIO controller
+
+The Renesas SoCs of the RZ/A1 family feature a combined Pin and GPIO controller,
+named "Ports" in the hardware reference manual.
+Pin multiplexing and GPIO configuration is performed on a per-pin basis
+writing configuration values to per-port register sets.
+Each "port" features up to 16 pins, each of them configurable for GPIO
+function (port mode) or in alternate function mode.
+Up to 8 different alternate function modes exist for each single pin.
+
+Pin controller node
+-------------------
+
+Required properties:
+  - compatible: should be:
+    - "renesas,r9a05g032-pinctrl"
+  - reg
+    address base and length of the memory area where the pin controller
+    hardware is mapped to.
+
+Example:
+	pinctrl: pinctrl@40067000 {
+		compatible = "renesas,r9a06g032-pinctrl";
+		reg = <0x40067000 0x1000>, <0x51000000 0x800>;
+		clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
+		clock-names = "bus";
+		status = "okay";
+	};
+
+
+Sub-nodes
+---------
+  The child nodes of the pin controller node describe a pin multiplexing
+  group that can be used by driver nodes.
+
+  A pin multiplexing sub-node describes how to configure a set of
+  (or a single) pin in some desired alternate function mode.
+  A single sub-node may define several pin configurations.
+
+  The allowed generic formats for a pin multiplexing sub-node are the
+  following ones:
+
+  Client sub-nodes shall refer to pin multiplexing sub-nodes using the phandle
+  of the most external one.
+
+  Eg.
+
+  client-1 {
+      ...
+      pinctrl-0 = <&node-1>;
+      ...
+  };
+
+  client-2 {
+      ...
+      pinctrl-0 = <&node-2>;
+      ...
+  };
+
+  Required properties:
+    - renesas,rzn1-pinctrl:
+      Array of integers representing each 'pin' and it's configuration.
+
+      A 'pin number' does not correspond 1:1 to the hardware manual notion of
+      PL_GPIO directly. Numbers 0...169 are PL_GPIOs, however there is also two
+      extra 170 and 171 that corresponds to the MDIO0 and MDIO1 bus config.
+
+      A 'function' also does not correspond 1:1 to the hardware manual. There
+      are 2 levels of pin muxing, Level 1, level 2 -- to this are added the
+      MDIO configurations.
+
+      Helper macros to ease assembling the pin index and function identifier
+      are provided by the pin controller header file at:
+      <include/dt-bindings/pinctrl/r9a06g032-pinctrl.h>
+
+Example #1:
+  A simple case configuring only the function for a given 'pin' works as follow:
+	#include <include/dt-bindings/pinctrl/r9a06g032-pinctrl.h>
+	&pinctrl {
+		pinsuart0: pinsuart0 {
+			renesas,rzn1-pinmux-ids = <
+				RZN1_MUX(103, UART0_I)	/* UART0_TXD */
+				RZN1_MUX(104, UART0_I)	/* UART0_RXD */
+			>;
+		};
+	};
+
+	&uart0 {
+		status = "okay";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinsuart0>;
+	};
+  Note that in this case the other functions of the pins are not changed.
+
+Example #2:
+  Here we also set the pullups on the RXD pin:
+	&pinctrl {
+		pinsuart0: pinsuart0 {
+			renesas,rzn1-pinmux-ids = <
+				RZN1_MUX(103, UART0_I)	/* UART0_TXD */
+				RZN1_MUX_PUP(104, UART0_I)	/* UART0_RXD */
+			>;
+		};
+	};
+  There are many alternative macros to set the pullup/down/none and the drive
+  strenght in the r9a06g032-pinctrl.h header file.
+
+Example #3:
+  The Soc has two configurable MDIO muxes, these can also be configured
+  with this interface using the 'special' MDIO constants:
+
+	&pinctrl {
+		mdio_mux: mdiomux {
+			renesas,rzn1-pinmux-ids = <
+				RZN1_MUX(RZN1_MDIO_BUS0, RZN1_FUNC_MDIO_MUX_MAC0)
+				RZN1_MUX(RZN1_MDIO_BUS1, RZN1_FUNC_MDIO_MUX_SWITCH)
+			>;
+		};
+	};
+  Clearly the pull/up/none and drive constants will be ignored, even if
+  specified.
+
+Note that Renesas provides an extensive webapp that can generates a device tree
+file for your board. See their website for this part number for details.
-- 
2.7.4
