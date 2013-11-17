From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: Fwd: [PATCH 4/8] watchdog: davinci: add GET_STATUS option support
Date: Sat, 16 Nov 2013 18:24:39 -0800
Message-ID: <528828E7.6060404@roeck-us.net>
References: <1383680783-12114-5-git-send-email-ivan.khoronzhuk@ti.com> <527A28CE.2070802@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <527A28CE.2070802-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/06/2013 03:32 AM, ivan.khoronzhuk wrote:
> When watchdog timer is expired we can know about it thought

thought -> through or with

> GET_STATUS ioctl option.
>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
> ---
>   drivers/watchdog/davinci_wdt.c |   13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
> index 6cbf2e1..a371b2d 100644
> --- a/drivers/watchdog/davinci_wdt.c
> +++ b/drivers/watchdog/davinci_wdt.c
> @@ -144,6 +144,18 @@ static unsigned int davinci_wdt_get_timeleft(struct watchdog_device *wdd)
>   	return wdd->timeout - timer_counter;
>   }
>
> +static unsigned int davinci_wdt_status(struct watchdog_device *wdd)
> +{
> +	u32 val;
> +	struct davinci_wdt_device *davinci_wdt = watchdog_get_drvdata(wdd);
> +
> +	val = ioread32(davinci_wdt->base + WDTCR);
> +	if (val & WDFLAG)
> +		return WDIOF_CARDRESET;
> +
	"Card previously reset the CPU"

Is this really accurate / correct ?

My understanding is that the status is supposed to return the reason for a previous reset/reboot,
not the curent condition.

> +	return 0;
> +}
> +
>   static const struct watchdog_info davinci_wdt_info = {
>   	.options = WDIOF_KEEPALIVEPING,
>   	.identity = "DaVinci Watchdog",
> @@ -155,6 +167,7 @@ static const struct watchdog_ops davinci_wdt_ops = {
>   	.stop		= davinci_wdt_ping,
>   	.ping		= davinci_wdt_ping,
>   	.get_timeleft	= davinci_wdt_get_timeleft,
> +	.status		= davinci_wdt_status,
>   };
>
>   static int davinci_wdt_probe(struct platform_device *pdev)
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
