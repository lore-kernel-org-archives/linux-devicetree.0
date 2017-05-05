From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] of: fix sparse warnings in of_find_next_cache_node
Date: Thu, 4 May 2017 22:15:26 -0700
Message-ID: <590C0A6E.1080902@gmail.com>
References: <20170504180035.12834-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170504180035.12834-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/04/17 11:00, Rob Herring wrote:
> sparse gives a warning that 'handle' is not a __be32:
> 
> ../drivers/of/base.c:2261:61: warning: incorrect type in argument 1 (different base types)
> ../drivers/of/base.c:2261:61:    expected restricted __be32 const [usertype] *p
> ../drivers/of/base.c:2261:61:    got unsigned int const [usertype] *[assigned] handle
> 
> We could just change the type, but the code can be improved by using
> of_parse_phandle instead of open coding it with of_get_property and
> of_find_node_by_phandle.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/base.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d7c4629a3a2d..016f9d77d64d 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2250,15 +2250,14 @@ EXPORT_SYMBOL_GPL(of_console_check);
>   */
>  struct device_node *of_find_next_cache_node(const struct device_node *np)
>  {
> -	struct device_node *child;
> -	const phandle *handle;
> +	struct device_node *child, *cache_node;
>  
> -	handle = of_get_property(np, "l2-cache", NULL);
> -	if (!handle)
> -		handle = of_get_property(np, "next-level-cache", NULL);
> +	cache_node = of_parse_phandle(np, "l2-cache", 0);
> +	if (!cache_node)
> +		cache_node = of_parse_phandle(np, "next-level-cache", 0);
>  
> -	if (handle)
> -		return of_find_node_by_phandle(be32_to_cpup(handle));
> +	if (cache_node)
> +		return cache_node;
>  
>  	/* OF on pmac has nodes instead of properties named "l2-cache"
>  	 * beneath CPU nodes.
> 

Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
