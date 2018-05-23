Return-Path: <robherring2@gmail.com>
Date: Wed, 23 May 2018 13:33:20 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: Add driver for MAX9485
Message-ID: <20180523183320.GA15306@rob-hp-laptop>
References: <20180521085848.17192-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180521085848.17192-1-daniel@zonque.org>
To: Daniel Mack <daniel@zonque.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <zonque@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 21, 2018 at 10:58:48AM +0200, Daniel Mack wrote:
> From: Daniel Mack <zonque@gmail.com>
> 
> This patch adds a driver for MAX9485, a programmable audio clock generator.
> 
> The device requires a 27.000 MHz clock input. It can provide a gated
> buffered output of its input clock and two gated outputs of a PLL that can
> generate one out of 16 discrete frequencies. There is only one PLL however,
> so the two gated outputs will always have the same frequency but they can
> be switched individually.
> 
> The driver for this device exposes 4 clocks in total:
> 
> - MAX9485_MCLKOUT:      A gated, buffered output of the input clock
> - MAX9485_CLKOUT:       A PLL that can be configured to 16 different
> 			discrete frequencies
> - MAX9485_CLKOUT[1,2]:  Two gated outputs for MAX9485_CLKOUT
> 
> Some PLL output frequencies can be achieved with different register
> settings. The driver will select the one with lowest jitter in such cases.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../devicetree/bindings/clock/maxim,max9485.txt    |  59 ++++
>  drivers/clk/Kconfig                                |   8 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/clk-max9485.c                          | 379 +++++++++++++++++++++
>  include/dt-bindings/clock/maxim,max9485.h          |  19 ++

The 2 DT files should be a separate patch.

>  5 files changed, 466 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/maxim,max9485.txt
>  create mode 100644 drivers/clk/clk-max9485.c
>  create mode 100644 include/dt-bindings/clock/maxim,max9485.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/maxim,max9485.txt b/Documentation/devicetree/bindings/clock/maxim,max9485.txt
> new file mode 100644
> index 000000000000..43713031be2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/maxim,max9485.txt
> @@ -0,0 +1,59 @@
> +Devicetree bindings for Maxim MAX9485 Programmable Audio Clock Generator
> +
> +The driver for this device exposes 4 clocks in total:

Bindings describe h/w, not drivers.

> +- MAX9485_MCLKOUT: 	A gated, buffered output of the input clock of 27 MHz
> +- MAX9485_CLKOUT:	A PLL that can be configured to 16 different discrete
> +			frequencies
> +- MAX9485_CLKOUT[1,2]:	Two gated outputs for MAX9485_CLKOUT
> +
> +MAX9485_CLKOUT[1,2] are children of MAX9485_CLKOUT which upchain all rate set
> +requests.
> +
> +Required properties:
> +- compatible:	"maxim,max9485"
> +- clocks:	Input clock, must provice 27.000 MHz
> +- clock-names:	Must be set to "xclk"
> +- #clock-cells: From common clock binding; shall be set to 1
> +
> +Optional properties:
> +- reset-gpio:		GPIO descriptor connected to the #RESET input pin

reset-gpios

> +- vdd-supply:		A regulator node for Vdd
> +- clock-output-names:	Name of output clocks, as defined in common clock
> +			bindings
> +
> +If not explicitly set, the output names are "mclkout", "clkout", "clkout1"
> +and "clkout2".
> +
> +Clocks are defined as preprocessor macros in the dt-binding header.
> +
> +Example:
> +
> +	#include <dt-bindings/clock/maxim,max9485.h>
> +
> +	xo_27mhz: xo_27mhz {

Don't use '_' in node names.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <27000000>;
> +	};
> +
> +	&i2c0 {
> +		max9485: max9485@63 {

clock-controller@63

> +			compatible = "maxim,max9485";
> +			clock-names = "xclk";
> +			clocks = <&xo_27mhz>;
> +			reg = <0x63>;
> +			reset-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +			vdd-supply = <&3v3_reg>;
> +			#clock-cells = <1>;
> +		};
> +	};
> +
> +	// Clock consumer node
> +
> +	foo@0 {
> +		compatible = "bar,foo";
> +		/* ... */
> +		clock-names = "foo-intput-clk";
> +		clocks = <&max9485 MAX9485_CLKOUT1>;
> +	};


> diff --git a/include/dt-bindings/clock/maxim,max9485.h b/include/dt-bindings/clock/maxim,max9485.h
> new file mode 100644
> index 000000000000..23add67f32a7
> --- /dev/null
> +++ b/include/dt-bindings/clock/maxim,max9485.h
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2018 Daniel Mack
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Don't need this with the SPDX tag.

> + *
> + */
> +
> +#ifndef __DT_BINDINGS_MAX9485_CLK_H
> +#define __DT_BINDINGS_MAX9485_CLK_H
> +
> +#define MAX9485_MCLKOUT	0
> +#define MAX9485_CLKOUT	1
> +#define MAX9485_CLKOUT1	2
> +#define MAX9485_CLKOUT2	3
> +
> +#endif /* __DT_BINDINGS_MAX9485_CLK_H */
> -- 
> 2.14.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
