From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND][PATCH 1/4] of: platform: populate /firmware/ node from
 of_platform_default_populate_init()
Date: Mon, 16 Oct 2017 15:44:33 -0700
Message-ID: <59E53651.5070704@gmail.com>
References: <1506595562-10592-1-git-send-email-sudeep.holla@arm.com>
 <1506595562-10592-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506595562-10592-2-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+ me

On 09/28/17 03:45, Sudeep Holla wrote:
> Since "/firmware" does not have its own "compatible" property as it's
> just collection of nodes representing firmware interface, it's sub-nodes
> are not populated during system initialization.
> 
> Currently different firmware drivers search the /firmware/ node and
> populate the sub-node devices selectively. Instead we can populate
> the /firmware/ node during init to avoid more drivers continuing to
> populate the devices selectively.
> 
> To generalize the solution this patch populates the /firmware/ node
> explicitly from of_platform_default_populate_init().
> 
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/of/platform.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index ac15d0e3d27d..3a213a6aee89 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -515,6 +515,10 @@ static int __init of_platform_default_populate_init(void)
>  			of_platform_device_create(node, NULL, NULL);
>  	}
>  
> +	node = of_find_node_by_path("/firmware");
> +	if (node)
> +		of_platform_populate(node, NULL, NULL, NULL);
> +
>  	/* Populate everything else. */
>  	of_platform_default_populate(NULL, NULL, NULL);
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
