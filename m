From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] Update bcm_defconfig with new pinctrl CONFIG
Date: Thu, 10 Apr 2014 13:56:23 -0400
Message-ID: <20140410175623.GC23695@beef>
References: <1390509887-19278-1-git-send-email-syin@broadcom.com>
 <1396478439-16586-1-git-send-email-syin@broadcom.com>
 <1396478439-16586-3-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396478439-16586-3-git-send-email-syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 02, 2014 at 03:40:38PM -0700, Sherman Yin wrote:
> To be consistent with other Broadcom drivers, the Broadcom Capri pinctrl
> driver and its related CONFIG option are renamed to bcm281xx.
> 
> This commit updates the defconfig that enables the pinctrl driver.
> 
> Signed-off-by: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  arch/arm/configs/bcm_defconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/bcm_defconfig b/arch/arm/configs/bcm_defconfig
> index 2519d6d..b4d3013 100644
> --- a/arch/arm/configs/bcm_defconfig
> +++ b/arch/arm/configs/bcm_defconfig
> @@ -125,7 +125,7 @@ CONFIG_CRC_ITU_T=y
>  CONFIG_CRC7=y
>  CONFIG_XZ_DEC=y
>  CONFIG_AVERAGE=y
> -CONFIG_PINCTRL_CAPRI=y
> +CONFIG_PINCTRL_BCM281XX=y
>  CONFIG_WATCHDOG=y
>  CONFIG_BCM_KONA_WDT=y
>  CONFIG_BCM_KONA_WDT_DEBUG=y
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
