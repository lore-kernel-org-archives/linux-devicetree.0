Return-Path: <vkoul@kernel.org>
Date: Tue, 5 Jun 2018 21:58:54 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [v5 2/6] dmaengine: fsl-qdma: Add qDMA controller driver for
 Layerscape SoCs
Message-ID: <20180605162854.GW16230@vkoul-mobl>
References: <20180525111920.24498-1-wen.he_1@nxp.com>
 <20180525111920.24498-2-wen.he_1@nxp.com>
 <20180529070724.GE5666@vkoul-mobl>
 <AM6PR0402MB3382D42C76332B98D53D001AE26D0@AM6PR0402MB3382.eurprd04.prod.outlook.com>
 <20180529101954.GJ5666@vkoul-mobl>
 <AM6PR0402MB3382F92D1123CDCA0E0075EDE26D0@AM6PR0402MB3382.eurprd04.prod.outlook.com>
 <20180530102744.GE16230@vkoul-mobl>
 <AM6PR0402MB3382A63FF2884BAD8AF6080BE2630@AM6PR0402MB3382.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR0402MB3382A63FF2884BAD8AF6080BE2630@AM6PR0402MB3382.eurprd04.prod.outlook.com>
To: Wen He <wen.he_1@nxp.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Jiaheng Fan <jiaheng.fan@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 31-05-18, 01:58, Wen He wrote:
> > > > > > > +static void fsl_qdma_issue_pending(struct dma_chan *chan) {
> > > > > > > +	struct fsl_qdma_chan *fsl_chan = to_fsl_qdma_chan(chan);
> > > > > > > +	struct fsl_qdma_queue *fsl_queue = fsl_chan->queue;
> > > > > > > +	unsigned long flags;
> > > > > > > +
> > > > > > > +	spin_lock_irqsave(&fsl_queue->queue_lock, flags);
> > > > > > > +	spin_lock(&fsl_chan->vchan.lock);
> > > > > > > +	if (vchan_issue_pending(&fsl_chan->vchan))
> > > > > > > +		fsl_qdma_enqueue_desc(fsl_chan);
> > > > > > > +	spin_unlock(&fsl_chan->vchan.lock);
> > > > > > > +	spin_unlock_irqrestore(&fsl_queue->queue_lock, flags);
> > > > > >
> > > > > > why do we need two locks, and since you are doing vchan why
> > > > > > should you add your own lock on top
> > > > > >
> > > > >
> > > > > Yes, we need two locks.
> > > > > As you know, the QDMA support multiple virtualized blocks for
> > > > > multi-core
> > > > support.
> > > > > so we need to make sure that muliti-core access issues.
> > > >
> > > > but why cant you use vchan lock for all?
> > > >
> > >
> > > We can't only use vchan lock for all. otherwise enqueue action will be
> > interrupted.
> > 
> > I think it is possible to use only vchan lock
> 
> I tried that if I use only vchan lock then qdma will be can't work.
> Do you have a other good idea?

can you explain the scenario...

-- 
~Vinod
