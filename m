Return-Path: <SRS0=Whtj=LS=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180903215035.17265-1-linus.walleij@linaro.org> <20180903215035.17265-4-linus.walleij@linaro.org>
In-Reply-To: <20180903215035.17265-4-linus.walleij@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Sep 2018 09:39:19 +0200
Message-ID: <CAMuHMdXz+viq1CAPZNa15KQL=kMnqaSVSE98B3hqZ-P6yjtQSg@mail.gmail.com>
Subject: Re: [PATCH 3/4] spi: Add a DT binding for high impedance turnaround
Content-Type: text/plain; charset="UTF-8"
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, lorenzo.bianconi@redhat.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Linus,

On Mon, Sep 3, 2018 at 11:51 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> Some 3WIRE SPI devices require the host to insert a "high
> impedance turnaround" essentially a clock pulse after

high-impedance

(English allows both, but since you use "turn-around")

> switching the one line from output to input.
>
> This is needed to support the TPO TPG110 panel to use
> the 3WIRE SPI bindings.
>
> Cc: devicetree@vger.kernel.org
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/spi-bus.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
> @@ -70,6 +70,10 @@ All slave nodes can contain the following optional properties:
>  - spi-cs-high     - Empty property indicating device requires chip select
>                     active high.
>  - spi-3wire       - Empty property indicating device requires 3-wire mode.
> +- spi-3wire-high-impedance-turnaround - Empty property indicating that a
> +                   3wire host need to insert a high impedance turn-around

needs
high-impedance

> +                   clock cycle after turning the one output line into an
> +                   input line.
>  - spi-lsb-first   - Empty property indicating device requires LSB first mode.
>  - spi-tx-bus-width - The bus width (number of data wires) that is used for MOSI.
>                     Defaults to 1 if not present.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
