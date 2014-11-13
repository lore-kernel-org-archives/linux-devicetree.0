From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] dmaengine: Add driver for IMG MDC
Date: Thu, 13 Nov 2014 23:13:10 +0100
Message-ID: <11336807.gWpZoH7Aih@wuerfel>
References: <1415912288-26926-1-git-send-email-abrestic@chromium.org> <1415912288-26926-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415912288-26926-3-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 13 November 2014 12:58:08 Andrew Bresticker wrote:
> +
> +static bool mdc_filter_fn(struct dma_chan *chan, void *fn_param)
> +{
> +       struct mdc_filter_data *data = fn_param;
> +       struct mdc_chan *mchan;
> +
> +       if (chan->device->dev->driver == &mdc_dma_driver.driver) {
> +               mchan = to_mdc_chan(chan);
> +               if (!(data->mask & BIT(mchan->chan_nr)))
> +                       return false;
> +               mchan->periph = data->periph;
> +               mchan->thread = data->thread;
> +               return true;
> +       }
> +       return false;
> +}
> +
> +static struct dma_chan *mdc_of_xlate(struct of_phandle_args *dma_spec,
> +                                    struct of_dma *ofdma)
> +{
> +       struct mdc_dma *mdma = ofdma->of_dma_data;
> +       struct mdc_filter_data data;
> +
> +       if (dma_spec->args_count != 3)
> +               return NULL;
> +
> +       data.periph = dma_spec->args[0];
> +       data.mask = dma_spec->args[1];
> +       data.thread = dma_spec->args[2];
> +
> +       return dma_request_channel(mdma->dma_dev.cap_mask, mdc_filter_fn,
> +                                  &data);
> +}

The filter function is broken if you ever have multiple instances
of the device. Better avoid calling dma_request_channel and scan
the channels that the device knows about.

> +
> +#define PISTACHIO_CR_PERIPH_DMA_ROUTE(ch)      (0x120 + 0x4 * ((ch) / 4))
> +#define PISTACHIO_CR_PERIPH_DMA_ROUTE_SHIFT(ch) (8 * ((ch) % 4))
> +#define PISTACHIO_CR_PERIPH_DMA_ROUTE_MASK     0x3f
> +
> +static void pistachio_mdc_enable_chan(struct mdc_chan *mchan)
> +{
> +       struct mdc_dma *mdma = mchan->mdma;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&mdma->lock, flags);
> +       regmap_update_bits(mdma->periph_regs,
> +                          PISTACHIO_CR_PERIPH_DMA_ROUTE(mchan->chan_nr),
> +                          PISTACHIO_CR_PERIPH_DMA_ROUTE_MASK <<
> +                          PISTACHIO_CR_PERIPH_DMA_ROUTE_SHIFT(mchan->chan_nr),
> +                          mchan->periph <<
> +                          PISTACHIO_CR_PERIPH_DMA_ROUTE_SHIFT(mchan->chan_nr));
> +       spin_unlock_irqrestore(&mdma->lock, flags);
> +}
> +
> +static void pistachio_mdc_disable_chan(struct mdc_chan *mchan)
> +{
> +       struct mdc_dma *mdma = mchan->mdma;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&mdma->lock, flags);
> +       regmap_update_bits(mdma->periph_regs,
> +                          PISTACHIO_CR_PERIPH_DMA_ROUTE(mchan->chan_nr),
> +                          PISTACHIO_CR_PERIPH_DMA_ROUTE_MASK <<
> +                          PISTACHIO_CR_PERIPH_DMA_ROUTE_SHIFT(mchan->chan_nr),
> +                          0);
> +       spin_unlock_irqrestore(&mdma->lock, flags);
> +}

Regmap has its own locking, no need to add another level.

	Arnd
