From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 3/6] watchdog: davinci: add GET_TIMELEFT option support
Date: Mon, 18 Nov 2013 21:14:35 -0800
Message-ID: <528AF3BB.5020305@roeck-us.net>
References: <1384795139-19466-1-git-send-email-ivan.khoronzhuk@ti.com> <1384795139-19466-4-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384795139-19466-4-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Strashko Grygorii <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/18/2013 09:18 AM, Ivan Khoronzhuk wrote:
> Currently, the davinci watchdog can be read while counting,
> so we can add ability to report the remaining time before
> the system will reboot.
>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
> Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>   drivers/watchdog/davinci_wdt.c |   26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
> index b353df5..55deaf8 100644
> --- a/drivers/watchdog/davinci_wdt.c
> +++ b/drivers/watchdog/davinci_wdt.c
> @@ -116,6 +116,31 @@ static int davinci_wdt_ping(struct watchdog_device *wdd)
>   	return 0;
>   }
>
> +static unsigned int davinci_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	u64 timer_counter;
> +	unsigned long freq;
> +	u32 val;
> +	struct davinci_wdt_device *davinci_wdt = watchdog_get_drvdata(wdd);
> +
> +	/* if timeout has occured then return 0 */
> +	val = ioread32(davinci_wdt->base + WDTCR);
> +	if (val & WDFLAG)
> +		return 0;
> +
> +	freq = clk_get_rate(davinci_wdt->clk);
> +
> +	if (!freq)
> +		return 0;
> +
> +	timer_counter = ioread32(davinci_wdt->base + TIM12);
> +	timer_counter |= ((u64)ioread32(davinci_wdt->base + TIM34) << 32);
> +
> +	do_div(timer_counter, freq);
> +
> +	return wdd->timeout - timer_counter;
> +}
> +
>   static const struct watchdog_info davinci_wdt_info = {
>   	.options = WDIOF_KEEPALIVEPING,
>   	.identity = "DaVinci Watchdog",
> @@ -126,6 +151,7 @@ static const struct watchdog_ops davinci_wdt_ops = {
>   	.start		= davinci_wdt_start,
>   	.stop		= davinci_wdt_ping,
>   	.ping		= davinci_wdt_ping,
> +	.get_timeleft	= davinci_wdt_get_timeleft,
>   };
>
>   static int davinci_wdt_probe(struct platform_device *pdev)
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
