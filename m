From: "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 6/7] DMA: sun6i: Add driver for the
 Allwinner A31 DMA controller
Date: Tue, 11 Mar 2014 10:22:52 +0000
Message-ID: <1394533371.28803.226.camel@smile.fi.intel.com>
References: <1394462512-11620-1-git-send-email-maxime.ripard@free-electrons.com>
	 <1394462512-11620-7-git-send-email-maxime.ripard@free-electrons.com>
	 <1394531574.28803.222.camel@smile.fi.intel.com>
	 <20140311100838.GQ2815@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDLYD555WYHBBMGI7OMAKGQEL2I2QAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140311100838.GQ2815@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Language: en-US
Content-ID: <9CED5AC128720543915943A8B6C44424-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "Williams, Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mike
 Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org" <sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, "shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org" <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, "zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org" <zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-03-11 at 11:08 +0100, Maxime Ripard wrote:

[]

> > > +	spin_lock_irq(&sdev->lock);
> > > +	for (pchan_idx = 0; pchan_idx < NR_MAX_CHANNELS; pchan_idx++) {
> > > +		pchan = &sdev->pchans[pchan_idx];
> > > +
> > > +		if (pchan->vchan == NULL && !list_empty(&sdev->pending)) {
> > 
> > !pchan->vchan && ...
> 
> Ok.
> 
> > And you may decrease indentation level here if you use negative
> > condition.
> 
> Hmmm, I'm not following you here. What do you mean?

for () {
...
if (!(your current condition))
 continue;
... (do something else with decreased indentation level)
}

> > > +			vchan = list_first_entry(&sdev->pending,
> > > +						 struct sun6i_vchan, node);
> > > +
> > > +			/* Remove from pending channels */
> > > +			list_del_init(&vchan->node);
> > > +			pchan_alloc |= BIT(pchan_idx);
> > > +
> > > +			/* Mark this channel allocated */
> > > +			pchan->vchan = vchan;
> > > +			vchan->phy = pchan;
> > > +			dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
> > > +				pchan->idx, &vchan->vc);
> > > +		}
> > > +	}
> > > +	spin_unlock_irq(&sdev->lock);
> > > +
> > > +	for (pchan_idx = 0; pchan_idx < NR_MAX_CHANNELS; pchan_idx++) {
> > > +		if (pchan_alloc & BIT(pchan_idx)) {
> > 
> > Ditto.

Same here.

[]

> > > +#ifdef DEBUG
> > > +	dev_dbg(chan2dev(chan), "First: %pad\n", &txd->p_lli);
> > 
> > dev_dbg is aware of DEBUG. So, please, remove that #ifdef at all.
> 
> Yep, but the line just below isn't.
> 
> The ifdef here is not really to prevent the call to dev_dbg, but rather...
> 
> > > +	for (prev = txd->v_lli; prev != NULL; prev = prev->v_lli_next)
> 
> ... this.

It doesn't matter since implementation of sun6i_dma_dump_lli is (and
actually should be) aware of DEBUG already, because it's dev_dbg based.

> > 
> > You may remove '!= NULL' part.
> 
> Ok.
> 
> > > +		sun6i_dma_dump_lli(vchan, prev);
> > > +#endif




-- 
Andy Shevchenko <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Intel Finland Oy
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
