From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/irq: introduce of_has_named_irqs helper
Date: Fri, 24 Jul 2015 12:35:16 -0700
Message-ID: <55B29374.7040201@gmail.com>
References: <20150724182655.GA22007@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150724182655.GA22007@dtor-ws>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 24/07/15 11:26, Dmitry Torokhov wrote:
> Sometimes drivers might wish to transition from index-based to named
> interrupt descriptions. To aid in decision-making when parsing device
> tree data let's provide a helper that will indicate the scheme that is
> being used.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

[snip]

> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 3cf7a01..e02c43e 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -384,6 +384,19 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
>  EXPORT_SYMBOL_GPL(of_irq_to_resource);
>  
>  /**
> + * of_has_named_irq - Check if given node contains named interrupts
> + * @dev: pointer to device tree node
> + *
> + * Returns %true if node contains non-empty "interrupt-names" property.
> + */
> +bool of_has_named_irqs(struct device_node *dev)
> +{
> +	struct property *prop = of_find_property(dev, "interrupt-names", NULL);
> +
> +	return prop && prop->value;
> +}

Missing EXPORT_SYMBOL_GPL() here?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
