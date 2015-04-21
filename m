From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 05/11] ARM: dts: add imx7d soc dtsi file
Date: Tue, 21 Apr 2015 18:28:34 +0100
Message-ID: <20150421172834.GF10164@leverpostej>
References: <1429628007-8892-1-git-send-email-Frank.Li@freescale.com>
 <1429628007-8892-6-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429628007-8892-6-git-send-email-Frank.Li@freescale.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: "Frank.Li@freescale.com" <Frank.Li@freescale.com>
Cc: "lznuaa@gmail.com" <lznuaa@gmail.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anson Huang <b20788@freescale.com>
List-Id: devicetree@vger.kernel.org

> +/*
> +               cpu1: cpu@1 {
> +                       compatible = "arm,cortex-a7";
> +                       device_type = "cpu";
> +                       reg = <1>;
> +               };
> +*/

Why have it commented out? If it's not available, leave it out entirely.

> +       intc: interrupt-controller@31001000 {
> +               compatible = "arm,cortex-a7-gic";
> +               #interrupt-cells = <3>;
> +               interrupt-controller;
> +               reg = <0x31001000 0x1000>,
> +                     <0x31002000 0x100>;
> +       };

GICC should be larger than 0x100 bytes.

What about GICH, GICV?

What state do CPUs enter the kernel?

> +
> +       clocks {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ckil: clock@0 {
> +                       compatible = "fixed-clock";
> +                       reg = <0>;
> +                       #clock-cells = <0>;
> +                       clock-frequency = <32768>;
> +                       clock-output-names = "ckil";
> +               };
> +
> +               osc: clock@1 {
> +                       compatible = "fixed-clock";
> +                       reg = <1>;
> +                       #clock-cells = <0>;
> +                       clock-frequency = <24000000>;
> +                       clock-output-names = "osc";
> +               };
> +
> +       };

Get rid of the clocks container node, and put these under the root.

> +
> +       timer {
> +               compatible = "arm,armv7-timer";
> +               arm,cpu-registers-not-fw-configured;

This was bad enough the first time...

> +               interrupts = <GIC_PPI 13
> +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <GIC_PPI 14
> +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;

Two interrupts are missing.

> +               interrupt-parent = <&intc>;
> +               clock-frequency = <8000000>;

Why isn't this programmed?

> +       };
> +
> +       soc {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "simple-bus";
> +               interrupt-parent = <&intc>;
> +               ranges;
> +
> +               pmu {
> +                       compatible = "arm,cortex-a7-pmu";
> +                       interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +               };

Move this under the root. It doesn't live on an SoC-specific bus.

Why disabled?

Thanks,
Mark.
