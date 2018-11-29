Return-Path: <SRS0=Z+zc=OI=verge.net.au=horms@kernel.org>
Date: Thu, 29 Nov 2018 14:56:58 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 06/22] ARM: dts: r8a7744-iwg20m: Enable SDHI10 controller
Message-ID: <20181129135658.rhcghkxxnqlktkgd@verge.net.au>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1543319795-48325-7-git-send-email-biju.das@bp.renesas.com>
 <1e63706f-806a-2610-81e7-af6a36e3cad3@cogentembedded.com>
 <OSBPR01MB2103C36CA2867F42EB197739B8D00@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20181128132426.jfma4zu5i5b7ljls@verge.net.au>
 <OSBPR01MB2103CC5D39445184648AB3E2B8D10@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103CC5D39445184648AB3E2B8D10@OSBPR01MB2103.jpnprd01.prod.outlook.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 28, 2018 at 02:15:55PM +0000, Biju Das wrote:
> 
> > -----Original Message-----
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-
> > owner@vger.kernel.org> On Behalf Of Simon Horman
> > Sent: 28 November 2018 13:24
> > To: Biju Das <biju.das@bp.renesas.com>
> > Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>; Rob Herring
> > <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Magnus
> > Damm <magnus.damm@gmail.com>; linux-renesas-soc@vger.kernel.org;
> > devicetree@vger.kernel.org; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Chris Paterson
> > <Chris.Paterson2@renesas.com>; Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com>
> > Subject: Re: [PATCH 06/22] ARM: dts: r8a7744-iwg20m: Enable SDHI10
> > > >
> > > > On 11/27/2018 02:56 PM, Biju Das wrote:
> > > >
> > > > > Enable the SDHI0 controller on iWave RZ/G1N Qseven System On
> > Module.
> > > >
> > > >    Why your subject has SDHI10?
> > >
> > > It is a typo.
> > >
> > > Simon, Will you fix this while applying or do you want me to send V2?
> > > Please let me know.
> >
> > No need to repost for this.
> 
> Thanks Simon.

Thanks again,

I have now reviewed this patch and it looks fine to me but I will wait to
see if there are other reviews before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
