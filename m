From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: dts: add basic support for Rockchip RK1108 SOC
Date: Fri, 04 Nov 2016 09:00:05 +0100
Message-ID: <1788707.rfxhNfegGu@phil>
References: <1478175975-11779-1-git-send-email-andy.yan@rock-chips.com> <1478176848-12132-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478176848-12132-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: elaine.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 3. November 2016, 20:40:48 CET schrieb Andy Yan:
> RK1108 is embedded with an ARM Cortex-A7 single core and a DSP core.
> It is designed for varies application scenario such as car DVR, sports
> DV, secure camera and UAV camera.
> 
> This patch add basic support for it with DMAC / UART / CRU / pinctrl
> enabled.
> 
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  arch/arm/boot/dts/rk1108.dtsi     | 420
> ++++++++++++++++++++++++++++++++++++++ arch/arm/mach-rockchip/rockchip.c | 
>  1 +
>  2 files changed, 421 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk1108.dtsi
> 
> diff --git a/arch/arm/boot/dts/rk1108.dtsi b/arch/arm/boot/dts/rk1108.dtsi
> new file mode 100644
> index 0000000..9dccfea
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk1108.dtsi
> @@ -0,0 +1,420 @@
> +/*
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
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/rk1108-cru.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	compatible = "rockchip,rk1108";
> +
> +	interrupt-parent = <&gic>;
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@f00 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0xf00>;
> +		};
> +

unnecessary empty line

> +	};
> +
> +	amba {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		pdma: pdma@102a0000 {
> +			compatible = "arm,pl330", "arm,primecell";
> +			reg = <0x102a0000 0x4000>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			arm,pl330-broken-no-flushp;
> +			clocks = <&cru ACLK_DMAC>;
> +			clock-names = "apb_pclk";
> +		};
> +	};
> +
> +	arm-pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | 
IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;

CPU_MASK_SIMPLE(4)? You only have one core, not 4.


> +		clock-frequency = <24000000>;
> +	};
> +
> +	xin24m: oscillator {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xin24m";
> +		#clock-cells = <0>;
> +	};
> +
> +	bus_intmem@10080000 {
> +		compatible = "mmio-sram";
> +		reg = <0x10080000 0x2000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x10080000 0x2000>;
> +	};
> +
> +	grf: syscon@10300000 {
> +		compatible = "rockchip,rk1108-grf", "syscon";
> +		reg = <0x10300000 0x1000>;
> +	};
> +
> +	emmc: dwmmc@30110000 {
> +		compatible = "rockchip,rk1108-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		clock-freq-min-max = <400000 150000000>;
> +		clocks = <&cru HCLK_EMMC>, <&cru SCLK_EMMC>,
> +			 <&cru SCLK_EMMC_DRV>, <&cru SCLK_EMMC_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		fifo-depth = <0x100>;
> +		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +		reg = <0x30110000 0x4000>;
> +		status = "disabled";
> +	};
> +
> +	sdio: dwmmc@30120000 {
> +		compatible = "rockchip,rk1108-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		clock-freq-min-max = <400000 150000000>;
> +		clocks = <&cru HCLK_SDIO>, <&cru SCLK_SDIO>,
> +			 <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		fifo-depth = <0x100>;
> +		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +		reg = <0x30120000 0x4000>;
> +		status = "disabled";
> +	};
> +
> +	sdmmc: dwmmc@30130000 {

ordering by register address please (uart2 before sdmmc etc; same for 
everything else)


> +		compatible = "rockchip,rk1108-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		clock-freq-min-max = <400000 100000000>;
> +		clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
> +			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		fifo-depth = <0x100>;
> +		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +		reg = <0x30130000 0x4000>;
> +		status = "disabled";
> +	};
> +
> +	uart2: serial@10210000 {
> +		compatible = "rockchip,rk1108-uart", "snps,dw-apb-uart";
> +		reg = <0x10210000 0x100>;
> +		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +		clock-frequency = <24000000>;
> +		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> +		clock-names = "baudclk", "apb_pclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart2m0_xfer>;
> +		status = "disabled";
> +	};
> +
> +	uart1: serial@10220000 {
> +		compatible = "rockchip,rk1108-uart", "snps,dw-apb-uart";
> +		reg = <0x10220000 0x100>;
> +		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +		clock-frequency = <24000000>;
> +		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +		clock-names = "baudclk", "apb_pclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart1_xfer>;
> +		status = "disabled";
> +	};
> +
> +	uart0: serial@10230000 {
> +		compatible = "rockchip,rk1108-uart", "snps,dw-apb-uart";
> +		reg = <0x10230000 0x100>;
> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +		clock-frequency = <24000000>;
> +		clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
> +		clock-names = "baudclk", "apb_pclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
> +		status = "disabled";
> +	};
> +
> +	cru: clock-controller@20200000 {
> +		compatible = "rockchip,rk1108-cru";
> +		reg = <0x20200000 0x1000>;
> +		rockchip,grf = <&grf>;
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +	};
> +
> +	gic: interrupt-controller@32010000 {
> +		compatible = "arm,cortex-a15-gic";

compatible = "arm,gic-400"; ?

> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		#address-cells = <0>;
> +
> +		reg = <0x32011000 0x1000>,
> +		      <0x32012000 0x1000>;

please provide all 4 register areas and also the interrupt (

> +	};
> +

[...]

> diff --git a/arch/arm/mach-rockchip/rockchip.c
> b/arch/arm/mach-rockchip/rockchip.c index a7ab9ec..e7fdf06 100644
> --- a/arch/arm/mach-rockchip/rockchip.c
> +++ b/arch/arm/mach-rockchip/rockchip.c
> @@ -76,6 +76,7 @@ static void __init rockchip_dt_init(void)
>  }
> 
>  static const char * const rockchip_board_dt_compat[] = {
> +	"rockchip,rk1108",
>  	"rockchip,rk2928",
>  	"rockchip,rk3066a",
>  	"rockchip,rk3066b",

please split this into a separate patch, as code and dts changes need to go 
through different branches.


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
