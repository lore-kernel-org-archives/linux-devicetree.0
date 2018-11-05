Return-Path: <SRS0=UXaX=NQ=linux.intel.com=andriy.shevchenko@kernel.org>
Date: Mon, 5 Nov 2018 18:23:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/2] dmaengine: dw: implement per-channel protection
 control setting
Message-ID: <20181105162330.GP10650@smile.fi.intel.com>
References: <6b18bcf33d6473c166b607a5fa31ba63727cf6bb.1541350844.git.chunkeey@gmail.com>
 <20181105142254.GG10650@smile.fi.intel.com>
 <20181105142741.GI10650@smile.fi.intel.com>
 <25273848.Yt2vXhTyVK@debian64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25273848.Yt2vXhTyVK@debian64>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Nov 05, 2018 at 05:06:20PM +0100, Christian Lamparter wrote:
> On Monday, November 5, 2018 3:27:41 PM CET Andy Shevchenko wrote:
> > On Mon, Nov 05, 2018 at 04:22:54PM +0200, Andy Shevchenko wrote:
> > > On Sun, Nov 04, 2018 at 06:01:39PM +0100, Christian Lamparter wrote:
> > 
> > > > +	struct dw_dma *dw = to_dw_dma(dwc->chan.device);
> > > > +	size_t chanidx = (size_t)(dwc - dw->chan);
> > > 
> > > We have mask field, so, index is a first set bit out of mask, __ffs(mask).
> > > 
> > > 	unsigned int protctl = dw->pdata->protctl[__ffs(mask)];
> > 
> > dwc->mask, of course.
> Ok, will do. I'll sent a v2 later this week.
> 
> > Also, it's possible to use (though better to check) dwc->chan.chan_id,
> > though I dunno if it's reliable.
> dwc->chan.chan_id is subjected to the chan_allocation setting. 
> So, if it's set to CHAN_ALLOCATION_DESCENDING the dt prop array values
> for the protctl would need to be reversed as well in order to match the
> other per-channel settings (for example multiblock).
> So, let's not do that since this gets very confusing.

Yes, that's what I suspected. So, __ffs(dwc->mask) seems feasible approach.


-- 
With Best Regards,
Andy Shevchenko
