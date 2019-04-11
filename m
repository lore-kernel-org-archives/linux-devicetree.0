Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:49754 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfDKHyr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Apr 2019 03:54:47 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 06/20] ARM: dts: r8a77470: Add Audio support
Date: Thu, 11 Apr 2019 16:54:08 +0900
Message-Id: <1554969262-15028-7-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Add rcar_sound node to dtsi for Audio support on the RZ/G1C (r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm/boot/dts/r8a77470.dtsi | 261 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 261 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 7d47d04..a5a1918 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -807,6 +807,267 @@
 			status = "disabled";
 		};
 
+		rcar_sound: sound@ec500000 {
+			/*
+			 * #sound-dai-cells is required
+			 *
+			 * Single DAI : #sound-dai-cells = <0>; <&rcar_sound>;
+			 * Multi  DAI : #sound-dai-cells = <1>; <&rcar_sound N>;
+			 */
+			compatible = "renesas,rcar_sound-r8a77470",
+				     "renesas,rcar_sound-gen2";
+			reg = <0 0xec500000 0 0x1000>, /* SCU */
+			      <0 0xec5a0000 0 0x100>,  /* ADG */
+			      <0 0xec540000 0 0x1000>, /* SSIU */
+			      <0 0xec541000 0 0x280>,  /* SSI */
+			      <0 0xec740000 0 0x200>;  /* Audio DMAC peri peri */
+			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+
+			clocks = <&cpg CPG_MOD 1005>,
+				 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
+				 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
+				 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
+				 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
+				 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
+				 <&cpg CPG_MOD 1025>, <&cpg CPG_MOD 1026>,
+				 <&cpg CPG_MOD 1027>, <&cpg CPG_MOD 1028>,
+				 <&cpg CPG_MOD 1029>, <&cpg CPG_MOD 1030>,
+				 <&cpg CPG_MOD 1021>, <&cpg CPG_MOD 1020>,
+				 <&cpg CPG_MOD 1021>, <&cpg CPG_MOD 1020>,
+				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+				 <&audio_clk_a>, <&audio_clk_b>, <&audio_clk_c>,
+				 <&cpg CPG_CORE R8A77470_CLK_M2>;
+			clock-names = "ssi-all",
+				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+				      "ssi.1", "ssi.0",
+				      "src.6", "src.5", "src.4", "src.3",
+				      "src.2", "src.1",
+				      "ctu.0", "ctu.1",
+				      "mix.0", "mix.1",
+				      "dvc.0", "dvc.1",
+				      "clk_a", "clk_b", "clk_c", "clk_i";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 1005>,
+				 <&cpg 1006>, <&cpg 1007>, <&cpg 1008>,
+				 <&cpg 1009>, <&cpg 1010>, <&cpg 1011>,
+				 <&cpg 1012>, <&cpg 1013>, <&cpg 1014>,
+				 <&cpg 1015>;
+			reset-names = "ssi-all",
+				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+				      "ssi.1", "ssi.0";
+
+			status = "disabled";
+
+			rcar_sound,dvc {
+				dvc0: dvc-0 {
+					dmas = <&audma0 0xbc>;
+					dma-names = "tx";
+				};
+				dvc1: dvc-1 {
+					dmas = <&audma0 0xbe>;
+					dma-names = "tx";
+				};
+			};
+
+			rcar_sound,mix {
+				mix0: mix-0 { };
+				mix1: mix-1 { };
+			};
+
+			rcar_sound,ctu {
+				ctu00: ctu-0 { };
+				ctu01: ctu-1 { };
+				ctu02: ctu-2 { };
+				ctu03: ctu-3 { };
+				ctu10: ctu-4 { };
+				ctu11: ctu-5 { };
+				ctu12: ctu-6 { };
+				ctu13: ctu-7 { };
+			};
+
+			rcar_sound,src {
+				src-0 {
+					status = "disabled";
+				};
+				src1: src-1 {
+					interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x87>, <&audma0 0x9c>;
+					dma-names = "rx", "tx";
+				};
+				src2: src-2 {
+					interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x89>, <&audma0 0x9e>;
+					dma-names = "rx", "tx";
+				};
+				src3: src-3 {
+					interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x8b>, <&audma0 0xa0>;
+					dma-names = "rx", "tx";
+				};
+				src4: src-4 {
+					interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x8d>, <&audma0 0xb0>;
+					dma-names = "rx", "tx";
+				};
+				src5: src-5 {
+					interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x8f>, <&audma0 0xb2>;
+					dma-names = "rx", "tx";
+				};
+				src6: src-6 {
+					interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x91>, <&audma0 0xb4>;
+					dma-names = "rx", "tx";
+				};
+			};
+
+			rcar_sound,ssiu {
+				ssiu00: ssiu-0 {
+					dmas = <&audma0 0x15>, <&audma0 0x16>;
+					dma-names = "rx", "tx";
+				};
+				ssiu01: ssiu-1 {
+					dmas = <&audma0 0x35>, <&audma0 0x36>;
+					dma-names = "rx", "tx";
+				};
+				ssiu02: ssiu-2 {
+					dmas = <&audma0 0x37>, <&audma0 0x38>;
+					dma-names = "rx", "tx";
+				};
+				ssiu03: ssiu-3 {
+					dmas = <&audma0 0x47>, <&audma0 0x48>;
+					dma-names = "rx", "tx";
+				};
+				ssiu10: ssiu-4 {
+					dmas = <&audma0 0x3F>, <&audma0 0x40>;
+					dma-names = "rx", "tx";
+				};
+				ssiu11: ssiu-5 {
+					dmas = <&audma0 0x43>, <&audma0 0x44>;
+					dma-names = "rx", "tx";
+				};
+				ssiu12: ssiu-6 {
+					dmas = <&audma0 0x4F>, <&audma0 0x50>;
+					dma-names = "rx", "tx";
+				};
+				ssiu13: ssiu-7 {
+					dmas = <&audma0 0x53>, <&audma0 0x54>;
+					dma-names = "rx", "tx";
+				};
+				ssiu20: ssiu-8 {
+					dmas = <&audma0 0x49>, <&audma0 0x4a>;
+					dma-names = "rx", "tx";
+				};
+				ssiu21: ssiu-9 {
+					dmas = <&audma0 0x4B>, <&audma0 0x4C>;
+					dma-names = "rx", "tx";
+				};
+				ssiu22: ssiu-10 {
+					dmas = <&audma0 0x57>, <&audma0 0x58>;
+					dma-names = "rx", "tx";
+				};
+				ssiu23: ssiu-11 {
+					dmas = <&audma0 0x59>, <&audma0 0x5A>;
+					dma-names = "rx", "tx";
+				};
+				ssiu30: ssiu-12 {
+					dmas = <&audma0 0x5F>, <&audma0 0x60>;
+					dma-names = "rx", "tx";
+				};
+				ssiu40: ssiu-13 {
+					dmas = <&audma0 0xC3>, <&audma0 0xC4>;
+					dma-names = "rx", "tx";
+				};
+				ssiu50: ssiu-14 {
+					dmas = <&audma0 0xC7>, <&audma0 0xC8>;
+					dma-names = "rx", "tx";
+				};
+				ssiu60: ssiu-15 {
+					dmas = <&audma0 0xCB>, <&audma0 0xCC>;
+					dma-names = "rx", "tx";
+				};
+				ssiu70: ssiu-16 {
+					dmas = <&audma0 0x63>, <&audma0 0x64>;
+					dma-names = "rx", "tx";
+				};
+				ssiu80: ssiu-17 {
+					dmas = <&audma0 0x67>, <&audma0 0x68>;
+					dma-names = "rx", "tx";
+				};
+				ssiu90: ssiu-18 {
+					dmas = <&audma0 0x6B>, <&audma0 0x6C>;
+					dma-names = "rx", "tx";
+				};
+				ssiu91: ssiu-19 {
+					dmas = <&audma0 0x6D>, <&audma0 0x6E>;
+					dma-names = "rx", "tx";
+				};
+				ssiu92: ssiu-20 {
+					dmas = <&audma0 0xCF>, <&audma0 0xCE>;
+					dma-names = "rx", "tx";
+				};
+				ssiu93: ssiu-21 {
+					dmas = <&audma0 0xEB>, <&audma0 0xEC>;
+					dma-names = "rx", "tx";
+				};
+			};
+
+			rcar_sound,ssi {
+				ssi0: ssi-0 {
+					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x01>, <&audma0 0x02>;
+					dma-names = "rx", "tx";
+				};
+				ssi1: ssi-1 {
+					 interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x03>, <&audma0 0x04>;
+					dma-names = "rx", "tx";
+				};
+				ssi2: ssi-2 {
+					interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x05>, <&audma0 0x06>;
+					dma-names = "rx", "tx";
+				};
+				ssi3: ssi-3 {
+					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x07>, <&audma0 0x08>;
+					dma-names = "rx", "tx";
+				};
+				ssi4: ssi-4 {
+					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x09>, <&audma0 0x0a>;
+					dma-names = "rx", "tx";
+				};
+				ssi5: ssi-5 {
+					interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0b>, <&audma0 0x0c>;
+					dma-names = "rx", "tx";
+				};
+				ssi6: ssi-6 {
+					interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0d>, <&audma0 0x0e>;
+					dma-names = "rx", "tx";
+				};
+				ssi7: ssi-7 {
+					interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0f>, <&audma0 0x10>;
+					dma-names = "rx", "tx";
+				};
+				ssi8: ssi-8 {
+					interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x11>, <&audma0 0x12>;
+					dma-names = "rx", "tx";
+				};
+				ssi9: ssi-9 {
+					interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x13>, <&audma0 0x14>;
+					dma-names = "rx", "tx";
+				};
+			};
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4
