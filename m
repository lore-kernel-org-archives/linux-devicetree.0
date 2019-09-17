From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] devicetree: property-units: Add kohms unit
Date: Tue, 17 Sep 2019 10:19:03 +0200
Message-ID: <CAMuHMdUWue6-51Za7vejk=QkhV80iBXdc1E+6aTmQsvpB5AP-A@mail.gmail.com>
References: <20190917075850.40039-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917075850.40039-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Biwen,

On Tue, Sep 17, 2019 at 10:09 AM Biwen Li <biwen.li@nxp.com> wrote:
> The patch adds kohms unit
>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/property-units.txt
> +++ b/Documentation/devicetree/bindings/property-units.txt
> @@ -27,6 +27,7 @@ Electricity
>  -microamp      : microampere
>  -microamp-hours : microampere hour
>  -ohms          : ohm
> +-kohms         : kiloohm
>  -micro-ohms    : microohm
>  -microwatt-hours: microwatt hour
>  -microvolt     : microvolt

What's your rationale for adding "kohms"?
Do you need to specify resistance values that do not fit in 32-bit, and
thus cannot be specified using "ohms"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
