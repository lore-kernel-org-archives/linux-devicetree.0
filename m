From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/4] rtc: mediatek: enhance the description for MediaTek
 PMIC based RTC
Date: Fri, 22 Sep 2017 16:07:16 +0800
Message-ID: <1506067636.26847.2.camel@mtksdaap41>
References: <cover.1506049341.git.sean.wang@mediatek.com>
         <0d9d5559d9d884c98ef589a8f56ab0dcb140e5e0.1506049341.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0d9d5559d9d884c98ef589a8f56ab0dcb140e5e0.1506049341.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sean,

On Fri, 2017-09-22 at 11:33 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Give a better description for original MediaTek RTC driver as PMIC based
> RTC in order to distinguish SoC based RTC. Also turning all words with
> Mediatek to MediaTek here.
> 
> Cc: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/rtc/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 4226295..4500f77 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1716,14 +1716,14 @@ config RTC_DRV_MEDIATEK
>  	  will be called rtc-mediatek.
>  
>  config RTC_DRV_MT6397
> -	tristate "Mediatek Real Time Clock driver"
> +	tristate "MediaTek PMIC based RTC"
>  	depends on MFD_MT6397 || (COMPILE_TEST && IRQ_DOMAIN)
>  	help
> -	  This selects the Mediatek(R) RTC driver. RTC is part of Mediatek
> +	  This selects the MediaTek(R) RTC driver. RTC is part of MediaTek
>  	  MT6397 PMIC. You should enable MT6397 PMIC MFD before select
> -	  Mediatek(R) RTC driver.
> +	  MediaTek(R) RTC driver.
>  
> -	  If you want to use Mediatek(R) RTC interface, select Y or M here.
> +	  If you want to use MediaTek(R) RTC interface, select Y or M here.
>  
>  config RTC_DRV_XGENE
>  	tristate "APM X-Gene RTC"

Thanks your correction.

Acked-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Regards,


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
