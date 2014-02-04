From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 2/2] of: fix of_update_property()
Date: Tue, 04 Feb 2014 17:24:36 +0000
Message-ID: <20140204172436.7EC3FC4050F@trevor.secretlab.ca>
References: <1390370260-11273-1-git-send-email-Li.Xiubo@freescale.com> < 1390370260-11273-2-git-send-email-Li.Xiubo@freescale.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390370260-11273-2-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 22 Jan 2014 13:57:40 +0800, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> The of_update_property() is intented to update a property in a node
> and if the property does not exist, will add it.
> 
> The second search of the property is possibly won't be found, that
> maybe removed by other thread just before the second search begain.
> 
> Using the __of_find_property() and __of_add_property() instead and
> move them into lock operations.
> 
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>

Applied, thanks

g.

> ---
>  drivers/of/base.c | 36 ++++++++++++++----------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index b86b77a..458072d 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1573,7 +1573,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
>  {
>  	struct property **next, *oldprop;
>  	unsigned long flags;
> -	int rc, found = 0;
> +	int rc = 0;
>  
>  	rc = of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, newprop);
>  	if (rc)
> @@ -1582,36 +1582,28 @@ int of_update_property(struct device_node *np, struct property *newprop)
>  	if (!newprop->name)
>  		return -EINVAL;
>  
> -	oldprop = of_find_property(np, newprop->name, NULL);
> -	if (!oldprop)
> -		return of_add_property(np, newprop);
> -
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
> -	next = &np->properties;
> -	while (*next) {
> -		if (*next == oldprop) {
> -			/* found the node */
> -			newprop->next = oldprop->next;
> -			*next = newprop;
> -			oldprop->next = np->deadprops;
> -			np->deadprops = oldprop;
> -			found = 1;
> -			break;
> -		}
> -		next = &(*next)->next;
> +	oldprop = __of_find_property(np, newprop->name, NULL);
> +	if (!oldprop) {
> +		/* add the node */
> +		rc = __of_add_property(np, newprop);
> +	} else {
> +		/* replace the node */
> +		next = &oldprop;
> +		newprop->next = oldprop->next;
> +		*next = newprop;
> +		oldprop->next = np->deadprops;
> +		np->deadprops = oldprop;
>  	}
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
> -	if (!found)
> -		return -ENODEV;
> -
>  #ifdef CONFIG_PROC_DEVICETREE
>  	/* try to add to proc as well if it was initialized */
> -	if (np->pde)
> +	if (!rc && np->pde)
>  		proc_device_tree_update_prop(np->pde, newprop, oldprop);
>  #endif /* CONFIG_PROC_DEVICETREE */
>  
> -	return 0;
> +	return rc;
>  }
>  
>  #if defined(CONFIG_OF_DYNAMIC)
> -- 
> 1.8.4
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
