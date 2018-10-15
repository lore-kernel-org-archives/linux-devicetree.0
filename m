Return-Path: <SRS0=7icI=M3=verge.net.au=horms@kernel.org>
Date: Mon, 15 Oct 2018 17:38:20 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 4/6] ARM: dts: r8a77470: Add SDHI0 support
Message-ID: <20181015153819.w467j4kc6zrrowzo@verge.net.au>
References: <1538988712-17077-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1538988712-17077-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181015151930.onybzcxepun3vwv3@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181015151930.onybzcxepun3vwv3@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 15, 2018 at 05:19:30PM +0200, Simon Horman wrote:
> On Mon, Oct 08, 2018 at 09:51:50AM +0100, Fabrizio Castro wrote:
> > RZ/G1C comes with two different types of IP for the SDHI
> > interfaces, SDHI0 and SDHI2 share the same IP type, and
> > such an IP is also compatible with the one found in R-Car
> > Gen2. SDHI1 IP on the other hand is compatible with R-Car
> > Gen3 with internal DMA.
> > This patch completes the SDHI support of the R-Car Gen2
> > compatible IPs, including fixing the max-frequency
> > definition of SDHI2, as it turns out there is a bug in
> > Section 1.3.9 of the RZ/G1C Hardware User's Manual (Rev.
> > 1.00 Oct. 2017).
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > 
> > ---
> > v2->v3:
> > * No change
> > 
> > v2:
> > * New patch
> > ---
> >  arch/arm/boot/dts/r8a77470.dtsi | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> > index 9e7f86d..e01df9c 100644
> > --- a/arch/arm/boot/dts/r8a77470.dtsi
> > +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > @@ -412,6 +412,21 @@
> >  			status = "disabled";
> >  		};
> >  
> > +		sdhi0: sd@ee100000 {
> > +			compatible = "renesas,sdhi-r8a77470",
> > +				     "renesas,rcar-gen2-sdhi";
> > +			reg = <0 0xee100000 0 0x328>;
> 
> I am unable to verify the base address of this register range,
> but I am prepared to take your word for it.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> I'm happy to apply this patch but I'm holding off for the moment
> as I have a question about the following patch in the series.

Sorry for the noise, I am now happy with the other patches in this series.
I have applied patches 4, 5 and 6 of this series for v4.21.

> 
> 
> > +			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cpg CPG_MOD 314>;
> > +			dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
> > +			       <&dmac1 0xcd>, <&dmac1 0xce>;
> > +			dma-names = "tx", "rx", "tx", "rx";
> > +			max-frequency = <156000000>;
> > +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> > +			resets = <&cpg 314>;
> > +			status = "disabled";
> > +		};
> > +
> >  		sdhi2: sd@ee160000 {
> >  			compatible = "renesas,sdhi-r8a77470",
> >  				     "renesas,rcar-gen2-sdhi";
> > @@ -421,7 +436,7 @@
> >  			dmas = <&dmac0 0xd3>, <&dmac0 0xd4>,
> >  			       <&dmac1 0xd3>, <&dmac1 0xd4>;
> >  			dma-names = "tx", "rx", "tx", "rx";
> > -			max-frequency = <97500000>;
> > +			max-frequency = <78000000>;
> >  			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> >  			resets = <&cpg 312>;
> >  			status = "disabled";
> > -- 
> > 2.7.4
> > 
