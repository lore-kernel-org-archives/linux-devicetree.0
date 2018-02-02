From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC v4 13/26] watchdog: renesas_wdt: Add restart handler
Date: Thu, 1 Feb 2018 18:58:20 -0800
Message-ID: <7d53a583-f8fa-b479-cc8a-408febdddc0e@roeck-us.net>
References: <1517423070-24236-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1517423070-24236-14-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517423070-24236-14-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/31/2018 10:24 AM, Fabrizio Castro wrote:
> On iWave's boards iwg20d and iwg22d the only way to reboot the system is
> by means of the watchdog.
> This patch adds a restart handler to rwdt_ops, and also makes sure we
> keep its priority to a medium level, in order to not override other more
> effective handlers.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
> v3->v4:
> * New patch spawn out from patch 12/16. The restart handler on Gen3 is
>    controversial, hopefully this patch will help finalizing the discussion.
> 
>   drivers/watchdog/renesas_wdt.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 0a1a402..6d1c4b9 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -107,6 +107,24 @@ static unsigned int rwdt_get_timeleft(struct watchdog_device *wdev)
>   	return DIV_BY_CLKS_PER_SEC(priv, 65536 - val);
>   }
>   
> +static int rwdt_restart(struct watchdog_device *wdev, unsigned long action,
> +			void *data)
> +{
> +	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	pm_runtime_get_sync(wdev->parent);
> +
> +	rwdt_write(priv, 0x00, RWTCSRB);
> +	rwdt_write(priv, 0x00, RWTCSRA);
> +	rwdt_write(priv, 0xffff, RWTCNT);
> +
> +	while (readb_relaxed(priv->base + RWTCSRA) & RWTCSRA_WRFLG)
> +		cpu_relax();
> +
> +	rwdt_write(priv, 0x80, RWTCSRA);
> +	return 0;
> +}
> +
>   static const struct watchdog_info rwdt_ident = {
>   	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
>   	.identity = "Renesas WDT Watchdog",
> @@ -118,6 +136,7 @@ static const struct watchdog_ops rwdt_ops = {
>   	.stop = rwdt_stop,
>   	.ping = rwdt_init_timeout,
>   	.get_timeleft = rwdt_get_timeleft,
> +	.restart = rwdt_restart,
>   };
>   
>   static int rwdt_probe(struct platform_device *pdev)
> @@ -176,6 +195,7 @@ static int rwdt_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, priv);
>   	watchdog_set_drvdata(&priv->wdev, priv);
>   	watchdog_set_nowayout(&priv->wdev, nowayout);
> +	watchdog_set_restart_priority(&priv->wdev, 128);
>   
>   	/* This overrides the default timeout only if DT configuration was found */
>   	ret = watchdog_init_timeout(&priv->wdev, 0, &pdev->dev);
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
