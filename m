From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] of/fdt: skip unflattening of disabled nodes
Date: Tue, 3 Oct 2017 14:46:57 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710031444060.5407@knanqh.ubzr>
References: <20171003161815.25999-1-robh@kernel.org> <20171003161815.25999-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171003161815.25999-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 3 Oct 2017, Rob Herring wrote:

> For static DT usecases, we don't need the disabled nodes and can skip
> unflattening. This saves a significant amount of RAM in memory constrained
> cases. In one example on STM32F469, the RAM usage goes from 118K to 26K.
> 
> There are a few cases in the kernel that modify the status property
> dynamically. These all are changes from enabled to disabled, depend on
> OF_DYNAMIC or are not FDT based (PDT based).
> 
> Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Tested-by: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
> For more background, see this presentation from Nico:
> 
> https://connect.linaro.org/resource/sfo17/sfo17-100/

Oh my ... this is horrible ...

/me hides in shame

> 
>  drivers/of/fdt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index f8c39705418b..efe91c6856a0 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -396,6 +396,10 @@ static int unflatten_dt_nodes(const void *blob,
>  		if (WARN_ON_ONCE(depth >= FDT_MAX_DEPTH))
>  			continue;
>  
> +		if (!IS_ENABLED(CONFIG_OF_DYNAMIC) &&
> +		    !of_fdt_device_is_available(blob, offset))
> +			continue;
> +
>  		if (!populate_node(blob, offset, &mem, nps[depth],
>  				   &nps[depth+1], dryrun))
>  			return mem - base;
> -- 
> 2.11.0
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
