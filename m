From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [RFC] Documentation: pinctrl: Add "pinmux" property
Date: Thu,  6 Apr 2017 12:35:55 +0200
Message-ID: <1491474955-25605-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, geert@linux-m68k.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document "pinmux" property as part of generic pin controller
documentation.
Fix 2 minor typos in documentation while at there.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
Hi Linus and linux-gpio community.

During development of Renesas RZ/A1 pin controller I've been suggested to add
description of "pinmux" property to generic pin controller documentation.
Currently several pin controller drivers are using this property in place of
the already documented "pin"/"group" and "function" ones: stm32, mt65xx, mt8173
and in-review r7s72100, not sure about at91-sama5d2)

Sending this one as RFC to collect feedback. If the change is not rejected is it
worth adding to pin controller core helper functions to parse the newly
documented property, as this commit
<https://patchwork.kernel.org/patch/9411231/>
did for "pinctrl-pin-array" one?

All drivers using "pinmux" exhibit the same behavior which is fine as long as
"pinmux" only accepts a list of u32 parameters.

	...
	pins = of_find_property(node, "pinmux", NULL);
	...
	npins = pins->length / sizeof(u32);
	...
	of_property_read_u32_index(node, "pinmux",
				   i, &pinfunc);
	...

Thanks

---
 .../bindings/pinctrl/pinctrl-bindings.txt          | 46 +++++++++++++++++++---
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index f2ed458..6609389 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -162,8 +162,8 @@ state_2_node_a {
 	pins = "mfio29", "mfio30";
 };

-Optionally an altenative binding can be used if more suitable depending on the
-pin controller hardware. For hardaware where there is a large number of identical
+Optionally an alternative binding can be used if more suitable depending on the
+pin controller hardware. For hardware where there is a large number of identical
 pin controller instances, naming each pin and function can easily become
 unmaintainable. This is especially the case if the same controller is used for
 different pins and functions depending on the SoC revision and packaging.
@@ -198,6 +198,28 @@ registers, and must not be a virtual index of pin instances. The reason for
 this is to avoid mapping of the index in the dts files and the pin controller
 driver as it can change.

+For hardware where pin multiplexing configurations have to be specified for
+each single pin the number of required sub-nodes containing "pin" and
+"function" properties can quickly escalate and become hard to write and
+maintain.
+
+For cases like this, the pin controller driver may use the pinmux helper
+property, where the pin identifier is packed with mux configuration settings
+in a single integer.
+
+The pinmux property accepts an array of integers, each of them describing
+a single pin multiplexing configuration.
+
+pincontroller {
+	state_0_node_a {
+		pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ...;
+	};
+};
+
+Each individual pin controller driver bindings documentation shall specify
+how those values (pin IDs and pin multiplexing configuration) are defined and
+assembled together.
+
 == Generic pin configuration node content ==

 Many data items that are represented in a pin configuration node are common
@@ -210,12 +232,15 @@ structure of the DT nodes that contain these properties.
 Supported generic properties are:

 pins			- the list of pins that properties in the node
-			  apply to (either this or "group" has to be
+			  apply to (either this, "group" or "pinmux" has to be
 			  specified)
 group			- the group to apply the properties to, if the driver
 			  supports configuration of whole groups rather than
-			  individual pins (either this or "pins" has to be
-			  specified)
+			  individual pins (either this, "pins" or "pinmux" has
+			  to be specified)
+pinmux			- the list of numeric pin ids and their mux settings
+			  that properties in the node apply to (either this,
+			  "pins" or "groups" have to be specified)
 bias-disable		- disable any pin bias
 bias-high-impedance	- high impedance mode ("third-state", "floating")
 bias-bus-hold		- latch weakly
@@ -260,6 +285,12 @@ state_2_node_a {
 		bias-pull-up;
 	};
 };
+state_3_node_a {
+	mux {
+		pinmux = <GPIOx_PINm_MUXn>, <GPIOx_PINj_MUXk)>;
+		input-enable;
+	};
+};

 Some of the generic properties take arguments. For those that do, the
 arguments are described below.
@@ -268,6 +299,11 @@ arguments are described below.
   binding for the hardware defines:
   - Whether the entries are integers or strings, and their meaning.

+- pinmux takes a list of pin IDs and mux settings as required argument. The
+  specific bindings for the hardware defines:
+  - How pin IDs and mux settings are defined and assembled together in a single
+    integer.
+
 - bias-pull-up, -down and -pin-default take as optional argument on hardware
   supporting it the pull strength in Ohm. bias-disable will disable the pull.

--
2.7.4
