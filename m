From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner A33 DTSI
Date: Sun, 10 May 2015 12:43:40 +0200
Message-ID: <20150510104340.GG11057@lukather>
References: <1431240383-12763-1-git-send-email-vishnupatekar0510@gmail.com>
 <1431240383-12763-6-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="peRj85VDUce1fu/0"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBMHNXSVAKGQETT23UVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431240383-12763-6-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--peRj85VDUce1fu/0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sun, May 10, 2015 at 12:16:22PM +0530, Vishnu Patekar wrote:
> this is based on common sun8i.dtsi patch.
> sun8i-a23.dtsi and sun8i-a33.dtsi are same, A33 specific features
> e.g. clocks can be added in future.
> 
> Signed-off-by: VishnuPatekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a33.dtsi | 217 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-a33.dtsi
> 
> diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
> new file mode 100644
> index 0000000..32489fc
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-a33.dtsi
> @@ -0,0 +1,217 @@
> +/*
> + * Copyright 2014 Chen-Yu Tsai
> + *
> + * Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
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
> +#include "sun8i.dtsi"
> +
> +/ {
> +	cpus {
> +		enable-method = "allwinner,sun8i";
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
> +	memory {
> +		reg = <0x40000000 0x80000000>;
> +	};
> +
> +	clocks {
> +		/* dummy clock until actually implemented */
> +		pll5: pll5_clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <0>;
> +			clock-output-names = "pll5";
> +		};
> +
> +		axi: axi_clk@01c20050 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun8i-a23-axi-clk";
> +			reg = <0x01c20050 0x4>;
> +			clocks = <&cpu>;
> +			clock-output-names = "axi";
> +		};
> +
> +		ahb1_gates: clk@01c20060 {
> +			#clock-cells = <1>;
> +			compatible = "allwinner,sun8i-a23-ahb1-gates-clk";
> +			reg = <0x01c20060 0x8>;
> +			clocks = <&ahb1>;
> +			clock-output-names = "ahb1_mipidsi", "ahb1_dma",
> +					"ahb1_mmc0", "ahb1_mmc1", "ahb1_mmc2",
> +					"ahb1_nand", "ahb1_sdram",
> +					"ahb1_hstimer", "ahb1_spi0",
> +					"ahb1_spi1", "ahb1_otg", "ahb1_ehci",
> +					"ahb1_ohci", "ahb1_ve", "ahb1_lcd",
> +					"ahb1_csi", "ahb1_be",	"ahb1_fe",
> +					"ahb1_gpu", "ahb1_spinlock",
> +					"ahb1_drc";
> +		};
> +
> +		apb1_gates: clk@01c20068 {
> +			#clock-cells = <1>;
> +			compatible = "allwinner,sun8i-a23-apb1-gates-clk";
> +			reg = <0x01c20068 0x4>;
> +			clocks = <&apb1>;
> +			clock-output-names = "apb1_codec", "apb1_pio",
> +					"apb1_daudio0",	"apb1_daudio1";
> +		};
> +
> +		apb2: clk@01c20058 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun4i-a10-apb1-clk";
> +			reg = <0x01c20058 0x4>;
> +			clocks = <&osc32k>, <&osc24M>, <&pll6 0>, <&pll6 0>;
> +			clock-output-names = "apb2";
> +		};
> +
> +		apb2_gates: clk@01c2006c {
> +			#clock-cells = <1>;
> +			compatible = "allwinner,sun8i-a23-apb2-gates-clk";
> +			reg = <0x01c2006c 0x4>;
> +			clocks = <&apb2>;
> +			clock-output-names = "apb2_i2c0", "apb2_i2c1",
> +					"apb2_i2c2", "apb2_uart0",
> +					"apb2_uart1", "apb2_uart2",
> +					"apb2_uart3", "apb2_uart4";
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
> +		dma: dma-controller@01c02000 {
> +			compatible = "allwinner,sun8i-a23-dma";
> +			reg = <0x01c02000 0x1000>;
> +			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ahb1_gates 6>;
> +			resets = <&ahb1_rst 6>;
> +			#dma-cells = <1>;
> +		};

With what device did you test DMA?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--peRj85VDUce1fu/0--
