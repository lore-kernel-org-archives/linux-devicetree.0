From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of/resolver: Simplify to be32_add_cpu()
Date: Fri, 13 Oct 2017 15:52:59 -0700
Message-ID: <59E143CB.1010802@gmail.com>
References: <20171013073558.11518-1-stephen.boyd@linaro.org>
 <20171013073558.11518-2-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171013073558.11518-2-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/13/17 00:35, Stephen Boyd wrote:
> This is the same as be32_add_cpu(), so simplify the code and
> remove the now unused local variable.
> 
> Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/resolver.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> index 99309cb7d372..2d58253bf2f7 100644
> --- a/drivers/of/resolver.c
> +++ b/drivers/of/resolver.c
> @@ -165,7 +165,6 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
>  	struct property *prop_fix, *prop;
>  	int err, i, count;
>  	unsigned int off;
> -	phandle phandle;
>  
>  	if (!local_fixups)
>  		return 0;
> @@ -195,9 +194,7 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
>  			if ((off + 4) > prop->length)
>  				return -EINVAL;
>  
> -			phandle = be32_to_cpu(*(__be32 *)(prop->value + off));
> -			phandle += phandle_delta;
> -			*(__be32 *)(prop->value + off) = cpu_to_be32(phandle);
> +			be32_add_cpu(prop->value + off, phandle_delta);
>  		}
>  	}
>  
> 

Reviewed-by: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
