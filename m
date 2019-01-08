From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] dmaengine: mediatek: Add MediaTek Command-Queue DMA
 controller for MT6765 SoC
Date: Tue, 8 Jan 2019 22:29:46 +0530
Message-ID: <20190108165946.GQ13372@vkoul-mobl.Dlink>
References: <1545916258-18218-1-git-send-email-shun-chih.yu@mediatek.com>
 <1545916258-18218-3-git-send-email-shun-chih.yu@mediatek.com>
 <20190104123836.GB13372@vkoul-mobl.Dlink>
 <1546949984.25257.96.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546949984.25257.96.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: "Shun-Chih.Yu" <shun-chih.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com, dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08-01-19, 20:19, Shun-Chih.Yu wrote:
> On Fri, 2019-01-04 at 18:08 +0530, Vinod Koul wrote:
> > On 27-12-18, 21:10, shun-chih.yu@mediatek.com wrote:
> > > From: Shun-Chih Yu <shun-chih.yu@mediatek.com>

> > Have you tested this with dmatest, if so can you provide results of the
> > test as well.
> Yes, I tested with dmatest in multi-thread version. 
> The results shown below, and I would attach them in the next revision if needed.
> 
> dmatest: dma0chan0-copy2: summary 5000 tests, 0 failures 3500 iops 28037
> KB/s (0)
> dmatest: dma0chan0-copy4: summary 5000 tests, 0 failures 3494 iops 27612
> KB/s (0)
> dmatest: dma0chan0-copy1: summary 5000 tests, 0 failures 3491 iops 27749
> KB/s (0)
> dmatest: dma0chan0-copy7: summary 5000 tests, 0 failures 3673 iops 29092
> KB/s (0)
> dmatest: dma0chan0-copy6: summary 5000 tests, 0 failures 3763 iops 30237
> KB/s (0)
> dmatest: dma0chan0-copy0: summary 5000 tests, 0 failures 3730 iops 30131
> KB/s (0)
> dmatest: dma0chan0-copy3: summary 5000 tests, 0 failures 3717 iops 29569
> KB/s (0)
> dmatest: dma0chan0-copy5: summary 5000 tests, 0 failures 3699 iops 29302
> KB/s (0)

Having them in cover letter helps :)

> > > Signed-off-by: Shun-Chih Yu <shun-chih.yu@mediatek.com>
> > > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > 
> > This is _WRONG_ I have never provided such tag, can you explain why this
> > was added without my approval?
> So sorry about this, I misunderstood the usage of reviewed-by tag and I
> would remove this. Thanks for pointing out this mistake.

This tag should be added _only_ when someone replies with
Reviewed-by: ..., same goes for Acked-by and Tested-by: ... etc

> > > +static void mtk_dma_write(struct mtk_cqdma_pchan *pc, u32 reg, u32 val)
> > > +{
> > > +	writel_relaxed(val, pc->base + reg);
> > 
> > Why is it relaxed one?
> Most of the operations to the CQDMA hardware could be relaxed, and the 

looks like you missed the rest of sentence

> > > +static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
> > > +					   dma_cookie_t cookie,
> > > +					   struct dma_tx_state *txstate)
> > > +{
> > > +	struct mtk_cqdma_vchan *cvc = to_cqdma_vchan(c);
> > > +	struct mtk_cqdma_vdesc *cvd;
> > > +	struct virt_dma_desc *vd;
> > > +	enum dma_status ret;
> > > +	unsigned long flags;
> > > +	size_t bytes = 0;
> > > +
> > > +	ret = dma_cookie_status(c, cookie, txstate);
> > > +	if (ret == DMA_COMPLETE || !txstate)
> > > +		return ret;
> > > +
> > > +	spin_lock_irqsave(&cvc->vc.lock, flags);
> > > +	vd = mtk_cqdma_find_active_desc(c, cookie);
> > > +	spin_unlock_irqrestore(&cvc->vc.lock, flags);
> > > +
> > > +	if (vd) {
> > > +		cvd = to_cqdma_vdesc(vd);
> > > +		bytes = cvd->len;
> > > +	}
> > > +
> > > +	dma_set_residue(txstate, bytes);
> > 
> > Have you tested this and are able to report residue properly?
> > 
> I tested and thought the residue report properly. But after checking the
> definition of residue in tx_status again, I found that should be always
> return 0 in the driver instead, since there is no state DMA_IN_PROGRESS
> or DMA_PAUSED in the driver. I would fix this in the next revision.

So memcpy is quite fast :D, that's why. This is more helpful in
slave-dma which is relatively slow :)

-- 
~Vinod
