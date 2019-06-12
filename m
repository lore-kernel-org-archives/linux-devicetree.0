Return-Path: <SRS0=e23W=UL=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
In-Reply-To: <20190612094524.GA2153@kunai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2019 13:06:09 +0200
Message-ID: <CAMuHMdVFvL4wRuHD64-N0KK-YQDvjZXm+HKf2mBQ=Jz8N=-A_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Content-Type: text/plain; charset="UTF-8"
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

Hi Wolfram,

On Wed, Jun 12, 2019 at 11:45 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > I was thinking about sending a follow-up patch to list hs400 here
> > after Wolfram's patch appears in a RC, would that be okay with you?
>
> Do we need that? The *board* does not handle HS400, so why add the
> property?
>
> Similar setting would be an I2C device which can do 400kHz but the board
> layout doesn't allow for such speeds, so we are limited to 100kHz.

Do we know the HiHope board layout does not support HS400?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
