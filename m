From: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] arm: sunxi: Add alternative pins for spi0
Date: Wed, 13 Dec 2017 09:44:34 +0200
Message-ID: <1513151074-6888-1-git-send-email-stefan@olimex.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner A10/A13/A20 SoCs have pinmux for spi0
on port C. The patch adds these pins in the respective
dts includes.

Signed-off-by: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi | 10 ++++++++++
 arch/arm/boot/dts/sun5i.dtsi     | 10 ++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 5840f5c..d835741 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -705,11 +705,21 @@
 				bias-pull-up;
 			};
 
+			spi0_pc_pins: spi0-pc-pins {
+				pins = "PC0", "PC1", "PC2";
+				function = "spi0";
+			};
+
 			spi0_pi_pins: spi0-pi-pins {
 				pins = "PI11", "PI12", "PI13";
 				function = "spi0";
 			};
 
+			spi0_cs0_pc_pin: spi0-cs0-pc-pin {
+				pins = "PC23";
+				function = "spi0";
+			};
+
 			spi0_cs0_pi_pin: spi0-cs0-pi-pin {
 				pins = "PI10";
 				function = "spi0";
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 07f2248..9290e26 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -492,6 +492,16 @@
 				function = "nand0";
 			};
 
+			spi0_pins_a: spi0@0 {
+				pins = "PC0", "PC1", "PC2";
+				function = "spi0";
+			};
+
+			spi0_cs0_pins_a: spi0-cs0@0 {
+				pins = "PC3";
+				function = "spi0";
+			};
+
 			spi2_pins_a: spi2@0 {
 				pins = "PE1", "PE2", "PE3";
 				function = "spi2";
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 59655e4..6930527 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -838,11 +838,21 @@
 				function = "spi0";
 			};
 
+			spi0_pins_b: spi0@1 {
+				pins = "PC0", "PC1", "PC2";
+				function = "spi0";
+			};
+
 			spi0_cs0_pins_a: spi0_cs0@0 {
 				pins = "PI10";
 				function = "spi0";
 			};
 
+			spi0_cs0_pins_b: spi0_cs0@1 {
+				pins = "PC23";
+				function = "spi0";
+			};
+
 			spi0_cs1_pins_a: spi0_cs1@0 {
 				pins = "PI14";
 				function = "spi0";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
