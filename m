Return-Path: <SRS0=hPEm=MH=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVY1ty4fGoBg7qxfkRaEBEgBEK5YDgwNryDx_tCUYpiaw@mail.gmail.com>
 <TY1PR01MB1770218E44B1C365EE23299DC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdX1jTwehG_XdsnWXz5HhPK4OYtOkb1BNr75yxZn8u6B6w@mail.gmail.com>
 <20180925074751.m2lwlinpebcun4a7@verge.net.au> <CAMuHMdVhdHsKDPuQZzwqkEUuPGYriAOgSRcROrC3DVfkmPix6Q@mail.gmail.com>
 <20180925082216.GA2270@kunai> <CAMuHMdXcZMEgjxPLTr9jsb7SvtVP-DLcMk3oa-277tTDYeEm0Q@mail.gmail.com>
 <TY1PR01MB177030FE92BDA0DB5DEB535AC0160@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB177030FE92BDA0DB5DEB535AC0160@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Sep 2018 15:03:46 +0200
Message-ID: <CAMuHMdVAiP-49kMhcQPyCT0Wpfkw8hG1e3Hx+WSqwHa77QLPvw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

On Tue, Sep 25, 2018 at 2:45 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/4] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
> > On Tue, Sep 25, 2018 at 10:22 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > > > Perhaps stating the obvious: this feels a lot like the problem we thought
> > > > > we had with different Gen-3 SoCs/ES versions. And in that case we decided
> > > > > against using compat strings to differentiate. The main difference here
> > > > > seems to be that we need to differentiate between different ports on the
> > > > > same SoC.
> > >
> > > Yes, I agree. Our so far agreed solution didn't take into account that
> > > there are different SDHI versions on the same SoC. Adding a compatible
> > > might be the easiest solution, but then we have a mix of compatibles,
> > > soc_device_match, and even version register (deeper in the driver). My
> > > gut feeling is we should take the time to rethink all this?
> > >
> > > > So either
> > > >   a) SDHI0/2 vs. SDHI1 are different, deserving different compatible values, or
> > > >   b) SDHI0/1/2 are identical, but SDHI1 is wired different, deserving the same
> > > >      compatible value, but one or more additional properties describing the
> > > >      different wiring.
> > >
> > > Actually, SDHI2 seems different, too. It doesn't support SDR104. I don't
> > > have the SDHI specific docs, but from the main docs, all SDHI instances
> > > are different.
> >
> > I forgot about the version register.
> >
> > Fabrizio: can you please check what the 3 instances report in their version
> > registers? Thanks!
>
> SDHI0: 0xcc0d
> SDHI1: 0xcc10
> SDHI2: 0xcc0d

Thank you. So SDHI1 differs from SDH0/2.
SDHI2 probably doesn't support SDR104 because its parent clock is a div6
clock, while the others have SDCKCR parents.

Plus we don't describe the relation to the SDH clock yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
