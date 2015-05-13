From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v4 4/4] base/platform: Remove code duplication
Date: Wed, 13 May 2015 09:03:31 -0500
Message-ID: <CAL_JsqLOBvTgaLx7Ev3y5UQQdKGqMwnYSptDKvBQmmN0EnQL5Q@mail.gmail.com>
References: <1429797494-29242-1-git-send-email-ricardo.ribalda@gmail.com> <1429797494-29242-5-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429797494-29242-5-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jakub Sitnicki <jsitnicki@gmail.com>, Vivek Goyal <vgoyal@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Jiang Liu <jiang.liu@linux.intel.com>, Mike Travis <travis@sgi.com>, Thierry Reding <treding@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 23, 2015 at 8:58 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Failure path of platform_device_add was almost the same as
> platform_device_del. Refactor same code in a function.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Clean-ups should come first in the series. Otherwise:

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  drivers/base/platform.c | 60 +++++++++++++++++++++----------------------------
>  1 file changed, 25 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 2e7e904..152d84d 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -298,6 +298,25 @@ int platform_device_add_data(struct platform_device *pdev, const void *data,
>  }
>  EXPORT_SYMBOL_GPL(platform_device_add_data);
>
> +static void platform_device_cleanout(struct platform_device *pdev, int n_res)
> +{
> +       int i;
> +
> +       if (pdev->id_auto) {
> +               ida_simple_remove(&platform_devid_ida, pdev->id);
> +               pdev->id = PLATFORM_DEVID_AUTO;
> +       }
> +
> +       for (i = 0; i < n_res; i++) {
> +               struct resource *r = &pdev->resource[i];
> +               unsigned long type = resource_type(r);
> +
> +               if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
> +                               r->parent)
> +                       release_resource(r);
> +       }
> +}
> +
>  /**
>   * platform_device_add - add a platform device to device hierarchy
>   * @pdev: platform device we're adding
> @@ -371,23 +390,8 @@ int platform_device_add(struct platform_device *pdev)
>                  dev_name(&pdev->dev), dev_name(pdev->dev.parent));
>
>         ret = device_add(&pdev->dev);
> -       if (ret == 0)
> -               return ret;
> -
> -       /* Failure path */
> -       if (pdev->id_auto) {
> -               ida_simple_remove(&platform_devid_ida, pdev->id);
> -               pdev->id = PLATFORM_DEVID_AUTO;
> -       }
> -
> -       while (--i >= 0) {
> -               struct resource *r = &pdev->resource[i];
> -               unsigned long type = resource_type(r);
> -
> -               if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
> -                               r->parent)
> -                       release_resource(r);
> -       }
> +       if (ret)
> +               platform_device_cleanout(pdev, i);
>
>         return ret;
>  }
> @@ -403,25 +407,11 @@ EXPORT_SYMBOL_GPL(platform_device_add);
>   */
>  void platform_device_del(struct platform_device *pdev)
>  {
> -       int i;
> -
> -       if (pdev) {
> -               device_del(&pdev->dev);
> -
> -               if (pdev->id_auto) {
> -                       ida_simple_remove(&platform_devid_ida, pdev->id);
> -                       pdev->id = PLATFORM_DEVID_AUTO;
> -               }
> -
> -               for (i = 0; i < pdev->num_resources; i++) {
> -                       struct resource *r = &pdev->resource[i];
> -                       unsigned long type = resource_type(r);
> +       if (!pdev)
> +               return;
>
> -                       if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
> -                                       r->parent)
> -                               release_resource(r);
> -               }
> -       }
> +       device_del(&pdev->dev);
> +       platform_device_cleanout(pdev, pdev->num_resources);
>  }
>  EXPORT_SYMBOL_GPL(platform_device_del);
>
> --
> 2.1.4
>
