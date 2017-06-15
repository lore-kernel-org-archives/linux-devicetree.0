From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH] watchdog: meson-wdt: add support for the watchdog on
 Meson8 and Meson8m2
Date: Thu, 15 Jun 2017 10:25:10 -0700
Message-ID: <20170615172510.GA7549@roeck-us.net>
References: <20170611095219.22095-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170611095219.22095-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 11, 2017 at 11:52:19AM +0200, Martin Blumenstingl wrote:
> The watchdog IP block on Meson8 and Meson8m2 is already supported by the
> existing meson-wdt driver. Meson8 uses the same register bits as Meson6,
> while the newer Meson8m2 SoC uses the same register bits as Meson8b.
> 
> Currently watchdog support on Meson8 SoC already works because
> meson8.dtsi simply uses the "amlogic,meson6-wdt" compatible. Adding a
> separate compatible for Meson8 makes this more explicit though.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

In general, changes like this are not necessary, though. The dts file
is supposed to reference both generic and specific compatible strings.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/meson-wdt.txt | 6 +++++-
>  drivers/watchdog/meson_wdt.c                             | 2 ++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/meson-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
> index ae70185d96e6..f2fbe1a39d31 100644
> --- a/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
> @@ -2,7 +2,11 @@ Meson SoCs Watchdog timer
>  
>  Required properties:
>  
> -- compatible : should be "amlogic,meson6-wdt" or "amlogic,meson8b-wdt"
> +- compatible : depending on the SoC this should be one of:
> +	"amlogic,meson6-wdt"
> +	"amlogic,meson8-wdt"
> +	"amlogic,meson8b-wdt"
> +	"amlogic,meson8m2-wdt"
>  - reg : Specifies base physical address and size of the registers.
>  
>  Example:
> diff --git a/drivers/watchdog/meson_wdt.c b/drivers/watchdog/meson_wdt.c
> index 491b9bf13d84..304274c67735 100644
> --- a/drivers/watchdog/meson_wdt.c
> +++ b/drivers/watchdog/meson_wdt.c
> @@ -155,7 +155,9 @@ static const struct watchdog_ops meson_wdt_ops = {
>  
>  static const struct of_device_id meson_wdt_dt_ids[] = {
>  	{ .compatible = "amlogic,meson6-wdt", .data = &meson6_wdt_data },
> +	{ .compatible = "amlogic,meson8-wdt", .data = &meson6_wdt_data },
>  	{ .compatible = "amlogic,meson8b-wdt", .data = &meson8b_wdt_data },
> +	{ .compatible = "amlogic,meson8m2-wdt", .data = &meson8b_wdt_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, meson_wdt_dt_ids);
> -- 
> 2.13.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
