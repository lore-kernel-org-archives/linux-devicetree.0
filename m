From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH 1/5] soc: mediatek: Add infracfg misc driver support
Date: Tue, 12 May 2015 11:24:31 +0200
Message-ID: <1431422671.2398.155.camel@x220>
References: <1431372206-1237-1-git-send-email-s.hauer@pengutronix.de>
	 <1431372206-1237-2-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431372206-1237-2-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-05-11 at 21:23 +0200, Sascha Hauer wrote:
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig

> +config MTK_INFRACFG
> +	tristate "MediaTek INFRACFG Support"
> +	depends on ARCH_MEDIATEK
> +	select REGMAP
> +	help
> +	  Say yes here to add support for the MediaTek INFRACFG controller. The
> +	  INFRACFG controller contains various infrastructure registers not
> +	  directly associated to any device.

> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile

> +obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o

> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-infracfg.c

> +EXPORT_SYMBOL_GPL(mtk_infracfg_set_bus_protection);

> +EXPORT_SYMBOL_GPL(mtk_infracfg_clear_bus_protection);

As I understand it, if both MTK_INFRACFG and MTK_SCPSYS (see 3/5) are m
we will get mtk-infracfg.ko and mtk-scpsys.ko (see 3/5). And loading
mtk-scpsys.ko will trigger loading mtk-infracfg.ko, right?

But since this file has no MODULE_LICENSE() that should generate a
warning and taint the kernel. (I haven't tested this. Please correct me
if I'm overlooking something here.)

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
