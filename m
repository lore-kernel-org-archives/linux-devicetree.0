From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] of/irq: add a dummy of_msi_configure if OF_IRQ=n
Date: Thu, 17 Sep 2015 14:32:17 -0500
Message-ID: <CAL_JsqJNNu8nHo0C=-1k9wc+=TX+Mji3MVBaWKsXrNam4J3S9g@mail.gmail.com>
References: <1441629437-23769-1-git-send-email-jogo@openwrt.org> <1441629437-23769-2-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441629437-23769-2-git-send-email-jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 7, 2015 at 7:37 AM, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> It is unconditionally called from of_platform_device_create_pdata, which
> does not depend on OF_IRQ, just OF_ADDRESS.
>
> Fixes: c706c239 ("of/platform: Assign MSI domain to platform device")
> Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> ---
>  include/linux/of_irq.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index d884929..7b81771 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -86,6 +86,10 @@ static inline void *of_irq_find_parent(struct device_node *child)
>  {
>         return NULL;
>  }
> +
> +static inline void of_msi_configure(struct device *dev, struct device_node *np)
> +{
> +}

Why do you add it here and then move it in patch #2? Just do this in 1 patch.

Rob

>  #endif /* !CONFIG_OF */
>
>  #endif /* __OF_IRQ_H */
> --
> 2.1.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
