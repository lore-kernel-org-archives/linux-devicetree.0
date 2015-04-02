From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH_V4 2/3] dma: jz4780: add driver for the Ingenic JZ4780 DMA controller
Date: Thu, 02 Apr 2015 16:51:44 +0200
Message-ID: <2520994.aQ5VZIsnTb@wuerfel>
References: <1426695397-54906-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1426695397-54906-3-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426695397-54906-3-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 18 March 2015 16:16:36 Zubair Lutfullah Kakakhel wrote:

> +
> +static bool jz4780_dma_filter_fn(struct dma_chan *chan, void *param)
> +{
> +	struct jz4780_dma_chan *jzchan = to_jz4780_dma_chan(chan);
> +	struct jz4780_dma_dev *jzdma = jz4780_dma_chan_parent(jzchan);
> +	struct jz4780_dma_data *data = param;
> +
> +	if (data->channel > -1) {
> +		if (data->channel != jzchan->id)
> +			return false;
> +	} else if (jzdma->chan_reserved & BIT(jzchan->id)) {
> +		return false;
> +	}
> +
> +	jzchan->transfer_type = data->transfer_type;
> +
> +	return true;
> +}
> +
> +static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
> +	struct of_dma *ofdma)
> +{
> +	struct jz4780_dma_dev *jzdma = ofdma->of_dma_data;
> +	dma_cap_mask_t mask = jzdma->dma_device.cap_mask;
> +	struct jz4780_dma_data data;
> +
> +	if (dma_spec->args_count != 2)
> +		return NULL;
> +
> +	data.transfer_type = dma_spec->args[0];
> +	data.channel = dma_spec->args[1];
> +
> +	if (data.channel > -1) {
> +		if (data.channel >= JZ_DMA_NR_CHANNELS) {
> +			dev_err(jzdma->dma_device.dev,
> +				"device requested non-existent channel %u\n",
> +				data.channel);
> +			return NULL;
> +		}
> +
> +		/* Can only select a channel marked as reserved. */
> +		if (!(jzdma->chan_reserved & BIT(data.channel))) {
> +			dev_err(jzdma->dma_device.dev,
> +				"device requested unreserved channel %u\n",
> +				data.channel);
> +			return NULL;
> +		}
> +	}
> +
> +	return dma_request_channel(mask, jz4780_dma_filter_fn, &data);
> +}
> +

You should be able to avoid the use of the filter function by calling
dma_get_slave_channel. You already know which channel you want, so no
need to scan all channels of all controllers in the system.

> --- /dev/null
> +++ b/include/dt-bindings/dma/jz4780-dma.h
> @@ -0,0 +1,49 @@
> +#ifndef __DT_BINDINGS_DMA_JZ4780_DMA_H__
> +#define __DT_BINDINGS_DMA_JZ4780_DMA_H__
> +
> +/*
> + * Request type numbers for the JZ4780 DMA controller (written to the DRTn
> + * register for the channel).
> + */
> +#define JZ4780_DMA_I2S1_TX	0x4
> +#define JZ4780_DMA_I2S1_RX	0x5
> +#define JZ4780_DMA_I2S0_TX	0x6
> +#define JZ4780_DMA_I2S0_RX	0x7
> +#define JZ4780_DMA_AUTO		0x8
> +#define JZ4780_DMA_SADC_RX	0x9

This is evidently just a hardware number, so please don't introduce
a false dependency here, and remove that header file. Putting the numbers
into the dts file like you do for gpio or irq numbers makes it easier to
do updates and avoids dependencies between the platform and driver files.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
