From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: zynq: dt: Convert to preprocessor includes
Date: Mon, 7 Apr 2014 20:02:28 +0200
Message-ID: <20140407180228.GN12170@pengutronix.de>
References: <1396653256-28397-1-git-send-email-soren.brinkmann@xilinx.com>
 <1396653256-28397-3-git-send-email-soren.brinkmann@xilinx.com>
 <53423E75.3020008@monstr.eu>
 <53429754.8080105@topic.nl>
 <534298E7.2020409@monstr.eu>
 <20140407171012.GC9952@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140407171012.GC9952-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

On Mon, Apr 07, 2014 at 11:10:12AM -0600, Jason Gunthorpe wrote:
> On Mon, Apr 07, 2014 at 02:24:07PM +0200, Michal Simek wrote:
> 
> > Device-tree BSP and in 2014.01 there will be new BSP which just
> > generate them directly from the Vivado tools which just target your
> > reference design.  You can connect your custom IP (or Xilinx or 3rd
> > party) directly to the GIC which using different IRQ sensitivity
> > with whatever register addresses and make no sense to write it by
> > hand.
> 
> On our Zynq design here we ended up being unwilling to use platform
> generation from Vivado. Basically all our IP was custom, so there was
> no win at all to invoking the complexity of the automatic tools.
> 
> Thus we write the DT by hand, and our DT is complex, integrating
> peripherals that span two FPGAs.
> 
> I think the in-kernel DT should use the kernel conventions, which
> means using #include and the binding constants over magic values.
> 

ACK.

If in doubt follow common mainline practice. Although using includes
for DT is not necessarily common practice, readability of DTs is
really important IMHO.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
