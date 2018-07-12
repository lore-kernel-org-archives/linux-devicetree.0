Return-Path: <SRS0=F8cI=J4=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180712030149.91385-1-chris.brandt@renesas.com> <20180712030149.91385-3-chris.brandt@renesas.com>
In-Reply-To: <20180712030149.91385-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jul 2018 14:14:35 +0200
Message-ID: <CAMuHMdXuXJdvtmEu3WYVSgwd0xfCpQcWQeL+FA9vUMxiA7h=VQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: Document RZ/A2 SoC DT bindings
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Jul 12, 2018 at 5:02 AM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add device tree bindings documentation for Renesas RZ/A2 (r7s9210) SoC.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -7,6 +7,8 @@ SoCs:
>      compatible = "renesas,emev2"
>    - RZ/A1H (R7S72100)
>      compatible = "renesas,r7s72100"
> +  - RZ/A2 (R7S9210)
> +    compatible = "renesas,r7s9210"

There seems to be a difference between the r7s92104x and the r7s92105x
parts (with "x" just denoting a different packaging)?
Do we need one more digit?

>    - SH-Mobile AG5 (R8A73A00/SH73A0)
>      compatible = "renesas,sh73a0"
>    - R-Mobile APE6 (R8A73A40)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
