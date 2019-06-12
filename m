Return-Path: <SRS0=e23W=UL=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai> <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612101516.xrlvqw7cls7eiv4u@ninjato>
In-Reply-To: <20190612101516.xrlvqw7cls7eiv4u@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2019 13:07:48 +0200
Message-ID: <CAMuHMdWPe8CgsJrNjt+6DqES6AB5o1FpTXdVsUJiDi9MDFE6dA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Content-Type: text/plain; charset="UTF-8"
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

Hi Wolfram,

On Wed, Jun 12, 2019 at 12:15 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > File arch/arm64/boot/dts/renesas/hihope-common.dtsi contains common
> > definitions for the mother boards for both flavours (including the
> > eMMC). My understanding is that R-Car M3-N does support HS400, hence
> > the need for the property here.
>
> I won't be super strict here, yet I think it is more elegant to add the
> HS400 properties to the board DTS files, not the dtsi. I mean we could
> add them to the SoC dtsi otherwise.

This _is_ the (shared) board DTS, cfr. salvator-common.dtsi and
ulcb.dtsi, which do have mmc-hs400-1_8v properties.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
