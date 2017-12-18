From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH 2/3] ARM: dts: r8a7743: Add CMT SoC specific support
Date: Mon, 18 Dec 2017 15:41:56 +0000
Message-ID: <TY1PR06MB0895881A40AFCE3FA8F25BC1C00E0@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1513104579-6333-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513104579-6333-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20171213083829.ptdeggbon3szmko4@verge.net.au>
 <TY1PR06MB0895B34EFC2A48F49AFF0694C0350@TY1PR06MB0895.apcprd06.prod.outlook.com>
 <CAMuHMdWEFttz_Shve+D1Ku2NoUYX-AomzXY9JFGRjzzM=hOc_A@mail.gmail.com>
 <TY1PR06MB08954C04D41BDA8EFA04E1DFC0350@TY1PR06MB0895.apcprd06.prod.outlook.com>
 <20171218111819.nsu4dd6wacdud3lc@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171218111819.nsu4dd6wacdud3lc-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Simon,

> > Hello Geert,
> >
> > thank you for your feedback.
> >
> > > Hi Fabrizio,
> > >
> > > On Wed, Dec 13, 2017 at 10:42 AM, Fabrizio Castro
> > > <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
> > > >> On Tue, Dec 12, 2017 at 06:49:38PM +0000, Fabrizio Castro wrote:
> > > >> > Add CMT[01] support to SoC DT.
> > > >> > Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > > >> > Reviewed-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > > >> > ---
> > > >> >  arch/arm/boot/dts/r8a7743.dtsi | 30 +++++++++++++++++++++++++++=
+++
> > > >> >  1 file changed, 30 insertions(+)
> > > >>
> > > >> I was expecting the cmt nodes to be "disabled" in the SoC file
> > > >> and then enabled selectively in board files. Am I missing somethin=
g?
> > > >
> > > > Since this component is just a compare and match timer, I  thought =
there was no harm in enabling it by default in the SoC specific
> DT.
> > > > The system will park it and leave its clock disabled until actually=
 needed for something.
> > > > The user can still disable it in the board specific DT if he/she do=
esn't mean to even have the option to use it. Do you prefer I left it
> > > disabled by default?
> > >
> > > It's debatable (thus up to Simon the maintainer ;-).
> > > For I/O devices, we disable them in the SoC .dtsi file.
> > > For core infrastructure like interrupt, DMA, and GPIO controllers, we=
 keep
> > > them enabled.
> > >
> > > Timers are core functionality, but who's actually using these timers?
> >
> > I don't have a use case in mind unfortunately, but it's still core
> > functionality and pretty harmless as far as I can tell. Let's see what
> > Simon thinks about this.
>
> On Renesas SoCs we have a bit more flexibility with timers than might
> be the case on other SoCs. Thus I'd like to keep with the scheme of
> disabling them in .dtsi and enabling them when they are needed.
>
> Please update the patches.

Ok, I'll send a v2.

Thanks,
Fab



[https://www2.renesas.eu/media/email/unicef_2017.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
