From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: of: helper for determining flags properties
Date: Tue, 13 May 2014 13:20:54 +0100
Message-ID: <20140513122054.GA2419@e106331-lin.cambridge.arm.com>
References: <1399982253-21079-1-git-send-email-gabriel.fernandez@linaro.org>
 <1399982253-21079-2-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399982253-21079-2-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Cc: "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 13, 2014 at 12:57:32PM +0100, Gabriel FERNANDEZ wrote:
> The patch provides a helper to get flags properties of
> a clock node.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/clk/clk.c            | 11 +++++++++++
>  include/linux/clk-provider.h |  6 ++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 4d56220..cae8985 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2528,6 +2528,17 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>  }
>  EXPORT_SYMBOL_GPL(of_clk_get_parent_name);
>  
> +unsigned long of_clk_get_flags(struct device_node *np)
> +{
> +	unsigned long flags = 0;
> +
> +	if (of_property_read_bool(np, "set-rate-parent"))
> +		flags |= CLK_SET_RATE_PARENT;

NAK.

This is _not_ a hardware property. This flag describes internals of the
Linux clock framework, and is thus not suitable for DT.

You've also failed to document the property.

What are you trying to achieve here, and why do you think this is the
best way of achieving that?

Cheers,
Mark.

> +
> +	return flags;
> +}
> +EXPORT_SYMBOL_GPL(of_clk_get_flags);
> +
>  struct clock_provider {
>  	of_clk_init_cb_t clk_init_cb;
>  	struct device_node *np;
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 59e2eb5..650bc10 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -519,6 +519,7 @@ int of_clk_get_parent_count(struct device_node *np);
>  const char *of_clk_get_parent_name(struct device_node *np, int index);
>  
>  void of_clk_init(const struct of_device_id *matches);
> +unsigned long of_clk_get_flags(struct device_node *np);
>  
>  #else /* !CONFIG_OF */
>  
> @@ -546,6 +547,11 @@ static inline const char *of_clk_get_parent_name(struct device_node *np,
>  {
>  	return NULL;
>  }
> +static inline unsigned long of_clk_get_flags(struct device_node *np)
> +{
> +	return NULL;
> +}
> +
>  #define of_clk_init(matches) \
>  	{ while (0); }
>  #endif /* CONFIG_OF */
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
