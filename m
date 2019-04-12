Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60920 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfDLMIc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 08:08:32 -0400
Date: Fri, 12 Apr 2019 14:08:28 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 05/11] ARM: dts: r8a77470: Add VIN support
Message-ID: <20190412120819.a4se3nyfhiwq3lm3@verge.net.au>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-6-git-send-email-cv-dong@jinso.co.jp>
 <20190409130138.GN15350@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190409130138.GN15350@bigcity.dyn.berto.se>
Sender: devicetree-owner@vger.kernel.org
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Cao Van Dong <cv-dong@jinso.co.jp>, linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 09, 2019 at 03:01:38PM +0200, Niklas Söderlund wrote:
> Hi Cao,
> 
> On 2019-04-09 17:51:46 +0900, Cao Van Dong wrote:
> > Add vin{0|1} nodes to dtsi for VIN support on the RZ/G1C (r8a77470) SoC.
> > 
> > Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> > ---
> >  arch/arm/boot/dts/r8a77470.dtsi | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> > index 3940a0d..e89c72f 100644
> > --- a/arch/arm/boot/dts/r8a77470.dtsi
> > +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > @@ -780,6 +780,28 @@
> >  			status = "disabled";
> >  		};
> >  
> > +		vin0: video@e6ef0000 {
> > +			compatible = "renesas,vin-r8a77470",
> > +				     "renesas,rcar-gen2-vin";
> 
> This patch looks good but you should also add renesas,vin-r8a77470 to 
> Documentation/devicetree/bindings/media/rcar_vin.txt in a separate 
> patch.
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks,

applied for inclusion in v5.2 with the changelog wrapped to 75 columns
wide.

> 
> > +			reg = <0 0xe6ef0000 0 0x1000>;
> > +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cpg CPG_MOD 811>;
> > +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> > +			resets = <&cpg 811>;
> > +			status = "disabled";
> > +		};
> > +
> > +		vin1: video@e6ef1000 {
> > +			compatible = "renesas,vin-r8a77470",
> > +				     "renesas,rcar-gen2-vin";
> > +			reg = <0 0xe6ef1000 0 0x1000>;
> > +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cpg CPG_MOD 810>;
> > +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> > +			resets = <&cpg 810>;
> > +			status = "disabled";
> > +		};
> > +
> >  		sdhi0: sd@ee100000 {
> >  			compatible = "renesas,sdhi-r8a77470",
> >  				     "renesas,rcar-gen2-sdhi";
> > -- 
> > 2.7.4
> > 
> 
> -- 
> Regards,
> Niklas Söderlund
> 
