From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH  0/3] Add SMP support
Date: Thu, 10 Aug 2017 11:19:10 +0000
Message-ID: <KL1PR06MB1702C4E3CE94EFA111DE530BB8880@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1502189793-59679-1-git-send-email-biju.das@bp.renesas.com>
 <20170809083554.GI2705@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Biju Das
> Sent: 10 August 2017 10:17
> To: 'Simon Horman' <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland
> <mark.rutland-5wv7dgnIgG8@public.gmane.org>; Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>;
> Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>; Chris Paterson
> <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-renesas-
> soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: RE: [PATCH 0/3] Add SMP support
>
>
> > -----Original Message-----
> > From: Simon Horman [mailto:horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org]
> > Sent: 09 August 2017 09:36
> > To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland
> > <mark.rutland-5wv7dgnIgG8@public.gmane.org>; Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>;
> Russell
> > King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>; Chris Paterson
> > <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > linux-renesas- soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Subject: Re: [PATCH 0/3] Add SMP support
> >
> > On Tue, Aug 08, 2017 at 11:56:30AM +0100, Biju Das wrote:
> > > This series aims to add SMP support for r8a7743 SoC.
> > >
> > > This series has been tested against Linux-next tag 20170727 and
> > > renesas-dev branch.
> >
> > It seems that these patches are targeted at the renesas tree.
> > The best practice in that case is to base patches on the latest devel b=
ranch.
> > Please consider doing so in future.
> >
> > The patches themselves seem good to me, however, I would like to
> > enquire about testing. In particular, have you tested CPU hotplug and
> > suspend to RAM with these patches (and without in the case of the latte=
r)?
>
> I have tested CPU hotplug with this patch and it works ok.
>
> Currently iWave platform doesn't support STR I guess. But we should check=
 the
> changes on other M2 platforms to prove that things don't break.

I have tested STR on RZ-G1M SK(r8a7743) platform using gpio-key as wake up =
source.
It works fine with and without the patch . It is tested against renesas-dev=
eloper branch.

Also I have tested STR on R-Car M2 board.it works fine with gpio-key as wak=
e up source.

> [>]
> > I am cautious about any regressions that may creep in when going from
> > UP to SMP.
>
> > >
> > > Biju Das (3):
> > >   dt-bindings: apmu: Document r8a7743 support
> > >   ARM: dts: r8a7743: Add APMU node and second CPU core
> > >   ARM: dts: r8a7743: Add OPP table for frequency scaling
> > >
> > >  .../devicetree/bindings/power/renesas,apmu.txt     |  3 ++-
> > >  arch/arm/boot/dts/r8a7743.dtsi                     | 25
> ++++++++++++++++++++++
> > >  2 files changed, 27 insertions(+), 1 deletion(-)
> > >
> > > --
> > > 1.9.1
> > >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
