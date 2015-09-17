From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of/irq: fix guards of of_irq_find_parent and of_msi_configure
Date: Thu, 17 Sep 2015 14:48:34 -0500
Message-ID: <CAL_JsqJWiUnAcLDtTmy4rq+fWJ_bfWOXV0k5Fe1tDn1b15HCXA@mail.gmail.com>
References: <1441629437-23769-1-git-send-email-jogo@openwrt.org> <1441629437-23769-3-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441629437-23769-3-git-send-email-jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 7, 2015 at 7:37 AM, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> Only irq_of_parse_and_map is implemented differently on SPARC, so only
> that one should be protected by the CONFIG_OF guard.

of_irq_find_parent is only used by of_irq.c, so just make it static.

Rob

>
> Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> ---
>  include/linux/of_irq.h | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index 7b81771..d6a6d2e 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -46,6 +46,8 @@ extern int of_irq_get(struct device_node *dev, int index);
>  extern int of_irq_get_byname(struct device_node *dev, const char *name);
>  extern int of_irq_to_resource_table(struct device_node *dev,
>                 struct resource *res, int nr_irqs);
> +extern struct device_node *of_irq_find_parent(struct device_node *child);
> +extern void of_msi_configure(struct device *dev, struct device_node *np);
>  #else
>  static inline int of_irq_count(struct device_node *dev)
>  {
> @@ -64,6 +66,13 @@ static inline int of_irq_to_resource_table(struct device_node *dev,
>  {
>         return 0;
>  }
> +static inline void *of_irq_find_parent(struct device_node *child)
> +{
> +       return NULL;
> +}
> +static inline void of_msi_configure(struct device *dev, struct device_node *np)
> +{
> +}
>  #endif
>
>  #if defined(CONFIG_OF)
> @@ -73,7 +82,6 @@ static inline int of_irq_to_resource_table(struct device_node *dev,
>   * so declare it here regardless of the CONFIG_OF_IRQ setting.
>   */
>  extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
> -extern struct device_node *of_irq_find_parent(struct device_node *child);
>
>  #else /* !CONFIG_OF */
>  static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
> @@ -81,15 +89,6 @@ static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
>  {
>         return 0;
>  }
> -
> -static inline void *of_irq_find_parent(struct device_node *child)
> -{
> -       return NULL;
> -}
> -
> -static inline void of_msi_configure(struct device *dev, struct device_node *np)
> -{
> -}
>  #endif /* !CONFIG_OF */
>
>  #endif /* __OF_IRQ_H */
> --
> 2.1.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
