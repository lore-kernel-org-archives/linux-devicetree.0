Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:49788 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbfDKHyt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Apr 2019 03:54:49 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 07/20] ARM: dts: r8a77470: Add Audio-DMAC support
Date: Thu, 11 Apr 2019 16:54:09 +0900
Message-Id: <1554969262-15028-8-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Add audma0 node to dtsi for audio support on the RZ/G1C (r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm/boot/dts/r8a77470.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index a5a1918..9fc9f6a 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -1068,6 +1068,37 @@
 			};
 		};
 
+		audma0: dma-controller@ec700000 {
+			compatible = "renesas,dmac-r8a77470",
+				     "renesas,rcar-dmac";
+			reg = <0 0xec700000 0 0x10000>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12";
+			clocks = <&cpg CPG_MOD 502>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 502>;
+			#dma-cells = <1>;
+			dma-channels = <13>;
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4
