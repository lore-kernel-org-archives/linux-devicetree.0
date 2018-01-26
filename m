From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 2/3] gpiolib-of: Support 'reserved-gpio-ranges'
 property
Date: Fri, 26 Jan 2018 11:35:45 +0200
Message-ID: <1516959345.7000.1281.camel@linux.intel.com>
References: <20180126011400.2191-1-sboyd@codeaurora.org>
         <20180126011400.2191-3-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180126011400.2191-3-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-01-25 at 17:13 -0800, Stephen Boyd wrote:
> Some qcom platforms make some GPIOs or pins unavailable for use
> by non-secure operating systems, and thus reading or writing the
> registers for those pins will cause access control issues.  Add
> support for a DT property to describe the set of GPIOs that are
> available for use so that higher level OSes are able to know what
> pins to avoid reading/writing.
> 
> For now, we plumb this into the gpiochip irq APIs so that
> GPIO/pinctrl drivers can use the gpiochip_irqchip_irq_valid() to
> test validity of GPIOs.


> +static void of_gpiochip_init_irq_valid_mask(struct gpio_chip *chip)
> +{

> +	int len, i;
> +	u32 start, count;
> +	struct device_node *np = chip->of_node;

Perhaps reversed tree style? (In the following function as well)

> +	len = of_property_count_u32_elems(np,  "reserved-gpio-
> ranges");
> 

> +	for (i = 0; i < len; i += 2) {
> +		of_property_read_u32_index(np, "reserved-gpio-
> ranges",
> +					   i, &start);
> +		of_property_read_u32_index(np, "reserved-gpio-
> ranges",
> +					   i + 1, &count);

of_find_property() + of_prop_next_u32() ?

> +	if (size > 0 && size % 2 == 0)
> +		gpiochip->irq.need_valid_mask = true;

 ffs(size) >= 2 ?


-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
