Return-Path: <SRS0=hWsO=RL=verge.net.au=horms@kernel.org>
Date: Fri, 8 Mar 2019 13:05:11 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add RWDT support
Message-ID: <20190308120511.vw3tseqvkyotkpeu@verge.net.au>
References: <1551871785-4093-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB22857AB97F530249900887C1B7730@TYAPR01MB2285.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB22857AB97F530249900887C1B7730@TYAPR01MB2285.jpnprd01.prod.outlook.com>
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>, "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 06, 2019 at 11:52:03AM +0000, Chris Paterson wrote:
> 
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Sent: 06 March 2019 11:30
> > 
> > Enable RWDT and use 60 seconds as default timeout.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Thanks, applied for v5.2.

> Kind regards, Chris
> 
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> > b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> > index 96ee0d2c..49ad3a5 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> > @@ -84,6 +84,11 @@
> >  	};
> >  };
> > 
> > +&rwdt {
> > +	timeout-sec = <60>;
> > +	status = "okay";
> > +};
> > +
> >  &scif2 {
> >  	pinctrl-0 = <&scif2_pins>;
> >  	pinctrl-names = "default";
> > --
> > 2.7.4
> 
