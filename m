From: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [RESEND 2/2] arm64: dts: Add dts files for Hisilicon Hi3660 SoC
Date: Thu, 5 Jan 2017 11:28:40 +0800
Message-ID: <586DBD68.7090509@hisilicon.com>
References: <1482744972-56622-1-git-send-email-puck.chen@hisilicon.com>
 <1482744972-56622-2-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482744972-56622-2-git-send-email-puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi will&catalin,

Could you help review this part?

On 2016/12/26 17:36, Chen Feng wrote:
> Add initial dtsi file to support Hisilicon Hi3660 SoC with
> support of Octal core CPUs in two clusters(4 * A53 & 4 * A73).
> 
> Also add dts file to support HiKey960 development board which
> based on Hi3660 SoC.
> The output console is earlycon "earlycon=pl011,0xfdf05000".
> And the con_init uart5 with a fixed clock, which already
> configured at bootloader.
> 
> When clock is available, the uart5 will be modified.
> 
> Tested on HiKey960 Board.
> 
> Signed-off-by: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>  arch/arm64/boot/dts/hisilicon/Makefile            |   1 +
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts |  34 +++++
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 156 ++++++++++++++++++++++
>  3 files changed, 191 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>  create mode 100644 arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/Makefile b/arch/arm64/boot/dts/hisilicon/Makefile
> index d5f43a0..b633b5d 100644
> --- a/arch/arm64/boot/dts/hisilicon/Makefile
> +++ b/arch/arm64/boot/dts/hisilicon/Makefile
> @@ -1,4 +1,5 @@
>  dtb-$(CONFIG_ARCH_HISI) += hi6220-hikey.dtb
> +dtb-$(CONFIG_ARCH_HISI) += hi3660-hikey960.dtb
>  dtb-$(CONFIG_ARCH_HISI) += hip05-d02.dtb
>  dtb-$(CONFIG_ARCH_HISI) += hip06-d03.dtb
>  
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> new file mode 100644
> index 0000000..3d7aead
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -0,0 +1,34 @@
> +/*
> + * dts file for Hisilicon HiKey960 Development Board
> + *
> + * Copyright (C) 2016, Hisilicon Ltd.
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "hi3660.dtsi"
> +
> +/ {
> +	model = "HiKey960";
> +	compatible = "hisilicon,hi3660";
> +
> +	aliases {
> +		serial5 = &uart5;       /* console UART */
> +	};
> +
> +	chosen {
> +		stdout-path = "serial5:115200n8";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x00400000 0x0 0xBFE00000>;
> +	};
> +
> +	soc {
> +		uart5: uart@fdf05000 {
> +			status = "ok";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> new file mode 100644
> index 0000000..7f9805c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -0,0 +1,156 @@
> +/*
> + * dts file for Hisilicon Hi3660 SoC
> + *
> + * Copyright (C) 2016, Hisilicon Ltd.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "hisilicon,hi3660";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +				core2 {
> +					cpu = <&cpu6>;
> +				};
> +				core3 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1: cpu@1 {
> +			compatible = "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu2: cpu@2 {
> +			compatible = "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x2>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@3 {
> +			compatible = "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x3>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu4: cpu@100 {
> +			compatible = "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu5: cpu@101 {
> +			compatible = "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x101>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu6: cpu@102 {
> +			compatible = "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x102>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu7: cpu@103 {
> +			compatible = "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x103>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	gic: interrupt-controller@e82b0000 {
> +		compatible = "arm,gic-400";
> +		reg = <0x0 0xe82b1000 0 0x1000>, /* GICD */
> +		      <0x0 0xe82b2000 0 0x2000>, /* GICC */
> +		      <0x0 0xe82b4000 0 0x2000>, /* GICH */
> +		      <0x0 0xe82b6000 0 0x2000>; /* GICV */
> +		#address-cells = <0>;
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <1920000>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		fixed_uart5: fixed_19_2M {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +			clock-output-names = "fixed:uart5";
> +		};
> +
> +		uart5: uart@fdf05000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0xfdf05000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&fixed_uart5 &fixed_uart5>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "ok";
> +		};
> +	};
> +};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
