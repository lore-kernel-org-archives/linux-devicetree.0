Return-Path: <SRS0=fPTE=NL=verge.net.au=horms@kernel.org>
Date: Wed, 31 Oct 2018 15:25:05 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a77470 CMT
 support
Message-ID: <20181031142501.dun2rla6mi5vginu@verge.net.au>
References: <1540542973-15752-1-git-send-email-biju.das@bp.renesas.com>
 <TYXPR01MB1775E03BA074105B92580477C0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <20181031125516.t7ahujfvqmuej5u2@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181031125516.t7ahujfvqmuej5u2@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Oct 31, 2018 at 01:55:16PM +0100, Simon Horman wrote:
> On Fri, Oct 26, 2018 at 09:48:19AM +0000, Fabrizio Castro wrote:
> > > Subject: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a77470 CMT support
> > >
> > > Document SoC specific compatible strings for r8a77470. No driver change
> > > is needed as the fallback strings will activate the right code.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > 
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Thanks, applied for v4.21.

On second thoughts, I think this should either go through
Daniel's tree or be acked by him.
