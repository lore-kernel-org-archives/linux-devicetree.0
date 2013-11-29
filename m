From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv2 1/4] ARM: kirkwood: NETGEAR ReadyNAS Duo v2 .dts cleanup
Date: Fri, 29 Nov 2013 21:27:25 +0100
Message-ID: <79f40df9fe26fbb5177c5389a2f3961d8f77cdf8.1385756371.git.arno@natisbad.org>
References: <cover.1385756371.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1385756371.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


The patch does some cleanup work on NETGEAR ReadyNAS Duo v2 .dts
file. Changes are listed below:

 - Converted from value to macros for GPIO voltage level
 - Converted all numeric input key values to macros
 - Made button names more explicit
 - Document ethernet PHY (Marvell 88E1318) via a comment
 - Added header for the file to describe content and author
 - Made G762 clock node name unique by including g762 in it
 - Fixed all node names and labels to use respectively '-' and '_'
 - Changed order of included files from general to local
 - Removed useless clocks and gpio-keys properties

Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 .../boot/dts/kirkwood-netgear_readynas_duo_v2.dts  | 51 ++++++++++++----------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-netgear_readynas_duo_v2.dts b/arch/arm/boot/dts/kirkwood-netgear_readynas_duo_v2.dts
index 551bfed..03bb136 100644
--- a/arch/arm/boot/dts/kirkwood-netgear_readynas_duo_v2.dts
+++ b/arch/arm/boot/dts/kirkwood-netgear_readynas_duo_v2.dts
@@ -1,5 +1,17 @@
+/*
+ * Device Tree file for NETGEAR ReadyNAS Duo v2
+ *
+ * Copyright (C) 2013, Arnaud EBALARD <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
 /dts-v1/;
 
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
 #include "kirkwood.dtsi"
 #include "kirkwood-6282.dtsi"
@@ -68,10 +80,7 @@
 		};
 
 		clocks {
-		       #address-cells = <1>;
-		       #size-cells = <0>;
-
-		       g762_clk: fixedclk {
+		       g762_clk: g762-oscillator {
 				 compatible = "fixed-clock";
 				 #clock-cells = <0>;
 				 clock-frequency = <8192>;
@@ -117,49 +126,47 @@
 
 		power_led {
 			label = "status:blue:power_led";
-			gpios = <&gpio0 31 1>;   /* GPIO 31 Active Low */
+			gpios = <&gpio0 31 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "default-on";
 		};
 		activity_led {
 			label = "status:blue:activity_led";
-			gpios = <&gpio1 6 1>;    /* GPIO 38 Active Low */
+			gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 		};
 		disk1_led {
 			label = "status:blue:disk1_led";
-			gpios = <&gpio0 23 1>;   /* GPIO 23 Active Low */
+			gpios = <&gpio0 23 GPIO_ACTIVE_LOW>;
 		};
 		disk2_led {
 			label = "status:blue:disk2_led";
-			gpios = <&gpio0 22 1>;   /* GPIO 22 Active Low */
+			gpios = <&gpio0 22 GPIO_ACTIVE_LOW>;
 		};
 		backup_led {
 			label = "status:blue:backup_led";
-			gpios = <&gpio0 29 1>;   /* GPIO 29 Active Low*/
+			gpios = <&gpio0 29 GPIO_ACTIVE_LOW>;
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		pinctrl-0 = <&pmx_button_power &pmx_button_backup
 			     &pmx_button_reset>;
 		pinctrl-names = "default";
 
-		button@1 {
+		power-button {
 			label = "Power Button";
-			linux,code = <116>;     /* KEY_POWER */
-			gpios = <&gpio1 15 1>;
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
 		};
-		button@2 {
+		reset-button {
 			label = "Reset Button";
-			linux,code = <0x198>;   /* KEY_RESTART */
-			gpios = <&gpio0 13 1>;
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
 		};
-		button@3 {
+		backup-button {
 			label = "Backup Button";
-			linux,code = <133>;     /* KEY_COPY */
-			gpios = <&gpio1 13 1>;
+			linux,code = <KEY_COPY>;
+			gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
 		};
 	};
 
@@ -222,7 +229,7 @@
 &mdio {
 	status = "okay";
 
-	ethphy0: ethernet-phy@0 {
+	ethphy0: ethernet-phy@0 { /* Marvell 88E1318 */
 		device_type = "ethernet-phy";
 		reg = <0>;
 	};
-- 
1.8.4.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
