Return-Path: <SRS0=r4+v=L3=linaro.org=linus.walleij@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: OF: Cut painful BNF experiments from bindings
Date: Thu, 13 Sep 2018 09:47:02 +0200
Message-Id: <20180913074702.5724-1-linus.walleij@linaro.org>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@kernel.crashing.org>
List-ID: <devicetree@vger.kernel.org>

In 2011 the commit bf859f84a19f
("gpio/dt: Refine GPIO device tree binding") introduced an
experimental BNF notation for defining a regular grammar for
the GPIO phandles used by different devices.

This was an interesting approach, and shows that we have long
nutured the idea to formally verify device tree files using
regular grammar.

Most if not all other bindings use natural language to define
the bindings, and the recent thinking for verifying device
tree files is to use JSON schemas in separate definitions.

Cut the BNF business and replace it with natural language
so that it becomes more human-readable for now.

Cc: devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Kumar Gala <galak@kernel.crashing.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/gpio/gpio.txt         | 114 ++++++++++--------
 1 file changed, 64 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 0451f612ff2b..3afaa396adf7 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -1,18 +1,9 @@
 Specifying GPIO information for devices
-============================================
+=======================================
 
 1) gpios property
 -----------------
 
-Nodes that makes use of GPIOs should specify them using one or more
-properties, each containing a 'gpio-list':
-
-	gpio-list ::= <single-gpio> [gpio-list]
-	single-gpio ::= <gpio-phandle> <gpio-specifier>
-	gpio-phandle : phandle to gpio controller node
-	gpio-specifier : Array of #gpio-cells specifying specific gpio
-			 (controller specific)
-
 GPIO properties should be named "[<name>-]gpios", with <name> being the purpose
 of this GPIO for the device. While a non-existent <name> is considered valid
 for compatibility reasons (resolving to the "gpios" property), it is not allowed
@@ -236,46 +227,40 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
 
 Some or all of the GPIOs provided by a GPIO controller may be routed to pins
 on the package via a pin controller. This allows muxing those pins between
-GPIO and other functions.
+GPIO and other functions. It is a fairly common practice among silicon
+engineers.
+
+2.2) Ordinary (numerical) GPIO ranges
+-------------------------------------
 
 It is useful to represent which GPIOs correspond to which pins on which pin
-controllers. The gpio-ranges property described below represents this, and
-contains information structures as follows:
-
-	gpio-range-list ::= <single-gpio-range> [gpio-range-list]
-	single-gpio-range ::= <numeric-gpio-range> | <named-gpio-range>
-	numeric-gpio-range ::=
-			<pinctrl-phandle> <gpio-base> <pinctrl-base> <count>
-	named-gpio-range ::= <pinctrl-phandle> <gpio-base> '<0 0>'
-	pinctrl-phandle : phandle to pin controller node
-	gpio-base : Base GPIO ID in the GPIO controller
-	pinctrl-base : Base pinctrl pin ID in the pin controller
-	count : The number of GPIOs/pins in this range
-
-The "pin controller node" mentioned above must conform to the bindings
-described in ../pinctrl/pinctrl-bindings.txt.
-
-In case named gpio ranges are used (ranges with both <pinctrl-base> and
-<count> set to 0), the property gpio-ranges-group-names contains one string
-for every single-gpio-range in gpio-ranges:
-	gpiorange-names-list ::= <gpiorange-name> [gpiorange-names-list]
-	gpiorange-name : Name of the pingroup associated to the GPIO range in
-			the respective pin controller.
-
-Elements of gpiorange-names-list corresponding to numeric ranges contain
-the empty string. Elements of gpiorange-names-list corresponding to named
-ranges contain the name of a pin group defined in the respective pin
-controller. The number of pins/GPIOs in the range is the number of pins in
-that pin group.
+controllers. The gpio-ranges property described below represents this with
+a discrete set of ranges mapping pins from the pin controller local number space
+to pins in the GPIO controller local number space.
+
+The format is: <[pin controller phandle], [GPIO controller offset],
+                [pin controller offset], [number of pins]>;
+
+The GPIO controller offset pertains to the GPIO controller node containing the
+range definition.
+
+The pin controller node referenced by the phandle must conform to the bindings
+described in pinctrl/pinctrl-bindings.txt.
+
+Each offset runs from 0 to N. It is perfectly fine to pile any number of
+ranges with just one pin-to-GPIO line mapping if the ranges are concocted, but
+in practice these ranges are often lumped in discrete sets.
+
+Example:
+
+    gpio-ranges = <&foo 0 20 10>, <&bar 10 50 20>;
+
+This means:
+- pins 20..29 on pin controller "foo" is mapped to GPIO line 0..9 and
+- pins 50..69 on pin controller "bar" is mapped to GPIO line 10..29
 
-Previous versions of this binding required all pin controller nodes that
-were referenced by any gpio-ranges property to contain a property named
-#gpio-range-cells with value <3>. This requirement is now deprecated.
-However, that property may still exist in older device trees for
-compatibility reasons, and would still be required even in new device
-trees that need to be compatible with older software.
 
-Example 1:
+Verbose example:
 
 	qe_pio_e: gpio-controller@1460 {
 		#gpio-cells = <2>;
@@ -289,7 +274,28 @@ Here, a single GPIO controller has GPIOs 0..9 routed to pin controller
 pinctrl1's pins 20..29, and GPIOs 10..29 routed to pin controller pinctrl2's
 pins 50..69.
 
-Example 2:
+
+2.3) GPIO ranges from named pin groups
+--------------------------------------
+
+It is also possible to use pin groups for gpio ranges when pin groups are the
+easiest and most convenient mapping.
+
+Both both <pinctrl-base> and <count> must set to 0 when using named pin groups
+names.
+
+The property gpio-ranges-group-names must contain exactly one string for each
+range.
+
+Elements of gpio-ranges-group-names must contain the name of a pin group
+defined in the respective pin controller. The number of pins/GPIO lines in the
+range is the number of pins in that pin group. The number of pins of that
+group is defined int the implementation and not in the device tree.
+
+If numerical and named pin groups are mixed, the string corresponding to a
+numerical pin range in gpio-ranges-group-names must be empty.
+
+Example:
 
 	gpio_pio_i: gpio-controller@14b0 {
 		#gpio-cells = <2>;
@@ -306,6 +312,14 @@ Example 2:
 						"bar";
 	};
 
-Here, three GPIO ranges are defined wrt. two pin controllers. pinctrl1 GPIO
-ranges are defined using pin numbers whereas the GPIO ranges wrt. pinctrl2
-are named "foo" and "bar".
+Here, three GPIO ranges are defined referring to two pin controllers.
+
+pinctrl1 GPIO ranges are defined using pin numbers whereas the GPIO ranges
+in pinctrl2 are defined using the pin groups named "foo" and "bar".
+
+Previous versions of this binding required all pin controller nodes that
+were referenced by any gpio-ranges property to contain a property named
+#gpio-range-cells with value <3>. This requirement is now deprecated.
+However, that property may still exist in older device trees for
+compatibility reasons, and would still be required even in new device
+trees that need to be compatible with older software.
-- 
2.17.1
