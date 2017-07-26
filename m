From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dmaengine: Add STM32 DMAMUX driver
Date: Wed, 26 Jul 2017 10:59:31 +0530
Message-ID: <20170726052930.GF3053@localhost>
References: <1499343623-5964-1-git-send-email-pierre-yves.mordret@st.com>
 <1499343623-5964-3-git-send-email-pierre-yves.mordret@st.com>
 <20170722065133.GT3053@localhost>
 <2b916330-9b65-f4d5-817f-79b66cc236b3@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2b916330-9b65-f4d5-817f-79b66cc236b3-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice GASNIER <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 24, 2017 at 01:55:10PM +0000, Pierre Yves MORDRET wrote:

> >> +
> >> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> +	if (!res)
> >> +		return -ENODEV;
> >> +
> >> +	iomem = devm_ioremap_resource(&pdev->dev, res);
> >> +	if (!iomem)
> >> +		return -ENOMEM;
> >> +
> >> +	spin_lock_init(&stm32_dmamux->lock);
> >> +
> >> +	stm32_dmamux->clk = devm_clk_get(&pdev->dev, NULL);
> >> +	if (IS_ERR(stm32_dmamux->clk)) {
> >> +		dev_info(&pdev->dev, "Missing controller clock\n");
> > 
> > Can you check for EPROBE_DEFER and print only for if that is not the error
> > otherwise we end up sapmming with defered probe issues
> > 
> 
> This is what you meant ?
> 	if (IS_ERR(stm32_dmamux->clk) != EPROBE_DEFER) {
> 		dev_info(&pdev->dev, "Missing controller clock\n");
> 		return PTR_ERR(stm32_dmamux->clk);
> 	}
> 
> OR
> 
> 	if (IS_ERR(stm32_dmamux->clk)) {
> 		if (IS_ERR(stm32_dmamux->clk) != EPROBE_DEFER)
> 			dev_info(&pdev->dev, "Missing controller clock\n");
> 		return PTR_ERR(stm32_dmamux->clk);
> 	}

This one please

> 
> >> +
> >> +#ifndef __DMA_STM32_DMAMUX_H
> >> +#define __DMA_STM32_DMAMUX_H
> >> +
> >> +#if defined(CONFIG_STM32_DMAMUX)
> >> +int stm32_dmamux_set_config(struct device *dev, void *route_data, u32 chan_id);
> > 
> > Why do we need a custom API in this case?
> > 
> 
> This API is called by DMA when a slave is requested by client. DMA can work
> without DMAMUX this API has been put in place to configure DMAMUX whether client
> is requesting a DMAMUX Channel instead of a DMA one.

You mean the dmaengine driver right?

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
