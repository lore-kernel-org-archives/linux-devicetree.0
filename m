From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/4] documentation: Fix pinctrl documentation for Meson8 / Meson8b
Date: Tue,  1 Mar 2016 23:04:36 +0100
Message-ID: <1456869876-19320-5-git-send-email-carlo@caione.org>
References: <1456869876-19320-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456869876-19320-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

Fix pin controller documentation with the new compatibles.

Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  | 36 +++-------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index 3f6a524..51a8ebb 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -1,13 +1,14 @@
 == Amlogic Meson pinmux controller ==
 
 Required properties for the root node:
- - compatible: "amlogic,meson8-pinctrl" or "amlogic,meson8b-pinctrl"
+ - compatible: "amlogic,meson8-cbus-pinctrl", "amlogic,meson8b-cbus-pinctrl",
+   "amlogic,meson8-aobus-pinctrl" or "amlogic,meson8b-aobus-pinctrl"
  - reg: address and size of registers controlling irq functionality
 
 === GPIO sub-nodes ===
 
-The 2 power domains of the controller (regular and always-on) are
-represented as sub-nodes and each of them acts as a GPIO controller.
+Each power domain of the controller (regular and always-on) is
+represented as a sub-node and it acts as a GPIO controller.
 
 Required properties for sub-nodes are:
  - reg: should contain address and size for mux, pull-enable, pull and
@@ -18,10 +19,6 @@ Required properties for sub-nodes are:
  - gpio-controller: identifies the node as a gpio controller
  - #gpio-cells: must be 2
 
-Valid sub-node names are:
- - "banks" for the regular domain
- - "ao-bank" for the always-on domain
-
 === Other sub-nodes ===
 
 Child nodes without the "gpio-controller" represent some desired
@@ -45,7 +42,7 @@ pinctrl-bindings.txt
 === Example ===
 
 	pinctrl: pinctrl@c1109880 {
-		compatible = "amlogic,meson8-pinctrl";
+		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0xc1109880 0x10>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -61,15 +58,6 @@ pinctrl-bindings.txt
 			#gpio-cells = <2>;
                };
 
-		gpio_ao: ao-bank@c1108030 {
-			reg = <0xc8100014 0x4>,
-			      <0xc810002c 0x4>,
-			      <0xc8100024 0x8>;
-			reg-names = "mux", "pull", "gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
 		nand {
 			mux {
 				groups = "nand_io", "nand_io_ce0", "nand_io_ce1",
@@ -79,18 +67,4 @@ pinctrl-bindings.txt
 				function = "nand";
 			};
 		};
-
-		uart_ao_a {
-			mux {
-				groups = "uart_tx_ao_a", "uart_rx_ao_a",
-					 "uart_cts_ao_a", "uart_rts_ao_a";
-				function = "uart_ao";
-			};
-
-			conf {
-				pins = "GPIOAO_0", "GPIOAO_1",
-				       "GPIOAO_2", "GPIOAO_3";
-				bias-disable;
-			};
-		};
 	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
