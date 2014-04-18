From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: fix spi cs on sama5d3 Xplained board
Date: Fri, 18 Apr 2014 17:31:29 +0200
Message-ID: <53514551.8030601@atmel.com>
References: <1396336363-13709-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396336363-13709-1-git-send-email-voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/04/2014 09:12, Bo Shen :
> The PD16 is the CS3 for SPI0 while not SPI1.
> 
> Signed-off-by: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Okay, queued in at91-3.15-fixes. Thanks



> ---
> This patch is based on v3.14-rc8
> 
>  arch/arm/boot/dts/at91-sama5d3_xplained.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> index ce13755..4537259 100644
> --- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> @@ -34,7 +34,7 @@
>  			};
>  
>  			spi0: spi@f0004000 {
> -				cs-gpios = <&pioD 13 0>;
> +				cs-gpios = <&pioD 13 0>, <0>, <0>, <&pioD 16 0>;
>  				status = "okay";
>  			};
>  
> @@ -79,7 +79,7 @@
>  			};
>  
>  			spi1: spi@f8008000 {
> -				cs-gpios = <&pioC 25 0>, <0>, <0>, <&pioD 16 0>;
> +				cs-gpios = <&pioC 25 0>;
>  				status = "okay";
>  			};
>  
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
