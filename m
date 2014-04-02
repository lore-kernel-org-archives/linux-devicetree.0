From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Use NULL for pointers
Date: Wed, 02 Apr 2014 13:48:40 +0100
Message-ID: <20140402124840.CD418C40B6A@trevor.secretlab.ca>
References: <1396424821-1963-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396424821-1963-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2 Apr 2014 09:47:01 +0200, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Commit 4485681939b9 (of/fdt: Clean up casting in unflattening path)
> modified unflatten_dt_node() to take a void * for the mem parameter
> instead of an unsigned long. One of the call sites wasn't updated.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied, thanks, but removed new line split. Sometimes keeping the 80
column limit just isn't worth it.  :-)

g.

> ---
>  drivers/of/fdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index fa16a912a927..383c6e665d13 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -385,7 +385,8 @@ static void __unflatten_device_tree(struct boot_param_header *blob,
>  
>  	/* First pass, scan for size */
>  	start = ((void *)blob) + be32_to_cpu(blob->off_dt_struct);
> -	size = (unsigned long)unflatten_dt_node(blob, 0, &start, NULL, NULL, 0);
> +	size = (unsigned long)unflatten_dt_node(blob, NULL, &start, NULL, NULL,
> +						0);
>  	size = ALIGN(size, 4);
>  
>  	pr_debug("  size is %lx, allocating...\n", size);
> -- 
> 1.9.1
> 
> 
> -----------------------------------------------------------------------------------
> This email message is for the sole use of the intended recipient(s) and may contain
> confidential information.  Any unauthorized review, use, disclosure or distribution
> is prohibited.  If you are not the intended recipient, please contact the sender by
> reply email and destroy all copies of the original message.
> -----------------------------------------------------------------------------------

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
