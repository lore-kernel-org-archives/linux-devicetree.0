From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH v3 2/2] pinctrl: asm9260: add pinctrl add device tree bindings documentation
Date: Sun,  5 Apr 2015 08:26:25 +0200
Message-ID: <1428215185-14190-3-git-send-email-linux@rempel-privat.de>
References: <1427476243.2334.12.camel@x220>
 <1428215185-14190-1-git-send-email-linux@rempel-privat.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428215185-14190-1-git-send-email-linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings documentation for Alphascale asm9260 pin controller

Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
---
 .../pinctrl/alphascale,asm9260-pinctrl.txt         | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/alphascale,asm9260-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/alphascale,asm9260-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/alphascale,asm9260-pinctrl.txt
new file mode 100644
index 0000000..dbeea4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/alphascale,asm9260-pinctrl.txt
@@ -0,0 +1,76 @@
+* Alphascale ASM9260 SoC pinctrl core driver
+
+The pinctrl driver enables Alphascale ASM9260 to configure pin multiplexing
+to a specific function.
+
+Required properties for pinctrl driver:
+- compatible: "alphascale,asm9260-pinctrl"
+- reg: Register base of the MPP block and length.
+- clocks: clock ids.
+- clock-names:
+	* 1 "ahb" : AHB gating clock.
+
+Please refer to pinctrl-bindings.txt in this directory for details of the
+common pinctrl bindings used by client devices, including the meaning of the
+phrase "pin configuration node".
+
+The pin configuration nodes act as a container for an arbitrary number of
+subnodes. Each of these subnodes represents some desired configuration for a
+pin or a list of pins. This configuration can include the
+mux function to select on those pin(s), and various pin configuration
+parameters, as listed below.
+
+SUBNODES:
+
+The name of each subnode is not important; all subnodes should be enumerated
+and processed purely based on their content.
+
+Each subnode only affects those parameters that are explicitly listed. In
+other words, a subnode that lists a mux function but no pin configuration
+parameters implies no information about any pin configuration parameters.
+Similarly, a pin subnode that describes a pullup parameter implies no
+information about e.g. the mux function.
+
+The following generic properties as defined in pinctrl-bindings.txt are valid
+to specify in a pin configuration subnode:
+pins			- the list of pins that properties in the node
+			  apply to (either this or "groups" has to be
+			  specified)
+function		- the mux function to select
+bias-disable		- disable any pin bias
+bias-pull-up		- pull up the pin. Supported only on GPIO0_* pins.
+bias-pull-down		- pull down the pin. Supported on all pins except of GPIO0_*.
+
+Examples:
+
+pinctrl: pinctrl@80044000 {
+	compatible = "alphascale,asm9260-pinctrl";
+	reg = <0x80044000 0x400>;
+	clocks = <&acc CLKID_AHB_IOCONFIG>;
+	clock-names = "ahb";
+
+        nand_fc0_pins_a: nand_fc0 {
+                nand_main_gr {
+                        pins = "GPIO11_0", "GPIO11_1", "GPIO11_2",
+                               "GPIO11_3", "GPIO11_4", "GPIO11_6",
+                               "GPIO12_0", "GPIO12_1", "GPIO12_2",
+                               "GPIO12_3", "GPIO12_4", "GPIO12_5",
+                               "GPIO12_6", "GPIO12_7";
+                        function = "nand0";
+                        bias-disable;
+                };
+        };
+};
+
+nand_controller0 {
+        status = "okay";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        nand-ecc-strength = <4>;
+        nand-ecc-step-size = <512>;
+        nand-max-chips = <1>;
+        nand-on-flash-bbt;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&nand_fc0_pins_a>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
