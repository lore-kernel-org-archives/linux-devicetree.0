From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v5 2/2] DW DMAC: add multi-block property to device tree
Date: Thu, 24 Nov 2016 17:52:08 +0200
Message-ID: <1480002728.20074.15.camel@linux.intel.com>
References: <1479999878-19120-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1479999878-19120-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479999878-19120-3-git-send-email-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shiraz.linux.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christian.ruppert-Yycd8EPnGM5BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-11-24 at 18:04 +0300, Eugeniy Paltsev wrote:
> Several versions of DW DMAC have multi block transfers hardware
> support. Hardware support of multi block transfers is disabled
> by default if we use DT to configure DMAC and software emulation
> of multi block transfers used instead.
> Add multi-block property, so it is possible to enable hardware
> multi block transfers (if present) via DT.
> 
> Switch from per device is_nollp variable to multi_block array
> to be able enable/disable multi block transfers separately per
> channel.

Thanks for an update. Basically I'm fine with this one.

So, we still have question about autoconfiguration in SPEAr SoCs, and
your ARC SoC but it's a different story. I would expect once you will
clarify it.

Another one is minor listed below, otherwise

Acked-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -102,7 +102,7 @@ dw_dma_parse_dt(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct dw_dma_platform_data *pdata;
> -	u32 tmp, arr[DW_DMA_MAX_NR_MASTERS];
> +	u32 tmp, arr[DW_DMA_MAX_NR_MASTERS],
> chan[DW_DMA_MAX_NR_CHANNELS];

chan here will confuse people...

> @@ -152,6 +154,11 @@ dw_dma_parse_dt(struct platform_device *pdev)
>  			pdata->data_width[tmp] = BIT(arr[tmp] &
> 0x07);
>  	}
>  
> +	if (!of_property_read_u32_array(np, "multi-block", chan,
> nr_channels)) {
> +		for (tmp = 0; tmp < nr_channels; tmp++)
> +			pdata->multi_block[tmp] = chan[tmp];

...mb (as short of multi-block) would suit better.

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
