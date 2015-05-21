From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH 1/5] soc: mediatek: Add infracfg misc driver support
Date: Thu, 21 May 2015 10:09:42 +0200
Message-ID: <1432195782.21715.123.camel@x220>
References: <1432131540-2523-1-git-send-email-s.hauer@pengutronix.de>
	 <1432131540-2523-2-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432131540-2523-2-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Just a nit: an unneeded macro.

On Wed, 2015-05-20 at 16:18 +0200, Sascha Hauer wrote:

> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig

> +config MTK_INFRACFG
> +	bool "MediaTek INFRACFG Support"
> +	depends on ARCH_MEDIATEK
> +	select REGMAP
> +	help
> +	  Say yes here to add support for the MediaTek INFRACFG controller. The
> +	  INFRACFG controller contains various infrastructure registers not
> +	  directly associated to any device.
> +

> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile

> +obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o

> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-infracfg.c

> +#include <linux/module.h>

> +MODULE_LICENSE("GPL v2");

MTK_INFRACFG was changed from tristate to bool in this version.

Note that for built-in code MODULE_LICENSE() will be effectively
preprocessed away. So you can drop that macro, and the include of
linux/module.h too. (I did a quick compile to see if nothing else
requires module.h, and it compiled cleanly without that include.)

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
