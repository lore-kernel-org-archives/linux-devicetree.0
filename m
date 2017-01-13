From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] dt-bindings: document renesas-ostm timer
Date: Fri, 13 Jan 2017 09:34:29 +0100
Message-ID: <CAMuHMdX_hx2M8Q4y7gptJvad4cbb+M54DZVCmbhunKuk4esbGA@mail.gmail.com>
References: <20170112185952.2780-1-chris.brandt@renesas.com> <20170112185952.2780-2-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170112185952.2780-2-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Thu, Jan 12, 2017 at 7:59 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  .../devicetree/bindings/timer/renesas,ostm.txt     | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt
>
> diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.txt b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
> new file mode 100644
> index 0000000..46e1f27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
> @@ -0,0 +1,36 @@
> +* Renesas OS Timer (OSTM)
> +
> +The OSTM comes with 2 independent channels.
> +We will use the first channel (OSTM0) as a free running clocksource and the
> +second channel (OSTM1) as a interrupt driven clock event.
> +
> +Additionally we will use the clocksource channel (OTSM0) for the system
> +schedule timer sched_clock().

The above two sentences are software policy, not hardware description.
Hence they do not belong in the DT bindings document.
You can move them to the commit description, though.

> +
> +Required Properties:
> +
> +  - compatible: must be one or more of the following:
> +    - "renesas,ostm-r7s72100" for the r7s72100 OSTM

Please use "renesas,r7s72100-ostm" instead, to match current practices.

> +    - "renesas,ostm" for any OSTM
> +      This is a fallback for the above renesas,ostm-* entries
> +
> +  - reg: base address and length of the registers block for each timer channel.
> +    There should be 2 sets of addresses, one for each channel.
> +
> +  - interrupts: interrupt specifiers for the timers. There should be 2
> +    interupts, one for each channel.
> +
> +  - clocks: a list of phandle + clock-specifier pairs, one for each entry
> +    channel. There should be 2 sets, one for each channel.

Are the channels truly independent? If yes, I think it's better to have two
separate device nodes, one for each channel.
Each channel has its own module clock, so using separate devices means
Runtime PM can manage both channels through their module clocks as soon as
you add a "power-domains" property pointing to the clock domain controller.

> +Example: R7S72100 (RZ/A1H) OSTM node
> +
> +       ostm: ostm@fcfec000 {
> +               compatible = "renesas,ostm-r7s72100", "renesas,ostm";
> +               reg = <0xfcfec000 0x30>,
> +                     <0xfcfec400 0x30>;
> +               interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING
> +                             GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
> +
> +               clocks = <&mstp5_clks R7S72100_CLK_OSTM0>, <&mstp5_clks R7S72100_CLK_OSTM1>;
> +       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
