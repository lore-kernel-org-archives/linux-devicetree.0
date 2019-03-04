Return-Path: <SRS0=MF8h=RH=verge.net.au=horms@kernel.org>
Date: Mon, 4 Mar 2019 10:38:31 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
Message-ID: <20190304093831.4rchfgz574nb6itm@verge.net.au>
References: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYXPR01MB17752BA491B4A41F1257EB61C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYXPR01MB17752BA491B4A41F1257EB61C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 01, 2019 at 12:00:39PM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Are you happy with this patch?
> 
> Thanks,
> Fab
> 
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Sent: 15 February 2019 12:26
> > Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
> > 
> > We usually leave a space between "=" and the value of device
> > tree properties, but unfortunately that was overlooked for the
> > "clocks" property of cpu@0 and cpu@1.
> > This patch fixes the spacing with the "clocks" property of
> > cpu@0 and cpu@1.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, and sorry for the delay.

Applied for v5.2.

> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > index 61a0afb..0bbcaf1 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > @@ -76,7 +76,7 @@
> >  			power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
> >  			next-level-cache = <&L2_CA53>;
> >  			enable-method = "psci";
> > -			clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;
> > +			clocks = <&cpg CPG_CORE R8A774C0_CLK_Z2>;
> >  			operating-points-v2 = <&cluster1_opp>;
> >  		};
> > 
> > @@ -87,7 +87,7 @@
> >  			power-domains = <&sysc R8A774C0_PD_CA53_CPU1>;
> >  			next-level-cache = <&L2_CA53>;
> >  			enable-method = "psci";
> > -			clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;
> > +			clocks = <&cpg CPG_CORE R8A774C0_CLK_Z2>;
> >  			operating-points-v2 = <&cluster1_opp>;
> >  		};
> > 
> > --
> > 2.7.4
> 
