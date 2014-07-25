From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] dmaengine: add a driver for AMBA AXI NBPF DMAC
 IP cores
Date: Fri, 25 Jul 2014 19:46:21 +0530
Message-ID: <20140725141621.GT8181@intel.com>
References: <Pine.LNX.4.64.1407191239400.3062@axis700.grange>
 <Pine.LNX.4.64.1407191243360.3062@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1407191243360.3062-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 19, 2014 at 12:48:51PM +0200, Guennadi Liakhovetski wrote:
> This patch adds a driver for NBPF DMAC IP cores from Renesas, designed for
> the AMBA AXI bus.
> 

> +struct nbpf_desc {
> +	struct dma_async_tx_descriptor async_tx;
> +	bool user_wait;
sounds odd?

> +static int nbpf_chan_probe(struct nbpf_device *nbpf, int n)
> +{
> +	struct dma_device *dma_dev = &nbpf->dma_dev;
> +	struct nbpf_channel *chan = nbpf->chan + n;
> +	int ret;
> +
> +	chan->nbpf = nbpf;
> +	chan->base = nbpf->base + NBPF_REG_CHAN_OFFSET + NBPF_REG_CHAN_SIZE * n;
> +	INIT_LIST_HEAD(&chan->desc_page);
> +	spin_lock_init(&chan->lock);
> +	chan->dma_chan.device = dma_dev;
> +	dma_cookie_init(&chan->dma_chan);
> +	nbpf_chan_prepare_default(chan);
> +
> +	dev_dbg(dma_dev->dev, "%s(): channel %d: -> %p\n", __func__, n, chan->base);
> +
> +	snprintf(chan->name, sizeof(chan->name), "nbpf %d", n);
> +
> +	ret = devm_request_threaded_irq(dma_dev->dev, chan->irq,
> +			nbpf_chan_irq, nbpf_chan_irqt, IRQF_SHARED,
> +			chan->name, chan);
devm_request_irq and friends arent apt here. You are in .remove and get an
irq, what prevents that race? You need to run free_irq and synchronize_irq()
to ensure everything is proper before freeing up.

Also why threaded_irq when dmaengine API mandates you to use tasklet? The
callback is supposed to be invoked from a tasklet.

Thanks
-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
