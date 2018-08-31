Return-Path: <SRS0=WyUm=LO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51444 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbeHaTXm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Aug 2018 15:23:42 -0400
From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 1/3] ARM: dts: am33xx: convert to use new clkctrl layout
Date: Fri, 31 Aug 2018 18:14:49 +0300
Message-ID: <1535728491-25321-2-git-send-email-t-kristo@ti.com>
In-Reply-To: <1535728491-25321-1-git-send-email-t-kristo@ti.com>
References: <1535728491-25321-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: tony@atomide.com, linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Convert AM33xx to use the new clockdomain based layout. Previously the
clkctrl split was based on CM instance boundaries. The new layout
helps with introducing the interconnect driver instances.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/am335x-bone-common.dtsi   |   2 +-
 arch/arm/boot/dts/am335x-boneblue.dts       |   2 +-
 arch/arm/boot/dts/am335x-evm.dts            |   2 +-
 arch/arm/boot/dts/am335x-evmsk.dts          |   2 +-
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts |   2 +-
 arch/arm/boot/dts/am33xx-clocks.dtsi        | 110 +++++++++++++++++++++-------
 arch/arm/boot/dts/am33xx.dtsi               |   2 +-
 7 files changed, 88 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
index 73b514d..2a9fb3d 100644
--- a/arch/arm/boot/dts/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
@@ -415,6 +415,6 @@
 };
 
 &rtc {
-	clocks = <&clk_32768_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 	clock-names = "ext-clk", "int-clk";
 };
diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
index 7bcd726..ccb147e 100644
--- a/arch/arm/boot/dts/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/am335x-boneblue.dts
@@ -515,7 +515,7 @@
 
 &rtc {
 	system-power-controller;
-	clocks = <&clk_32768_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 	clock-names = "ext-clk", "int-clk";
 };
 
diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index c87d012..b1ff868 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -797,6 +797,6 @@
 };
 
 &rtc {
-	clocks = <&clk_32768_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 	clock-names = "ext-clk", "int-clk";
 };
diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index bf1a40e..012db5a 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -730,6 +730,6 @@
 };
 
 &rtc {
-	clocks = <&clk_32768_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 	clock-names = "ext-clk", "int-clk";
 };
diff --git a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
index 4d96901..427e9ca 100755
--- a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
@@ -452,6 +452,6 @@
 };
 
 &rtc {
-	clocks = <&clk_32768_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 	clock-names = "ext-clk", "int-clk";
 };
diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
index 95d5c9d..9221824 100644
--- a/arch/arm/boot/dts/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
@@ -334,49 +334,49 @@
 	timer1_fck: timer1_fck@528 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
-		clocks = <&sys_clkin_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>, <&tclkin_ck>, <&clk_rc32k_ck>, <&clk_32768_ck>;
+		clocks = <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>, <&tclkin_ck>, <&clk_rc32k_ck>, <&clk_32768_ck>;
 		reg = <0x0528>;
 	};
 
 	timer2_fck: timer2_fck@508 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
-		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x0508>;
 	};
 
 	timer3_fck: timer3_fck@50c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
-		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x050c>;
 	};
 
 	timer4_fck: timer4_fck@510 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
-		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x0510>;
 	};
 
 	timer5_fck: timer5_fck@518 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
-		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x0518>;
 	};
 
 	timer6_fck: timer6_fck@51c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
-		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x051c>;
 	};
 
 	timer7_fck: timer7_fck@504 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
-		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x0504>;
 	};
 
@@ -407,7 +407,7 @@
 	wdt1_fck: wdt1_fck@538 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
-		clocks = <&clk_rc32k_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+		clocks = <&clk_rc32k_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x0538>;
 	};
 
@@ -477,7 +477,7 @@
 	gpio0_dbclk_mux_ck: gpio0_dbclk_mux_ck@53c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
-		clocks = <&clk_rc32k_ck>, <&clk_32768_ck>, <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+		clocks = <&clk_rc32k_ck>, <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x053c>;
 	};
 
