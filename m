From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] of: Fix issue where code would fall through to error
 case.
Date: Thu, 1 Dec 2016 23:11:31 -0800
Message-ID: <58411EA3.8040000@gmail.com>
References: <1480659025-18836-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480659025-18836-1-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/01/16 22:10, Moritz Fischer wrote:
> From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> No longer fall through into the error case that prints out
> an error if no error (err = 0) occurred.
> 
> Fixes d9181b20a83(of: Add back an error message, restructured)
> Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Reviewed-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
> ---
> Hi Frank, Rob
> 
> sorry for the noise before.

I'm sure I created much more noise than you did.  Thanks for
persisting.

I am confirming that this still applies for v4:

   Reviewed-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

-Frank

> 
> Thanks,
> Moritz
> ---
>  drivers/of/resolver.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> index 783bd09..8bf12e9 100644
> --- a/drivers/of/resolver.c
> +++ b/drivers/of/resolver.c
> @@ -298,12 +298,12 @@ int of_resolve_phandles(struct device_node *overlay)
>  	if (!overlay) {
>  		pr_err("null overlay\n");
>  		err = -EINVAL;
> -		goto err_out;
> +		goto out;
>  	}
>  	if (!of_node_check_flag(overlay, OF_DETACHED)) {
>  		pr_err("overlay not detached\n");
>  		err = -EINVAL;
> -		goto err_out;
> +		goto out;
>  	}
>  
>  	phandle_delta = live_tree_max_phandle() + 1;
> @@ -315,7 +315,7 @@ int of_resolve_phandles(struct device_node *overlay)
>  
>  	err = adjust_local_phandle_references(local_fixups, overlay, phandle_delta);
>  	if (err)
> -		goto err_out;
> +		goto out;
>  
>  	overlay_fixups = NULL;
>  
> @@ -333,7 +333,7 @@ int of_resolve_phandles(struct device_node *overlay)
>  	if (!tree_symbols) {
>  		pr_err("no symbols in root of device tree.\n");
>  		err = -EINVAL;
> -		goto err_out;
> +		goto out;
>  	}
>  
>  	for_each_property_of_node(overlay_fixups, prop) {
> @@ -345,12 +345,12 @@ int of_resolve_phandles(struct device_node *overlay)
>  		err = of_property_read_string(tree_symbols,
>  				prop->name, &refpath);
>  		if (err)
> -			goto err_out;
> +			goto out;
>  
>  		refnode = of_find_node_by_path(refpath);
>  		if (!refnode) {
>  			err = -ENOENT;
> -			goto err_out;
> +			goto out;
>  		}
>  
>  		phandle = refnode->phandle;
> @@ -361,9 +361,9 @@ int of_resolve_phandles(struct device_node *overlay)
>  			break;
>  	}
>  
> -err_out:
> -	pr_err("overlay phandle fixup failed: %d\n", err);
>  out:
> +	if (err)
> +		pr_err("overlay phandle fixup failed: %d\n", err);
>  	of_node_put(tree_symbols);
>  
>  	return err;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
