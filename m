From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [1/7] watchdog: sama5d4: make use of timeout-secs provided in
 devicetree
Date: Sun, 11 Feb 2018 09:38:37 -0800
Message-ID: <20180211173837.GA18566@roeck-us.net>
References: <20180209192724.1227-2-marcus.folkesson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180209192724.1227-2-marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 09, 2018 at 08:27:18PM +0100, Marcus Folkesson wrote:
> watchdog_init_timeout() will allways pick timeout_param since it
> defaults to a valid timeout.
> 
> Following best practice described in
> Documentation/watchdog/watchdog-kernel-api.txt to make use of
> the parameter logic.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Unfortunately I'll have to withdraw the Reviewed-by:. wdt_timeout is used at
the end of the probe function to display the selected timeout. This will have
to be changed to display the actual timeout.

Guenter

> ---
>  drivers/watchdog/sama5d4_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 0ae947c3d7bc..e6c679383734 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -33,7 +33,7 @@ struct sama5d4_wdt {
>  	unsigned long		last_ping;
>  };
>  
> -static int wdt_timeout = WDT_DEFAULT_TIMEOUT;
> +static int wdt_timeout;
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  
>  module_param(wdt_timeout, int, 0);
> @@ -212,7 +212,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	wdd = &wdt->wdd;
> -	wdd->timeout = wdt_timeout;
> +	wdd->timeout = WDT_DEFAULT_TIMEOUT;
>  	wdd->info = &sama5d4_wdt_info;
>  	wdd->ops = &sama5d4_wdt_ops;
>  	wdd->min_timeout = MIN_WDT_TIMEOUT;
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
