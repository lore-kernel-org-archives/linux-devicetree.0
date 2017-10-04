From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] ARM: dts: r8a7790: Use generic node name for VSP1 nodes
Date: Wed,  4 Oct 2017 14:36:46 +0200
Message-ID: <1507120609-14501-2-git-send-email-geert+renesas@glider.be>
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
 arch/arm/boot/dts/r8a7790.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 252c9664d0836838..ffa57bfe4873415c 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1010,7 +1010,7 @@
 		status = "disabled";
 	};
 
-	vsp1@fe920000 {
+	vsp@fe920000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe920000 0 0x8000>;
 		interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
@@ -1019,7 +1019,7 @@
 		resets = <&cpg 130>;
 	};
 
-	vsp1@fe928000 {
+	vsp@fe928000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe928000 0 0x8000>;
 		interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
@@ -1028,7 +1028,7 @@
 		resets = <&cpg 131>;
 	};
 
-	vsp1@fe930000 {
+	vsp@fe930000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe930000 0 0x8000>;
 		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
@@ -1037,7 +1037,7 @@
 		resets = <&cpg 128>;
 	};
 
-	vsp1@fe938000 {
+	vsp@fe938000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe938000 0 0x8000>;
 		interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4
