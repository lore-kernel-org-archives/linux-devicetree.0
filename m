From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: zynq: dt: Convert to preprocessor includes
Date: Tue, 8 Apr 2014 11:27:52 -0600
Message-ID: <20140408172752.GC27776@obsidianresearch.com>
References: <1396653256-28397-1-git-send-email-soren.brinkmann@xilinx.com>
 <1396653256-28397-3-git-send-email-soren.brinkmann@xilinx.com>
 <53423E75.3020008@monstr.eu>
 <53429754.8080105@topic.nl>
 <534298E7.2020409@monstr.eu>
 <20140407171012.GC9952@obsidianresearch.com>
 <20140407180228.GN12170@pengutronix.de>
 <53439F3F.2030801@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53439F3F.2030801-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 08, 2014 at 09:03:27AM +0200, Michal Simek wrote:

> > If in doubt follow common mainline practice. Although using includes
> > for DT is not necessarily common practice, readability of DTs is
> > really important IMHO.
> 
> Let me give you one example. When you add xilinx intc controller
> to zynq HW design which uses gic with headers you are using
> then you will find out that sensitivity for both controllers
> are just different.
> This is just one case I am aware of. I expect there will be one more.

I'm not sure I see the problem here, just because some bindings can't
use the standard shared constants doesn't mean the GIC bindings and
users should avoid them. The binding documentation is supposed to make
it clear what is correct.

It is just as easy to get confused with numbers, does 4 mean
XILINX_INTC_IRQ_RISING or IRQ_TYPE_LEVEL_HIGH ?

> Using dtc preprocessor and macros improve DTS readability but at the same
> time force other users to copy all necessary files from the kernel
> to that projects which is just hassle.

You can run the DTS through cpp before you export it out of the kernel
environment, then you get a flat file with no includes.

The shared kernel conventions are more important than constraints from
outside projects.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
