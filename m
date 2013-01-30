From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH,RFC] usb: add devicetree helpers for determining dr_mode
 and phy_type
Date: Wed, 30 Jan 2013 15:00:15 +0100
Message-ID: <20130130140015.GZ1906@pengutronix.de>
References: <1359458548-25071-1-git-send-email-s.hauer@pengutronix.de>
 <87pq0omcfb.fsf@ashishki-desk.ger.corp.intel.com>
 <20130130020627.GA699@nchen-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130130020627.GA699@nchen-desktop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2013 at 10:06:28AM +0800, Peter Chen wrote:
> On Tue, Jan 29, 2013 at 01:55:04PM +0200, Alexander Shishkin wrote:
> > Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> > 
> > > From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > >
> > > This adds two little devicetree helper functions for determining the
> > > dr_mode (host, peripheral, otg) and phy_type (utmi, ulpi,...) from
> > > the devicetree.
> > >
> > > Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > ---
> > >
> > > The properties and their values have been taken from the fsl-mph-dr driver.
> > > This binding is also documented (though currently not used) for the tegra
> > > ehci driver (Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt).
> > > This is a first attempt to parse these bindings at a common place so that
> > > others can make use of it.
> > >
> > > Basically I want to know whether this binding is recommended for new drivers
> > > since normally the devicetree uses '-' instead of '_', and maybe there are
> > > other problems with it.
> > >
> > > I need this binding for the chipidea driver. I suspect that the fsl-mph-dr
> > > driver also really handles a chipidea core.
> > 
> > As far as I know, it is a chipidea core. Adding Peter to Cc list, he can
> > probably confirm.
> 
> The fsl-mph-dr can't be used for chipdiea as it handles three platform
> drivers for three roles (peripheral , host, otg). But chipidea only has
> two platform drivers, one is the chipidea core, the other is related
> controller wrapper.

What do you mean by 'three platform drivers'? That's only how the driver
is built, no? I was talking about the hardware the fsl-mph-dr driver
handles which definitely smells like chipidea.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
