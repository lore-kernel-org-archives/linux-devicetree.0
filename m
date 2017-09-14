From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v1 1/2] watchdog: dw_wdt: add stop watchdog operation
Date: Thu, 14 Sep 2017 12:17:39 +0200
Message-ID: <1505384259.10100.2.camel@pengutronix.de>
References: <20170914081402.7893-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170914081402.7893-1-o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Oleksij,

On Thu, 2017-09-14 at 10:14 +0200, Oleksij Rempel wrote:
> From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> The only way of stopping the watchdog is by resetting it.
> Add the watchdog op for stopping the device and reset if
> a reset line is provided.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/watchdog/dw_wdt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 36be987ff9ef..50d8a6a5b5ac 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -135,6 +135,21 @@ static int dw_wdt_start(struct watchdog_device
> *wdd)
>  	return 0;
>  }
>  
> +static int dw_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
> +
> +	if (IS_ERR(dw_wdt->rst)) {

	if (!dw_wdt->rst) {

Since commit 65a3b6935d92 ("watchdog: dw_wdt: get reset lines from dt"),
the reset control is requested as optional, meaning dw_wdt->rst == NULL
if the reset line is not present. If an error is value is stored into
dw_wdt->rst, the probe function does not succeed.

> +		dev_warn(wdd->parent, "No reset line. Will not
> stop.\n");
> +		return PTR_ERR(dw_wdt->rst);
> +	}

regards
Philipp
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
