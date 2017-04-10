From: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: at91: sama5d3_xplained: not all ADC
 channels are available
Date: Mon, 10 Apr 2017 11:04:56 +0200
Message-ID: <32a56914-7e10-d5ab-1eb0-436941ce368c@microchip.com>
References: <20170410082517.19628-1-ludovic.desroches@microchip.com>
 <20170410082517.19628-2-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170410082517.19628-2-ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Eugen.Hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, "# 3 . 16+" <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 10/04/2017 à 10:25, Ludovic Desroches a écrit :
> Remove ADC channels that are not available by default on the sama5d3_xplained
> board (resistor not populated) in order to not create confusion.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.16+

Acked-by: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

> ---
>  arch/arm/boot/dts/at91-sama5d3_xplained.dts | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> index 7a0fa1a..5a53fcf 100644
> --- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> @@ -163,9 +163,9 @@
>  
>  			adc0: adc@f8018000 {
>  				atmel,adc-vref = <3300>;
> +				atmel,adc-channels-used = <0xfe>;
>  				pinctrl-0 = <
>  					&pinctrl_adc0_adtrg
> -					&pinctrl_adc0_ad0
>  					&pinctrl_adc0_ad1
>  					&pinctrl_adc0_ad2
>  					&pinctrl_adc0_ad3
> @@ -173,8 +173,6 @@
>  					&pinctrl_adc0_ad5
>  					&pinctrl_adc0_ad6
>  					&pinctrl_adc0_ad7
> -					&pinctrl_adc0_ad8
> -					&pinctrl_adc0_ad9
>  					>;
>  				status = "okay";
>  			};
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
