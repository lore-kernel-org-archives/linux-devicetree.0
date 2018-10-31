From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of/platform: Support dynamic device tree on AMBA bus
Date: Wed, 31 Oct 2018 13:31:50 -0500
Message-ID: <CAL_Jsq+V8HmmHV98Wsq-Kec2NXgY4ih+KKEVd-1nZbCoLUPe7Q@mail.gmail.com>
References: <1540485597-12240-1-git-send-email-jaewon02.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540485597-12240-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jaewon02.kim@gmail.com
Cc: Frank Rowand <frowand.list@gmail.com>, jaewon02.kim@samsung.com, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 11:40 AM Jaewon Kim <jaewon02.kim@gmail.com> wrote:
>
> This patch supports dynamic device-tree for AMBA device.
> The AMBA device must be registered on the AMBA bus, not the platform bus.

I'm not convinced we should even support this. There's a limited
number of AMBA devices. They would almost certainly be on-chip and
static. I suppose in theory you could have them in an FPGA, but
generally the FPGA vendors have their own IP blocks and don't use ARM
Primecell IP. So what is the usecase?

>
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>

Your author and S-o-b emails should match.

> ---
>  drivers/of/platform.c | 93 ++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 73 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 04ad312..b9ac105 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -286,6 +286,22 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>         of_node_clear_flag(node, OF_POPULATED);
>         return NULL;
>  }
> +
> +/**
> + * of_find_amba_device_by_node - Find the amba_device associated with a node
> + * @np: Pointer to device tree node
> + *
> + * Returns amba_device pointer, or NULL if not found
> + */
> +struct amba_device *of_find_amba_device_by_node(struct device_node *np)
> +{
> +       struct device *dev;
> +
> +       dev = bus_find_device(&amba_bustype, NULL, np, of_dev_node_match);
> +       return dev ? to_amba_device(dev) : NULL;
> +}
> +EXPORT_SYMBOL(of_find_amba_device_by_node);

I would prefer we add (or change the platform device version) an
of_find_device_by_node which can be extended to different bus types.

> +
>  #else /* CONFIG_ARM_AMBA */
>  static struct amba_device *of_amba_device_create(struct device_node *node,
>                                                  const char *bus_id,
> @@ -294,6 +310,12 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>  {
>         return NULL;
>  }
> +
> +struct amba_device *of_find_amba_device_by_node(struct device_node *np)
> +{
> +       return NULL;
> +}
> +EXPORT_SYMBOL(of_find_amba_device_by_node);
>  #endif /* CONFIG_ARM_AMBA */
>
>  /**
> @@ -665,6 +687,7 @@ static int of_platform_notify(struct notifier_block *nb,
>  {
>         struct of_reconfig_data *rd = arg;
>         struct platform_device *pdev_parent, *pdev;
> +       struct amba_device *adev_p, *adev;
>         bool children_left;
>
>         switch (of_reconfig_get_state_change(action, rd)) {
> @@ -677,17 +700,34 @@ static int of_platform_notify(struct notifier_block *nb,
>                 if (of_node_check_flag(rd->dn, OF_POPULATED))
>                         return NOTIFY_OK;
>
> -               /* pdev_parent may be NULL when no bus platform device */
> -               pdev_parent = of_find_device_by_node(rd->dn->parent);
> -               pdev = of_platform_device_create(rd->dn, NULL,
> -                               pdev_parent ? &pdev_parent->dev : NULL);
> -               of_dev_put(pdev_parent);
> -
> -               if (pdev == NULL) {
> -                       pr_err("%s: failed to create for '%pOF'\n",
> -                                       __func__, rd->dn);
> -                       /* of_platform_device_create tosses the error code */
> -                       return notifier_from_errno(-EINVAL);
> +               if (of_device_is_compatible(rd->dn, "arm,primecell")) {
> +                       /* adev_p may be NULL when no bus amba device */
> +                       adev_p = of_find_amba_device_by_node(rd->dn->parent);

An amba_device can't ever have a parent that's an amba_device. The
parent of an amba_device is typically a platform_device for a
'simple-bus'.

> +                       adev = of_amba_device_create(rd->dn, NULL, NULL,
> +                                       adev_p ? &adev_p->dev : NULL);
> +
> +                       if (adev_p)
> +                               put_device(&adev_p->dev);
> +
> +                       if (adev == NULL) {
> +                               pr_err("%s: failed to create for '%s'\n",
> +                                               __func__, rd->dn->full_name);
> +                               /* of_amba_device_create tosses the error */
> +                               return notifier_from_errno(-EINVAL);
> +                       }
> +               } else {
> +                       /* pdev_parent may be NULL when no bus platform device*/
> +                       pdev_parent = of_find_device_by_node(rd->dn->parent);
> +                       pdev = of_platform_device_create(rd->dn, NULL,
> +                                       pdev_parent ? &pdev_parent->dev : NULL);
> +                       of_dev_put(pdev_parent);
> +
> +                       if (pdev == NULL) {
> +                               pr_err("%s: failed to create for '%pOF'\n",
> +                                               __func__, rd->dn);
> +                               /* of_platform_device_create tosses the error */
> +                               return notifier_from_errno(-EINVAL);
> +                       }

This all pretty much duplicates what of_platform_bus_create() does and
we should use it here rather than have another copy. Plus what about
handling of any child devices (in the platform device case).

>                 }
>                 break;
>
> @@ -698,15 +738,28 @@ static int of_platform_notify(struct notifier_block *nb,
>                         return NOTIFY_OK;
>
>                 /* find our device by node */
> -               pdev = of_find_device_by_node(rd->dn);
> -               if (pdev == NULL)
> -                       return NOTIFY_OK;       /* no? not meant for us */
> -
> -               /* unregister takes one ref away */
> -               of_platform_device_destroy(&pdev->dev, &children_left);
> -
> -               /* and put the reference of the find */
> -               of_dev_put(pdev);
> +               if (of_device_is_compatible(rd->dn, "arm,primecell")) {
> +                       adev = of_find_amba_device_by_node(rd->dn);

With the above suggested function returning a struct device for the
node, you can get rid of the if {} else {}.

> +                       if (adev == NULL)
> +                               return NOTIFY_OK; /* no? not meant for us */
> +
> +                       /* unregister takes one ref away */
> +                       of_platform_device_destroy(&adev->dev, &children_left);
> +
> +                       /* and put the reference of the find */
> +                       if (adev)
> +                               put_device(&adev->dev);
> +               } else {
> +                       pdev = of_find_device_by_node(rd->dn);
> +                       if (pdev == NULL)
> +                               return NOTIFY_OK; /* no? not meant for us */
> +
> +                       /* unregister takes one ref away */
> +                       of_platform_device_destroy(&pdev->dev, &children_left);
> +
> +                       /* and put the reference of the find */
> +                       of_dev_put(pdev);
> +               }
>                 break;
>         }
>
> --
> 2.7.4
>
