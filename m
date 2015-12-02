From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] clk: Add brcm,bcm63xx-gate-clk device tree binding
Date: Wed, 2 Dec 2015 10:12:56 -0800
Message-ID: <CAGVrzcYsjN+5Mvhasx7gqcqdzjJuzTekWwAWfMqjNrF9c7m9Ug@mail.gmail.com>
References: <565CB727.7030209@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <565CB727.7030209@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Cernekee <cernekee@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, Linux-MIPS <linux-mips@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

2015-11-30 12:52 GMT-08:00 Simon Arlott <simon@fire.lp0.eu>:
> Add device tree binding for the BCM63xx's gated clocks.
>
> The BCM63xx contains clocks gated with a register. Clocks are indexed
> by bits in the register and are active high. Clock gate bits are
> interleaved with other status bits and configurable clocks in the same
> register.
>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>  .../bindings/clock/brcm,bcm63xx-gate-clk.txt       | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt
> new file mode 100644
> index 0000000..3f4ead1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt
> @@ -0,0 +1,58 @@
> +Broadcom BCM63xx clocks
> +
> +This binding uses the common clock binding:
> +       Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +The BCM63xx contains clocks gated with a register. Clocks are indexed
> +by bits in the register and are active high. Clock gate bits are
> +interleaved with other status bits and configurable clocks in the same
> +register.

Most MIPS-based BCM63xx SoCs have clock gating set of registers, these
SoCs are pretty much all of them except 63381 (maybe newer ones too),
this one uses the PMB interface, like 63138 to control resets and
clocks fed to peripherals.

> +
> +Required properties:
> +- compatible:  Should be "brcm,bcm<soc>-gate-clk", "brcm,bcm63xx-gate-clk"

I think we would want to start with the lowest common denominator
here, which is either 6345 or 6348.
--
Florian
