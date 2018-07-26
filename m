Return-Path: <SRS0=Qj0e=KK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180725143850.32985-1-chris.brandt@renesas.com> <20180725143850.32985-4-chris.brandt@renesas.com>
In-Reply-To: <20180725143850.32985-4-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 13:41:05 +0200
Message-ID: <CAMuHMdVBro=vmcL3kkzxz5a10wz2KU4J4punXu=-mzC0qGCojg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] serial: sh-sci: Document r7s9210 bindings
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 25, 2018 at 4:39 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add R7S9210 (RZ/A2) support.
> Also describe interrupts property in more detail.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Add more details to interrupts property
>  * Geert gave a Reviewed-by for V1, but then later said that was a
>    mistake because it was missing the interrupts description, so
>    I didn't include his Reviewed-by yet.

Thanks for the update!

With the below typo fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
> +++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
> @@ -72,7 +73,21 @@ Required properties:
>      family-specific and/or generic versions.
>
>    - reg: Base address and length of the I/O registers used by the UART.
> -  - interrupts: Must contain an interrupt-specifier for the SCIx interrupt.
> +  - interrupts: Must contain one or more interrupt-specifiers for the SCIx.
> +                If a single interrupt is expressed, then all events are
> +                multiplexed into this single interrupt.
> +
> +                If multiple interrupts are provided by the hardware, the order
> +                in which the interrupts are listed must match order below. Note
> +                that some HW interrupt events may be muxed together resulting
> +                in duplicate entires.

entries

> +                The interrupt order is as follows:
> +                  1. Error (ERI)
> +                  2. Receive buffer full (RXI)
> +                  3. Transmit buffer empty (TXI)
> +                  4. Break (BRI)
> +                  5. Data Ready (DRI)
> +                  6. Transmit End (TEI)
>
>    - clocks: Must contain a phandle and clock-specifier pair for each entry
>      in clock-names.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
