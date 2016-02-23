From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: sun8i: Add ir receiver nodes to H3 dtsi
Date: Wed, 24 Feb 2016 00:03:16 +0100
Message-ID: <1456268597-13692-2-git-send-email-hdegoede@redhat.com>
References: <1456268597-13692-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456268597-13692-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The H3 ir receiver is completely compatible with the one found in the A31.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 3fdf213..c2f63c5 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -307,6 +307,14 @@
 			clock-indices = <0>, <1>;
 			clock-output-names = "apb0_pio", "apb0_ir";
 		};
+
+		ir_clk: ir_clk@01f01454 {
+			compatible = "allwinner,sun4i-a10-mod0-clk";
+			reg = <0x01f01454 0x4>;
+			#clock-cells = <0>;
+			clocks = <&osc32k>, <&osc24M>;
+			clock-output-names = "ir";
+		};
 	};
 
 	soc {
@@ -632,6 +640,16 @@
 			#reset-cells = <1>;
 		};
 
+		ir: ir@01f02000 {
+			compatible = "allwinner,sun5i-a13-ir";
+			clocks = <&apb0_gates 1>, <&ir_clk>;
+			clock-names = "apb", "ir";
+			resets = <&apb0_reset 1>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x01f02000 0x40>;
+			status = "disabled";
+		};
+
 		r_pio: pinctrl@01f02c00 {
 			compatible = "allwinner,sun8i-h3-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
@@ -642,6 +660,13 @@
 			#gpio-cells = <3>;
 			interrupt-controller;
 			#interrupt-cells = <3>;
+
+			ir_pins_a: ir@0 {
+				allwinner,pins = "PL11";
+				allwinner,function = "s_cir_rx";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
 		};
 	};
 };
-- 
2.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
