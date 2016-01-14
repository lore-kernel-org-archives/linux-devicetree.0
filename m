From: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [linux-sunxi][PATCH v3 5/5] ARM: dts: sun4i: Itead Iteaduino to use common code
Date: Thu, 14 Jan 2016 11:15:55 +0100
Message-ID: <1452766555-16409-6-git-send-email-codekipper@gmail.com>
References: <1452766555-16409-1-git-send-email-codekipper@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452766555-16409-1-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Convert the Itead Iteaduino A10 to use the new common itead core dtsi.

Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../boot/dts/sun4i-a10-itead-iteaduino-plus.dts    | 93 +---------------------
 1 file changed, 2 insertions(+), 91 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10-itead-iteaduino-plus.dts b/arch/arm/boot/dts/sun4i-a10-itead-iteaduino-plus.dts
index 985e155..b84eca3 100644
--- a/arch/arm/boot/dts/sun4i-a10-itead-iteaduino-plus.dts
+++ b/arch/arm/boot/dts/sun4i-a10-itead-iteaduino-plus.dts
@@ -1,5 +1,6 @@
 /*
  * Copyright 2015 Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>
+ * Copyright 2015 - Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
  *
  * This file is dual-licensed: you can use it either under the terms
  * of the GPL or the X11 license, at your option. Note that this dual
@@ -41,23 +42,11 @@
  */
 
 /dts-v1/;
-#include "sun4i-a10.dtsi"
-#include "sunxi-common-regulators.dtsi"
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/sun4i-a10.h>
+#include "sun4i-a10-itead-core.dtsi"
 
 / {
 	model = "Iteaduino Plus A10";
 	compatible = "itead,iteaduino-plus-a10", "allwinner,sun4i-a10";
-
-	aliases {
-		serial0 = &uart0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
 };
 
 &ahci {
@@ -65,18 +54,6 @@
 	status = "okay";
 };
 
-&cpu0 {
-	cpu-supply = <&reg_dcdc2>;
-};
-
-&ehci0 {
-	status = "okay";
-};
-
-&ehci1 {
-	status = "okay";
-};
-
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_pins_a>;
@@ -88,17 +65,6 @@
 	status = "okay";
 };
 
-&i2c0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c0_pins_a>;
-	status = "okay";
-
-	axp209: pmic@34 {
-		reg = <0x34>;
-		interrupts = <0>;
-	};
-};
-
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins_a>;
@@ -135,68 +101,13 @@
 	status = "okay";
 };
 
-&ohci0 {
-	status = "okay";
-};
-
-&ohci1 {
-	status = "okay";
-};
-
 &reg_ahci_5v {
 	status = "okay";
 };
 
-#include "axp209.dtsi"
-
-&reg_dcdc2 {
-	regulator-always-on;
-	regulator-min-microvolt = <1000000>;
-	regulator-max-microvolt = <1450000>;
-	regulator-name = "vdd-cpu";
-};
-
-&reg_dcdc3 {
-	regulator-always-on;
-	regulator-min-microvolt = <1000000>;
-	regulator-max-microvolt = <1400000>;
-	regulator-name = "vdd-int-dll";
-};
-
-&reg_ldo1 {
-	regulator-name = "vdd-rtc";
-};
-
-&reg_ldo2 {
-	regulator-always-on;
-	regulator-min-microvolt = <3000000>;
-	regulator-max-microvolt = <3000000>;
-	regulator-name = "avcc";
-};
-
-&reg_usb1_vbus {
-	status = "okay";
-};
-
-&reg_usb2_vbus {
-	status = "okay";
-};
-
 &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins_a>,
 		    <&spi0_cs0_pins_a>;
 	status = "okay";
 };
-
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_pins_a>;
-	status = "okay";
-};
-
-&usbphy {
-	usb1_vbus-supply = <&reg_usb1_vbus>;
-	usb2_vbus-supply = <&reg_usb2_vbus>;
-	status = "okay";
-};
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
