Return-Path: <SRS0=e23W=UL=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com> <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2019 11:29:19 +0200
Message-ID: <CAMuHMdWcTKAC8V5S0=asvs2eekc4dH72G3rMT5dxqRd8ouPNBA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

On Wed, Jun 12, 2019 at 10:39 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 12 June 2019 09:28
> > Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
> >
> > On Fri, Jun 7, 2019 at 10:14 AM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > This patch adds uSD and eMMC support to the HiHope RZ/G2M
> > > board.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> >
> > > +&sdhi3 {
> > > +       pinctrl-0 = <&sdhi3_pins>;
> > > +       pinctrl-1 = <&sdhi3_pins>;
> > > +       pinctrl-names = "default", "state_uhs";
> > > +
> > > +       vmmc-supply = <&reg_3p3v>;
> > > +       vqmmc-supply = <&reg_1p8v>;
> > > +       bus-width = <8>;
> > > +       mmc-hs200-1_8v;
> >
> > Does the eMMC support HS400, too?
>
> The eMMC does support HS400, but if I list it here the eMMC won't work properly as the SoC can't deal with it.
> Wolfram's patch blacklists HS400 for the RZ/G2M (revisions "ES1.[012]"):
> https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg40630.html
> I was thinking about sending a follow-up patch to list hs400 here after Wolfram's patch appears in a RC, would
> that be okay with you?

Fine for me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
