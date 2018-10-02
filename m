From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: pinctrl: renesas,rzn1-pinctrl: documentation
Date: Tue, 2 Oct 2018 12:29:24 +0200
Message-ID: <CAMuHMdWc8qfzFdFeuJgJaTgSvws_AOBu4c9o91b=4FwMDYwPnw@mail.gmail.com>
References: <20181001131026.14635-1-phil.edworthy@renesas.com> <20181001131026.14635-2-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001131026.14635-2-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Phil,

On Mon, Oct 1, 2018 at 3:10 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The Renesas RZ/N1 device family PINCTRL node description.
>
> Based on a patch originally written by Michel Pollet at Renesas.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> v7:
>  - Revert changes in v6, and just remove the token pasting
>
> v6:
>  - Instead of combining the pin nr and func into a single element, use
>    a pair of 8-bit elements.

Thanks for the update!

I have replaced v5 with v7, after s/RZN1_MUX/RZN1_PINMUX/s for
consistency with other SoC families.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
