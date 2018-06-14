From: Vinod Koul <vinod.koul@linaro.org>
Subject: Re: [PATCH v2] dmaengine: rcar-dmac: don't use DMAC error interrupt
Date: Thu, 14 Jun 2018 14:04:25 +0530
Message-ID: <20180614083425.GA25852@vkoul-mobl>
References: <8736xrkrci.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8736xrkrci.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Dan Williams <dan.j.williams@intel.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran@ksquared.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 13-06-18, 08:49, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current rcar-dmac is using DMAC error interrupt which will handle all
> channel's error. But in this design, error handling itself will be
> issue if user want to use virtualization, multi OS, etc.
> This patch removes current DMAC error interrupt handling, and handle it
> on each channel interrupt handler.

So what happens when you are not in virtualization, multi OS..? Who
handles this interrupt?

> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> [Kuninori: updated patch to adjust DMACHCR/DMAOR]
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Nguyen Viet Dung <nv-dung@jinso.co.jp>
> ---
> v1 -> v2
> 
>  - add [Kuninori: xxx] line on git log
>  - don't remove DT property
>  - tidyup rcar_dmac_isr_channel()
> 
>  .../devicetree/bindings/dma/renesas,rcar-dmac.txt  |  1 +
>  drivers/dma/sh/rcar-dmac.c                         | 72 +++++++---------------
>  2 files changed, 23 insertions(+), 50 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> index b1ba6395..b8e1c13 100644
> --- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> @@ -38,6 +38,7 @@ Required Properties:
>  - interrupt-names: one entry for the error interrupt, named "error", plus one
>    entry per channel, named "ch%u", where %u is the channel number ranging from
>    zero to the number of channels minus one.
> +  # "error" interrupt will be ignored, so far
>  
>  - clock-names: "fck" for the functional clock
>  - clocks: a list of phandle + clock-specifier pairs, one for each entry
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2a2ccd9..279c930 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -431,7 +431,8 @@ static void rcar_dmac_chan_start_xfer(struct rcar_dmac_chan *chan)
>  		chcr |= RCAR_DMACHCR_DPM_DISABLED | RCAR_DMACHCR_IE;
>  	}
>  
> -	rcar_dmac_chan_write(chan, RCAR_DMACHCR, chcr | RCAR_DMACHCR_DE);
> +	rcar_dmac_chan_write(chan, RCAR_DMACHCR,
> +			     chcr | RCAR_DMACHCR_DE | RCAR_DMACHCR_CAIE);
>  }
>  
>  static int rcar_dmac_init(struct rcar_dmac *dmac)
> @@ -783,7 +784,8 @@ static void rcar_dmac_chan_halt(struct rcar_dmac_chan *chan)
>  	u32 chcr = rcar_dmac_chan_read(chan, RCAR_DMACHCR);
>  
>  	chcr &= ~(RCAR_DMACHCR_DSE | RCAR_DMACHCR_DSIE | RCAR_DMACHCR_IE |
> -		  RCAR_DMACHCR_TE | RCAR_DMACHCR_DE);
> +		  RCAR_DMACHCR_TE | RCAR_DMACHCR_DE |
> +		  RCAR_DMACHCR_CAE | RCAR_DMACHCR_CAIE);
>  	rcar_dmac_chan_write(chan, RCAR_DMACHCR, chcr);
>  	rcar_dmac_chcr_de_barrier(chan);
>  }
> @@ -812,12 +814,7 @@ static void rcar_dmac_chan_reinit(struct rcar_dmac_chan *chan)
>  	}
>  }
>  
> -static void rcar_dmac_stop(struct rcar_dmac *dmac)
> -{
> -	rcar_dmac_write(dmac, RCAR_DMAOR, 0);
> -}
> -
> -static void rcar_dmac_abort(struct rcar_dmac *dmac)
> +static void rcar_dmac_stop_all_chan(struct rcar_dmac *dmac)
>  {
>  	unsigned int i;
>  
> @@ -829,11 +826,10 @@ static void rcar_dmac_abort(struct rcar_dmac *dmac)
>  		spin_lock(&chan->lock);
>  		rcar_dmac_chan_halt(chan);
>  		spin_unlock(&chan->lock);
> -
> -		rcar_dmac_chan_reinit(chan);
>  	}
>  }
>  
> +
>  /* -----------------------------------------------------------------------------
>   * Descriptors preparation
>   */
> @@ -1522,11 +1518,18 @@ static irqreturn_t rcar_dmac_isr_channel(int irq, void *dev)
>  	u32 mask = RCAR_DMACHCR_DSE | RCAR_DMACHCR_TE;
>  	struct rcar_dmac_chan *chan = dev;
>  	irqreturn_t ret = IRQ_NONE;
> +	bool reinit = false;
>  	u32 chcr;
>  
>  	spin_lock(&chan->lock);
>  
>  	chcr = rcar_dmac_chan_read(chan, RCAR_DMACHCR);
> +	if (chcr & RCAR_DMACHCR_CAE) {
> +		rcar_dmac_chan_halt(chan);
> +		reinit = true;
> +		goto spin_lock_end;
> +	}
> +
>  	if (chcr & RCAR_DMACHCR_TE)
>  		mask |= RCAR_DMACHCR_DE;
>  	rcar_dmac_chan_write(chan, RCAR_DMACHCR, chcr & ~mask);
> @@ -1539,8 +1542,16 @@ static irqreturn_t rcar_dmac_isr_channel(int irq, void *dev)
>  	if (chcr & RCAR_DMACHCR_TE)
>  		ret |= rcar_dmac_isr_transfer_end(chan);
>  
> +spin_lock_end:
>  	spin_unlock(&chan->lock);
>  
> +	if (reinit) {
> +		dev_err(chan->chan.device->dev, "Channel Address Error\n");
> +
> +		rcar_dmac_chan_reinit(chan);
> +		ret = IRQ_HANDLED;
> +	}
> +
>  	return ret;
>  }
>  
> @@ -1597,24 +1608,6 @@ static irqreturn_t rcar_dmac_isr_channel_thread(int irq, void *dev)
>  	return IRQ_HANDLED;
>  }
>  
> -static irqreturn_t rcar_dmac_isr_error(int irq, void *data)
> -{
> -	struct rcar_dmac *dmac = data;
> -
> -	if (!(rcar_dmac_read(dmac, RCAR_DMAOR) & RCAR_DMAOR_AE))
> -		return IRQ_NONE;
> -
> -	/*
> -	 * An unrecoverable error occurred on an unknown channel. Halt the DMAC,
> -	 * abort transfers on all channels, and reinitialize the DMAC.
> -	 */
> -	rcar_dmac_stop(dmac);
> -	rcar_dmac_abort(dmac);
> -	rcar_dmac_init(dmac);
> -
> -	return IRQ_HANDLED;
> -}
> -
>  /* -----------------------------------------------------------------------------
>   * OF xlate and channel filter
>   */
> @@ -1784,8 +1777,6 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>  	struct rcar_dmac *dmac;
>  	struct resource *mem;
>  	unsigned int i;
> -	char *irqname;
> -	int irq;
>  	int ret;
>  
>  	dmac = devm_kzalloc(&pdev->dev, sizeof(*dmac), GFP_KERNEL);
> @@ -1824,17 +1815,6 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>  	if (IS_ERR(dmac->iomem))
>  		return PTR_ERR(dmac->iomem);
>  
> -	irq = platform_get_irq_byname(pdev, "error");
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "no error IRQ specified\n");
> -		return -ENODEV;
> -	}
> -
> -	irqname = devm_kasprintf(dmac->dev, GFP_KERNEL, "%s:error",
> -				 dev_name(dmac->dev));
> -	if (!irqname)
> -		return -ENOMEM;
> -
>  	/* Enable runtime PM and initialize the device. */
>  	pm_runtime_enable(&pdev->dev);
>  	ret = pm_runtime_get_sync(&pdev->dev);
> @@ -1885,14 +1865,6 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>  			goto error;
>  	}
>  
> -	ret = devm_request_irq(&pdev->dev, irq, rcar_dmac_isr_error, 0,
> -			       irqname, dmac);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to request IRQ %u (%d)\n",
> -			irq, ret);
> -		return ret;
> -	}
> -
>  	/* Register the DMAC as a DMA provider for DT. */
>  	ret = of_dma_controller_register(pdev->dev.of_node, rcar_dmac_of_xlate,
>  					 NULL);
> @@ -1932,7 +1904,7 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
>  {
>  	struct rcar_dmac *dmac = platform_get_drvdata(pdev);
>  
> -	rcar_dmac_stop(dmac);
> +	rcar_dmac_stop_all_chan(dmac);
>  }
>  
>  static const struct of_device_id rcar_dmac_of_ids[] = {
> -- 
> 1.9.1

-- 
~Vinod
