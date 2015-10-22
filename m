From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Thu, 22 Oct 2015 10:05:08 +0200
Message-ID: <20151022080508.GN10947@lukather>
References: <1445444428-4652-1-git-send-email-jenskuske@gmail.com>
 <1445444428-4652-2-git-send-email-jenskuske@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JLiXfqD9/Kt1b+Pq"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBNNRUKYQKGQEZIQEUCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445444428-4652-2-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--JLiXfqD9/Kt1b+Pq
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Wed, Oct 21, 2015 at 06:20:27PM +0200, Jens Kuske wrote:
> The Allwinner H3 is a home entertainment system oriented SoC with
> four Cortex-A7 cores and a Mali-400MP2 GPU.
> 
> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 499 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 499 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h3.dtsi
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> new file mode 100644
> index 0000000..4114e17
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -0,0 +1,499 @@
> +/*
> + * Copyright (C) 2015 Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "skeleton.dtsi"
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "arm,cortex-a7";
> +			device_type = "cpu";
> +			reg = <0>;
> +		};
> +
> +		cpu@1 {
> +			compatible = "arm,cortex-a7";
> +			device_type = "cpu";
> +			reg = <1>;
> +		};
> +
> +		cpu@2 {
> +			compatible = "arm,cortex-a7";
> +			device_type = "cpu";
> +			reg = <2>;
> +		};
> +
> +		cpu@3 {
> +			compatible = "arm,cortex-a7";
> +			device_type = "cpu";
> +			reg = <3>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <24000000>;
> +		arm,cpu-registers-not-fw-configured;
> +	};
> +
> +	memory {
> +		reg = <0x40000000 0x80000000>;
> +	};
> +
> +	clocks {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		osc24M: osc24M_clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "osc24M";
> +		};
> +
> +		osc32k: osc32k_clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <32768>;
> +			clock-output-names = "osc32k";
> +		};
> +
> +		pll1: clk@01c20000 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun8i-a23-pll1-clk";
> +			reg = <0x01c20000 0x4>;
> +			clocks = <&osc24M>;
> +			clock-output-names = "pll1";
> +		};
> +
> +		/* dummy clock until actually implemented */
> +		pll5: pll5_clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <0>;
> +			clock-output-names = "pll5";
> +		};
> +
> +		pll6: clk@01c20028 {
> +			#clock-cells = <1>;
> +			compatible = "allwinner,sun6i-a31-pll6-clk";
> +			reg = <0x01c20028 0x4>;
> +			clocks = <&osc24M>;
> +			clock-output-names = "pll6", "pll6x2", "pll6d2";
> +		};
> +
> +		pll8: clk@01c20044 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun6i-a31-pll6-clk";
> +			reg = <0x01c20044 0x4>;
> +			clocks = <&osc24M>;
> +			clock-output-names = "pll8", "pll8x2";
> +		};
> +
> +		cpu: cpu_clk@01c20050 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun4i-a10-cpu-clk";
> +			reg = <0x01c20050 0x4>;
> +			clocks = <&osc32k>, <&osc24M>, <&pll1>, <&pll1>;
> +			clock-output-names = "cpu";
> +		};
> +
> +		axi: axi_clk@01c20050 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun4i-a10-axi-clk";
> +			reg = <0x01c20050 0x4>;
> +			clocks = <&cpu>;
> +			clock-output-names = "axi";
> +		};
> +
> +		ahb1: ahb1_clk@01c20054 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun6i-a31-ahb1-clk";
> +			reg = <0x01c20054 0x4>;
> +			clocks = <&osc32k>, <&osc24M>, <&axi>, <&pll6 0>;
> +			clock-output-names = "ahb1";
> +		};
> +
> +		ahb2: ahb2_clk@01c2005c {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun8i-h3-ahb2-clk";
> +			reg = <0x01c2005c 0x4>;
> +			clocks = <&ahb1>, <&pll6 2>;
> +			clock-output-names = "ahb2";
> +		};
> +
> +		apb1: apb1_clk@01c20054 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun4i-a10-apb0-clk";
> +			reg = <0x01c20054 0x4>;
> +			clocks = <&ahb1>;
> +			clock-output-names = "apb1";
> +		};
> +
> +		apb2: apb2_clk@01c20058 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun4i-a10-apb1-clk";
> +			reg = <0x01c20058 0x4>;
> +			clocks = <&osc32k>, <&osc24M>, <&pll6 0>, <&pll6 0>;
> +			clock-output-names = "apb2";
> +		};
> +
> +		bus_gates: clk@01c20060 {
> +			#clock-cells = <1>;
> +			compatible = "allwinner,sun8i-h3-bus-gates-clk";
> +			reg = <0x01c20060 0x14>;
> +			clock-indices = <5>, <6>, <8>,
> +					<9>, <10>, <13>,
> +					<14>, <17>, <18>,
> +					<19>, <20>,
> +					<21>, <23>,
> +					<24>, <25>,
> +					<26>, <27>,
> +					<28>, <29>,
> +					<30>, <31>, <32>,
> +					<35>, <36>, <37>,
> +					<40>, <41>, <43>,
> +					<44>, <52>, <53>,
> +					<54>, <64>,
> +					<65>, <69>, <72>,
> +					<76>, <77>, <78>,
> +					<96>, <97>, <98>,
> +					<112>, <113>,
> +					<114>, <115>, <116>,
> +					<128>, <135>;
> +			clocks = <&ahb1>, <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb2>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb2>,
> +				 <&ahb2>, <&ahb2>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&apb1>,
> +				 <&apb1>, <&apb1>, <&apb1>,
> +				 <&apb1>, <&apb1>, <&apb1>,
> +				 <&apb2>, <&apb2>, <&apb2>,
> +				 <&apb2>, <&apb2>,
> +				 <&apb2>, <&apb2>, <&apb2>,
> +				 <&ahb1>, <&ahb1>;
> +			clock-output-names = "ahb1_ce", "ahb1_dma", "ahb1_mmc0",
> +					"ahb1_mmc1", "ahb1_mmc2", "ahb1_nand",
> +					"ahb1_sdram", "ahb2_gmac", "ahb1_ts",
> +					"ahb1_hstimer", "ahb1_spi0",
> +					"ahb1_spi1", "ahb1_otg",
> +					"ahb1_otg_ehci0", "ahb1_ehic1",
> +					"ahb1_ehic2", "ahb1_ehic3",
> +					"ahb1_otg_ohci0", "ahb2_ohic1",
> +					"ahb2_ohic2", "ahb2_ohic3", "ahb1_ve",
> +					"ahb1_lcd0", "ahb1_lcd1", "ahb1_deint",
> +					"ahb1_csi", "ahb1_tve", "ahb1_hdmi",
> +					"ahb1_de", "ahb1_gpu", "ahb1_msgbox",
> +					"ahb1_spinlock", "apb1_codec",
> +					"apb1_spdif", "apb1_pio", "apb1_ths",
> +					"apb1_i2s0", "apb1_i2s1", "apb1_i2s2",
> +					"apb2_i2c0", "apb2_i2c1", "apb2_i2c2",
> +					"apb2_uart0", "apb2_uart1",
> +					"apb2_uart2", "apb2_uart3", "apb2_scr",
> +					"ahb1_ephy", "ahb1_dbg";
> +		};
> +
> +		mmc0_clk: clk@01c20088 {
> +			#clock-cells = <1>;
> +			compatible = "allwinner,sun4i-a10-mmc-clk";
> +			reg = <0x01c20088 0x4>;
> +			clocks = <&osc24M>, <&pll6 0>, <&pll8 0>;
> +			clock-output-names = "mmc0",
> +					     "mmc0_output",
> +					     "mmc0_sample";
> +		};
> +
> +		mmc1_clk: clk@01c2008c {
> +			#clock-cells = <1>;
> +			compatible = "allwinner,sun4i-a10-mmc-clk";
> +			reg = <0x01c2008c 0x4>;
> +			clocks = <&osc24M>, <&pll6 0>, <&pll8 0>;
> +			clock-output-names = "mmc1",
> +					     "mmc1_output",
> +					     "mmc1_sample";
> +		};
> +
> +		mmc2_clk: clk@01c20090 {
> +			#clock-cells = <1>;
> +			compatible = "allwinner,sun4i-a10-mmc-clk";
> +			reg = <0x01c20090 0x4>;
> +			clocks = <&osc24M>, <&pll6 0>, <&pll8 0>;
> +			clock-output-names = "mmc2",
> +					     "mmc2_output",
> +					     "mmc2_sample";
> +		};
> +
> +		mbus_clk: clk@01c2015c {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun8i-a23-mbus-clk";
> +			reg = <0x01c2015c 0x4>;
> +			clocks = <&osc24M>, <&pll6 1>, <&pll5>;
> +			clock-output-names = "mbus";
> +		};
> +	};
> +
> +	soc@01c00000 {

We had some issues with this in the past, especially since it's wrong
and the SoC registers definitions start at 0, with the SRAMs. It would
be better if you removed it entirely like we did in the A80 DTSI.

> +		uart0: serial@01c28000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x01c28000 0x400>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&bus_gates 112>;
> +			resets = <&bus_rst 208>;

It's a bit weird that the clocks and reset indices don't match,
usually they do.

What's even weirder is that there's a 96 offset between the two (4 *
32), is this expected?

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--JLiXfqD9/Kt1b+Pq--
