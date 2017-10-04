From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] ARM: dts: r8a7792: Use generic node name for VSP1 nodes
Date: Wed,  4 Oct 2017 14:36:48 +0200
Message-ID: <1507120609-14501-4-git-send-email-geert+renesas@glider.be>
References: <1507120609-14501-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507120609-14501-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Use the preferred generic node name instead of the specific name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7792.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index c332f77ebb6b9349..549eafe8ff129edc 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -794,7 +794,7 @@
 			status = "disabled";
 		};
 
-		vsp1@fe928000 {
+		vsp@fe928000 {
 			compatible = "renesas,vsp1";
 			reg = <0 0xfe928000 0 0x8000>;
 			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
@@ -803,7 +803,7 @@
 			resets = <&cpg 131>;
 		};
 
-		vsp1@fe930000 {
+		vsp@fe930000 {
 			compatible = "renesas,vsp1";
 			reg = <0 0xfe930000 0 0x8000>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
@@ -812,7 +812,7 @@
 			resets = <&cpg 128>;
 		};
 
-		vsp1@fe938000 {
+		vsp@fe938000 {
 			compatible = "renesas,vsp1";
 			reg = <0 0xfe938000 0 0x8000>;
 			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4
