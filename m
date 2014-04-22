From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Clean up of_update_property
Date: Tue, 22 Apr 2014 15:39:46 +0100
Message-ID: <20140422143946.197B0C40793@trevor.secretlab.ca>
References: <1397576297-4785-1-git-send-email-linux@roeck-us.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397576297-4785-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 15 Apr 2014 08:38:17 -0700, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> After searching for the old property, bail out with -ENODEV
> if it was not found.
> 
> It is unnecessary to check if oldprop is NULL before removing
> its binary file; the check was already done before.
> 
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
>  drivers/of/base.c |   10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index f72d19b..6d4ee22 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1828,17 +1828,13 @@ int of_update_property(struct device_node *np, struct property *newprop)
>  		next = &(*next)->next;
>  	}
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> -	if (rc)
> -		return rc;
> +	if (!found)
> +		return -ENODEV;
>  
>  	/* Update the sysfs attribute */
> -	if (oldprop)
> -		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
> +	sysfs_remove_bin_file(&np->kobj, &oldprop->attr);

Hahaha. The funny think is that I had to put this change right back in
when picking up Xiubo's patch. The logic has become slightly different
with his fix though, so it doesn't make this patch incorrect.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
