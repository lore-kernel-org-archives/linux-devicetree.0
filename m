From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 4/5] DMA: sun6i: Add driver for the
 Allwinner A31 DMA controller
Date: Fri, 28 Feb 2014 15:33:11 +0200
Message-ID: <1393594391.28803.79.camel@smile.fi.intel.com>
References: <1393258967-4843-1-git-send-email-maxime.ripard@free-electrons.com>
	 <1393258967-4843-5-git-send-email-maxime.ripard@free-electrons.com>
	 <1393327695.28803.25.camel@smile.fi.intel.com>
	 <20140228103614.GM607@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDA5BKNJ6MIBBG5AYKMAKGQEDDKT5IA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140228103614.GM607@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-02-28 at 11:36 +0100, Maxime Ripard wrote:
> Hi Andy,
> 
> On Tue, Feb 25, 2014 at 01:28:15PM +0200, Andy Shevchenko wrote:
> > > +static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
> > > +{
> > > +	struct sun6i_dma_dev *sdev = (struct sun6i_dma_dev *)dev_id;
> > > +	struct sun6i_vchan *vchan;
> > > +	struct sun6i_pchan *pchan;
> > > +	int i, j, ret = 0;
> > > +	u32 status;
> > > +
> > > +	for (i = 0; i < 2; i++) {
> > > +		status = readl(sdev->base + DMA_IRQ_STAT(i));
> > > +		if (!status) {
> > > +			ret |= IRQ_NONE;
> > 
> > Maybe move this to definition block.
> > 
> > > +			continue;
> > > +		}
> > > +
> > > +		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
> > > +			i ? "high" : "low", status);
> > > +
> > > +		writel(status, sdev->base + DMA_IRQ_STAT(i));
> > > +
> > > +		for (j = 0; (j < 8) && status; j++) {
> > > +			if (status & DMA_IRQ_QUEUE) {
> > > +				pchan = sdev->pchans + j;
> > > +				vchan = pchan->vchan;
> > > +
> > > +				if (vchan) {
> > > +					unsigned long flags;
> > > +
> > > +					spin_lock_irqsave(&vchan->vc.lock,
> > > +							  flags);
> > > +					vchan_cookie_complete(&pchan->desc->vd);
> > > +					pchan->done = pchan->desc;
> > > +					spin_unlock_irqrestore(&vchan->vc.lock,
> > > +							       flags);
> > > +				}
> > > +			}
> > > +
> > > +			status = status >> 4;
> > > +		}
> > > +
> > > +		ret |= IRQ_HANDLED;
> > 
> > In case one is handled, another is not, what you have to do?
> 
> The interrupt status is split across two registers. In the case where
> one of the two register reports an interrupt, we still have to handle
> our interrupt, we actually did, so we have to return IRQ_HANDLED.

You removed the code below this assignment, but if I remember correctly
you check for exact value there.

In case of one is not handled and the other is handled you will have ret
= IRQ_HANDLED | IRQ_NONE. Thus, your following code will not be
executed. Is it by design?



-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
