Return-Path: <SRS0=hJ7p=KO=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1532685089-35645-1-git-send-email-biju.das@bp.renesas.com> <1532685089-35645-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1532685089-35645-5-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 17:14:30 +0200
Message-ID: <CAMuHMdWmObVo=UNRkmdAKhmU+aSafi61ztc1digUSWY_gvrvYA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: iwg23s-sbc: Add pinctl support for EtherAVB
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Fri, Jul 27, 2018 at 11:57 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Adding pinctrl support for EtherAVB interface.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for the update!

> --- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts

> @@ -46,6 +49,11 @@
>  };
>
>  &pfc {
> +       avb_pins: avb {
> +               groups = "avb_mdio", "avb_gmii_tx_rx";

avb_crs is wired, but deemed unused, right?

In that case:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> +               function = "avb";
> +       };
> +
>         scif1_pins: scif1 {
>                 groups = "scif1_data_b";
>                 function = "scif1";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
