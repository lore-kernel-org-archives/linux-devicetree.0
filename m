From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Fri, 25 Aug 2017 13:26:55 -0500
Message-ID: <20170825182655.4bgkr63ar27dwp4e@rob-hp-laptop>
References: <20170822033502.4100-1-brendanhiggins@google.com>
 <20170822033502.4100-3-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170822033502.4100-3-brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 21, 2017 at 08:35:01PM -0700, Brendan Higgins wrote:
> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
> specific device tree for the NPCM750 (Poleg) evaluation board.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  63 ++++++
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 222 +++++++++++++++++++++
>  include/dt-bindings/clock/nuvoton,npcm7xx-clks.h   |  39 ++++
>  4 files changed, 330 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
>  create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> 
> diff --git a/Documentation/devicetree/bindings/arm/npcm/npcm.txt b/Documentation/devicetree/bindings/arm/npcm/npcm.txt
> new file mode 100644
> index 000000000000..19aabe9a7414
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/npcm/npcm.txt
> @@ -0,0 +1,6 @@
> +NPCM Platforms Device Tree Bindings
> +-----------------------------------
> +NPCM750 SoC
> +Required root node properties:
> +	- compatible = "nuvoton,npcm750";
> +	- enable-method = "nuvoton,npcm7xx-smp"; required for dual core variant.

enable-method is not a root node property. There's a file to document 
all of these.

> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> new file mode 100644
> index 000000000000..10f523388dc1
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -0,0 +1,63 @@
> +/*
> + * DTS file for all NPCM750 SoCs
> + *
> + * Copyright 2012 Tomer Maimon <tomer.maimon-KrzQf0k3Iz9BDgjK7y7TUQ@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +#include "nuvoton-npcm750.dtsi"
> +
> +/ {
> +	model = "Nuvoton npcm750 Development Board (Device Tree)";
> +	compatible = "nuvoton,npcm750";
> +	enable-method = "nuvoton,npcm7xx-smp";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +	};
> +
> +	memory {
> +		reg = <0 0x40000000>;
> +	};
> +
> +	clocks {
> +		clk: clock-controller@f0801000 {
> +			status = "okay";
> +		};
> +	};
> +
> +	ahb {
> +	};

You don't need this.

> +
> +	apb {
> +		watchdog1: watchdog@f0009000 {
> +			status = "okay";
> +		};
> +
> +		uart0: uart0@f0001000 {

Use generic node names.

s/uart/serial/

> +			status = "okay";
> +		};
> +
> +		uart1: uart1@f0002000 {
> +			status = "okay";
> +		};
> +
> +		uart2: uart2@f0003000 {
> +			status = "okay";
> +		};
> +
> +		uart3: uart3@f0004000 {
> +			status = "okay";
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> new file mode 100644
> index 000000000000..fc64550c49a6
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> @@ -0,0 +1,222 @@
> +/*
> + * DTSi file for the NPCM750 SoC
> + *
> + * Copyright 2012 Tomer Maimon <tomer.maimon-KrzQf0k3Iz9BDgjK7y7TUQ@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +#include "skeleton.dtsi"
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/nuvoton,npcm7xx-clks.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			clocks = <&clk NPCM7XX_CLK_CPU>;
> +			clock-names = "clk_cpu";
> +			reg = <0>;
> +			next-level-cache = <&L2>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			clocks = <&clk NPCM7XX_CLK_CPU>;
> +			clock-names = "clk_cpu";
> +			reg = <1>;
> +			next-level-cache = <&L2>;
> +		};
> +
> +	};
> +
> +	L2: l2-cache {
> +		compatible = "arm,pl310-cache";
> +		reg = <0xf03fc000 0x80000>;

Pretty sure the PL310 doesn't have 512KB of address space.

> +		interrupts = <0 21 4>;
> +		cache-unified;
> +		cache-level = <2>;
> +		clocks = <&clk NPCM7XX_CLK_AXI>;
> +		clock-names = "clk_axi";

> +	    };
> +
> +	    clocks {

Indentation is wrong.

> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		clk: clock-controller@f0801000 {

unit-address is not valid without a reg property. 

> +			compatible = "nuvoton,npcm750-clk";
> +			#clock-cells = <1>;
> +		};
> +
> +		/* external clock signal rg1refck, supplied by the phy */
> +		clk_rg1refck: clk_rg1refck {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <125000000>;
> +			clock-output-names = "clk_rg1refck";
> +		};
> +
> +		/* external clock signal rg2refck, supplied by the phy */
> +		clk_rg2refck: clk_rg2refck {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <125000000>;
> +			clock-output-names = "clk_rg2refck";
> +		};
> +
> +		clk_xin: clk_xin {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <50000000>;
> +			clock-output-names = "clk_xin";
> +		};

