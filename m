Return-Path: <vkoul@kernel.org>
Date: Tue, 29 May 2018 15:49:54 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [v5 2/6] dmaengine: fsl-qdma: Add qDMA controller driver for
 Layerscape SoCs
Message-ID: <20180529101954.GJ5666@vkoul-mobl>
References: <20180525111920.24498-1-wen.he_1@nxp.com>
 <20180525111920.24498-2-wen.he_1@nxp.com>
 <20180529070724.GE5666@vkoul-mobl>
 <AM6PR0402MB3382D42C76332B98D53D001AE26D0@AM6PR0402MB3382.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR0402MB3382D42C76332B98D53D001AE26D0@AM6PR0402MB3382.eurprd04.prod.outlook.com>
To: Wen He <wen.he_1@nxp.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Jiaheng Fan <jiaheng.fan@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 29-05-18, 09:59, Wen He wrote:
> > On 25-05-18, 19:19, Wen He wrote:
> > 
> > > +/**
> > > + * struct fsl_qdma_format - This is the struct holding describing compound
> > > + *			    descriptor format with qDMA.
> > > + * @status:		    This field which describes command status and
> > > + *			    enqueue status notification.
> > > + * @cfg:		    This field which describes frame offset and frame
> > > + *			    format.
> > > + * @addr_lo:		    This field which indicating the start of the buffer
> > > + *			    holding the compound descriptor of the lower 32-bits
> > > + *			    address in memory 40-bit address.
> > > + * @addr_hi:		    This field's the same as above field, but point
> > high
> > > + *			    8-bits in memory 40-bit address.
> > > + * @__reserved1:	    Reserved field.
> > > + * @cfg8b_w1:		    This field which describes compound descriptor
> > > + *			    command queue origin produced by qDMA and
> > dynamic
> > 
> > you may remove 'This field which describes'... in above lines, give reader no
> > information :)
> > 
> 
> Ok, so I remove 'this filed which describes' but keep the second half, right?

right

> > > +	for (i = 0; i < queue_num; i++) {
> > > +		if (queue_size[i] > FSL_QDMA_CIRCULAR_DESC_SIZE_MAX
> > > +			|| queue_size[i] < FSL_QDMA_CIRCULAR_DESC_SIZE_MIN) {
> > > +			dev_err(&pdev->dev, "Get wrong queue-sizes.\n");
> > > +			return NULL;
> > 
> > the indents here are bad for reading..
> > 
> 
> So I add a empty line in here?

No, indent of trailing condition is same as code block, that causes confusion,
they should have different indent

> > > +	/*
> > > +	 * Clear the command queue interrupt detect register for all queues.
> > > +	 */
> > > +	qdma_writel(fsl_qdma, 0xffffffff, block + FSL_QDMA_BCQIDR(0));
> > 
> > bunch of writes with 0xffffffff, can you explain why? Also helps to make a
> > macro for this
> > 
> 
> Maybe I missed that I should defined the value to the macro and add comment.
> Right?

that would help, but why are you writing 0xffffffff at all these places?

> > > +static void fsl_qdma_issue_pending(struct dma_chan *chan) {
> > > +	struct fsl_qdma_chan *fsl_chan = to_fsl_qdma_chan(chan);
> > > +	struct fsl_qdma_queue *fsl_queue = fsl_chan->queue;
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&fsl_queue->queue_lock, flags);
> > > +	spin_lock(&fsl_chan->vchan.lock);
> > > +	if (vchan_issue_pending(&fsl_chan->vchan))
> > > +		fsl_qdma_enqueue_desc(fsl_chan);
> > > +	spin_unlock(&fsl_chan->vchan.lock);
> > > +	spin_unlock_irqrestore(&fsl_queue->queue_lock, flags);
> > 
> > why do we need two locks, and since you are doing vchan why should you add
> > your own lock on top
> > 
> 
> Yes, we need two locks.
> As you know, the QDMA support multiple virtualized blocks for multi-core support.
> so we need to make sure that muliti-core access issues.

but why cant you use vchan lock for all?

-- 
~Vinod
