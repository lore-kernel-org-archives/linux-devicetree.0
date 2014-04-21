From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/7] of: introduce of_dma_get_range() helper
Date: Mon, 21 Apr 2014 10:29:11 -0500
Message-ID: <CAL_Jsq+9dZiAndnbC3fZDjZWU90K4BBR=ckuDxfy5_mBcRL=nA@mail.gmail.com>
References: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com>
	<1397917972-6293-3-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397917972-6293-3-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 19, 2014 at 9:32 AM, Santosh Shilimkar
<santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
> From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>
> The of_dma_get_range() allows to find "dma-range" property for
> the specified device and parse it.
>  dma-ranges format:
>    DMA addr (dma_addr)          : naddr cells
>    CPU addr (phys_addr_t)       : pna cells
>    size                         : nsize cells
>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/of/platform.c       |   85 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_platform.h |    8 ++++

This belongs in drivers/of/address.c and of_address.h.

>  2 files changed, 93 insertions(+)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 404d1da..2265a55 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -485,4 +485,89 @@ int of_platform_populate(struct device_node *root,
>         return rc;
>  }
>  EXPORT_SYMBOL_GPL(of_platform_populate);
> +
> +/**
> + * of_dma_get_range - Get DMA range info
> + * @np:                device node to get DMA range info
> + * @dma_addr:  pointer to store initial DMA address of DMA range
> + * @paddr:     pointer to store initial CPU address of DMA range
> + * @size:      pointer to store size of DMA range
> + *
> + * Look in bottom up direction for the first "dma-range" property

dma-ranges

> + * and parse it.
> + *  dma-ranges format:
> + *     DMA addr (dma_addr)     : naddr cells
> + *     CPU addr (phys_addr_t)  : pna cells
> + *     size                    : nsize cells
> + *
> + * It returns -ENODEV if "dma-ranges" property was not found
> + * for this device in DT.
> + */
> +extern int of_dma_get_range(struct device_node *np, dma_addr_t *dma_addr,

drop extern.

> +               phys_addr_t *paddr, phys_addr_t *size)
> +{
> +       struct device_node *node = np;
> +       const u32 *ranges = NULL;

__be32

> +       int len, naddr, nsize, pna;
> +       int ret = 0;
> +
> +       if (!node)
> +               return -EINVAL;
> +
> +       while (1) {
> +               naddr = of_n_addr_cells(node);
> +               nsize = of_n_size_cells(node);
> +               node = of_get_next_parent(node);
> +               if (!node)
> +                       break;
> +
> +               ranges = of_get_property(node, "dma-ranges", &len);
> +
> +               /* Ignore empty ranges, they imply no translation required */
> +               if (ranges && len > 0)
> +                       break;
> +
> +               /*
> +                * At least empty ranges has to be defined for parent node if
> +                * DMA is supported
> +                */
> +               if (!ranges)
> +                       break;

You need an of_node_put here if you are getting the next parent.

> +       }
> +
> +       if (!ranges) {
> +               pr_debug("%s: no dma-ranges found for node(%s)\n",
> +                        __func__, np->full_name);
> +               ret = -ENODEV;
> +               goto out;
> +       }
> +
> +       len /= sizeof(u32);
> +
> +       pna = of_n_addr_cells(node);
> +
> +       /* dma-ranges format:
> +        * DMA addr     : naddr cells
> +        * CPU addr     : pna cells
> +        * size         : nsize cells
> +        */
> +       *dma_addr = of_read_number(ranges, naddr);

You should set this after the following call succeeds.

> +       *paddr = of_translate_dma_address(np, ranges);

This is going to search for dma-ranges again, but you have already
done that. Is there a case that just reading the CPU addr will not
work? I suppose we could have more than one level of translation. It
also seems a bit abusive that the DMA address is the ranges property.
I don't really have a better suggestion though.

> +       if (*paddr == OF_BAD_ADDR) {

As I mentioned, this is potentially a size mismatch.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
