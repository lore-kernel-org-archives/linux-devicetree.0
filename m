From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] mfd: ds1374: Add Dallas/Maxim DS1374 Multi Function
 Device
Date: Sun, 30 Jul 2017 00:26:08 +0200
Message-ID: <20170729222608.awlcjefi7wzfnahj@piout.net>
References: <1499975665-14581-1-git-send-email-mdf@kernel.org>
 <1499975665-14581-2-git-send-email-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499975665-14581-2-git-send-email-mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13/07/2017 at 12:54:25 -0700, Moritz Fischer wrote:
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 52a70ee..1703611 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -120,6 +120,16 @@ config DA9062_WATCHDOG
>  
>  	  This driver can be built as a module. The module name is da9062_wdt.
>  
> +config DS1374_WATCHDOG
> +	tristate "Maxim/Dallas 1374 Watchdog"

If you want to keep the backward compatibility, this probably needs to
be defaulting to RTC_DRV_DS1374 when RTC_DRV_DS1374_WDT is selected.

Also, maybe we need to make RTC_DRV_DS1374_WDT not user selectable.

If you don't think backward compatibility can be achieved, then we can
drop everything.

Else, the RTC part seems fine to me but the driver may be cleaned up a
bit further afterwards.

> +	depends on MFD_DS1374
> +	depends on REGMAP_I2C
> +	select WATCHDOG_CORE
> +	help
> +	  Support for the watchdog in the Maxim/Dallas DS1374 MFD.
> +
> +	  This driver can be built as a module. The module name is ds1374-wdt.
> +
>  config GPIO_WATCHDOG
>  	tristate "Watchdog device controlled through GPIO-line"
>  	depends on OF_GPIO

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
