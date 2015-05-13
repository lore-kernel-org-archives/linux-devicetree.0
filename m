From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/4] base/platform: Continue on insert_resource() error
Date: Wed, 13 May 2015 09:11:32 -0500
Message-ID: <CAL_JsqJ63yajAgFtfrehZWaOQFt0_nwGfh-U501needaBhTMqA@mail.gmail.com>
References: <1429797494-29242-1-git-send-email-ricardo.ribalda@gmail.com> <1429797494-29242-3-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429797494-29242-3-git-send-email-ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 23, 2015 at 8:58 AM, Ricardo Ribalda Delgado
<ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> insert_resource() can fail when the resource added  overlaps
> (partially or fully) with another.
>
> Device tree and AMBA devices may contain resources that overlap, so they
> could not call platform_device_add (see 02bbde7849e6 ('Revert "of:
> use platform_device_add"'))"
>
> On the other hand, device trees are released using
> platform_device_unregister(). This function calls platform_device_del(),
> which calls release_resource(), that crashes when the resource has not
> been added with with insert_resource. This was not an issue when the
> device tree could not be modified online, but this is not the case
> anymore.
>
> This patch let the flow continue when there is an insert error, after
> notifying the user with a dev_err(). r->parent is set to NULL, so
> platform_device_del() knows that the resource was not added, and
> therefore it should not be released.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  drivers/base/platform.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 6028681..2e7e904 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -332,7 +332,7 @@ int platform_device_add(struct platform_device *pdev)
>                  */
>                 ret = ida_simple_get(&platform_devid_ida, 0, 0, GFP_KERNEL);
>                 if (ret < 0)
> -                       goto err_out;
> +                       return ret;
>                 pdev->id = ret;
>                 pdev->id_auto = true;
>                 dev_set_name(&pdev->dev, "%s.%d.auto", pdev->name, pdev->id);
> @@ -340,7 +340,7 @@ int platform_device_add(struct platform_device *pdev)
>         }
>
>         for (i = 0; i < pdev->num_resources; i++) {
> -               struct resource *p, *r = &pdev->resource[i];
> +               struct resource *conflict, *p, *r = &pdev->resource[i];
>                 unsigned long type = resource_type(r);
>
>                 if (r->name == NULL)
> @@ -357,11 +357,14 @@ int platform_device_add(struct platform_device *pdev)
>                                 p = &ioport_resource;
>                 }
>
> -               if (insert_resource(p, r)) {
> -                       dev_err(&pdev->dev, "failed to claim resource %d\n", i);
> -                       ret = -EBUSY;
> -                       goto failed;
> -               }
> +               conflict = insert_resource_conflict(p, r);
> +               if (!conflict)
> +                       continue;
> +
> +               dev_err(&pdev->dev,
> +                       "ignoring resource %pR (conflicts with %s %pR)\n",
> +                       r, conflict->name, conflict);
> +               p->parent = NULL;
>         }
>
>         pr_debug("Registering platform device '%s'. Parent at %s\n",
> @@ -371,7 +374,7 @@ int platform_device_add(struct platform_device *pdev)
>         if (ret == 0)
>                 return ret;
>
> - failed:
> +       /* Failure path */
>         if (pdev->id_auto) {
>                 ida_simple_remove(&platform_devid_ida, pdev->id);
>                 pdev->id = PLATFORM_DEVID_AUTO;
> @@ -381,11 +384,11 @@ int platform_device_add(struct platform_device *pdev)
>                 struct resource *r = &pdev->resource[i];
>                 unsigned long type = resource_type(r);
>
> -               if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
> +               if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
> +                               r->parent)
>                         release_resource(r);
>         }
>
> - err_out:
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(platform_device_add);
> @@ -414,7 +417,8 @@ void platform_device_del(struct platform_device *pdev)
>                         struct resource *r = &pdev->resource[i];
>                         unsigned long type = resource_type(r);
>
> -                       if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
> +                       if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
> +                                       r->parent)
>                                 release_resource(r);
>                 }
>         }
> --
> 2.1.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
