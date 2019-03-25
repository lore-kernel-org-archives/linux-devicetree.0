Return-Path: <SRS0=cqG6=R4=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <b2964da9-4389-b277-0e6f-df41f39326b7@cogentembedded.com>
In-Reply-To: <b2964da9-4389-b277-0e6f-df41f39326b7@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Mar 2019 19:34:49 +0100
Message-ID: <CAMuHMdVr4EcgNdBSnAb2zPCopVCyCWNF8ebcWJzzx=FvrVc0QQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: Renesas R-Car IMR bindings
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kbingham@kernel.org>
List-ID: <devicetree@vger.kernel.org>

CC Laurent, Kieran

On Mon, Mar 25, 2019 at 7:14 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The image renderer (IMR), or the distortion correction engine, is a
> drawing processor with a simple instruction system capable of referencing
> video capture data or data in an external memory as the 2D texture data
> and performing texture mapping and drawing with respect to any shape that
> is split into triangular objects.
>
> Document  the device tree bindings for the image renderer light extended 4
> (IMR-LX4) found in the R-Car gen3 SoCs...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Rob Herring <robh@kernel.org>
>
> ---
> This patch is against the 'master' branch of the 'media_tree.git' repo.
>
> This patch has been split from the large IMR driver patch (which would need
> much more work), it fixes checkpatch.pl's warnings on the SoC .dtsi files
> which have been already merged (the bindings didn't change since v1 of the
> driver patch).
>
> Documentation/devicetree/bindings/media/rcar_imr.txt |   27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> Index: media_tree/Documentation/devicetree/bindings/media/rcar_imr.txt
> ===================================================================
> --- /dev/null
> +++ media_tree/Documentation/devicetree/bindings/media/rcar_imr.txt
> @@ -0,0 +1,27 @@
> +Renesas R-Car Image Renderer (Distortion Correction Engine)
> +-----------------------------------------------------------
> +
> +The image renderer, or the distortion correction engine, is a drawing processor
> +with a simple instruction system capable of referencing video capture data or
> +data in an external memory as 2D texture data and performing texture mapping
> +and drawing with respect to any shape that is split into triangular objects.
> +
> +Required properties:
> +
> +- compatible: "renesas,<soctype>-imr-lx4", "renesas,imr-lx4" as a fallback for
> +  the image renderer light extended 4 (IMR-LX4) found in the R-Car gen3 SoCs,
> +  where the examples with <soctype> are:
> +  - "renesas,r8a7795-imr-lx4" for R-Car H3,
> +  - "renesas,r8a7796-imr-lx4" for R-Car M3-W.
> +- reg: offset and length of the register block;
> +- interrupts: single interrupt specifier;
> +- clocks: single clock phandle/specifier pair.

power-domains? (they're usually not in the always-on area on R-Car Gen3)
resets?

> +
> +Example:
> +
> +       imr-lx4@fe860000 {
> +               compatible = "renesas,r8a7795-imr-lx4", "renesas,imr-lx4";
> +               reg = <0 0xfe860000 0 0x2000>;
> +               interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&cpg CPG_MOD 823>;
> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
