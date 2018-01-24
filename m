From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: use a correct at24 fallback for
 at91-nattis-2-natte-2
Date: Wed, 24 Jan 2018 23:12:17 +0100
Message-ID: <bd9bdd00-d7ce-e925-2d63-d0fbb86e07e9@axentia.se>
References: <20180124213412.4612-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180124213412.4612-1-brgl-ARrdPY/1zhM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bartosz,

On 2018-01-24 22:34, Bartosz Golaszewski wrote:
> We now require all at24 users to use the "atmel,<model>" fallback in
> device tree for different manufacturers.

I think my patch [3/4] from about a week ago was just a tiny bit
better.
https://lkml.org/lkml/2018/1/16/609

Can we please pick that one directly instead of doing this partial
step?

Cheers,
Peter

> Signed-off-by: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
> index 3ea1d26e1c68..9ae2a9de6123 100644
> --- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
> +++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
> @@ -146,7 +146,7 @@
>  	};
>  
>  	eeprom@50 {
> -		compatible = "nxp,24c02";
> +		compatible = "nxp,24c02", "atmel,24c02";
>  		reg = <0x50>;
>  		pagesize = <16>;
>  	};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
