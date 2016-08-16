From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: r8a7791: Remove obsolete vsp1 properties
Date: Tue, 16 Aug 2016 16:56:32 +0200
Message-ID: <1471359392-12584-3-git-send-email-geert+renesas@glider.be>
References: <1471359392-12584-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1471359392-12584-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

As of commit 5aa2eb3c86d4fd16 ("[media] v4l: vsp1: Configure device
based on IP version"), the DT properties to identify the exact VSP
device instance features are no longer used. Hence remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791.dtsi | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 8f0086bbd96bb27a..162b55c665a3519e 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -983,12 +983,6 @@
 		interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7791_CLK_VSP1_S>;
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-
-		renesas,has-lut;
-		renesas,has-sru;
-		renesas,#rpf = <5>;
-		renesas,#uds = <3>;
-		renesas,#wpf = <4>;
 	};
 
 	vsp1@fe930000 {
@@ -997,12 +991,6 @@
 		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7791_CLK_VSP1_DU0>;
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-
-		renesas,has-lif;
-		renesas,has-lut;
-		renesas,#rpf = <4>;
-		renesas,#uds = <1>;
-		renesas,#wpf = <4>;
 	};
 
 	vsp1@fe938000 {
@@ -1011,12 +999,6 @@
 		interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7791_CLK_VSP1_DU1>;
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-
-		renesas,has-lif;
-		renesas,has-lut;
-		renesas,#rpf = <4>;
-		renesas,#uds = <1>;
-		renesas,#wpf = <4>;
 	};
 
 	du: display@feb00000 {
-- 
1.9.1
