From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/7] of: introduce of_dma_is_coherent() helper
Date: Thu, 1 May 2014 19:56:46 -0500
Message-ID: <CAL_JsqKmf-OCf_-J06ztHWS0iRaMHAVxV0bOFGnY4Ci3fPgLow@mail.gmail.com>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com>
	<1398353407-2345-4-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398353407-2345-4-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 24, 2014 at 10:30 AM, Santosh Shilimkar
<santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
> The of_dma_is_coherent() helper parses the given DT device
> node to see if the "dma-coherent" property is supported and
> returns true or false accordingly.
>
> If the arch is always coherent or always noncoherent, then the default
> DMA ops has to be specified accordingly.
>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/of/platform.c       |   23 +++++++++++++++++++++++
>  include/linux/of_platform.h |    6 ++++++

I thought I said this already, but this does not belong in these files
as the function does not deal with platform devices. Probably
address.c/of_address.h would be the best place.

Rob

>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 404d1da..48de98f 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -485,4 +485,27 @@ int of_platform_populate(struct device_node *root,
>         return rc;
>  }
>  EXPORT_SYMBOL_GPL(of_platform_populate);
> +
> +/**
> + * of_dma_is_coherent - Check if device is coherent
> + * @np:        device node
> + *
> + * It returns true if "dma-coherent" property was found
> + * for this device in DT.
> + */
> +bool of_dma_is_coherent(struct device_node *np)
> +{
> +       struct device_node *node = of_node_get(np);
> +
> +       while (node) {
> +               if (of_property_read_bool(node, "dma-coherent")) {
> +                       of_node_put(node);
> +                       return true;
> +               }
> +               node = of_get_next_parent(node);
> +       }
> +       of_node_put(node);
> +       return false;
> +}
> +EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>  #endif /* CONFIG_OF_ADDRESS */
> diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
> index 05cb4a9..b9a3cb2 100644
> --- a/include/linux/of_platform.h
> +++ b/include/linux/of_platform.h
> @@ -72,6 +72,7 @@ extern int of_platform_populate(struct device_node *root,
>                                 const struct of_device_id *matches,
>                                 const struct of_dev_auxdata *lookup,
>                                 struct device *parent);
> +extern bool of_dma_is_coherent(struct device_node *np);
>  #else
>  static inline int of_platform_populate(struct device_node *root,
>                                         const struct of_device_id *matches,
> @@ -80,6 +81,11 @@ static inline int of_platform_populate(struct device_node *root,
>  {
>         return -ENODEV;
>  }
> +
> +static inline bool of_dma_is_coherent(struct device_node *np)
> +{
> +       return false;
> +}
>  #endif
>
>  #endif /* _LINUX_OF_PLATFORM_H */
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
