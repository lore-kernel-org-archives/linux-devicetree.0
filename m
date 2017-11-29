From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/4] ARM: dts: at91: sama5d2: added dma property for
 ADC device
Date: Wed, 29 Nov 2017 22:05:07 +0100
Message-ID: <20171129210507.GQ21126@piout.net>
References: <1510750608-8697-1-git-send-email-eugen.hristev@microchip.com>
 <1510750608-8697-3-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510750608-8697-3-git-send-email-eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 15/11/2017 at 14:56:46 +0200, Eugen Hristev wrote:
> Added DMA property for ADC device
> 
> Signed-off-by: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sama5d2.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

This didn't apply cleanly, please check
https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?h=at91-dt&id=0ae80c039ef2407c08842ddde892af0c9128711b

> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
> index 38d2216..ca8bf13 100644
> --- a/arch/arm/boot/dts/sama5d2.dtsi
> +++ b/arch/arm/boot/dts/sama5d2.dtsi
> @@ -1430,6 +1430,8 @@
>  				atmel,min-sample-rate-hz = <200000>;
>  				atmel,max-sample-rate-hz = <20000000>;
>  				atmel,startup-time-ms = <4>;
> +				dmas = <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) | AT91_XDMAC_DT_PERID(25))>;
> +				dma-names = "rx";
>  				status = "disabled";
>  			};
>  
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
