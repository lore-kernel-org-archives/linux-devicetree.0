From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] ARM: at91/dt: sam9x5: Add CAN device nodes
Date: Mon, 6 Oct 2014 17:33:11 +0200
Message-ID: <5432B637.1060200@atmel.com>
References: <1412605640-29472-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412605640-29472-1-git-send-email-alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/10/2014 16:27, Alexander Stein :
> Add the missing CAN devices node including their pin muxing and clocks.
> 
> Signed-off-by: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
> Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Changes in v3:
> * Match the pin name to the ones in the datasheet.
> 
>  arch/arm/boot/dts/at91sam9x5.dtsi | 48 +++++++++++++++++++++++++++++++++++++++

Alexander,

In fact, we already have a placeholder for these nodes:
arch/arm/boot/dts/at91sam9x5_can.dtsi

The file is only included in SoC device trees which actually contain
this peripheral: at91sam9x25 and at91sam9x35 (and not the other variants
of this family).

So, can you please move this addition above into the
arch/arm/boot/dts/at91sam9x5_can.dtsi file?



>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
> index e1a5c70..a58c1de 100644
> --- a/arch/arm/boot/dts/at91sam9x5.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x5.dtsi
> @@ -363,6 +363,16 @@
>  						#clock-cells = <0>;
>  						reg = <28>;
>  					};
> +
> +					can0_clk: can0_clk {
> +						#clock-cells = <0>;
> +						reg = <29>;
> +					};
> +
> +					can1_clk: can1_clk {
> +						#clock-cells = <0>;
> +						reg = <30>;

In fact, the clocks are already defined in the file that I pointed out
above, so you will be able to remove them.


> +					};
>  				};
>  			};
>  
> @@ -407,6 +417,28 @@
>  				};
>  			};
>  
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
>  			tcb0: timer@f8008000 {
>  				compatible = "atmel,at91sam9x5-tcb";
>  				reg = <0xf8008000 0x100>;
> @@ -763,6 +795,22 @@
>  					};
>  				};
>  
> +				can0 {
> +					pinctrl_can0_rx_tx: can0_rx_tx {
> +						atmel,pins =
> +							<AT91_PIOA 9 AT91_PERIPH_B AT91_PINCTRL_NONE	/* CANRX0, conflicts with DRXD */
> +							 AT91_PIOA 10 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* CANTX0, conflicts with DTXD */
> +					};
> +				};
> +
> +				can1 {
> +					pinctrl_can1_rx_tx: can1_rx_tx {
> +						atmel,pins =
> +							<AT91_PIOA 6 AT91_PERIPH_B AT91_PINCTRL_NONE	/* CANRX1, conflicts with RXD1 */
> +							 AT91_PIOA 5 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* CANTX1, conflicts with TXD1 */
> +					};
> +				};
> +
>  				pioA: gpio@fffff400 {
>  					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
>  					reg = <0xfffff400 0x200>;

Otherwise, it looks good.

Thanks for your help.

Best regards,
-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
