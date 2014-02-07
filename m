From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v6 05/19] watchdog: orion: Make sure the watchdog is initially
 stopped
Date: Thu, 06 Feb 2014 18:02:56 -0800
Message-ID: <52F43ED0.4050808@roeck-us.net>
References: <1391707226-18258-1-git-send-email-ezequiel.garcia@free-electrons.com> <1391707226-18258-6-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391707226-18258-6-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/06/2014 09:20 AM, Ezequiel Garcia wrote:
> Having the watchdog initially fully stopped is important to avoid
> any spurious watchdog triggers, in case the registers are not in
> its reset state.
>
> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> Tested-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Willy Tarreau <w@1wt.eu>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   drivers/watchdog/orion_wdt.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index 6746033..2dbeee9 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -142,6 +142,9 @@ static int orion_wdt_probe(struct platform_device *pdev)
>   	orion_wdt.max_timeout = wdt_max_duration;
>   	watchdog_init_timeout(&orion_wdt, heartbeat, &pdev->dev);
>
> +	/* Let's make sure the watchdog is fully stopped */
> +	orion_wdt_stop(&orion_wdt);
> +

Actually we just had that in another driver, and I stumbled over it there.

Problem with stopping the watchdog in probe unconditionally is that you can
use it to defeat nowayout: unload the module, then load it again,
and the watchdog is stopped even if nowayout is true.

Is this really what you want ? Or, in other words, what is the problem
you are trying to solve ?

Thanks,
Guenter


>   	watchdog_set_nowayout(&orion_wdt, nowayout);
>   	ret = watchdog_register_device(&orion_wdt);
>   	if (ret)
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
