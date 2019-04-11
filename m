Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:49687 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfDKHyl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Apr 2019 03:54:41 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 04/20] ARM: dts: r8a77470: Add CAN support
Date: Thu, 11 Apr 2019 16:54:06 +0900
Message-Id: <1554969262-15028-5-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Add can{0|1} nodes to dtsi for CAN support on the RZ/G1C (r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm/boot/dts/r8a77470.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 7d1fe2f..97c51c5 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -757,6 +757,32 @@
 			status = "disabled";
 		};
 
+		can0: can@e6e80000 {
+			compatible = "renesas,can-r8a77470",
+				     "renesas,rcar-gen2-can";
+			reg = <0 0xe6e80000 0 0x1000>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>,
+				 <&cpg CPG_CORE R8A77470_CLK_RCAN>, <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 916>;
+			status = "disabled";
+		};
+
+		can1: can@e6e88000 {
+			compatible = "renesas,can-r8a77470",
+				     "renesas,rcar-gen2-can";
+			reg = <0 0xe6e88000 0 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>,
+				 <&cpg CPG_CORE R8A77470_CLK_RCAN>, <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4
