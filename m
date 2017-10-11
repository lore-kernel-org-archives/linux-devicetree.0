From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] ARM: dts: gr-peach: Enable ostm0 and ostm1 timers
Date: Wed, 11 Oct 2017 14:45:16 +0200
Message-ID: <CAMuHMdXPiO1iZMABAZRfKv0HwYcVtZ_BkEa=dKFczx-3s84_Gg@mail.gmail.com>
References: <1507538915-16566-1-git-send-email-jacopo+renesas@jmondi.org> <1507538915-16566-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507538915-16566-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Chris Brandt <Chris.Brandt@renesas.com>, Andrew Lunn <andrew@lunn.ch>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 9, 2017 at 10:48 AM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Enable ostm0 and ostm1 timers to be used as clock source and clockevent
> source. The timers provides greater accuracy than the already enabled
> mtu2 one.
>
> With these enabled:
>
> clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
> sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every 64440619504ns
> ostm: used for clocksource
> ostm: used for clock events
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Suggested-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
