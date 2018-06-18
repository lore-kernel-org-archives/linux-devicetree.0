From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 0/5] Renesas R9A06G032 PINCTRL Driver
Date: Mon, 18 Jun 2018 10:57:18 +0200
Message-ID: <CAMuHMdVL-00gb7ZfgNGr8-VawFUpg+iY5mpPF6UZPfjFqM1_jg@mail.gmail.com>
References: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com> <CACRpkdbX0R+ipasLfZi80yf2OBU0TuDT-0KoUJBvrQz3Zj6eFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbX0R+ipasLfZi80yf2OBU0TuDT-0KoUJBvrQz3Zj6eFQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michel Pollet <michel.pollet@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Magnus Damm <damm+renesas@opensource.se>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Mon, Jun 18, 2018 at 10:46 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Jun 14, 2018 at 1:00 PM, Michel Pollet
> <michel.pollet@bp.renesas.com> wrote:
>
> > *WARNING* -- this requires:
> > + R9A06G032 base patch v9
> > + R9A06G032 SMP patch v5
>
> Is that required for the pin controller itself (compile-time dependence)
> or is it required to boot the system (run-time dependence)?

Obviously the last 3 patches in the series touch the DTS, so they depend
on the base patch adding the DTS files.

> We can merge support for pin control ahead, that's fine.

The actual pinctrl driver can indeed be merged separately.

> > This implements the pinctrl driver for the R9A06G032.
>
> Geert Uytterhoeven and Laurent Pinchart maintains the Renesas pin
> controllers, and this one is for some reason a totally new one in
> drivers/pinctrl/pinctrl-r9a06g032.c
>
> Is it totally different from the other "great old ones" in the SuperH-PFC
> series or is there some other reason why it was done like this?

Yes it is, cfr. drivers/pinctrl/pinctrl-rza1.c, which lives outside sh-pfc, too.

Of course I can take it through my sh-pfc tree, once the rough edges have been
removed.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
