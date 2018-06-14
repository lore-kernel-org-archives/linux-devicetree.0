Return-Path: <SRS0=mOcJ=JA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:39879 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755348AbeFNVt1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Jun 2018 17:49:27 -0400
From: Adam Ford <aford173@gmail.com>
Subject: [RFC] ARM: dts: OMAP36xx: Convert OPP table to v2
Date: Thu, 14 Jun 2018 16:49:14 -0500
Message-Id: <20180614214914.11748-1-aford173@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: bcousson@baylibre.com, devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Replace the OPP table with a version compatible with
operating-points-v2-ti-cpu.  A future patch will hopefully
enable the OPP1G table.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 6fb23ada1f64..9c5ab5e06902 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -19,18 +19,33 @@
 	};
 
 	cpus {
-		/* OMAP3630/OMAP37xx 'standard device' variants OPP50 to OPP130 */
 		cpu: cpu@0 {
-			operating-points = <
-				/* kHz    uV */
-				300000  1012500
-				600000  1200000
-				800000  1325000
-			>;
+			operating-points-v2 = <&cpu0_opp_table>;
 			clock-latency = <300000>; /* From legacy driver */
 		};
 	};
 
+	/* OMAP3630/OMAP37xx 'standard device' variants OPP50 to OPP130 */
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2-ti-cpu";
+		syscon = <&scm_conf>;
+
+		opp50-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1012500>;
+		};
+		opp100-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1200000>;
+			opp-microamp =  <0>;
+		};
+		opp130-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1325000>;
+			opp-microamp =  <0>;
+		};
+	};
+
 	ocp@68000000 {
 		uart4: serial@49042000 {
 			compatible = "ti,omap3-uart";
-- 
2.17.1

