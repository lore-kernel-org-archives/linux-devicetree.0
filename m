Return-Path: <SRS0=0pQc=N3=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181115161528.34326-1-chris.brandt@renesas.com> <20181115161528.34326-2-chris.brandt@renesas.com>
In-Reply-To: <20181115161528.34326-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Nov 2018 10:02:46 +0100
Message-ID: <CAMuHMdW7SDv34FDOinnZC6dNm3rofJHdHH=L=s1YmzJ1ifoMiQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 15, 2018 at 5:15 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Adds support for the pin and gpio controller found in R7S9210 (RZ/A2) SoCs.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> v6:
>  * Bug fix: Output value not being set in rza2_chip_direction_output()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
