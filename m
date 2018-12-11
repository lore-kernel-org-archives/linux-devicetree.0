Return-Path: <SRS0=IqaF=OU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41476 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbeLKKwz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Dec 2018 05:52:55 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH] ARM: dts: am33xx-l4: Fix epwmssX/ecapX/ehrpwmX ranges and reg
Date: Tue, 11 Dec 2018 12:54:30 +0200
Message-ID: <20181211105430.4359-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: tony@atomide.com
Cc: bcousson@baylibre.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, t-kristo@ti.com, jsarha@ti.com
List-ID: <devicetree@vger.kernel.org>

Correct the ranges for epwmsX nodes and the reg for the subnodes.

Fixes: 87fc89ced3a78 ("ARM: dts: am335x: Move l4 child devices to probe them with ti-sysc")

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
Hi Tony,

with this patch am335x-evmsk LCD is working.

Regards,
Peter

 arch/arm/boot/dts/am33xx-l4.dtsi | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 7c7876ecae14..85366f287a22 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1899,15 +1899,15 @@
 				#address-cells = <1>;
 				#size-cells = <1>;
 				status = "disabled";
-				ranges = <0x48300100 0x48300100 0x80   /* ECAP */
-					  0x48300180 0x48300180 0x80   /* EQEP */
-					  0x48300200 0x48300200 0x80>; /* EHRPWM */
+				ranges = <0x100 0x100 0x80   /* ECAP */
+					  0x180 0x180 0x80   /* EQEP */
+					  0x200 0x200 0x80>; /* EHRPWM */
 
 				ecap0: ecap@48300100 {
 					compatible = "ti,am3352-ecap",
 						     "ti,am33xx-ecap";
 					#pwm-cells = <3>;
-					reg = <0x48300100 0x80>;
+					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
 					clock-names = "fck";
 					interrupts = <31>;
@@ -1919,7 +1919,7 @@
 					compatible = "ti,am3352-ehrpwm",
 						     "ti,am33xx-ehrpwm";
 					#pwm-cells = <3>;
-					reg = <0x48300200 0x80>;
+					reg = <0x200 0x80>;
 					clocks = <&ehrpwm0_tbclk>, <&l4ls_gclk>;
 					clock-names = "tbclk", "fck";
 					status = "disabled";
@@ -1954,15 +1954,15 @@
 				#address-cells = <1>;
 				#size-cells = <1>;
 				status = "disabled";
-				ranges = <0x48302100 0x48302100 0x80   /* ECAP */
-					  0x48302180 0x48302180 0x80   /* EQEP */
-					  0x48302200 0x48302200 0x80>; /* EHRPWM */
+				ranges = <0x100 0x100 0x80   /* ECAP */
+					  0x180 0x180 0x80   /* EQEP */
+					  0x200 0x200 0x80>; /* EHRPWM */
 
 				ecap1: ecap@48302100 {
 					compatible = "ti,am3352-ecap",
 						     "ti,am33xx-ecap";
 					#pwm-cells = <3>;
-					reg = <0x48302100 0x80>;
+					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
 					clock-names = "fck";
 					interrupts = <47>;
@@ -1974,7 +1974,7 @@
 					compatible = "ti,am3352-ehrpwm",
 						     "ti,am33xx-ehrpwm";
 					#pwm-cells = <3>;
-					reg = <0x48302200 0x80>;
+					reg = <0x200 0x80>;
 					clocks = <&ehrpwm1_tbclk>, <&l4ls_gclk>;
 					clock-names = "tbclk", "fck";
 					status = "disabled";
@@ -2009,15 +2009,15 @@
 				#address-cells = <1>;
 				#size-cells = <1>;
 				status = "disabled";
-				ranges = <0x48304100 0x48304100 0x80   /* ECAP */
-					  0x48304180 0x48304180 0x80   /* EQEP */
-					  0x48304200 0x48304200 0x80>; /* EHRPWM */
+				ranges = <0x100 0x100 0x80   /* ECAP */
+					  0x180 0x180 0x80   /* EQEP */
+					  0x200 0x200 0x80>; /* EHRPWM */
 
 				ecap2: ecap@48304100 {
 					compatible = "ti,am3352-ecap",
 						     "ti,am33xx-ecap";
 					#pwm-cells = <3>;
-					reg = <0x48304100 0x80>;
+					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
 					clock-names = "fck";
 					interrupts = <61>;
@@ -2029,7 +2029,7 @@
 					compatible = "ti,am3352-ehrpwm",
 						     "ti,am33xx-ehrpwm";
 					#pwm-cells = <3>;
-					reg = <0x48304200 0x80>;
+					reg = <0x200 0x80>;
 					clocks = <&ehrpwm2_tbclk>, <&l4ls_gclk>;
 					clock-names = "tbclk", "fck";
 					status = "disabled";
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
