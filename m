Return-Path: <SRS0=MwbZ=PS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:50514 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729076AbfAJPcf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 10 Jan 2019 10:32:35 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a7778: Add HSCIF0/1 support
Date: Thu, 10 Jan 2019 16:32:32 +0100
Message-Id: <20190110153232.21212-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Add HSCIF0/1 clocks and device nodes, based on Rev. 1.00 of the R-Car
M1A datasheet.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
[geert: Squashed two patches]
[geert: Correct HSCIF1 module clock index]
[geert: Correct reg properties for non-LPAE]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on Bock-W using the patch below, and by forcing and verifying use
of each of the 3 possible clock sources.

While HSCIF0 offers advantages over SCIF0 (e.g. larger FIFOs), we have
to keep on using SCIF0 for the console, as that is what is used by the
bootloader.  Else earlycon no longer works, due on its reliance on
pinctrl as configured by the bootloader (cfr. commit 430d7baddf2d913d
("ARM: shmobile: r8a7790: switch console back to scif0")).

	--- a/arch/arm/boot/dts/r8a7778-bockw.dts
	+++ b/arch/arm/boot/dts/r8a7778-bockw.dts
	@@ -21,7 +21,7 @@
		compatible = "renesas,bockw", "renesas,r8a7778";

		aliases {
	-		serial0 = &scif0;
	+		serial0 = &hscif0;
		};

		chosen {
	@@ -126,9 +126,9 @@
		pinctrl-0 = <&scif_clk_pins>;
		pinctrl-names = "default";

	-	scif0_pins: scif0 {
	-		groups = "scif0_data_a", "scif0_ctrl";
	-		function = "scif0";
	+	hscif0_pins: hscif0 {
	+		groups = "hscif0_data_a", "hscif0_ctrl_a";
	+		function = "hscif0";
		};

		scif_clk_pins: scif_clk {
	@@ -216,8 +216,8 @@
		};
	 };

	-&scif0 {
	-	pinctrl-0 = <&scif0_pins>;
	+&hscif0 {
	+	pinctrl-0 = <&hscif0_pins>;
		pinctrl-names = "default";

		uart-has-rtscts;
---
 arch/arm/boot/dts/r8a7778.dtsi            | 28 +++++++++++++++++++++++
 include/dt-bindings/clock/r8a7778-clock.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 05db0ccad7a6b745..10d996d2941fe6ea 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -367,6 +367,30 @@
 		status = "disabled";
 	};
 
+	hscif0: serial@ffe48000 {
+		compatible = "renesas,hscif-r8a7778",
+			     "renesas,rcar-gen1-hscif", "renesas,hscif";
+		reg = <0xffe48000 96>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp0_clks R8A7778_CLK_HSCIF0>,
+			 <&cpg_clocks R8A7778_CLK_S>, <&scif_clk>;
+		clock-names = "fck", "brg_int", "scif_clk";
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
+
+	hscif1: serial@ffe49000 {
+		compatible = "renesas,hscif-r8a7778",
+			     "renesas,rcar-gen1-hscif", "renesas,hscif";
+		reg = <0xffe49000 96>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp0_clks R8A7778_CLK_HSCIF1>,
+			 <&cpg_clocks R8A7778_CLK_S>, <&scif_clk>;
+		clock-names = "fck", "brg_int", "scif_clk";
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
+
 	mmcif: mmc@ffe4e000 {
 		compatible = "renesas,mmcif-r8a7778", "renesas,sh-mmcif";
 		reg = <0xffe4e000 0x100>;
@@ -535,6 +559,8 @@
 				 <&cpg_clocks R8A7778_CLK_P>,
 				 <&cpg_clocks R8A7778_CLK_P>,
 				 <&cpg_clocks R8A7778_CLK_P>,
+				 <&cpg_clocks R8A7778_CLK_S>,
+				 <&cpg_clocks R8A7778_CLK_S>,
 				 <&cpg_clocks R8A7778_CLK_P>,
 				 <&cpg_clocks R8A7778_CLK_P>,
 				 <&cpg_clocks R8A7778_CLK_P>,
@@ -551,6 +577,7 @@
 				R8A7778_CLK_SCIF0 R8A7778_CLK_SCIF1
 				R8A7778_CLK_SCIF2 R8A7778_CLK_SCIF3
 				R8A7778_CLK_SCIF4 R8A7778_CLK_SCIF5
+				R8A7778_CLK_HSCIF0 R8A7778_CLK_HSCIF1
 				R8A7778_CLK_TMU0 R8A7778_CLK_TMU1
 				R8A7778_CLK_TMU2 R8A7778_CLK_SSI0
 				R8A7778_CLK_SSI1 R8A7778_CLK_SSI2
@@ -560,6 +587,7 @@
 			clock-output-names =
 				"i2c0", "i2c1", "i2c2", "i2c3", "scif0",
 				"scif1", "scif2", "scif3", "scif4", "scif5",
+				"hscif0", "hscif1",
 				"tmu0", "tmu1", "tmu2", "ssi0", "ssi1",
 				"ssi2", "ssi3", "sru", "hspi";
 		};
diff --git a/include/dt-bindings/clock/r8a7778-clock.h b/include/dt-bindings/clock/r8a7778-clock.h
index f6b07c5399dec1f9..d0bff9ec5c66baf1 100644
--- a/include/dt-bindings/clock/r8a7778-clock.h
+++ b/include/dt-bindings/clock/r8a7778-clock.h
@@ -30,6 +30,8 @@
 #define R8A7778_CLK_SCIF3	23
 #define R8A7778_CLK_SCIF4	22
 #define R8A7778_CLK_SCIF5	21
+#define R8A7778_CLK_HSCIF0	19
+#define R8A7778_CLK_HSCIF1	18
 #define R8A7778_CLK_TMU0	16
 #define R8A7778_CLK_TMU1	15
 #define R8A7778_CLK_TMU2	14
-- 
2.17.1
