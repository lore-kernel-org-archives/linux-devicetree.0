Return-Path: <SRS0=9+2E=TA=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com> <1555428717-18376-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1555428717-18376-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Apr 2019 16:10:30 +0200
Message-ID: <CAMuHMdV4PiVjYotbR-LF-2BNkpY61Q7XsxKFKDk56dvA_0iibA@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: r8a774a1: Add VSP instances
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Tue, Apr 16, 2019 at 5:38 PM Biju Das <biju.das@bp.renesas.com> wrote:
> The r8a774a1 soc has 5 VSP instances similar to r8a7796.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -1877,6 +1877,61 @@
>                         iommus = <&ipmmu_vc0 19>;
>                 };
>
> +               vspb: vsp@fe960000 {
> +                       compatible = "renesas,vsp2";
> +                       reg = <0 0xfe960000 0 0x8000>;
> +                       interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 626>;
> +                       power-domains = <&sysc R8A774A1_PD_A3VC>;

I have my doubts about vspb (and fcpvb0) being part of the A3VC power
domain (also on R-Car M3-W).


> +                       resets = <&cpg 626>;
> +
> +                       renesas,fcp = <&fcpvb0>;
> +               };

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
