Return-Path: <SRS0=v6br=LA=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v3 5/5] ARM: dts: iwg23s-sbc: Add pinctl support for
 EtherAVB
Date: Fri, 17 Aug 2018 09:03:08 +0000
Message-ID: 
 <OSBPR01MB210363D03733F02F6515105CB83D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
 <1533628626-26503-6-git-send-email-biju.das@bp.renesas.com>
 <20180810121231.776wrl3cozakpsao@verge.net.au>
 <OSBPR01MB2103211FDAC790771BFFB765B8240@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20180817084445.3iud4quiwvawhkbf@verge.net.au>
In-Reply-To: <20180817084445.3iud4quiwvawhkbf@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for the feedback.

> -----Original Message-----
> From: devicetree-owner@vger.kernel.org <devicetree-
> owner@vger.kernel.org> On Behalf Of Simon Horman
> Sent: 17 August 2018 09:45
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH v3 5/5] ARM: dts: iwg23s-sbc: Add pinctl support for
> EtherAVB
>
> On Fri, Aug 10, 2018 at 01:47:12PM +0000, Biju Das wrote:
> > Hello Simon,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v3 5/5] ARM: dts: iwg23s-sbc: Add pinctl support
> > > for EtherAVB
> > >
> > > On Tue, Aug 07, 2018 at 08:57:06AM +0100, Biju Das wrote:
> > > > Adding pinctrl support for EtherAVB interface.
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > V1-->V2
> > > >      * No change
> > > > V2-->V3
> > > >      * No change
> > > >      Depend onthe below patch
> > > >        https://patchwork.kernel.org/patch/10546801/
> > >
> > > What is the effect of applying this patch without that dependency
> present?
> >
> > No build dependency. Only driver probe will fail during run time.
> > [    0.838091] ravb: probe of e6800000.ethernet failed with error -22
>
> Thanks, but does the driver probe fail without this patch?

Drive probe works ok without  this patch.

> If so I'd rather hold off on this until v4.21.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
