From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] of/platform: Mark all device tree resources as SHARED
Date: Fri, 5 Jun 2015 11:45:22 -0500
Message-ID: <CAL_JsqLOqpP4E5mG5t5RvaTs96jLC=umY2cUQEhyZiWJNOt1nQ@mail.gmail.com>
References: <1433501478-15164-1-git-send-email-ricardo.ribalda@gmail.com> <1433501478-15164-2-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433501478-15164-2-git-send-email-ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Cliff Wickman <cpw-sJ/iWh9BUns@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 5, 2015 at 5:51 AM, Ricardo Ribalda Delgado
<ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Some device tree platform do not define their resources properly. i.e.
> overlapping or repeated resources.
>
> This patch mark all device tree resources as shareable.
>
> In the future this should only be set for the platforms that have
> problems.

I don't think we want to do this globally. This should be very rare
and we want to discourage any new cases.

Rob

>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/platform.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index ddf8e42c9367..89cb502f8812 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -136,6 +136,8 @@ struct platform_device *of_device_alloc(struct device_node *np,
>                 if (of_irq_to_resource_table(np, res, num_irq) != num_irq)
>                         pr_debug("not all legacy IRQ resources mapped for %s\n",
>                                  np->name);
> +               for (i = 0; i < num_reg + num_irq; i++, res++)
> +                       dev->resource[i].flags |= IORESOURCE_SHARED;
>         }
>
>         dev->dev.of_node = of_node_get(np);
> --
> 2.1.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
