From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm: dts: gr-peach: Reduce extal_clk resolution
Date: Wed, 4 Oct 2017 17:54:46 +0200
Message-ID: <CAMuHMdXOJ6V_p26ozzwzUh5a9mvH-Aeiz2MavEf22v3iB6GiKQ@mail.gmail.com>
References: <1507131657-6414-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507131657-6414-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Wed, Oct 4, 2017 at 5:40 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> The system clock described by extal_clk is reported to have a frequency
> of 13.333 Mhz and is correctly described by gr-peach device tree.
>
> However, when enabling a RIIC device the following error is reported by
> drivers/i2c/busses/i2c-riic.c
>
> "invalid parent clk (33332500). Must be 33325000Hz"
>
> As RIIC devices have a clock source obtained by dividing by 12 the
> system clock, the resulting value is not accepted by the driver
> (which clearly states not to support any frequency except the reported
> 33325000Hz one).
>
> Hence, reduce the system clock accuracy to a value which makes
> frequencies obtained through division accepted by RIIC driver.
>
> Please note that other r7s72100 boards, such as Genmai, report the same
> "reduced accuracy" frequency, even if their external clock sources are
> effectively 13.333Mhz as gr-peach one.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

There's no need to do this, Chris already proposed a fix, cfr.
"[PATCH v2] i2c: riic: remove fixed clock restriction"
(https://www.spinics.net/lists/linux-renesas-soc/msg18573.html).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
