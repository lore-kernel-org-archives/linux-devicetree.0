From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] dmaengine: pxa_dma: fix the maximum requestor line
Date: Mon, 15 Feb 2016 22:05:24 +0530
Message-ID: <20160215163524.GI19598@localhost>
References: <1455225798-9510-1-git-send-email-robert.jarzmik@free.fr>
 <1455225798-9510-5-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455225798-9510-5-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 10:23:18PM +0100, Robert Jarzmik wrote:
> @@ -1399,13 +1405,17 @@ static int pxad_probe(struct platform_device *op)
>  		return PTR_ERR(pdev->base);
>  
>  	of_id = of_match_device(pxad_dt_ids, &op->dev);
> -	if (of_id)
> +	if (of_id) {
>  		of_property_read_u32(op->dev.of_node, "#dma-channels",
>  				     &dma_channels);
> -	else if (pdata && pdata->dma_channels)
> +		of_property_read_u32(op->dev.of_node, "#requestors",
> +				     &nb_requestors);

I think we should check the return value here. This might be err in case
when we have older DT on platform, but still should work with default in
that case

> +	} else if (pdata && pdata->dma_channels) {
>  		dma_channels = pdata->dma_channels;
> -	else
> +		nb_requestors = pdata->nb_requestors;
> +	} else {
>  		dma_channels = 32;	/* default 32 channel */
> +	}

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
