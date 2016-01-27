From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of: resolver: Add missing of_node_put
Date: Wed, 27 Jan 2016 16:05:31 +0000
Message-ID: <20160127160531.GB17123@leverpostej>
References: <20160127152017.GA16048@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160127152017.GA16048@amitoj-Inspiron-3542>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 27, 2016 at 08:50:17PM +0530, Amitoj Kaur Chawla wrote:
> for_each_child_of_node performs an of_node_get on each iteration, so
> to break out of the loop an of_node_put is required.
> 
> Found using Coccinelle. The semantic patch used for this is as follows:
> 
> // <smpl>
> @@
> expression e;
> local idexpression n;
> @@
> 
>  for_each_child_of_node(..., n) {
>    ... when != of_node_put(n)
>        when != e = n
> (
>    return n;
> |
> +  of_node_put(n);
> ?  return ...;
> )
>    ...
>  }
> // </smpl
> 
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/resolver.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> index 640eb4c..e2a0143 100644
> --- a/drivers/of/resolver.c
> +++ b/drivers/of/resolver.c
> @@ -40,8 +40,10 @@ static struct device_node *__of_find_node_by_full_name(struct device_node *node,
>  
>  	for_each_child_of_node(node, child) {
>  		found = __of_find_node_by_full_name(child, full_name);
> -		if (found != NULL)
> +		if (found != NULL) {
> +			of_node_put(child);
>  			return found;
> +		}
>  	}
>  
>  	return NULL;

I don't think this is quite right. When child == found, this change will
leave it decremented.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
