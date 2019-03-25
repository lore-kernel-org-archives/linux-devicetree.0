Return-Path: <SRS0=yqAM=R4=verge.net.au=horms@kernel.org>
Date: Mon, 25 Mar 2019 11:58:06 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] ARM: dts: r8a77470: Add DU support
Message-ID: <20190325105806.nko5zgm6tbdgy3gb@verge.net.au>
References: <1552998099-22972-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1552998099-22972-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190322104641.hywslvn6mt4pjqbr@verge.net.au>
 <TY1PR01MB17703031AFD18BE75E5E554DC0430@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB17703031AFD18BE75E5E554DC0430@TY1PR01MB1770.jpnprd01.prod.outlook.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 22, 2019 at 10:53:16AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback!
> 
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 22 March 2019 10:47
> > Subject: Re: [PATCH 1/2] ARM: dts: r8a77470: Add DU support
> > 
> > On Tue, Mar 19, 2019 at 12:21:38PM +0000, Fabrizio Castro wrote:
> > > This commit adds DU support to the RZ/G1C (a.k.a. r8a77470)
> > > specific device tree.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  arch/arm/boot/dts/r8a77470.dtsi | 32 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 32 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> > > index f4e232b..493cf2b 100644
> > > --- a/arch/arm/boot/dts/r8a77470.dtsi
> > > +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > > @@ -643,6 +643,38 @@
> > >  			resets = <&cpg 408>;
> > >  		};
> > >
> > > +		du: display@feb00000 {
> > > +			compatible = "renesas,du-r8a77470";
> > > +			reg = <0 0xfeb00000 0 0x40000>;
> > > +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&cpg CPG_MOD 724>,
> > > +				 <&cpg CPG_MOD 723>;
> > 
> > I do not see MSTP 7 bit 23 documented as used by DU
> > in the User's Manual: Hardware v1.00 Oct 13, 2017.
> > 
> > Do you have more recent documentation or some insight in this area?
> 
> I have the same document, and I can see the bit defined in page 7A-16.
> Perhaps you checked the Software Reset Register?

Thanks,

I think its likely that was my mistake.
And I now see the field described on page 7A-16.

I have gone ahead and applied this patch for inclusion in v5.2.

> 
> Thanks,
> Fab
> 
> > 
> > > +			clock-names = "du.0", "du.1";
> > > +			status = "disabled";
> > > +
> > > +			ports {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				port@0 {
> > > +					reg = <0>;
> > > +					du_out_rgb0: endpoint {
> > > +					};
> > > +				};
> > > +				port@1 {
> > > +					reg = <1>;
> > > +					du_out_rgb1: endpoint {
> > > +					};
> > > +				};
> > > +				port@2 {
> > > +					reg = <2>;
> > > +					du_out_lvds0: endpoint {
> > > +					};
> > > +				};
> > > +			};
> > > +		};
> > > +
> > >  		prr: chipid@ff000044 {
> > >  			compatible = "renesas,prr";
> > >  			reg = <0 0xff000044 0 4>;
> > > --
> > > 2.7.4
> > >
> 
