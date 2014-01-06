From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610: use the interrupt macros
Date: Mon, 6 Jan 2014 14:04:33 +0800
Message-ID: <20140106060429.GC27227@S2101-09.ap.freescale.net>
References: <1387952367-6321-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387952367-6321-1-git-send-email-b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 25, 2013 at 02:19:27PM +0800, Huang Shijie wrote:
> This patch uses the IRQ_TYPE_LEVEL_HIGH/IRQ_TYPE_NONE to replace
> the hardcode.
> 
> Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/boot/dts/vf610.dtsi |   37 +++++++++++++++++++------------------
>  1 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
> index ef8a0ee..cd5bb86 100644
> --- a/arch/arm/boot/dts/vf610.dtsi
> +++ b/arch/arm/boot/dts/vf610.dtsi
> @@ -10,6 +10,7 @@
>  #include "skeleton.dtsi"
>  #include "vf610-pingrp.h"
>  #include <dt-bindings/clock/vf610-clock.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  
>  / {
>  	aliases {
> @@ -90,7 +91,7 @@
>  			uart0: serial@40027000 {
>  				compatible = "fsl,vf610-lpuart";
>  				reg = <0x40027000 0x1000>;
> -				interrupts = <0 61 0x00>;

Why is it so special having a 0x00 IRQ trigger type?  Or is it just a
typo?  While we are at it, we should probably fix it if it's a typo.

Shawn

> +				interrupts = <0 61 IRQ_TYPE_NONE>;
>  				clocks = <&clks VF610_CLK_UART0>;
>  				clock-names = "ipg";
>  				status = "disabled";
> @@ -99,7 +100,7 @@
>  			uart1: serial@40028000 {
>  				compatible = "fsl,vf610-lpuart";
>  				reg = <0x40028000 0x1000>;
> -				interrupts = <0 62 0x04>;
> +				interrupts = <0 62 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_UART1>;
>  				clock-names = "ipg";
>  				status = "disabled";
> @@ -108,7 +109,7 @@
>  			uart2: serial@40029000 {
>  				compatible = "fsl,vf610-lpuart";
>  				reg = <0x40029000 0x1000>;
> -				interrupts = <0 63 0x04>;
> +				interrupts = <0 63 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_UART2>;
>  				clock-names = "ipg";
>  				status = "disabled";
> @@ -117,7 +118,7 @@
>  			uart3: serial@4002a000 {
>  				compatible = "fsl,vf610-lpuart";
>  				reg = <0x4002a000 0x1000>;
> -				interrupts = <0 64 0x04>;
> +				interrupts = <0 64 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_UART3>;
>  				clock-names = "ipg";
>  				status = "disabled";
> @@ -128,7 +129,7 @@
>  				#size-cells = <0>;
>  				compatible = "fsl,vf610-dspi";
>  				reg = <0x4002c000 0x1000>;
> -				interrupts = <0 67 0x04>;
> +				interrupts = <0 67 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_DSPI0>;
>  				clock-names = "dspi";
>  				spi-num-chipselects = <5>;
> @@ -138,7 +139,7 @@
>  			sai2: sai@40031000 {
>  				compatible = "fsl,vf610-sai";
>  				reg = <0x40031000 0x1000>;
> -				interrupts = <0 86 0x04>;
> +				interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_SAI2>;
>  				clock-names = "sai";
>  				status = "disabled";
> @@ -147,7 +148,7 @@
>  			pit: pit@40037000 {
>  				compatible = "fsl,vf610-pit";
>  				reg = <0x40037000 0x1000>;
> -				interrupts = <0 39 0x04>;
> +				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_PIT>;
>  				clock-names = "pit";
>  			};
> @@ -164,7 +165,7 @@
>  				#size-cells = <0>;
>  				compatible = "fsl,vf610-qspi";
>  				reg = <0x40044000 0x1000>;
> -				interrupts = <0 24 0x04>;
> +				interrupts = <0 24 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_QSPI0_EN>,
>  					<&clks VF610_CLK_QSPI0>;
>  				clock-names = "qspi_en", "qspi";
> @@ -180,7 +181,7 @@
>  			gpio1: gpio@40049000 {
>  				compatible = "fsl,vf610-gpio";
>  				reg = <0x40049000 0x1000 0x400ff000 0x40>;
> -				interrupts = <0 107 0x04>;
> +				interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -191,7 +192,7 @@
>  			gpio2: gpio@4004a000 {
>  				compatible = "fsl,vf610-gpio";
>  				reg = <0x4004a000 0x1000 0x400ff040 0x40>;
> -				interrupts = <0 108 0x04>;
> +				interrupts = <0 108 IRQ_TYPE_LEVEL_HIGH>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -202,7 +203,7 @@
>  			gpio3: gpio@4004b000 {
>  				compatible = "fsl,vf610-gpio";
>  				reg = <0x4004b000 0x1000 0x400ff080 0x40>;
> -				interrupts = <0 109 0x04>;
> +				interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -213,7 +214,7 @@
>  			gpio4: gpio@4004c000 {
>  				compatible = "fsl,vf610-gpio";
>  				reg = <0x4004c000 0x1000 0x400ff0c0 0x40>;
> -				interrupts = <0 110 0x04>;
> +				interrupts = <0 110 IRQ_TYPE_LEVEL_HIGH>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -224,7 +225,7 @@
>  			gpio5: gpio@4004d000 {
>  				compatible = "fsl,vf610-gpio";
>  				reg = <0x4004d000 0x1000 0x400ff100 0x40>;
> -				interrupts = <0 111 0x04>;
> +				interrupts = <0 111 IRQ_TYPE_LEVEL_HIGH>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -242,7 +243,7 @@
>  				#size-cells = <0>;
>  				compatible = "fsl,vf610-i2c";
>  				reg = <0x40066000 0x1000>;
> -				interrupts =<0 71 0x04>;
> +				interrupts =<0 71 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_I2C0>;
>  				clock-names = "ipg";
>  				status = "disabled";
> @@ -265,7 +266,7 @@
>  			uart4: serial@400a9000 {
>  				compatible = "fsl,vf610-lpuart";
>  				reg = <0x400a9000 0x1000>;
> -				interrupts = <0 65 0x04>;
> +				interrupts = <0 65 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_UART4>;
>  				clock-names = "ipg";
>  				status = "disabled";
> @@ -274,7 +275,7 @@
>  			uart5: serial@400aa000 {
>  				compatible = "fsl,vf610-lpuart";
>  				reg = <0x400aa000 0x1000>;
> -				interrupts = <0 66 0x04>;
> +				interrupts = <0 66 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_UART5>;
>  				clock-names = "ipg";
>  				status = "disabled";
> @@ -283,7 +284,7 @@
>  			fec0: ethernet@400d0000 {
>  				compatible = "fsl,mvf600-fec";
>  				reg = <0x400d0000 0x1000>;
> -				interrupts = <0 78 0x04>;
> +				interrupts = <0 78 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_ENET0>,
>  					<&clks VF610_CLK_ENET0>,
>  					<&clks VF610_CLK_ENET>;
> @@ -294,7 +295,7 @@
>  			fec1: ethernet@400d1000 {
>  				compatible = "fsl,mvf600-fec";
>  				reg = <0x400d1000 0x1000>;
> -				interrupts = <0 79 0x04>;
> +				interrupts = <0 79 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_ENET1>,
>  					<&clks VF610_CLK_ENET1>,
>  					<&clks VF610_CLK_ENET>;
> -- 
> 1.7.2.rc3
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
