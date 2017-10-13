From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] of/resolver: Replace kmalloc + memcpy with kmemdup()
Date: Fri, 13 Oct 2017 15:33:07 -0700
Message-ID: <59E13F23.4030201@gmail.com>
References: <20171013073558.11518-1-stephen.boyd@linaro.org>
 <20171013073558.11518-3-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171013073558.11518-3-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/13/17 00:35, Stephen Boyd wrote:
> Save one line.
> 
> Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/resolver.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> index 2d58253bf2f7..bd21a66f6930 100644
> --- a/drivers/of/resolver.c
> +++ b/drivers/of/resolver.c
> @@ -84,10 +84,9 @@ static int update_usages_of_a_phandle_reference(struct device_node *overlay,
>  	int offset, len;
>  	int err = 0;
>  
> -	value = kmalloc(prop_fixup->length, GFP_KERNEL);
> +	value = kmemdup(prop_fixup->value, prop_fixup->length, GFP_KERNEL);
>  	if (!value)
>  		return -ENOMEM;
> -	memcpy(value, prop_fixup->value, prop_fixup->length);
>  
>  	/* prop_fixup contains a list of tuples of path:property_name:offset */
>  	end = value + prop_fixup->length;
> 

Reviewed-by: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
