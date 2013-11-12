From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: Fwd: [PATCH 1/8] watchdog: davinci: change driver to use WDT
 core
Date: Tue, 12 Nov 2013 10:31:58 -0500
Message-ID: <528249EE.6080109@ti.com>
References: <1383680783-12114-2-git-send-email-ivan.khoronzhuk@ti.com> <527A287C.2090401@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <527A287C.2090401-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 06 November 2013 06:31 AM, ivan.khoronzhuk wrote:
> To reduce code duplicate and increase code readability use WDT core
> code to handle WDT interface.
> 
> Remove io_lock as the WDT core uses mutex to lock each wdt device.
> Remove wdt_state as the WDT core track state with its own variable.
> 
> The watchdog_init_timeout() can read timeout value from timeout-sec
> property if the passed value is out of bounds. So set initial
> heartbeat value more than max value in order to initialize heartbeat
> in next way. If heartbeat is not set thought module parameter, try
> to read it's value from WDT node timeout-sec property. If node has
> no one, use default value.
> 
> The heartbeat is hold in wdd->timeout by WDT core, so use it in
> order to set timeout period.
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/watchdog/Kconfig       |    1 +
>  drivers/watchdog/davinci_wdt.c |  150 ++++++++++------------------------------
>  2 files changed, 38 insertions(+), 113 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index d1d53f3..2c954b5 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -271,6 +271,7 @@ config IOP_WATCHDOG
>  config DAVINCI_WATCHDOG
>  	tristate "DaVinci watchdog"
>  	depends on ARCH_DAVINCI
> +	select WATCHDOG_CORE
>  	help
>  	  Say Y here if to include support for the watchdog timer
>  	  in the DaVinci DM644x/DM646x processors.
> diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
> index bead774..a6eef71 100644
> --- a/drivers/watchdog/davinci_wdt.c
> +++ b/drivers/watchdog/davinci_wdt.c
> @@ -3,7 +3,7 @@
>   *
>   * Watchdog driver for DaVinci DM644x/DM646x processors
>   *
> - * Copyright (C) 2006 Texas Instruments.
> + * Copyright (C) 2013 Texas Instruments.
s/2013/2006-2013

Apart from the minor nit, this is really nice clean-up and
more aligned with wdt coer leayer.

FWIW, Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
