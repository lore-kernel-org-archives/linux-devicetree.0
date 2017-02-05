From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v9 2/3] MAINTAINERS: add zx2967 watchdog controller driver
 to ARM ZTE architecture
Date: Sat, 4 Feb 2017 16:05:21 -0800
Message-ID: <4cba1be6-ee85-7371-ea02-1bf8e7eb628e@roeck-us.net>
References: <1486172055-13162-1-git-send-email-baoyou.xie@linaro.org>
 <1486172055-13162-2-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486172055-13162-2-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/03/2017 05:34 PM, Baoyou Xie wrote:
> Add the zx2967 watchdog controller driver as maintained by ARM ZTE
> architecture maintainers, as they're parts of the core IP.
>
> Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

I assume you'll submit this patch through the arm tree ?

Guenter

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index edfdea3..275c434 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1990,11 +1990,13 @@ F:	drivers/clk/zte/
>  F:	drivers/reset/reset-zx2967.c
>  F:	drivers/soc/zte/
>  F:	drivers/thermal/zx*
> +F:	drivers/watchdog/zx2967_wdt.c
>  F:	Documentation/devicetree/bindings/arm/zte.txt
>  F:	Documentation/devicetree/bindings/clock/zx296702-clk.txt
>  F:	Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
>  F:	Documentation/devicetree/bindings/soc/zte/
>  F:	Documentation/devicetree/bindings/thermal/zx*
> +F:	Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
>  F:	include/dt-bindings/soc/zx*.h
>
>  ARM/ZYNQ ARCHITECTURE
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
