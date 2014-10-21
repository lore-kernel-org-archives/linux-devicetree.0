From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/1] ARM: at91/dt: sam9x5: Add CAN device nodes
Date: Tue, 21 Oct 2014 19:06:46 +0200
Message-ID: <544692A6.9030509@atmel.com>
References: <1412682710-14219-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412682710-14219-1-git-send-email-alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/10/2014 13:51, Alexander Stein :
> Add the missing CAN devices node including their pin muxing to the shared
> .dtsi for at91sam9x5. Actually include this file.
> While at it, fix white spaces of can1_clk.

Well, no: I split the patch in two to separate these whitespace
modifications and the addition of nodes. But now worries, I did it and
stacked the 2 patches on top of my WIP at91-3.19-dt branch.

(FYI, the additional patch is named (ARM: at91/dt/trivial:
at91sam9x5_can.dtsi: comment and whitespace fixes))

I also added the Acked-by from Alexandre Belloni as he added it in a
previous version and confirmed it on IRC for this v4.

Thanks for your help Alexander. Bye,


> Signed-off-by: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
> ---
> Changes in v4:
> * Move can related descriptions to at91sam9x5_can.dtsi
> * Actually include this file in at91sam9x[23]5.dtsi
> 
>  arch/arm/boot/dts/at91sam9x25.dtsi    |  1 +
>  arch/arm/boot/dts/at91sam9x35.dtsi    |  1 +
>  arch/arm/boot/dts/at91sam9x5_can.dtsi | 48 ++++++++++++++++++++++++++++++++---
>  3 files changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9x25.dtsi b/arch/arm/boot/dts/at91sam9x25.dtsi
> index c255421..3c5fa33 100644
> --- a/arch/arm/boot/dts/at91sam9x25.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x25.dtsi
> @@ -10,6 +10,7 @@
>  #include "at91sam9x5_usart3.dtsi"
>  #include "at91sam9x5_macb0.dtsi"
>  #include "at91sam9x5_macb1.dtsi"
> +#include "at91sam9x5_can.dtsi"
>  
>  / {
>  	model = "Atmel AT91SAM9X25 SoC";
> diff --git a/arch/arm/boot/dts/at91sam9x35.dtsi b/arch/arm/boot/dts/at91sam9x35.dtsi
> index 8eac66c..499cdc8 100644
> --- a/arch/arm/boot/dts/at91sam9x35.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x35.dtsi
> @@ -8,6 +8,7 @@
>  
>  #include "at91sam9x5.dtsi"
>  #include "at91sam9x5_macb0.dtsi"
> +#include "at91sam9x5_can.dtsi"
>  
>  / {
>  	model = "Atmel AT91SAM9X35 SoC";
> diff --git a/arch/arm/boot/dts/at91sam9x5_can.dtsi b/arch/arm/boot/dts/at91sam9x5_can.dtsi
> index f44ab77..3579232 100644
> --- a/arch/arm/boot/dts/at91sam9x5_can.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x5_can.dtsi
> @@ -20,10 +20,50 @@
>  						reg = <29>;
>  					};
>  
> -                                        can1_clk: can1_clk {
> -                                                #clock-cells = <0>;
> -                                                reg = <30>;
> -                                        };
> +					can1_clk: can1_clk {
> +						#clock-cells = <0>;
> +						reg = <30>;
> +					};
> +				};
> +			};
> +
> +			can0: can@f8000000 {
> +				compatible = "atmel,at91sam9x5-can";
> +				reg = <0xf8000000 0x300>;
> +				interrupts = <29 IRQ_TYPE_LEVEL_HIGH 3>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_can0_rx_tx>;
> +				clocks = <&can0_clk>;
> +				clock-names = "can_clk";
> +				status = "disabled";
> +			};
> +
> +			can1: can@f8004000 {
> +				compatible = "atmel,at91sam9x5-can";
> +				reg = <0xf8004000 0x300>;
> +				interrupts = <30 IRQ_TYPE_LEVEL_HIGH 3>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_can1_rx_tx>;
> +				clocks = <&can1_clk>;
> +				clock-names = "can_clk";
> +				status = "disabled";
> +			};
> +
> +			pinctrl@fffff400 {
> +				can0 {
> +					pinctrl_can0_rx_tx: can0_rx_tx {
> +						atmel,pins =
> +							<AT91_PIOA 9 AT91_PERIPH_B AT91_PINCTRL_NONE	/* CANRX0, conflicts with DRXD */
> +							AT91_PIOA 10 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* CANTX0, conflicts with DTXD */
> +					};
> +				};
> +
> +				can1 {
> +					pinctrl_can1_rx_tx: can1_rx_tx {
> +						atmel,pins =
> +							<AT91_PIOA 6 AT91_PERIPH_B AT91_PINCTRL_NONE	/* CANRX1, conflicts with RXD1 */
> +							AT91_PIOA 5 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* CANTX1, conflicts with TXD1 */
> +					};
>  				};
>  			};
>  		};
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
