From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 07/11] dmaengine: sun6i: Retrieve channel count/max
 request from devicetree
Date: Mon, 23 Oct 2017 11:45:09 +0530
Message-ID: <20171023061508.GD936@localhost>
References: <20170928014928.2272-1-stefan.bruens@rwth-aachen.de>
 <2200ff4f-67f6-45c7-a2c8-99d066af3391@rwthex-w2-a.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2200ff4f-67f6-45c7-a2c8-99d066af3391-cBaz+nnMw1+1MzRH+ruthl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 01:06:34AM +0200, Stefan Brüns wrote:
> To avoid introduction of a new compatible for each small SoC/DMA controller
> variation, move the definition of the channel count to the devicetree.
> 
> The number of vchans is no longer explicit, but limited by the highest
> port/DMA request number. The result is a slight overallocation for SoCs
> with a sparse port mapping.

Applied, thanks. But ...


>  static int sun6i_dma_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct sun6i_dma_dev *sdc;
>  	struct resource *res;
>  	int ret, i;
> @@ -1228,6 +1233,26 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>  	sdc->num_vchans = sdc->cfg->nr_max_vchans;
>  	sdc->max_request = sdc->cfg->nr_max_requests;
>  
> +	ret = of_property_read_u32(np, "dma-channels", &sdc->num_pchans);
> +	if (ret && !sdc->num_pchans) {
> +		dev_err(&pdev->dev, "Can't get dma-channels.\n");
> +		return ret;
> +	}

 ... we should probably use device_read_xxx calls instead of of_xxx

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
