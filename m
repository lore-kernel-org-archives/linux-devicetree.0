From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v4 2/2] dma: Add Xilinx zynqmp dma engine driver support
Date: Thu, 20 Aug 2015 11:43:12 +0530
Message-ID: <20150820061312.GA13546@localhost>
References: <1438831173-8761-1-git-send-email-punnaia@xilinx.com>
 <1438831173-8761-2-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438831173-8761-2-git-send-email-punnaia@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kalluripunnaiahchoudary@gmail.com, kpc528@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 06, 2015 at 08:49:33AM +0530, Punnaiah Choudary Kalluri wrote:

> +	list_for_each_entry_safe(desc, next, &chan->done_list, node) {
> +		dma_async_tx_callback callback;
> +		void *callback_param;
> +
> +		list_del(&desc->node);
> +
> +		callback = desc->async_tx.callback;
> +		callback_param = desc->async_tx.callback_param;
> +		if (callback) {
> +			if (in_interrupt())
> +				spin_unlock_bh(&chan->lock);
> +			else
> +				spin_unlock(&chan->lock);

This looks bad!
Why would callback be called from different context. It should only be
invoked from your tasklet

> +static int zynqmp_dma_device_terminate_all(struct dma_chan *dchan)
> +{
> +	struct zynqmp_dma_chan *chan = to_chan(dchan);
> +
> +	spin_lock_bh(&chan->lock);
> +	zynqmp_dma_reset(chan);
> +	spin_unlock_bh(&chan->lock);

No descriptor cleanup

> +static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
> +{
> +	if (!chan)
> +		return;
> +
> +	devm_free_irq(chan->zdev->dev, chan->irq, chan);
> +	tasklet_kill(&chan->tasklet);
> +	list_del(&chan->common.device_node);

not deregistering with dmaengine?

> +	zdev->chan = chan;
> +	tasklet_init(&chan->tasklet, zynqmp_dma_do_tasklet, (ulong)chan);
> +	spin_lock_init(&chan->lock);
> +	INIT_LIST_HEAD(&chan->active_list);
> +	INIT_LIST_HEAD(&chan->pending_list);
> +	INIT_LIST_HEAD(&chan->done_list);
> +	INIT_LIST_HEAD(&chan->free_list);

You can simmplify this by using vchan framework!

> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_DESCRIPTION("Xilinx ZynqMP DMA driver");
> +MODULE_LICENSE("GPL");
No alias, how did it get loaded?

-- 
~Vinod
