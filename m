From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 07/15] ARM: dts: kirkwood: consolidate common pinctrl
 settings
Date: Wed, 30 Apr 2014 18:44:41 +0200
Message-ID: <20140430164441.GB3082@lunn.ch>
References: <1398862602-29595-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1398862602-29595-8-git-send-email-sebastian.hesselbarth@gmail.com>
 <20140430164236.GC12944@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140430164236.GC12944-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 30, 2014 at 10:42:36AM -0600, Jason Gunthorpe wrote:
> On Wed, Apr 30, 2014 at 02:56:34PM +0200, Sebastian Hesselbarth wrote:
> > All SoCs have the same pinctrl setting for NAND, UART0/1, SPI, TWSI0,
> > and GBE1. Move it to the common pinctrl node that we now have.
> 
> There are two possible choices for UART0, UART1, and SPI on kirkwood..
> 
> For instance I use this on my board:
> 
>                                 pmx_spi0: pmx-spi0 {
>                                         marvell,pins = "mpp7", "mpp10", "mpp11", "mpp12";
>                                         marvell,function = "spi";
>                                 };
> 
> vs
> 
> > +
> > +			pmx_spi: pmx-spi {
> > +				marvell,pins = "mpp0", "mpp1", "mpp2", "mpp3";
> > +				marvell,function = "spi";
> > +			};
> 
> It looks like all the boards in the kernel use the same choice, so it
> makes some sense to consolidate, but I assume a board file can
> override the marvell,pins?

Hi Jason

Yes, the board can override it, see patch 10/15 for an example.

     Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
