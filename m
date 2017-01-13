From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] ARM: dts: rskrza1: add ostm DT support
Date: Fri, 13 Jan 2017 09:40:58 +0100
Message-ID: <CAMuHMdWNd=TqqWAv3NhEF5R8JRQ362EJ3LirHpqBLgQK3w30oA@mail.gmail.com>
References: <20170112190108.2856-1-chris.brandt@renesas.com> <20170112190108.2856-4-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170112190108.2856-4-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Thu, Jan 12, 2017 at 8:01 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -513,7 +513,8 @@
>                 interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING
>                               GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
>
> -               clocks = <&mstp5_clks R7S72100_CLK_OSTM0>, <&mstp5_clks R7S72100_CLK_OSTM1>;
> +               clocks = <&mstp5_clks R7S72100_CLK_OSTM0>,
> +                        <&mstp5_clks R7S72100_CLK_OSTM1>;

I think this change should be folded into "[PATCH 2/3] ARM: dts: r7s72100: add
ostm to device tree" ;-)

>                 status = "disabled";
>         };
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
