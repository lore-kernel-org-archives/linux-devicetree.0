From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] watchdog: dw_wdt: get reset lines from dt
Date: Sun, 14 May 2017 07:33:37 -0700
Message-ID: <db63fee1-6938-48b1-9912-ced318341782@roeck-us.net>
References: <44e4e733055cfa2ed79091542c7bb17aa24afca9.1494595189.git-series.s.trumtrar@pengutronix.de>
 <4aa9252b45f2334eb429bb195d5d2963b4e61db1.1494595189.git-series.s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4aa9252b45f2334eb429bb195d5d2963b4e61db1.1494595189.git-series.s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/12/2017 06:34 AM, Steffen Trumtrar wrote:
> The dw_wdt has an external reset line, that can keep the device in reset
> and therefore rendering it useless and also is the only way of stopping
> the watchdog once it was started.
>
> Get the reset lines for this core from the devicetree.
> If resets are not specified just warn but don't fail probing to be compatible
> with all users.
>
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/watchdog/dw_wdt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 914da3a4d334..3accddf1f381 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -29,6 +29,7 @@
>  #include <linux/of.h>
>  #include <linux/pm.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/watchdog.h>
>
>  #define WDOG_CONTROL_REG_OFFSET		    0x00
> @@ -54,6 +55,7 @@ struct dw_wdt {
>  	struct clk		*clk;
>  	unsigned long		rate;
>  	struct watchdog_device	wdd;
> +	struct reset_control	*rst;
>  };
>
>  #define to_dw_wdt(wdd)	container_of(wdd, struct dw_wdt, wdd)
> @@ -234,6 +236,8 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  		goto out_disable_clk;
>  	}
>
> +	dw_wdt->rst = devm_reset_control_get(&pdev->dev, NULL);
> +

devm_reset_control_get() does not return NULL, it returns ERR_PTR on error.

>  	wdd = &dw_wdt->wdd;
>  	wdd->info = &dw_wdt_ident;
>  	wdd->ops = &dw_wdt_ops;
> @@ -267,6 +271,9 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_disable_clk;
>
> +	if (dw_wdt->rst)
> +		reset_control_deassert(dw_wdt->rst);

Granted, this doesn't cause a crash here, but a warning with traceback.
Either case, the if() statement misses the point.

> +
>  	return 0;
>
>  out_disable_clk:
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
