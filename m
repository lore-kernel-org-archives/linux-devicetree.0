From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] of/platform: Use platform_device interface
Date: Wed, 22 Apr 2015 11:25:02 -0500
Message-ID: <CAL_JsqKYkNyfY+4RPY=FD1=wBxc2EJXaSsJ8D+0T84JK_65E4Q@mail.gmail.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com> <1429719261-18024-5-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429719261-18024-5-git-send-email-ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 22, 2015 at 11:14 AM, Ricardo Ribalda Delgado
<ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> of_platform_device_create_pdata() was using of_device_add() to create
> the devices, but of_platform_device_destroy was using
> of_platform_device_destroy().
>
> of_device_add(), do not call insert_resource(), which initializes the
> parent field of the resource structure, needed by release_resource(),
> called by of_platform_device_destroy().
>
> This leads to a NULL pointer deference.
>
> This patch, replaces of_device_add() with platform_device_data().

This doesn't match the change.

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

Can't we now remove of_device_add?

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
