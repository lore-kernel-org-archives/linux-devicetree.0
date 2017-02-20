From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/7] Documentation: devicetree: bindings: Add RZ/A1 pinctrl binding documentation
Date: Mon, 20 Feb 2017 18:13:03 +0100
Message-ID: <1487610788-6939-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487610788-6939-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device tree bindings documentation for Renesas RZ/A1 gpio and pin
controller.

Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
---
 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
new file mode 100644
index 0000000..1136146
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
@@ -0,0 +1,114 @@
+Renesas RZ/A1 combined Pin and GPIO controller
+
+Renesas SoCs of RZ/A1 family feature a combined Pin and GPIO controller
+hardware controller, named "Ports" in the hardware reference manual.
+Pin multiplexing and GPIO configuration is performed on a per-pin base
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
+  - #pinctrl-cells
+    as defined by pinctrl-bindings.txt, this is the number
+    of cells (in addition to pin index) required to configure a single pin.
+    Shall be set to 1.
+
+  - reg
+    address base and length of the memory area where pin controller
+    hardware is mapped to.
+
+Example:
+Pin controller node for RZ/A1H SoC (r7s72100)
+
+pinctrl: pinctrl@fcfe3000 {
+	compatible = "renesas,r7s72100-ports";
+
+	#pinctrl-cells = <1>;
+
+	reg = <0xfcfe3000 0x4248>;
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
+  A single sub-node may define several pin configurations groups.
+
+  Required properties:
+    - renesas,pins
+      describes an array of pin multiplexing configurations.
+      When a pin has to be configured in alternate function mode, use this
+      property to identify the pin by its global index, and provide its
+      alternate function configuration description along with it.
+      When multiple pins are required to be configured as part of the same
+      alternate function (odds are single-pin alternate functions exist) they
+      shall be specified as members of the same argument list of a single
+      "renesas-pins" property.
+      Helper macros to ease calculating the pin index from its position
+      (port where it sits on and pin offset), and alternate function
+      configuration options are provided in pin controller header file at:
+      include/dt-bindings/pinctrl/r7s72100-pinctrl.h
+
+  Example:
+  A serial communication interface with a TX output pin and a RX input pin.
+  The RX pin requires input capabilities.
+
+  &pinctrl {
+	scif2_pins: serial2 {
+		renesas,pins = <PIN(3, 0) 6>,
+			       <PIN(3, 2) (4 | INPUT_EN)>;
+	};
+  }
+
+  Pin #0 on port #3 is configured in alternate function #6.
+  Pin #2 on port #3 is configured in alternate function #4 with input enabled.
+
+- GPIO controller sub-nodes:
+  Each port of r7s72100 pin controller hardware is itself a gpio controller.
+  Different SoCs have different number of available pins per port, but
+  generally speaking, each of them can be configured in GPIO ("port") mode
+  on this hardware.
+  Describe gpio-controllers using sub-nodes with the following properties.
+
+  Required properties:
+    - gpio-controller
+      empty property as defined by gpio bindings documentation.
+    - #gpio-cells
+      number of cells required to identify and configure a GPIO.
+      Shall be 2.
+    - gpio-ranges
+      Describes a gpio controller specifying its specific pin base, the pin
+      base in the global pin numbering space, and the number of controlled
+      pins, as defined by gpio bindings documentation. Refer to this file
+      for a more detailed description.
+
+  Example:
+  A gpio controller node, controlling 16 pins indexed starting from 0.
+  The gpio controller base in the global pin indexing space is pin 48, thus
+  pins [0 - 15] on this controller map to pins [48 - 63] in the global pin
+  indexing space.
+
+  port3: gpio@3 {
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
