From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 3/7] watchdog: JZ4740: Register a restart handler
Date: Thu, 28 Dec 2017 10:40:53 -0800
Message-ID: <e1871276-fc00-eefd-1a43-e528f6da1269@roeck-us.net>
References: <20171228162939.3928-1-paul@crapouillou.net>
 <20171228162939.3928-4-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171228162939.3928-4-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/28/2017 08:29 AM, Paul Cercueil wrote:
> The watchdog driver can restart the system by simply configuring the
> hardware for a timeout of 0 seconds.
> 
> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>   drivers/watchdog/jz4740_wdt.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
> index 92d6ca8ceb49..fa7f49a3212c 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -130,6 +130,14 @@ static int jz4740_wdt_stop(struct watchdog_device *wdt_dev)
>   	return 0;
>   }
>   
> +static int jz4740_wdt_restart(struct watchdog_device *wdt_dev,
> +			      unsigned long action, void *data)
> +{
> +	wdt_dev->timeout = 0;
> +	jz4740_wdt_start(wdt_dev);
> +	return 0;
> +}
> +
>   static const struct watchdog_info jz4740_wdt_info = {
>   	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
>   	.identity = "jz4740 Watchdog",
> @@ -141,6 +149,7 @@ static const struct watchdog_ops jz4740_wdt_ops = {
>   	.stop = jz4740_wdt_stop,
>   	.ping = jz4740_wdt_ping,
>   	.set_timeout = jz4740_wdt_set_timeout,
> +	.restart = jz4740_wdt_restart,
>   };
>   
>   #ifdef CONFIG_OF
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