These 3 clocks are not part of the bus, so move to top level.

> +	};
> +
> +	ahb {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		interrupt-parent = <&gic>;
> +		ranges = <0x80000000 0x80000000 0x20000000 /* AHB18 */
> +			0xa0000000 0xa0000000 0x28000000 /* AHB3  */
> +			0xe0000000 0xe0000000 0x10000000 /* AHB14 */
> +			0xf0000000 0xf0000000 0x00800000 /* AHB1  */
> +			0xf0800000 0xf0800000 0x00800000 /* AHB8  */
> +			0xf8000000 0xf8000000 0x04000000  /* AHB18 - cont */
> +			0xfffd0000 0xfffd0000 0x00040000>;   /* RAM2 */
> +
> +		gic: interrupt-controller@f03ff000 {
> +			compatible = "arm,cortex-a9-gic";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0xf03ff000 0x1000>,
> +			    <0xf03fe100 0x100>;
> +		};
> +
> +		gcr: gcr@f0800000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "nuvoton,npcm750-gcr", "syscon",
> +				"simple-mfd";
> +			reg = <0xf0800000 0x1000>;
> +		};
> +
> +		scu: scu@f03fe000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "arm,cortex-a9-scu";
> +			reg = <0xf03fe000 0x1000>;
> +		};
> +
> +		clk_rst: clk_rst@f0801000 {

Don't use '_' in node or property names.

Build your dtb with W=2 and fix any warnings.

> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "nuvoton,npcm750-clk_rst", "syscon",
> +				"simple-mfd";
> +			reg = <0xF0801000 0x1000>;
> +		};
> +
> +		twd: timer@f03fe600 {
> +			compatible = "arm,cortex-a9-twd-timer";
> +			reg = <0xf03fe600 0x20>;
> +			interrupts = <1 13 0x304>;
> +		};
> +	};
> +
> +	apb {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		interrupt-parent = <&gic>;
> +		ranges = <0xf0000000 0xf0000000 0x00080000
> +			0xf0080000 0xf0080000 0x00080000

You have overlapping addresses at least in the ranges. Make sure you 
don't actually have any regions overlapping.

It looks like you don't really need this entry.

> +			0xf0100000 0xf0100000 0x00080000
> +			0xf0180000 0xf0180000 0x00080000
> +			0xf0200000 0xf0200000 0x00600000>;
> +
> +		timer0: timer@f0000000 {
> +			compatible = "nuvoton,npcm750-timer";
> +			interrupts = <0 32 4>;
> +			clocks = <&clk NPCM7XX_CLK_TIMER>;
> +			clock-names = "clk_timer";

-names is pointless when there is only 1.

> +		};
> +
> +		watchdog0: watchdog@f0008000 {
> +			compatible = "nuvoton,npcm750-wdt";
> +			interrupts = <0 47 4>;
> +			reg = <0xf0008000 0x1000>;
> +			status = "disabled";
> +			clocks = <&clk NPCM7XX_CLK_TIMER>;
> +			clock-names = "clk_timer";
> +		};
> +
> +		watchdog1: watchdog@f0009000 {
> +			compatible = "nuvoton,npcm750-wdt";
> +			interrupts = <0 48 4>;
> +			reg = <0xf0009000 0x1000>;
> +			status = "disabled";
> +			clocks = <&clk NPCM7XX_CLK_TIMER>;
> +			clock-names = "clk_timer";
> +		};
> +
> +		watchdog2: watchdog@f000a000 {
> +			compatible = "nuvoton,npcm750-wdt";
> +			interrupts = <0 49 4>;
> +			reg = <0xf000a000 0x1000>;
> +			status = "disabled";
> +			clocks = <&clk NPCM7XX_CLK_TIMER>;
> +			clock-names = "clk_timer";
> +		};
> +
> +		uart0: uart0@f0001000 {
> +			compatible = "nuvoton,npcm750-uart";
> +			reg = <0xf0001000 0x1000>;
> +			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +			clock-names = "clk_uart";
> +			interrupts = <0 2 4>;
> +			status = "disabled";
> +		};
> +
> +		uart1: uart1@f0002000 {
> +			compatible = "nuvoton,npcm750-uart";
> +			reg = <0xf0002000 0x1000>;
> +			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +			clock-names = "clk_uart";
> +			interrupts = <0 3 4>;
> +			status = "disabled";
> +		};
> +
> +		uart2: uart2@f0003000 {
> +			compatible = "nuvoton,npcm750-uart";
> +			reg = <0xf0003000 0x1000>;
> +			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +			clock-names = "clk_uart";
> +			interrupts = <0 4 4>;
> +			status = "disabled";
> +		};
> +
> +		uart3: uart3@f0004000 {
> +			compatible = "nuvoton,npcm750-uart";
> +			reg = <0xf0004000 0x1000>;
> +			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +			clock-names = "clk_uart";
> +			interrupts = <0 5 4>;
> +			status = "disabled";
> +		};
> +	};
> +};
> diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> new file mode 100644
> index 000000000000..c69d3bbf7e42
> --- /dev/null
> +++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> @@ -0,0 +1,39 @@
> +/*
> + * Copyright (C) 2016 Nuvoton Technologies,  tali.perry-KrzQf0k3Iz9BDgjK7y7TUQ@public.gmane.org
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_NPCM7XX_H
> +#define _DT_BINDINGS_CLK_NPCM7XX_H
> +
> +#define NPCM7XX_CLK_PLL0	0
> +#define NPCM7XX_CLK_PLL1	1
> +#define NPCM7XX_CLK_PLL2	2
> +#define NPCM7XX_CLK_GFX		3
> +#define NPCM7XX_CLK_APB1	4
> +#define NPCM7XX_CLK_APB2	5
> +#define NPCM7XX_CLK_APB3	6
> +#define NPCM7XX_CLK_APB4	7
> +#define NPCM7XX_CLK_APB5	8
> +#define NPCM7XX_CLK_MC		9
> +#define NPCM7XX_CLK_CPU		10
> +#define NPCM7XX_CLK_SPI0	11
> +#define NPCM7XX_CLK_SPI3	12
> +#define NPCM7XX_CLK_SPIX	13
> +#define NPCM7XX_CLK_UART_CORE	14
> +#define NPCM7XX_CLK_TIMER	15
> +#define NPCM7XX_CLK_HOST_UART	16
> +#define NPCM7XX_CLK_MMC		17
> +#define NPCM7XX_CLK_SDHC	18
> +#define NPCM7XX_CLK_ADC		19
> +#define NPCM7XX_CLK_GFX_MEM	20
> +#define NPCM7XX_CLK_USB_BRIDGE	21
> +#define NPCM7XX_CLK_AXI		22
> +#define NPCM7XX_CLK_AHB		23
> +#define NPCM7XX_CLK_EMC		24
> +#define NPCM7XX_CLK_GMAC	25
> +
> +#endif
> -- 
> 2.14.1.480.gb18f417b89-goog
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
