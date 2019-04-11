Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:49479 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfDKHye (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Apr 2019 03:54:34 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 01/20] ARM: dts: r8a77470: Add HSCIF support
Date: Thu, 11 Apr 2019 16:54:03 +0900
Message-Id: <1554969262-15028-2-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Add hscif{0|1|2} nodes to dtsi for HSCIF support on the RZ/G1C (r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm/boot/dts/r8a77470.dtsi | 48 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 493cf2b..60bd79f 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -588,6 +588,54 @@
 			status = "disabled";
 		};
 
+		hscif0: serial@e62c0000 {
+			compatible = "renesas,hscif-r8a77470",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62c0000 0 0x60>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 717>,
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x39>, <&dmac0 0x3a>,
+			       <&dmac1 0x39>, <&dmac1 0x3a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 717>;
+			status = "disabled";
+		};
+
+		hscif1: serial@e62c8000 {
+			compatible = "renesas,hscif-r8a77470",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62c8000 0 0x60>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 716>,
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x4d>, <&dmac0 0x4e>,
+			       <&dmac1 0x4d>, <&dmac1 0x4e>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 716>;
+			status = "disabled";
+		};
+
+		hscif2: serial@e62d0000 {
+			compatible = "renesas,hscif-r8a77470",
+				     "renesas,rcar-gen2-hscif", "renesas,hscif";
+			reg = <0 0xe62d0000 0 0x60>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 713>,
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x3b>, <&dmac0 0x3c>,
+			       <&dmac1 0x3b>, <&dmac1 0x3c>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 713>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4
