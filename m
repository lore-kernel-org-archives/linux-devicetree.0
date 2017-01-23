From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: document renesas-ostm timer
Date: Mon, 23 Jan 2017 10:15:09 +0100
Message-ID: <CAMuHMdU+wfKj+B+7vHCnLMaakL6o9phJkYPex272z4UurcXemg@mail.gmail.com>
References: <20170120212003.4103-1-chris.brandt@renesas.com> <20170120212003.4103-2-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170120212003.4103-2-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Jan 20, 2017 at 10:20 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>
> ---
> v2:
> * remove sw implementation specific portions
> ---
>  .../devicetree/bindings/timer/renesas,ostm.txt     | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt
>
> diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.txt b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
> new file mode 100644
> index 0000000..06d7d71
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
> @@ -0,0 +1,29 @@
> +* Renesas OS Timer (OSTM)
> +
> +The OSTM is a multi-channel 32-bit timer/counter with fixed clock
> +source that can operate in either interval count down timer or free-running
> +compare match mode.
> +
> +Channels are independent from each other.
> +
> +Required Properties:
> +
> +  - compatible: must be one or more of the following:
> +    - "renesas,r7s72100-ostm" for the r7s72100 OSTM
> +    - "renesas,ostm" for any OSTM
> +               This is a fallback for the above renesas,*-ostm entries
> +
> +  - reg: base address and length of the register block for a timer channel.
> +
> +  - interrupts: interrupt specifier for the timer channel.
> +
> +  - clocks: clock specifier for the timer channel.
> +
> +Example: R7S72100 (RZ/A1H) OSTM node
> +
> +       ostm0: ostm@fcfec000 {

timer@fcfec000

If you fix that:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> +               compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> +               reg = <0xfcfec000 0x30>;
> +               interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
> +               clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
> +       };
> --
> 2.10.1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
