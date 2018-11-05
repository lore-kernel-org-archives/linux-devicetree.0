Return-Path: <SRS0=UXaX=NQ=linux.intel.com=andriy.shevchenko@kernel.org>
Date: Mon, 5 Nov 2018 16:27:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/2] dmaengine: dw: implement per-channel protection
 control setting
Message-ID: <20181105142741.GI10650@smile.fi.intel.com>
References: <6b18bcf33d6473c166b607a5fa31ba63727cf6bb.1541350844.git.chunkeey@gmail.com>
 <19ee8f8992a364d826680ee86f3a965c395a672d.1541350844.git.chunkeey@gmail.com>
 <20181105142254.GG10650@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181105142254.GG10650@smile.fi.intel.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Nov 05, 2018 at 04:22:54PM +0200, Andy Shevchenko wrote:
> On Sun, Nov 04, 2018 at 06:01:39PM +0100, Christian Lamparter wrote:

> > +	struct dw_dma *dw = to_dw_dma(dwc->chan.device);
> > +	size_t chanidx = (size_t)(dwc - dw->chan);
> 
> We have mask field, so, index is a first set bit out of mask, __ffs(mask).
> 
> 	unsigned int protctl = dw->pdata->protctl[__ffs(mask)];

dwc->mask, of course.

Also, it's possible to use (though better to check) dwc->chan.chan_id, though I
dunno if it's reliable.

-- 
With Best Regards,
Andy Shevchenko
