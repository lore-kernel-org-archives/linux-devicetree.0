Return-Path: <SRS0=JwyO=OC=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181115161528.34326-1-chris.brandt@renesas.com>
In-Reply-To: <20181115161528.34326-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Nov 2018 09:33:05 +0100
Message-ID: <CAMuHMdXyCO6De0V7eFwL5dyYgjpWABcgi7cn-n+NbuA-Ts0bAQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] pinctrl: Add RZ/A2 pin and gpio driver
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Nov 15, 2018 at 5:15 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The pin controller in the RZ/A2 is nothing like the pin controller in
> the RZ/A1. That's a good thing! This pin controller is much more simple
> and easier to configure.
>
> So, this driver is faily simple (I hope).

Thanks, qeuing in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
