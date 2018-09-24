Return-Path: <SRS0=oVJk=MG=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVY1ty4fGoBg7qxfkRaEBEgBEK5YDgwNryDx_tCUYpiaw@mail.gmail.com> <20180924122637.GA1661@kunai>
In-Reply-To: <20180924122637.GA1661@kunai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Sep 2018 14:44:37 +0200
Message-ID: <CAMuHMdX7MJWuPBLH_7fVTD-EyiSiMGVGrv8s_BY55uoURaSoZw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
Content-Type: text/plain; charset="UTF-8"
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Wolfram,

On Mon, Sep 24, 2018 at 2:26 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > It seems RZ/G1C has two slighty different types of SD card interfaces:
> >   1. SDHI0 and SDHI2 use SYS-DMAC,
> >   2. SDHI1 can also be used as an MMC interface, and has an internal DMAC.
> >
> > Do we need to distinguish between them using the compatible value, or
> > are there other ways?
>
> Yes, that seems to need an update to our current implementation which is
> per-SoC only. One idea from my side would be to whitelist SYS-DMAC for
> this compatible and then check if dma-properties are present, otherwise
> fall back to internal DMAC?

I'm afraid that won't work, as the "dmas" properties are optional. So you
cannot distinguish between optional properties missing and internal DMA
present.

A dirty hack would be checking the device name for xxxxxxxx.sdhi, like how
whitelisting is implemented in the IPMMU driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
