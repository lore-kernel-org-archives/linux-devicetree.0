From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/4] base/platform: Continue on insert_resource() error
Date: Wed, 22 Apr 2015 11:44:57 -0500
Message-ID: <20150422164457.GI20701@google.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429719261-18024-4-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429719261-18024-4-git-send-email-ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 22, 2015 at 06:14:20PM +0200, Ricardo Ribalda Delgado wrote:
> insert_resource() can fail when the resource added  overlaps
> (partially or fully) with another.
> 
> Device tree and AMBA devices may contain resources that overlap, so they
> could not call platform_device_add (Revert "of: use platform_device_add"
> 02bbde7849e68e193cefaa1885fe0df0f03c9fcd )

Usual style for referencing a commit is "(see 02bbde7849e6 ('Revert "of:
use platform_device_add"'))".

> On the other hand, device trees are released using
> platform_device_unregister(). This function calls platform_device_del(),
> which calls release_resource(), that crashes when the resource has not
> been added with with insert_resource. This was not an issue when the
> device tree could not be modified online, but this is not the case
> anymore.
> 
> This patch let the flow continue when there is an insert error, after
> notifying the user with a dev_err(). r->parent is set to NULL, so the
> device_del knows that the resource was not added, and therefore it
> should not be released.

I think you meant platform_device_del()?  I don't think device_del() does
anything with resources.

> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/base/platform.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 6028681..8cce2a3 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -359,8 +359,7 @@ int platform_device_add(struct platform_device *pdev)
>  
>  		if (insert_resource(p, r)) {
>  			dev_err(&pdev->dev, "failed to claim resource %d\n", i);

Sounds like we should expect to see this message more in the future, after
you change of_platform_device_create_pdata() use platform_device_add().
You might want to use insert_resource_conflict() here so you can include
information about *why* we failed to claim the resource.  And it would be
nice to use %pR for both resources.

> -			ret = -EBUSY;
> -			goto failed;
> +			r->parent = NULL;
>  		}
>  	}
>  
> @@ -371,7 +370,6 @@ int platform_device_add(struct platform_device *pdev)
>  	if (ret == 0)
>  		return ret;
>  
> - failed:

Might be nice to keep a comment here as a clue that the rest of the
function is the failure path.

It's a minor style thing, but I would also remove the "err_out" label and
return "ret" directly above rather than branching to "err_out".

>  	if (pdev->id_auto) {
>  		ida_simple_remove(&platform_devid_ida, pdev->id);
>  		pdev->id = PLATFORM_DEVID_AUTO;
> @@ -381,7 +379,8 @@ int platform_device_add(struct platform_device *pdev)
>  		struct resource *r = &pdev->resource[i];
>  		unsigned long type = resource_type(r);
>  
> -		if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
> +		if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
> +				r->parent)
>  			release_resource(r);
>  	}
>  
> @@ -414,7 +413,8 @@ void platform_device_del(struct platform_device *pdev)
>  			struct resource *r = &pdev->resource[i];
>  			unsigned long type = resource_type(r);
>  
> -			if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
> +			if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
> +					r->parent)
>  				release_resource(r);
>  		}
>  	}
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
