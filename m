Return-Path: <SRS0=LOhN=OJ=verge.net.au=horms@kernel.org>
Date: Fri, 30 Nov 2018 12:55:05 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] ARM: dts: r7s9210: Initial SoC device tree
Message-ID: <20181130115500.twmtwnu352ukjm73@verge.net.au>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129130559.66732-2-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 29, 2018 at 08:05:58AM -0500, Chris Brandt wrote:
> Basic support for the RZ/A2 (R7S9210) SoC.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  arch/arm/boot/dts/r7s9210.dtsi | 211 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 211 insertions(+)
>  create mode 100644 arch/arm/boot/dts/r7s9210.dtsi
> 
> diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
> new file mode 100644
> index 000000000000..3c5373a5c7d2
> --- /dev/null
> +++ b/arch/arm/boot/dts/r7s9210.dtsi
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the R7S9210 SoC
> + *
> + * Copyright (C) 2018 Renesas Electronics Corporation
> + *
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/r7s9210-cpg-mssr.h>
> +
> +/ {
> +	compatible = "renesas,r7s9210";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	bsid: chipid@fcfe8004 {
> +		compatible = "renesas,bsid";
> +		reg = <0xfcfe8004 4>;
> +	};
> +
> +	clocks {
> +		ranges;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		/* External clocks */
> +		extal_clk: extal {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			/* Value must be set by board */
> +			clock-frequency = <0>;
> +		};
> +
> +		rtc_x1_clk: rtc_x1 {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			/* If clk present, value (32678) must be set by board */
> +			clock-frequency = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			reg = <0>;
> +			clock-frequency = <528000000>;
> +			next-level-cache = <&L2>;
> +		};
> +	};
> +
> +	gic: interrupt-controller@e8221000 {
> +		compatible = "arm,gic-400";
> +		#interrupt-cells = <3>;
> +		#address-cells = <0>;
> +		interrupt-controller;
> +		reg = <0xe8221000 0x1000>,
> +		      <0xe8222000 0x1000>;
> +	};
> +
> +	L2: cache-controller@1f003000 {
> +		compatible = "arm,pl310-cache";
> +		reg = <0x1f003000 0x1000>;
> +		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,early-bresp-disable;
> +		arm,full-line-zero-disable;
> +		cache-unified;
> +		cache-level = <2>;
> +	};
> +
> +	cpg: clock-controller@fcfe0020 {
> +		compatible = "renesas,r7s9210-cpg-mssr";
> +		reg = <0xfcfe0010 0x455>;

There is a discrepancy here between the base address, fcfe0020
and the start address of the register range, 0xfcfe0010.

> +		clocks = <&extal_clk>;
> +		clock-names = "extal";
> +		#clock-cells = <2>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <1>;
> +	};
> +
> +	ostm0: timer@e803b000 {
> +		compatible = "renesas,r7s9210-ostm", "renesas,ostm";
> +		reg = <0xe803b000 0x30>;


Its not clear to me why the size of the register range is 0x30.

> +		interrupts = <GIC_SPI 56 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&cpg CPG_MOD 36>;
> +		clock-names = "ostm0";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	ostm1: timer@e803c000 {
> +		compatible = "renesas,r7s9210-ostm", "renesas,ostm";
> +		reg = <0xe803c000 0x30>;
> +		interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&cpg CPG_MOD 35>;
> +		clock-names = "ostm1";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	ostm2: timer@e803d000 {
> +		compatible = "renesas,r7s9210-ostm", "renesas,ostm";
> +		reg = <0xe803d000 0x30>;
> +		interrupts = <GIC_SPI 58 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&cpg CPG_MOD 34>;
> +		clock-names = "ostm2";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	wdt: watchdog@fcfe7000 {
> +		compatible = "renesas,r7s9210-wdt", "renesas,rza-wdt";
> +		reg = <0xfcfe7000 0x26>;
> +		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cpg CPG_CORE R7S9210_CLK_P0>;
> +	};
> +
> +	pinctrl: pin-controller@fcffe000 {
> +		compatible = "renesas,r7s9210-pinctrl";
> +		reg = <0xfcffe000 0x1000>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&pinctrl 0 0 176>;
> +	};
> +
> +	scif0: serial@e8007000 {
> +		compatible = "renesas,scif-r7s9210";
> +		reg = <0xe8007000 18>;
> +		interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eri", "rxi", "txi", "bri", "dri", "tei";
> +		clocks = <&cpg CPG_MOD 47>;
> +		clock-names = "fck";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	scif1: serial@e8007800 {
> +		compatible = "renesas,scif-r7s9210";
> +		reg = <0xe8007800 18>;
> +		interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eri", "rxi", "txi", "bri", "dri", "tei";
> +		clocks = <&cpg CPG_MOD 46>;
> +		clock-names = "fck";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	scif2: serial@e8008000 {
> +		compatible = "renesas,scif-r7s9210";
> +		reg = <0xe8008000 18>;
> +		interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eri", "rxi", "txi", "bri", "dri", "tei";
> +		clocks = <&cpg CPG_MOD 45>;
> +		clock-names = "fck";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	scif3: serial@e8008800 {
> +		compatible = "renesas,scif-r7s9210";
> +		reg = <0xe8008800 18>;
> +		interrupts = <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eri", "rxi", "txi", "bri", "dri", "tei";
> +		clocks = <&cpg CPG_MOD 44>;
> +		clock-names = "fck";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	scif4: serial@e8009000 {
> +		compatible = "renesas,scif-r7s9210";
> +		reg = <0xe8009000 18>;
> +		interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eri", "rxi", "txi", "bri", "dri", "tei";
> +		clocks = <&cpg CPG_MOD 43>;
> +		clock-names = "fck";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +};
> -- 
> 2.16.1
> 
