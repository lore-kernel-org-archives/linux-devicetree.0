Return-Path: <SRS0=WyUm=LO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35608 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbeHaTXa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Aug 2018 15:23:30 -0400
From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 2/3] ARM: dts: am43xx: convert to use new clkctrl layout
Date: Fri, 31 Aug 2018 18:14:50 +0300
Message-ID: <1535728491-25321-3-git-send-email-t-kristo@ti.com>
In-Reply-To: <1535728491-25321-1-git-send-email-t-kristo@ti.com>
References: <1535728491-25321-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: tony@atomide.com, linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Convert AM43xx to use the new clockdomain based layout. Previously the
clkctrl split was based on CM isntance boundaries. The new layout
helps with introducing the interconnect driver instances.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/am4372.dtsi        |  4 +-
 arch/arm/boot/dts/am43xx-clocks.dtsi | 74 ++++++++++++++++++++++++++++++------
 2 files changed, 64 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index f0cbd86..7fafbea 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -1016,7 +1016,7 @@
 				reg = <0x483a8000 0x8000>;
 				syscon-phy-power = <&scm_conf 0x620>;
 				clocks = <&usb_phy0_always_on_clk32k>,
-					 <&l4_per_clkctrl AM4_USB_OTG_SS0_CLKCTRL 8>;
+					 <&l3s_clkctrl AM4_L3S_USB_OTG_SS0_CLKCTRL 8>;
 				clock-names = "wkupclk", "refclk";
 				#phy-cells = <0>;
 				status = "disabled";
@@ -1035,7 +1035,7 @@
 				reg = <0x483e8000 0x8000>;
 				syscon-phy-power = <&scm_conf 0x628>;
 				clocks = <&usb_phy1_always_on_clk32k>,
-					 <&l4_per_clkctrl AM4_USB_OTG_SS1_CLKCTRL 8>;
+					 <&l3s_clkctrl AM4_L3S_USB_OTG_SS1_CLKCTRL 8>;
 				clock-names = "wkupclk", "refclk";
 				#phy-cells = <0>;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/am43xx-clocks.dtsi b/arch/arm/boot/dts/am43xx-clocks.dtsi
index a7037a4..e3f4207 100644
--- a/arch/arm/boot/dts/am43xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
@@ -710,73 +710,123 @@
 };
 
 &prcm {
-	l4_wkup_cm: l4_wkup_cm@2800 {
+	wkup_cm: wkup-cm@2800 {
 		compatible = "ti,omap4-cm";
 		reg = <0x2800 0x400>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x2800 0x400>;
 
-		l4_wkup_clkctrl: clk@20 {
+		l3s_tsc_clkctrl: l3s-tsc-clkctrl@120 {
 			compatible = "ti,clkctrl";
-			reg = <0x20 0x34c>;
+			reg = <0x120 0x4>;
 			#clock-cells = <2>;
 		};
+
+		l4_wkup_aon_clkctrl: l4-wkup-aon-clkctrl@228 {
+			compatible = "ti,clkctrl";
+			reg = <0x228 0xc>;
+			#clock-cells = <2>;
+		};
+
+		l4_wkup_clkctrl: l4-wkup-clkctrl@220 {
+			compatible = "ti,clkctrl";
+			reg = <0x220 0x4>, <0x328 0x44>;
+			#clock-cells = <2>;
+		};
+
 	};
 
-	mpu_cm: mpu_cm@8300 {
+	mpu_cm: mpu-cm@8300 {
 		compatible = "ti,omap4-cm";
 		reg = <0x8300 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x8300 0x100>;
 
-		mpu_clkctrl: clk@20 {
+		mpu_clkctrl: mpu-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	gfx_l3_cm: gfx_l3_cm@8400 {
+	gfx_l3_cm: gfx-l3-cm@8400 {
 		compatible = "ti,omap4-cm";
 		reg = <0x8400 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x8400 0x100>;
 
-		gfx_l3_clkctrl: clk@20 {
+		gfx_l3_clkctrl: gfx-l3-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l4_rtc_cm: l4_rtc_cm@8500 {
+	l4_rtc_cm: l4-rtc-cm@8500 {
 		compatible = "ti,omap4-cm";
 		reg = <0x8500 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x8500 0x100>;
 
-		l4_rtc_clkctrl: clk@20 {
+		l4_rtc_clkctrl: l4-rtc-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l4_per_cm: l4_per_cm@8800 {
+	per_cm: per-cm@8800 {
 		compatible = "ti,omap4-cm";
 		reg = <0x8800 0xc00>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x8800 0xc00>;
 
-		l4_per_clkctrl: clk@20 {
+		l3_clkctrl: l3-clkctrl@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0x3c>, <0x78 0x2c>;
+			#clock-cells = <2>;
+		};
+
+		l3s_clkctrl: l3s-clkctrl@68 {
+			compatible = "ti,clkctrl";
+			reg = <0x68 0xc>, <0x220 0x4c>;
+			#clock-cells = <2>;
+		};
+
+		pruss_ocp_clkctrl: pruss-ocp-clkctrl@320 {
 			compatible = "ti,clkctrl";
-			reg = <0x20 0xb04>;
+			reg = <0x320 0x4>;
 			#clock-cells = <2>;
 		};
+
+		l4ls_clkctrl: l4ls-clkctrl@420 {
+			compatible = "ti,clkctrl";
+			reg = <0x420 0x1a4>;
+			#clock-cells = <2>;
+		};
+
+		emif_clkctrl: emif-clkctrl@720 {
+			compatible = "ti,clkctrl";
+			reg = <0x720 0x4>;
+			#clock-cells = <2>;
+		};
+
+		dss_clkctrl: dss-clkctrl@a20 {
+			compatible = "ti,clkctrl";
+			reg = <0xa20 0x4>;
+			#clock-cells = <2>;
+		};
+
+		cpsw_125mhz_clkctrl: cpsw-125mhz-clkctrl@b20 {
+			compatible = "ti,clkctrl";
+			reg = <0xb20 0x4>;
+			#clock-cells = <2>;
+		};
+
 	};
 };
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
