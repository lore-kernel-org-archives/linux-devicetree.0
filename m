Return-Path: <SRS0=Ncy5=WP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com> <1565867073-24746-10-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1565867073-24746-10-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2019 14:03:04 +0200
Message-ID: <CAMuHMdW9Lx_x=tgTXxpKAqTxY5w_b06y7Httky-ks8jj3zQHBg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: Add EK874 board with
 idk-2121wr display support
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

On Thu, Aug 15, 2019 at 1:05 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> The EK874 is advertised as compatible with panel IDK-2121WR from
> Advantech, however the panel isn't sold alongside the board.
> A new dts, adding everything that's required to get the panel to
> to work with the EK874, is the most convenient way to support the
> EK874 when it's connected to the IDK-2121WR.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> Geert,
>
> at this point in time no other board uses this display, can we
> postpone the creation of the .dtsi file to when there'll be another
> user (if any)?

OK.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts

> +&lvds0 {
> +       renesas,swap-data;

Wasn't that property dropped?

I'd be grateful if anyone could review the panel parts.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
