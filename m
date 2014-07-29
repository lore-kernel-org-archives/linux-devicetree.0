From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: use IORESOURCE_REG resource type for non-translatable addresses in DT
Date: Tue, 29 Jul 2014 14:00:50 +0200
Message-ID: <3794875.CZFbAag5Sv@wuerfel>
References: <53D788A7.4020303@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D788A7.4020303-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 29 July 2014 14:42:31 Stanimir Varbanov wrote:
>         taddr = of_translate_address(dev, addrp);
> -       if (taddr == OF_BAD_ADDR)
> -               return -EINVAL;
> +       /*
> +        * if the address is non-translatable to cpu physical address
> +        * fallback to a IORESOURCE_REG resource.
> +        */
> +       if (taddr == OF_BAD_ADDR) {
> +               memset(r, 0, sizeof(*r));
> +               taddr = of_read_number(addrp, 1);
> +               if (taddr == OF_BAD_ADDR)
> +                       return -EINVAL;
> +               r->start = taddr;
> +               r->end = taddr + size - 1;
> +               r->flags = IORESOURCE_REG;
> +               r->name = name ? name : dev->full_name;
> +               return 0;
> +       }
> +

I don't think that everything returning OF_BAD_ADDR makes sense
to turn into IORESOURCE_REG. It could be an e.g. invalid DT
representation, a node with #size-cells=<0>, or it could be
something that gets translated one or more nodes up in the
tree before it reaches a bus without a ranges property.

Also, you should not rely on #address-cells being hardcoded
to <1> above.

How about modifying of_get_address() rather than
__of_address_to_resource() instead? You could introduce
a new of_bus entry for each bus you expect to return
an IORESOURCE_REG, or you could change of_bus_default_get_flags
to return IORESOURCE_REG if the parent node has no ranges property
and is not the root node.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
