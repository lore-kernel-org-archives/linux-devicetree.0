From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Request and map make argument name constant
Date: Fri, 31 Oct 2014 17:21:26 +0100
Message-ID: <CABuKBeJNqTvf=t7tN4CWN4RLKvqQihxC9Ysk3OD6Ow6+2A+Q1w@mail.gmail.com>
References: <1413908845-11526-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413908845-11526-1-git-send-email-matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

2014-10-21 18:27 GMT+02:00 Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> This patch makes the name argument from of_io_request_and_map constant.

Any comments on this patch?

Thanks,
Matthias

>
> Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/address.c       | 2 +-
>  include/linux/of_address.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index afdb782..e02828f 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -871,7 +871,7 @@ EXPORT_SYMBOL(of_iomap);
>   *             return PTR_ERR(base);
>   */
>  void __iomem *of_io_request_and_map(struct device_node *np, int index,
> -                                       char *name)
> +                                       const char *name)
>  {
>         struct resource res;
>         void __iomem *mem;
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 8cb14eb..d88e81b 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -106,7 +106,7 @@ extern int of_address_to_resource(struct device_node *dev, int index,
>                                   struct resource *r);
>  void __iomem *of_iomap(struct device_node *node, int index);
>  void __iomem *of_io_request_and_map(struct device_node *device,
> -                                       int index, char *name);
> +                                       int index, const char *name);
>  #else
>
>  #include <linux/io.h>
> @@ -123,7 +123,7 @@ static inline void __iomem *of_iomap(struct device_node *device, int index)
>  }
>
>  static inline void __iomem *of_io_request_and_map(struct device_node *device,
> -                                       int index, char *name)
> +                                       int index, const char *name)
>  {
>         return IOMEM_ERR_PTR(-EINVAL);
>  }
> --
> 1.9.1
>



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
