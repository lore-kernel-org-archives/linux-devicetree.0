From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v4 3/9] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Wed,  5 Apr 2017 16:07:21 +0200
Message-ID: <1491401247-7030-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add device tree bindings documentation for Renesas RZ/A1 gpio and pin
controller.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 218 +++++++++++++++++++++
 1 file changed, 218 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
new file mode 100644
index 0000000..46584ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
@@ -0,0 +1,218 @@
+Renesas RZ/A1 combined Pin and GPIO controller
+
+The Renesas SoCs of RZ/A1 family feature a combined Pin and GPIO controller,
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
+  - compatible
+    this shall be "renesas,r7s72100-ports".
+
+  - reg
+    address base and length of the memory area where pin controller
+    hardware is mapped to.
+
+Example:
+Pin controller node for RZ/A1H SoC (r7s72100)
+
+pinctrl: pin-controller@fcfe3000 {
+	compatible = "renesas,r7s72100-ports";
+
+	reg = <0xfcfe3000 0x4230>;
+};
+
+Sub-nodes
+---------
+
+The child nodes of the pin controller node describe a pin multiplexing
+function or a gpio controller alternatively.
+
+- Pin multiplexing sub-nodes:
+  A pin multiplexing sub-node describes how to configure a set of
+  (or a single) pin in some desired alternate function mode.
+  A single sub-node may define several pin configurations.
+  Some alternate functions require special pin configuration flags to be
+  supplied along with the alternate function configuration number.
+  When hardware reference manual specifies a pin function to be either
+  "bi-directional" or "software IO driven", use the generic properties from
+  <include/linux/pinctrl/pinconf_generic.h> header file to instruct the
+  pin controller to perform the desired pin configuration operations.
+  Please refer to pinctrl-bindings.txt to get to know more on generic
+  pin properties usage.
+
+  The allowed generic formats for a pin multiplexing sub-node are the
+  following ones:
+
+  node-1 {
+      pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
+      GENERIC_PINCONFIG;
+  };
+
+  node-2 {
+      sub-node-1 {
+          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
+          GENERIC_PINCONFIG;
+      };
+
+      sub-node-2 {
+          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
+          GENERIC_PINCONFIG;
+      };
+
+      ...
+
+      sub-node-n {
+          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
+          GENERIC_PINCONFIG;
+      };
+  };
+
+  Use the second format when pins part of the same logical group need to have
+  different generic pin configuration flags applied.
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
+    - pinmux:
+      integer array representing pin number and pin multiplexing configuration.
+      When a pin has to be configured in alternate function mode, use this
+      property to identify the pin by its global index, and provide its
+      alternate function configuration number along with it.
+      When multiple pins are required to be configured as part of the same
+      alternate function they shall be specified as members of the same
+      argument list of a single "pinmux" property.
+      Helper macros to ease assembling the pin index from its position
+      (port where it sits on and pin number) and alternate function identifier
+      are provided by the pin controller header file at:
+      <include/dt-bindings/pinctrl/r7s72100-pinctrl.h>
+      Integers values in "pinmux" argument list are assembled as:
+      ((PORT * 16 + PIN) | MUX_FUNC << 16)
+
+  Supported generic properties:
+    - bi-directional:
+      for pins requiring bi-directional operations.
+    - input-enable:
+      for pins requiring software driven IO input operations.
+    - output-enable:
+      for pins requiring software driver IO output operations.
+
+  Example:
+  A serial communication interface with a TX output pin and an RX input pin.
+
+  &pinctrl {
+	scif2_pins: serial2 {
+		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
+	};
+  };
+
+  Pin #0 on port #3 is configured as alternate function #6.
+  Pin #2 on port #3 is configured as alternate function #4.
+
+  Example 2:
+  I2c master: both SDA and SCL pins need bi-directional operations
+
+  &pinctrl {
+	i2c2_pins: i2c2 {
+		pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
+		bi-directional;
+	};
+  };
+
+  Pin #4 on port #1 is configured as alternate function #1.
+  Pin #5 on port #1 is configured as alternate function #1.
+  Both need to work in bi-directional mode.
+  The hardware reference manual specifies when a pin has to be configured to
+  work in bi-directional mode.
+
+  Example 3:
+  Multi-function timer input and output compare pins.
+  Configure TIOC0A as software driven input and TIOC0B as software driven
+  output.
+
+  &pinctrl {
+	tioc0_pins: tioc0 {
+		tioc0_input_pins {
+			pinumx = <RZA1_PINMUX(4, 0, 2)>;
+			input-enable;
+		};
+
+		tioc0_output_pins {
+			pinmux = <RZA1_PINMUX(4, 1, 1)>;
+			output-enable;
+		};
+	};
+  };
+
+
+  &tioc0 {
+	...
+	pinctrl-0 = <&tioc0_pins>;
+	...
+  };
+
+  Pin #0 on port #4 is configured as alternate function #2 with IO direction
+  specified by software as input.
+  Pin #1 on port #4 is configured as alternate function #1 with IO direction
+  specified by software as output.
+  The hardware reference manual specifies when a pin has to be configured with
+  input/output direction specified by software.
+
+- GPIO controller sub-nodes:
+  Each port of the r7s72100 pin controller hardware is itself a gpio controller.
+  Different SoCs have different number of available pins per port, but
+  generally speaking, each of them can be configured in GPIO ("port") mode
+  on this hardware.
+  Describe gpio-controllers using sub-nodes with the following properties.
+
+  Required properties:
+    - gpio-controller
+      empty property as defined by the gpio bindings documentation.
+    - #gpio-cells
+      number of cells required to identify and configure a GPIO.
+      Shall be 2.
+    - gpio-ranges
+      Describes a gpio controller specifying its specific pin base, the pin
+      base in the global pin numbering space, and the number of controlled
+      pins, as defined by the gpio bindings documentation. Refer to this file
+      for a more detailed description.
+
+  Example:
+  A gpio controller node, controlling 16 pins indexed from 0.
+  The gpio controller base in the global pin indexing space is pin 48, thus
+  pins [0 - 15] on this controller map to pins [48 - 63] in the global pin
+  indexing space.
+
+  port3: gpio-3 {
+	gpio-controller;
+	#gpio-cells = <2>;
+	gpio-ranges = <&pinctrl 0 48 16>;
+  };
+
+  A device node willing to use pins controlled by this gpio controller, shall
+  refer to it as follows:
+
+  led1 {
+	gpios = <&port3 10 GPIO_ACTIVE_LOW>;
+  };
--
2.7.4

