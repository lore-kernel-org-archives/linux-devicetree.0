From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 4/8] watchdog: JZ4740: Drop module remove function
Date: Sat, 30 Dec 2017 08:08:30 -0800
Message-ID: <8454df76-df77-c57f-2f87-be03c4cda63b@roeck-us.net>
References: <20171228162939.3928-2-paul@crapouillou.net>
 <20171230135108.6834-1-paul@crapouillou.net>
 <20171230135108.6834-4-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171230135108.6834-4-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/30/2017 05:51 AM, Paul Cercueil wrote:
> When the watchdog was configured for nowayout, and after the
> userspace watchdog daemon closed the dev node without sending the
> magic character, unloading this module stopped the watchdog
> hardware, which was clearly a problem.
> 
> Besides, unloading the module is not possible when the userspace
> watchdog daemon is running, so it's safe to assume that we don't
> need to stop the watchdog hardware in the jz4740_wdt_remove()
> function.
> 
> For this reason, the jz4740_wdt_remove() function can then be
> dropped alltogether.
> 
> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>   drivers/watchdog/jz4740_wdt.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
>   v2: New patch in this series
> 
> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
> index fa7f49a3212c..02b9b8e946a2 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -205,16 +205,8 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int jz4740_wdt_remove(struct platform_device *pdev)
> -{
> -	struct jz4740_wdt_drvdata *drvdata = platform_get_drvdata(pdev);
> -
> -	return jz4740_wdt_stop(&drvdata->wdt);
> -}
> -
>   static struct platform_driver jz4740_wdt_driver = {
>   	.probe = jz4740_wdt_probe,
> -	.remove = jz4740_wdt_remove,
>   	.driver = {
>   		.name = "jz4740-wdt",
>   		.of_match_table = of_match_ptr(jz4740_wdt_of_matches),
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
