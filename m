From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/fdt: fix allocation size for device node path
Date: Wed, 15 Apr 2015 13:15:15 +0100
Message-ID: <20150415121515.8E1FAC40A0B@trevor.secretlab.ca>
References: <1428986165-6250-1-git-send-email-jcliang@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428986165-6250-1-git-send-email-jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 14 Apr 2015 12:36:05 +0800
, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 wrote:
> The allocation size of device node path is off by one which drops the
> '\0' terminator.
> 
> Signed-off-by: Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This looks like something that should be backported to stable. Do you agree?

g.

> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 3a896c9..98a9e6e 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -172,7 +172,7 @@ static void * unflatten_dt_node(void *blob,
>  	if (!pathp)
>  		return mem;
>  
> -	allocl = l++;
> +	allocl = ++l;
>  
>  	/* version 0x10 has a more compact unit name here instead of the full
>  	 * path. we accumulate the full path size using "fpsize", we'll rebuild
> -- 
> 2.1.2
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
