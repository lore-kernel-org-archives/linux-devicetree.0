Return-Path: <SRS0=6yyY=NR=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1540546347-42791-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540546347-42791-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Nov 2018 11:18:14 +0100
Message-ID: <CAMuHMdX0rQFn330ZhOOs0tA91+oYfVxND9g1kkizgfMeA3UxPA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r8a77470: Add watchdog support to SoC dtsi
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Fri, Oct 26, 2018 at 11:40 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds watchdog support to the r8a77470 SoC dtsi.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -196,6 +196,16 @@
>                         reg = <0 0xe6160000 0 0x100>;
>                 };
>
> +               rwdt: watchdog@e6020000 {

Please follow the sort order rules:
  - By unit-address (if present), per group,
  - Alphabetically.

> +                       compatible = "renesas,r8a77470-wdt",
> +                                    "renesas,rcar-gen2-wdt";
> +                       reg = <0 0xe6020000 0 0x0c>;
> +                       clocks = <&cpg CPG_MOD 402>;
> +                       power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +                       resets = <&cpg 402>;
> +                       status = "disabled";
> +               };
> +
>                 sysc: system-controller@e6180000 {
>                         compatible = "renesas,r8a77470-sysc";
>                         reg = <0 0xe6180000 0 0x200>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
