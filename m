From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Fri, 12 Jun 2015 16:00:53 +0200
Message-ID: <CAPybu_2cugVWwPwEHJktBzY8-a2PPEAVrWe5-A3sdN-zRkK1rA@mail.gmail.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org> <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433686811-12303-3-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello

Tested-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


Some runtime warnings, but no oops

[   46.348911] Trying to free nonexistent resource
<00000000b0050000-00000000b005ffff>
[   46.351979] Trying to free nonexistent resource
<00000000b9000000-00000000b900ffff>
[   46.351993] Trying to free nonexistent resource
<00000000b0000000-00000000b000ffff>
[   46.352003] Trying to free nonexistent resource
<00000000b9000000-00000000b900ffff>
[   46.352009] Trying to free nonexistent resource
<00000000b0000000-00000000b000ffff>


Thanks!

On Sun, Jun 7, 2015 at 4:20 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> The unregister path of platform_device is broken. On registration, it
> will register all resources with either a parent already set, or
> type==IORESOURCE_{IO,MEM}. However, on unregister it will release
> everything with type==IORESOURCE_{IO,MEM}, but ignore the others. There
> are also cases where resources don't get registered in the first place,
> like with devices created by of_platform_populate()*.
>
> Fix the unregister path to be symmetrical with the register path by
> checking the parent pointer instead of the type field to decide which
> resources to unregister. This is safe because the upshot of the
> registration path algorithm is that registered resources have a parent
> pointer, and non-registered resources do not.
>
> * It can be argued that of_platform_populate() should be registering
>   it's resources, and they argument has some merit. However, there are
>   quite a few platforms that end up broken if we try to do that due to
>   overlapping resources in the device tree. Until that is fixed, we need
>   to solve the immediate problem.
>
> Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/base/platform.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index ebf034b97278..7403de94832c 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -375,9 +375,7 @@ int platform_device_add(struct platform_device *pdev)
>
>         while (--i >= 0) {
>                 struct resource *r = &pdev->resource[i];
> -               unsigned long type = resource_type(r);
> -
> -               if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
> +               if (r->parent)
>                         release_resource(r);
>         }
>
> @@ -408,9 +406,7 @@ void platform_device_del(struct platform_device *pdev)
>
>                 for (i = 0; i < pdev->num_resources; i++) {
>                         struct resource *r = &pdev->resource[i];
> -                       unsigned long type = resource_type(r);
> -
> -                       if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
> +                       if (r->parent)
>                                 release_resource(r);
>                 }
>         }
> --
> 2.1.4
>



-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
