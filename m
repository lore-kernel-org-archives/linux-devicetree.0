Return-Path: <SRS0=PDnu=J3=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1531312174-17489-1-git-send-email-phil.edworthy@renesas.com> <1531312174-17489-2-git-send-email-phil.edworthy@renesas.com>
In-Reply-To: <1531312174-17489-2-git-send-email-phil.edworthy@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jul 2018 14:39:05 +0200
Message-ID: <CAMuHMdU6-vKAfbd-pf9jXrrFFbSANHckGGQnkHsXabQsCvFFNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt: serial: Add Renesas RZ/N1 binding documentation
Content-Type: text/plain; charset="UTF-8"
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Phil,

On Wed, Jul 11, 2018 at 2:30 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The RZ/N1 UART is a modified Synopsys DesignWare UART.
> The modifications only relate to DMA so you could actually use the
> controller with the Synopsys compatible string if you are not using
> DMA, but you should not do so.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt
> @@ -0,0 +1,10 @@
> +Renesas RZ/N1 UART
> +
> +This controller is based on the Synopsys DesignWare ABP UART and inherits all
> +properties defined in snps-dw-apb-uart.txt except for the compatible property.
> +
> +Required properties:
> +- compatible : The device specific string followed by the generic RZ/N1 string.
> +   Therefore it must be one of:
> +   "renesas,uart-r9a06g032", "renesas,uart-rzn1"

"renesas,r9a06g032-uart", "renesas,rzn1-uart"

> +   "renesas,uart-r9a06g033", "renesas,uart-rzn1"

"renesas,r9a06g033-uart", "renesas,rzn1-uart"

I assume you plan to describe the DMA-related properties later?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
