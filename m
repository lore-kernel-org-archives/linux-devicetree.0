From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/6] of/irq: Export of_irq_find_parent again
Date: Thu, 3 Dec 2015 09:14:12 -0600
Message-ID: <CAL_JsqK55+3FQk-bzELZ3zNKRrrNYE+Khqf9wj_GpG2V8mWroA@mail.gmail.com>
References: <1448987062-31225-1-git-send-email-carlo@caione.org> <1448987062-31225-2-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448987062-31225-2-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Daniel Drake <drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 1, 2015 at 10:24 AM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:
> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>
> of_irq_find_parent was made static since it had no users outside of
> of_irq.c. Export it again since we are going to use it again.
>
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/of/irq.c       | 3 ++-
>  include/linux/of_irq.h | 6 ++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 902b89b..4fa916d 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -53,7 +53,7 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
>   * Returns a pointer to the interrupt parent node, or NULL if the interrupt
>   * parent could not be determined.
>   */
> -static struct device_node *of_irq_find_parent(struct device_node *child)
> +struct device_node *of_irq_find_parent(struct device_node *child)
>  {
>         struct device_node *p;
>         const __be32 *parp;
> @@ -77,6 +77,7 @@ static struct device_node *of_irq_find_parent(struct device_node *child)
>
>         return p;
>  }
> +EXPORT_SYMBOL_GPL(of_irq_find_parent);
>
>  /**
>   * of_irq_parse_raw - Low level interrupt tree parsing
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index 039f2ee..6f879c6 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -94,6 +94,7 @@ static inline void of_msi_configure(struct device *dev, struct device_node *np)
>   */
>  extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
>  u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in);
> +extern struct device_node *of_irq_find_parent(struct device_node *child);

The whole reason this got removed started with there was a problem
with building for OF=y and OF_IRQ=n, so you need to move the
declarations to the OF_IRQ if/else section.

Given multiple people needing this, I'm going to apply this for 4.4 if
we can get this sorted out.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
