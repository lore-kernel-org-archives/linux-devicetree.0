Return-Path: <SRS0=e23W=UL=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2019 10:27:56 +0200
Message-ID: <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

On Fri, Jun 7, 2019 at 10:14 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds uSD and eMMC support to the HiHope RZ/G2M
> board.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi

> +&sdhi3 {
> +       pinctrl-0 = <&sdhi3_pins>;
> +       pinctrl-1 = <&sdhi3_pins>;
> +       pinctrl-names = "default", "state_uhs";
> +
> +       vmmc-supply = <&reg_3p3v>;
> +       vqmmc-supply = <&reg_1p8v>;
> +       bus-width = <8>;
> +       mmc-hs200-1_8v;

Does the eMMC support HS400, too?

> +       non-removable;
> +       fixed-emmc-driver-type = <1>;
> +       status = "okay";
> +};

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
