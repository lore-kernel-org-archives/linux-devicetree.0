From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 07/12] arm64: dts: hi3660: Add uarts nodes
Date: Mon, 22 May 2017 19:44:36 -0500
Message-ID: <20170523004436.h6gculclztymamyj@rob-hp-laptop>
References: <20170517083745.24479-1-guodong.xu@linaro.org>
 <20170517083745.24479-8-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170517083745.24479-8-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 17, 2017 at 04:37:40PM +0800, Guodong Xu wrote:
> From: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> 
> Add nodes uart0 to uart4 and uart6 for hi3660 SoC.
> Enable uart3 and uart6, disable uart5, in hikey960 board dts.
> 
> On HiKey960:
>  - UART6 is used as default console, and is wired out through low speed
>          expansion connector.
>  - UART3 has RTS/CTS hardware handshake, and is wired out through low
>          speed expansion connector.
>  - UART5 is not used in commercial launched boards. So disable it.
>  - UART4 is connected to Bluetooth, WL1837.
> 
> Signed-off-by: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Zhangfei Gao <zhangfei.gao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 18 +++++--
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 60 +++++++++++++++++++++++
>  2 files changed, 73 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index f685b1e..513c496 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -15,12 +15,16 @@
>  	compatible = "hisilicon,hi3660-hikey960", "hisilicon,hi3660";
>  
>  	aliases {
> -		serial5 = &uart5;       /* console UART */
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +		serial5 = &uart5;
> +		serial6 = &uart6;
>  	};
>  
> -	chosen {
> -		stdout-path = "serial5:115200n8";

Why is this removed?

> -	};
> +	chosen {};
>  
>  	memory@0 {
>  		device_type = "memory";
> @@ -47,6 +51,10 @@
>  	status = "okay";
>  };
>  
> -&uart5 {
> +&uart3 {
> +	status = "okay";
> +};
> +
> +&uart6 {
>  	status = "okay";

labels for LS connector?

>  };
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index 3bea0d2..0951a29 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -242,6 +242,56 @@
>  			status = "disabled";
>  		};
>  
> +		uart0: serial@fdf02000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0xfdf02000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&crg_ctrl HI3660_CLK_MUX_UART0>,
> +				 <&crg_ctrl HI3660_PCLK>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@fdf00000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0xfdf00000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&crg_ctrl HI3660_CLK_GATE_UART1>,
> +				 <&crg_ctrl HI3660_CLK_GATE_UART1>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@fdf03000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0xfdf03000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&crg_ctrl HI3660_CLK_GATE_UART2>,
> +				 <&crg_ctrl HI3660_PCLK>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@ffd74000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0xffd74000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&crg_ctrl HI3660_FACTOR_UART3>,
> +				 <&crg_ctrl HI3660_PCLK>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@fdf01000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0xfdf01000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&crg_ctrl HI3660_CLK_GATE_UART4>,
> +				 <&crg_ctrl HI3660_CLK_GATE_UART4>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
>  		uart5: serial@fdf05000 {
>  			compatible = "arm,pl011", "arm,primecell";
>  			reg = <0x0 0xfdf05000 0x0 0x1000>;
> @@ -252,6 +302,16 @@
>  			status = "disabled";
>  		};
>  
> +		uart6: serial@fff32000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0xfff32000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&crg_ctrl HI3660_CLK_UART6>,
> +				 <&crg_ctrl HI3660_PCLK>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
>  		gpio0: gpio@e8a0b000 {
>  			compatible = "arm,pl061", "arm,primecell";
>  			reg = <0 0xe8a0b000 0 0x1000>;
> -- 
> 2.10.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
