From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: constify drv arg of of_driver_match_device stub
Date: Tue, 28 Jul 2015 10:56:39 -0500
Message-ID: <CAL_JsqJjMd189_CLoYUSdyt+VZPk0uYb9uysZxsgwpMAP0HkMg@mail.gmail.com>
References: <1435734643-20204-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435734643-20204-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 1, 2015 at 2:10 AM, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> With this change the stub has the same signature as the actual function,
> preventing this compiler warning when building without CONFIG_OF:
>
>    drivers/base/property.c: In function 'fwnode_driver_match_device':
>>> drivers/base/property.c:608:38: warning: passing argument 2 of 'of_driver_match_device' discards 'const' qualifier from pointer target type
>       return of_driver_match_device(dev, drv);
>                                          ^
>    In file included from drivers/base/property.c:18:0:
>    include/linux/of_device.h:61:19: note: expected 'struct device_driver *' but argument is of type 'const struct device_driver *'
>     static inline int of_driver_match_device(struct device *dev,
>                       ^
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

Applied. Thanks.

Rob

> ---
>  include/linux/of_device.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/of_device.h b/include/linux/of_device.h
> index 4c50854..cc7dd687 100644
> --- a/include/linux/of_device.h
> +++ b/include/linux/of_device.h
> @@ -59,7 +59,7 @@ void of_dma_configure(struct device *dev, struct device_node *np);
>  #else /* CONFIG_OF */
>
>  static inline int of_driver_match_device(struct device *dev,
> -                                        struct device_driver *drv)
> +                                        const struct device_driver *drv)
>  {
>         return 0;
>  }
> --
> 2.4.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
