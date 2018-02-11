From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v2, 7/7] watchdog: coh901327: make use of timeout-secs provided
 in devicetree
Date: Sun, 11 Feb 2018 09:33:56 -0800
Message-ID: <20180211173356.GA18292@roeck-us.net>
References: <20180210091911.3644-7-marcus.folkesson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180210091911.3644-7-marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 10, 2018 at 10:19:11AM +0100, Marcus Folkesson wrote:
> watchdog_init_timeout() will allways pick timeout_param since it
> defaults to a valid timeout.
> 
> Following best practice described in
> Documentation/watchdog/watchdog-kernel-api.txt to make use of
> the parameter logic.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> v2:
> 	- Set .timeout in coh901327_wdt structure declaration.
> 	- Set .min_timeout to 1 instead of 0. I could not find a datasheet
> 	  for coh901327, so I'm not sure if 0 is valid. However, 0 seems
> 		  wrong to me and most driver has 1 as min value. If it should
> 		  be 0, please let me know and I have to set another initial
> 		  value for margin.

Makes sense to me.

> 
>  drivers/watchdog/coh901327_wdt.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/coh901327_wdt.c b/drivers/watchdog/coh901327_wdt.c
> index 4410337f4f7f..5d8eb9a30879 100644
> --- a/drivers/watchdog/coh901327_wdt.c
> +++ b/drivers/watchdog/coh901327_wdt.c
> @@ -67,7 +67,9 @@
>  #define U300_WDOG_IFR_WILL_BARK_IRQ_FORCE_ENABLE			0x0001U
>  
>  /* Default timeout in seconds = 1 minute */
> -static unsigned int margin = 60;
> +#define U300_WDOG_DEFAULT_TIMEOUT					60
> +
> +static unsigned int margin;

I just realized that 'margin' instead of the actual timeout is used
at the end of the probe function to display the selected timeout.
This will have to change as well (and I'll have to go back to the
other patches to make sure that this doesn't happen there as well).

Guenter

>  static int irq;
>  static void __iomem *virtbase;
>  static struct device *parent;
> @@ -235,8 +237,9 @@ static struct watchdog_device coh901327_wdt = {
>  	 * timeout register is max
>  	 * 0x7FFF = 327670ms ~= 327s.
>  	 */
> -	.min_timeout = 0,
> +	.min_timeout = 1,
>  	.max_timeout = 327,
> +	.timeout = U300_WDOG_DEFAULT_TIMEOUT,
>  };
>  
>  static int __exit coh901327_remove(struct platform_device *pdev)
> @@ -315,9 +318,7 @@ static int __init coh901327_probe(struct platform_device *pdev)
>  		goto out_no_irq;
>  	}
>  
> -	ret = watchdog_init_timeout(&coh901327_wdt, margin, dev);
> -	if (ret < 0)
> -		coh901327_wdt.timeout = 60;
> +	watchdog_init_timeout(&coh901327_wdt, margin, dev);
>  
>  	coh901327_wdt.parent = dev;
>  	ret = watchdog_register_device(&coh901327_wdt);
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
