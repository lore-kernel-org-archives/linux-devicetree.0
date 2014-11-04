From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Request and map make argument name constant
Date: Tue, 04 Nov 2014 16:00:48 +0000
Message-ID: <20141104160048.10D57C423D0@trevor.secretlab.ca>
References: <1413908845-11526-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413908845-11526-1-git-send-email-matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 21 Oct 2014 18:27:25 +0200
, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 wrote:
> This patch makes the name argument from of_io_request_and_map constant.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks.

g.

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
>   *		return PTR_ERR(base);
>   */
>  void __iomem *of_io_request_and_map(struct device_node *np, int index,
> -					char *name)
> +					const char *name)
>  {
>  	struct resource res;
>  	void __iomem *mem;
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 8cb14eb..d88e81b 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -106,7 +106,7 @@ extern int of_address_to_resource(struct device_node *dev, int index,
>  				  struct resource *r);
>  void __iomem *of_iomap(struct device_node *node, int index);
>  void __iomem *of_io_request_and_map(struct device_node *device,
> -					int index, char *name);
> +					int index, const char *name);
>  #else
>  
>  #include <linux/io.h>
> @@ -123,7 +123,7 @@ static inline void __iomem *of_iomap(struct device_node *device, int index)
>  }
>  
>  static inline void __iomem *of_io_request_and_map(struct device_node *device,
> -					int index, char *name)
> +					int index, const char *name)
>  {
>  	return IOMEM_ERR_PTR(-EINVAL);
>  }
> -- 
> 1.9.1
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
