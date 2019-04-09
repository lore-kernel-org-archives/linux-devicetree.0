Return-Path: <SRS0=MvHc=SL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42937 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbfDIMPT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Apr 2019 08:15:19 -0400
Date: Tue, 9 Apr 2019 14:15:15 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 01/11] ARM: dts: r8a77470: Add HSCIF support
Message-ID: <20190409121515.kqsog247tpxkybmr@verge.net.au>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-2-git-send-email-cv-dong@jinso.co.jp>
 <20190409115135.dt4ny3mizmfv3sbd@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190409115135.dt4ny3mizmfv3sbd@verge.net.au>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 09, 2019 at 01:51:38PM +0200, Simon Horman wrote:
> On Tue, Apr 09, 2019 at 05:51:42PM +0900, Cao Van Dong wrote:
> > Add hscif{0|1|2} nodes to dtsi for HSCIF support on the RZ/G1C (r8a77470) SoC.
> > 
> > Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Sorry, I spoke a little too soon.

The following incremental change is required in order
for this patch to compile.

Please test that each patch in this series compiles and resubmit.


diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 85f7a6f68720..60bd79fc35f7 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -594,12 +594,12 @@
 			reg = <0 0xe62c0000 0 0x60>;
 			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 717>,
-				 <&cpg CPG_CORE r8a77470_CLK_ZS>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x39>, <&dmac0 0x3a>,
 			       <&dmac1 0x39>, <&dmac1 0x3a>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 717>;
 			status = "disabled";
 		};
@@ -610,12 +610,12 @@
 			reg = <0 0xe62c8000 0 0x60>;
 			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 716>,
-				 <&cpg CPG_CORE r8a77470_CLK_ZS>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x4d>, <&dmac0 0x4e>,
 			       <&dmac1 0x4d>, <&dmac1 0x4e>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 716>;
 			status = "disabled";
 		};
@@ -626,12 +626,12 @@
 			reg = <0 0xe62d0000 0 0x60>;
 			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 713>,
-				 <&cpg CPG_CORE r8a77470_CLK_ZS>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x3b>, <&dmac0 0x3c>,
 			       <&dmac1 0x3b>, <&dmac1 0x3c>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 713>;
 			status = "disabled";
 		};
