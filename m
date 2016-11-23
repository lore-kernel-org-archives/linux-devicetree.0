From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/2] DW DMAC: update device tree
Date: Wed, 23 Nov 2016 09:36:03 +0530
Message-ID: <20161123040603.GD2698@localhost>
References: <1479496356-27834-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479497189.22212.41.camel@linux.intel.com>
 <1479722477.2487.5.camel@synopsys.com>
 <1479724626.22212.50.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479724626.22212.50.camel-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 21, 2016 at 12:37:06PM +0200, Andy Shevchenko wrote:
> On Mon, 2016-11-21 at 10:02 +0000, Alexey Brodkin wrote:
> > Hi Andy,
> > 
> > On Fri, 2016-11-18 at 21:26 +0200, Andy Shevchenko wrote:
> > > On Fri, 2016-11-18 at 22:12 +0300, Eugeniy Paltsev wrote:
> > > > 
> > > > It wasn't possible to enable some features like
> > > > memory-to-memory transfers or multi block transfers via DT.
> > > > It is fixed by these patches.
> > > 
> > > First of all, please, give time to reviewers to comment the patches.
> > > Usually it should be at least 24h (for the series that has been sent
> > > first time 1 week approximately).
> > 
> > I'm not really sure a lot of people get disturbed by this series
> > and given this all has been discussed for months now I'd really like
> > to see changes required for our HW to work to land in upstream ASAP.
> 
> I understand your concern, I'm often in the same position in many areas,
> including this driver (I'm not a maintainer of slave DMA subsystem).
> 
> Though let's face the issues we have with the series:
> - stuff regarding to style and alike (would be fixed in a day)
> - DTS naming and conventions, this is apparently a big area, where I
> might share opinion, but can't decide for
> - last word by the subsystem maintainer
> 
> > Too bad we're late for 4.9 (which is supposed to be the next LTS) but
> > > we need to make sure this series hits 4.10 for sure.
> 
> Vinod, is it possible to get in for this series (if we get Ack from DT
> people)?

We still have a week or so... But holding race agaisnt upstream is a bad
idea... Doesnt work that way.

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
