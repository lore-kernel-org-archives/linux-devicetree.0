From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2 v2] of/platform: Use platform_device interface
Date: Tue, 21 Apr 2015 15:13:33 -0500
Message-ID: <CAL_Jsq+ux9aCNUNVH+Vwy_j9oeV0CLbruPN4arkuCBPxvgrzhw@mail.gmail.com>
References: <1429604702-14157-1-git-send-email-ricardo.ribalda@gmail.com> <1429604702-14157-2-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429604702-14157-2-git-send-email-ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 21, 2015 at 3:25 AM, Ricardo Ribalda Delgado
<ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> of_platform_device_create_pdata() was using of_device_add() to create
> the devices, but of_platform_device_destroy was using
> of_platform_device_destroy().
>
> of_device_add(), do not call insert_resource(), which initializes the
> parent field of the resource structure, needed by release_resource(),
> called by of_platform_device_destroy().

This is because some DTs have overlapping resources and doing this
would break things. If you look at the git history, this was fixed and
then reverted by Grant.

Rob

> This leads to a NULL pointer deference.
>
> This patch, replaces of_device_add() with platform_device_data().
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/platform.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index a01f57c..f011f57 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -183,8 +183,9 @@ static struct platform_device *of_platform_device_create_pdata(
>         dev->dev.bus = &platform_bus_type;
>         dev->dev.platform_data = platform_data;
>         of_dma_configure(&dev->dev, dev->dev.of_node);
> +       dev->name = dev_name(&dev->dev);
>
> -       if (of_device_add(dev) != 0) {
> +       if (platform_device_add(dev) != 0) {
>                 of_dma_deconfigure(&dev->dev);
>                 platform_device_put(dev);
>                 goto err_clear_flag;
> --
> 2.1.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
