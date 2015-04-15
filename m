From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] of: Add dummy of_irq_to_resource_table() for IRQ_OF=n
Date: Wed, 15 Apr 2015 07:54:29 -0500
Message-ID: <CAL_Jsq+q_u0=yZp44-x2JSBx_HK+dwhcSmh0HOweczDHiytEHQ@mail.gmail.com>
References: <1428245965-19618-1-git-send-email-geert@linux-m68k.org> <1428245965-19618-4-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428245965-19618-4-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 5, 2015 at 9:59 AM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> If CONFIG_IRQ_OF=n:
>
> drivers/built-in.o: In function `of_device_alloc':
> (.text+0x72bce): undefined reference to `of_irq_to_resource_table'
> make: *** [vmlinux] Error 1
>
> of_device_alloc() calls of_irq_to_resource_table() with nr_irqs = 0 due
> to of_irq_count() already being a dummy, so just add a dummy for
> of_irq_to_resource_table(), too.
>
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>

Applied. Thanks.

Rob

> ---
>  include/linux/of_irq.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index bfec136a6d1e60f8..d884929a77479782 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -37,8 +37,6 @@ extern int of_irq_parse_one(struct device_node *device, int index,
>  extern unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data);
>  extern int of_irq_to_resource(struct device_node *dev, int index,
>                               struct resource *r);
> -extern int of_irq_to_resource_table(struct device_node *dev,
> -               struct resource *res, int nr_irqs);
>
>  extern void of_irq_init(const struct of_device_id *matches);
>
> @@ -46,6 +44,8 @@ extern void of_irq_init(const struct of_device_id *matches);
>  extern int of_irq_count(struct device_node *dev);
>  extern int of_irq_get(struct device_node *dev, int index);
>  extern int of_irq_get_byname(struct device_node *dev, const char *name);
> +extern int of_irq_to_resource_table(struct device_node *dev,
> +               struct resource *res, int nr_irqs);
>  #else
>  static inline int of_irq_count(struct device_node *dev)
>  {
> @@ -59,6 +59,11 @@ static inline int of_irq_get_byname(struct device_node *dev, const char *name)
>  {
>         return 0;
>  }
> +static inline int of_irq_to_resource_table(struct device_node *dev,
> +                                          struct resource *res, int nr_irqs)
> +{
> +       return 0;
> +}
>  #endif
>
>  #if defined(CONFIG_OF)
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
