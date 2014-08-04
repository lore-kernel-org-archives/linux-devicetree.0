From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] dmaengine: add a driver for AMBA AXI NBPF DMAC
 IP cores
Date: Mon, 4 Aug 2014 13:25:43 +0530
Message-ID: <20140804075543.GJ8181@intel.com>
References: <Pine.LNX.4.64.1407191239400.3062@axis700.grange>
 <Pine.LNX.4.64.1407191243360.3062@axis700.grange>
 <20140725141621.GT8181@intel.com>
 <Pine.LNX.4.64.1407251635070.13523@axis700.grange>
 <20140725163417.GV8181@intel.com>
 <Pine.LNX.4.64.1407262105150.24257@axis700.grange>
 <20140731125704.GV8181@intel.com>
 <Pine.LNX.4.64.1407311520290.24081@axis700.grange>
 <20140801163456.GZ8181@intel.com>
 <alpine.DEB.2.00.1408012300270.4784@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1408012300270.4784-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 01, 2014 at 11:04:52PM +0200, Guennadi Liakhovetski wrote:
> Hi Vinod,
> 
> On Fri, 1 Aug 2014, Vinod Koul wrote:
> 
> > On Thu, Jul 31, 2014 at 03:42:44PM +0200, Guennadi Liakhovetski wrote:
> > > Ok. This doesn't seem to progress. You suggested in your previous mail, 
> > > that I can provide an incremental patch to add devm_free(_threaded)_irq() 
> > > and synchronize_irq() to .release(). I still think, that this doesn't make 
> > > much sense, but if you insist... Alternatively, my proposal would be to 
> > > fix the thoretical race in .free_chan_resources(). Would you accept such a 
> > > patch instead of what you were proposing? I can also convert the driver to 
> > > using a tasklet, if required. Would it suffice, if I do those patches as 
> > > fixes after -rc1? I'm leaving on a holiday tomorrow and I still have to 
> > > finalise some other work, so, preparing those patches today doesn't seem 
> > > realistic to me... Would this be acceptable?
> > Can you please send both, incrementally is fine.
> > I will merge them tomorrow
> 
> Sorry, do you mean I should send those incremental patches for the 
> original one to become acceptable? As I explained above, I'm on a holiday 
> now, so, I hoped it would be acceptble to get this patch in and let me do 
> the other two later, possibly after -rc1 as fixes. If you definitely would 
> like all 3 patches now... Well, I could try, but this won't be easy...
Well I was planning to merge and wait for fixes in rc1 or later during merge
window. Looks like you managed to send, so I will merge all.

Thanks

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
