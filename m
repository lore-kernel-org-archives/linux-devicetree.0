From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dmaengine: Add STM32 DMAMUX driver
Date: Sat, 22 Jul 2017 12:21:33 +0530
Message-ID: <20170722065133.GT3053@localhost>
References: <1499343623-5964-1-git-send-email-pierre-yves.mordret@st.com>
 <1499343623-5964-3-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499343623-5964-3-git-send-email-pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice GASNIER <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 06, 2017 at 02:20:20PM +0200, Pierre-Yves MORDRET wrote:
> +static int stm32_dmamux_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *dma_node;
> +	struct stm32_dmamux_data *stm32_dmamux;
> +	struct resource *res;
> +	void __iomem *iomem;
> +	int i, ret;
> +
> +	if (!node)
> +		return -ENODEV;
> +
> +	stm32_dmamux = devm_kzalloc(&pdev->dev, sizeof(*stm32_dmamux),
> +				    GFP_KERNEL);
> +	if (!stm32_dmamux)
> +		return -ENOMEM;
> +
> +	dma_node = of_parse_phandle(node, "dma-masters", 0);
> +	if (!dma_node) {
> +		dev_err(&pdev->dev, "Can't get DMA master node\n");
> +		return -ENODEV;
> +	}
> +
> +	if (device_property_read_u32(&pdev->dev, "dma-channels",
> +				     &stm32_dmamux->dmamux_channels))
> +		stm32_dmamux->dmamux_channels = STM32_DMAMUX_MAX_CHANNELS;
> +
> +	if (device_property_read_u32(&pdev->dev, "dma-requests",
> +				     &stm32_dmamux->dmamux_requests))
> +		stm32_dmamux->dmamux_requests = STM32_DMAMUX_MAX_REQUESTS;

I think defaults should be warned here too

> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	iomem = devm_ioremap_resource(&pdev->dev, res);
> +	if (!iomem)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&stm32_dmamux->lock);
> +
> +	stm32_dmamux->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(stm32_dmamux->clk)) {
> +		dev_info(&pdev->dev, "Missing controller clock\n");

Can you check for EPROBE_DEFER and print only for if that is not the error
otherwise we end up sapmming with defered probe issues

> +
> +#ifndef __DMA_STM32_DMAMUX_H
> +#define __DMA_STM32_DMAMUX_H
> +
> +#if defined(CONFIG_STM32_DMAMUX)
> +int stm32_dmamux_set_config(struct device *dev, void *route_data, u32 chan_id);

Why do we need a custom API in this case?

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
