From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 1/3] dma: at_xdmac: creation of the atmel eXtended
 DMA Controller driver
Date: Fri, 17 Oct 2014 13:02:26 +0530
Message-ID: <20141017073226.GM1638@intel.com>
References: <1412175565-810-1-git-send-email-ludovic.desroches@atmel.com>
 <1412175565-810-2-git-send-email-ludovic.desroches@atmel.com>
 <20141015133004.GP1638@intel.com>
 <20141016141048.GC2367@ldesroches-Latitude-E6320>
 <20141016161233.GJ1638@intel.com>
 <20141017065357.GE2367@ldesroches-Latitude-E6320>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141017065357.GE2367@ldesroches-Latitude-E6320>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 17, 2014 at 08:53:57AM +0200, Ludovic Desroches wrote:

> > 
> > > > For memcpy why should we need slave_config. The system memory source and
> > > > destination width could be assumed to relastic values and then burst sizes
> > > > maxed for performance. These values make more sense for periphral where we
> > > > have to match up with the periphral
> > > 
> > > I don't tell I need slave_config. We have already talked about this. I don't
> > > see the problem. It is only a comment, a reminder. The only information
> > > I may need, one day, is the direction because we have to set src and dst
> > > interfaces. At the moment, all our products are done in a way nand flash
> > > and DDR are on the same interface so we don't have to care about
> > > direction.
> > > Since we don't have the direction, two solutions:
> > > - remember this limitation for next products, that's why there is this reminder,
> > > - change our nand driver in order to see nand as a peripheral instead of
> > >   a memory. 
> > I think treating NAND as memory may not be a right model. It should be
> > treated as periphral with incrementing and decrementing address value. That
> > way you should be able to set the right properties for it.
> > 
> > The system memory copy is right model for memcpy.
> 
> Ok, I'll discuss of it with the atmel nand maintener. Even if there is
> something to improve here, I hope it is not considered as a blocking point
> to get the xdmac driver included into 3.19 because at the moment we have no
> DMA on the SAMA5D4 recently introduced.

That sounds good to me, no this is non blocker here

And yes keeping the comment here is fine to warn folks.

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
