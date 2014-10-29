From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/6] ARM: shmobile: r8a7740 dtsi: Change to using clock-indices
Date: Wed, 29 Oct 2014 15:19:09 +0100
Message-ID: <1414592353-24044-3-git-send-email-geert+renesas@glider.be>
References: <1414592353-24044-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1414592353-24044-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

With the addition of clock-indices in commit 8e33f91a0b84ae19 ("clk:
shmobile: clk-mstp: change to using clock-indices"), we can change the
DTSes to use the generic property instead of the deprecated
vendor-specific property.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7740.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index aec8da89ef9ac766..62f6de252d09c604 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -453,7 +453,7 @@
 			reg = <0xe6150080 4>;
 			clocks = <&sub_clk>, <&sub_clk>;
 			#clock-cells = <1>;
-			renesas,clock-indices = <
+			clock-indices = <
 				R8A7740_CLK_SUBCK R8A7740_CLK_SUBCK2
 			>;
 			clock-output-names =
@@ -468,7 +468,7 @@
 				 <&sub_clk>, <&sub_clk>,
 				 <&cpg_clocks R8A7740_CLK_B>;
 			#clock-cells = <1>;
-			renesas,clock-indices = <
+			clock-indices = <
 				R8A7740_CLK_CEU21 R8A7740_CLK_CEU20 R8A7740_CLK_TMU0
 				R8A7740_CLK_LCDC1 R8A7740_CLK_IIC0 R8A7740_CLK_TMU1
 				R8A7740_CLK_LCDC0
@@ -489,7 +489,7 @@
 				 <&sub_clk>, <&sub_clk>, <&sub_clk>,
 				 <&sub_clk>;
 			#clock-cells = <1>;
-			renesas,clock-indices = <
+			clock-indices = <
 				R8A7740_CLK_SCIFA6 R8A7740_CLK_INTCA
 				R8A7740_CLK_SCIFA7
 				R8A7740_CLK_DMAC1 R8A7740_CLK_DMAC2
@@ -518,7 +518,7 @@
 				 <&cpg_clocks R8A7740_CLK_HP>,
 				 <&cpg_clocks R8A7740_CLK_HP>;
 			#clock-cells = <1>;
-			renesas,clock-indices = <
+			clock-indices = <
 				R8A7740_CLK_CMT1 R8A7740_CLK_FSI R8A7740_CLK_IIC1
 				R8A7740_CLK_USBF R8A7740_CLK_SDHI0 R8A7740_CLK_SDHI1
 				R8A7740_CLK_MMC R8A7740_CLK_GETHER R8A7740_CLK_TPU0
@@ -535,7 +535,7 @@
 				 <&cpg_clocks R8A7740_CLK_HP>,
 				 <&cpg_clocks R8A7740_CLK_HP>;
 			#clock-cells = <1>;
-			renesas,clock-indices = <
+			clock-indices = <
 				R8A7740_CLK_USBH R8A7740_CLK_SDHI2
 				R8A7740_CLK_USBFUNC R8A7740_CLK_USBPHY
 			>;
-- 
1.9.1

