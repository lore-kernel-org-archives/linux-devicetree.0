From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: renesas,r9a06g032-sysctrl:
 Document power Domains
Date: Tue, 28 May 2019 09:28:55 +0200
Message-ID: <CAMuHMdV2jmY2u1-Z6cRR1OQcfW8U0HM_ac-xn1gO9nPf41iD+A@mail.gmail.com>
References: <1558711904-27278-1-git-send-email-gareth.williams.jx@renesas.com> <1558711904-27278-2-git-send-email-gareth.williams.jx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558711904-27278-2-git-send-email-gareth.williams.jx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gareth Williams <gareth.williams.jx@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Phil Edworthy <phil.edworthy@renesas.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Gareth,

On Fri, May 24, 2019 at 5:32 PM Gareth Williams
<gareth.williams.jx@renesas.com> wrote:
> The driver is gaining power domain support, so add the new property
> to the DT binding and update the examples.
>
> Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
@@ -40,4 +42,5 @@ Examples
>                 reg-io-width = <4>;
>                 clocks = <&sysctrl R9A06G032_CLK_UART0>;
>                 clock-names = "baudclk";
> +               power-domains = <&sysctrl>;

This is an interesting example: according to the driver,
R9A06G032_CLK_UART0, is not clock used for power management?

Oh, the real uart0 node in arch/arm/boot/dts/r9a06g032.dtsi uses

    clocks = <&sysctrl R9A06G032_CLK_UART0>, <&sysctrl R9A06G032_HCLK_UART0>;
    clock-names = "baudclk", "apb_pclk";

That does make sense...

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
