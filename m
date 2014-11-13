From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sama5d4: add DMA support
Date: Thu, 13 Nov 2014 15:30:40 +0100
Message-ID: <5464C090.2080203@atmel.com>
References: <1415884724-11777-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415884724-11777-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/11/2014 14:18, Ludovic Desroches :
> Add DMA controllers and device configurations.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

and queued in at91-3.19-dt.

BTW: I changed the subject to match at91 standard ;-)
"ARM: at91*" so it is now: "ARM: at91/dt: sama5d4: add DMA support"

Thanks, bye,

> ---
> 
>  arch/arm/boot/dts/sama5d4.dtsi | 69 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
> index 338dfd8..05e0526 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -45,6 +45,7 @@
>  
>  #include "skeleton.dtsi"
>  #include <dt-bindings/clock/at91.h>
> +#include <dt-bindings/dma/at91.h>
>  #include <dt-bindings/pinctrl/at91.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/gpio/gpio.h>
> @@ -302,6 +303,15 @@
>  			#size-cells = <1>;
>  			ranges;
>  
> +			dma1: dma-controller@f0004000 {
> +				compatible = "atmel,sama5d4-dma";
> +				reg = <0xf0004000 0x200>;
> +				interrupts = <50 IRQ_TYPE_LEVEL_HIGH 0>;
> +				#dma-cells = <1>;
> +				clocks = <&dma1_clk>;
> +				clock-names = "dma_clk";
> +			};
> +
>  			ramc0: ramc@f0010000 {
>  				compatible = "atmel,sama5d3-ddramc";
>  				reg = <0xf0010000 0x200>;
> @@ -309,6 +319,15 @@
>  				clock-names = "ddrck", "mpddr";
>  			};
>  
> +			dma0: dma-controller@f0014000 {
> +				compatible = "atmel,sama5d4-dma";
> +				reg = <0xf0014000 0x200>;
> +				interrupts = <8 IRQ_TYPE_LEVEL_HIGH 0>;
> +				#dma-cells = <1>;
> +				clocks = <&dma0_clk>;
> +				clock-names = "dma_clk";
> +			};
> +
>  			pmc: pmc@f0018000 {
>  				compatible = "atmel,sama5d3-pmc";
>  				reg = <0xf0018000 0x120>;
> @@ -761,6 +780,10 @@
>  				compatible = "atmel,hsmci";
>  				reg = <0xf8000000 0x600>;
>  				interrupts = <35 IRQ_TYPE_LEVEL_HIGH 0>;
> +				dmas = <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(0))>;
> +				dma-names = "rxtx";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_mmc0_clk_cmd_dat0 &pinctrl_mmc0_dat1_3>;
>  				status = "disabled";
> @@ -776,6 +799,13 @@
>  				compatible = "atmel,at91rm9200-spi";
>  				reg = <0xf8010000 0x100>;
>  				interrupts = <37 IRQ_TYPE_LEVEL_HIGH 3>;
> +				dmas = <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(10))>,
> +				       <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(11))>;
> +				dma-names = "tx", "rx";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_spi0>;
>  				clocks = <&spi0_clk>;
> @@ -787,6 +817,13 @@
>  				compatible = "atmel,at91sam9x5-i2c";
>  				reg = <0xf8014000 0x4000>;
>  				interrupts = <32 IRQ_TYPE_LEVEL_HIGH 6>;
> +				dmas = <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(2))>,
> +				       <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(3))>;
> +				dma-names = "tx", "rx";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_i2c0>;
>  				#address-cells = <1>;
> @@ -818,6 +855,13 @@
>  				compatible = "atmel,at91sam9x5-i2c";
>  				reg = <0xf8024000 0x4000>;
>  				interrupts = <34 IRQ_TYPE_LEVEL_HIGH 6>;
> +				dmas = <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(6))>,
> +				       <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(7))>;
> +				dma-names = "tx", "rx";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_i2c2>;
>  				#address-cells = <1>;
> @@ -830,6 +874,10 @@
>  				compatible = "atmel,hsmci";
>  				reg = <0xfc000000 0x600>;
>  				interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
> +				dmas = <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(1))>;
> +				dma-names = "rxtx";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_mmc1_clk_cmd_dat0 &pinctrl_mmc1_dat1_3>;
>  				status = "disabled";
> @@ -843,6 +891,13 @@
>  				compatible = "atmel,at91sam9260-usart";
>  				reg = <0xfc008000 0x100>;
>  				interrupts = <29 IRQ_TYPE_LEVEL_HIGH 5>;
> +				dmas = <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(16))>,
> +				       <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(17))>;
> +				dma-names = "tx", "rx";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_usart2 &pinctrl_usart2_rts &pinctrl_usart2_cts>;
>  				clocks = <&usart2_clk>;
> @@ -854,6 +909,13 @@
>  				compatible = "atmel,at91sam9260-usart";
>  				reg = <0xfc00c000 0x100>;
>  				interrupts = <30 IRQ_TYPE_LEVEL_HIGH 5>;
> +				dmas = <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(18))>,
> +				       <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(19))>;
> +				dma-names = "tx", "rx";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_usart3>;
>  				clocks = <&usart3_clk>;
> @@ -865,6 +927,13 @@
>  				compatible = "atmel,at91sam9260-usart";
>  				reg = <0xfc010000 0x100>;
>  				interrupts = <31 IRQ_TYPE_LEVEL_HIGH 5>;
> +				dmas = <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(20))>,
> +				       <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(21))>;
> +				dma-names = "tx", "rx";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_usart4>;
>  				clocks = <&usart4_clk>;
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