@@ -539,86 +539,140 @@
 };
 
 &prcm {
-	l4_per_cm: l4_per_cm@0 {
+	per_cm: per-cm@0 {
 		compatible = "ti,omap4-cm";
-		reg = <0x0 0x200>;
+		reg = <0x0 0x400>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0 0x0 0x200>;
+		ranges = <0 0x0 0x400>;
 
-		l4_per_clkctrl: clk@14 {
+		l4ls_clkctrl: l4ls-clkctrl@38 {
 			compatible = "ti,clkctrl";
-			reg = <0x14 0x13c>;
+			reg = <0x38 0x2c>, <0x6c 0x28>, <0xac 0xc>, <0xc0 0x1c>, <0xec 0xc>, <0x10c 0x8>, <0x130 0x4>;
+			#clock-cells = <2>;
+		};
+
+		l3s_clkctrl: l3s-clkctrl@1c {
+			compatible = "ti,clkctrl";
+			reg = <0x1c 0x4>, <0x30 0x8>, <0x68 0x4>, <0xf8 0x4>;
+			#clock-cells = <2>;
+		};
+
+		l3_clkctrl: l3-clkctrl@24 {
+			compatible = "ti,clkctrl";
+			reg = <0x24 0xc>, <0x94 0x10>, <0xbc 0x4>, <0xdc 0x8>, <0xfc 0x8>;
+			#clock-cells = <2>;
+		};
+
+		l4hs_clkctrl: l4hs-clkctrl@120 {
+			compatible = "ti,clkctrl";
+			reg = <0x120 0x4>;
+			#clock-cells = <2>;
+		};
+
+		pruss_ocp_clkctrl: pruss-ocp-clkctrl@e8 {
+			compatible = "ti,clkctrl";
+			reg = <0xe8 0x4>;
+			#clock-cells = <2>;
+		};
+
+		cpsw_125mhz_clkctrl: cpsw-125mhz-clkctrl@0 {
+			compatible = "ti,clkctrl";
+			reg = <0x0 0x18>;
+			#clock-cells = <2>;
+		};
+
+		lcdc_clkctrl: lcdc-clkctrl@18 {
+			compatible = "ti,clkctrl";
+			reg = <0x18 0x4>;
+			#clock-cells = <2>;
+		};
+
+		clk_24mhz_clkctrl: clk-24mhz-clkctrl@14c {
+			compatible = "ti,clkctrl";
+			reg = <0x14c 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l4_wkup_cm: l4_wkup_cm@400 {
+	wkup_cm: wkup-cm@400 {
 		compatible = "ti,omap4-cm";
 		reg = <0x400 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x400 0x100>;
 
-		l4_wkup_clkctrl: clk@4 {
+		l4_wkup_clkctrl: l4-wkup-clkctrl@0 {
+			compatible = "ti,clkctrl";
+			reg = <0x0 0x10>, <0xb4 0x24>;
+			#clock-cells = <2>;
+		};
+
+		l3_aon_clkctrl: l3-aon-clkctrl@14 {
+			compatible = "ti,clkctrl";
+			reg = <0x14 0x4>;
+			#clock-cells = <2>;
+		};
+
+		l4_wkup_aon_clkctrl: l4-wkup-aon-clkctrl@b0 {
 			compatible = "ti,clkctrl";
-			reg = <0x4 0xd4>;
+			reg = <0xb0 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	mpu_cm: mpu_cm@600 {
+	mpu_cm: mpu-cm@600 {
 		compatible = "ti,omap4-cm";
 		reg = <0x600 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x600 0x100>;
 
-		mpu_clkctrl: clk@4 {
+		mpu_clkctrl: mpu-clkctrl@0 {
 			compatible = "ti,clkctrl";
-			reg = <0x4 0x4>;
+			reg = <0x0 0x8>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l4_rtc_cm: l4_rtc_cm@800 {
+	l4_rtc_cm: l4-rtc-cm@800 {
 		compatible = "ti,omap4-cm";
 		reg = <0x800 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x800 0x100>;
 
-		l4_rtc_clkctrl: clk@0 {
+		l4_rtc_clkctrl: l4-rtc-clkctrl@0 {
 			compatible = "ti,clkctrl";
 			reg = <0x0 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	gfx_l3_cm: gfx_l3_cm@900 {
+	gfx_l3_cm: gfx-l3-cm@900 {
 		compatible = "ti,omap4-cm";
 		reg = <0x900 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x900 0x100>;
 
-		gfx_l3_clkctrl: clk@4 {
+		gfx_l3_clkctrl: gfx-l3-clkctrl@0 {
 			compatible = "ti,clkctrl";
-			reg = <0x4 0x4>;
+			reg = <0x0 0x8>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l4_cefuse_cm: l4_cefuse_cm@a00 {
+	l4_cefuse_cm: l4-cefuse-cm@a00 {
 		compatible = "ti,omap4-cm";
 		reg = <0xa00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0xa00 0x100>;
 
-		l4_cefuse_clkctrl: clk@20 {
+		l4_cefuse_clkctrl: l4-cefuse-clkctrl@0 {
 			compatible = "ti,clkctrl";
-			reg = <0x20 0x4>;
+			reg = <0x0 0x24>;
 			#clock-cells = <2>;
 		};
 	};
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index d3dd6a1..44240c7 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -581,7 +581,7 @@
 			interrupts = <75
 				      76>;
 			ti,hwmods = "rtc";
-			clocks = <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>;
+			clocks = <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 			clock-names = "int-clk";
 		};
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
