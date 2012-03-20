From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 20 Mar 2012 19:06:29 -0400
Message-ID: <20120320230629.GJ2484@titan.lakedaemon.net>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203202057.38365.arnd@arndb.de>
 <20120320220156.GI2484@titan.lakedaemon.net>
 <201203202215.09227.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203202215.09227.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2012 at 10:15:09PM +0000, Arnd Bergmann wrote:
> On Tuesday 20 March 2012, Jason Cooper wrote:
> > > If you want to add a dependency, it should be
> > > 
> > >       depends on PLAT_PXA
> > > 
> > > Most other platform drivers have a dependency on the platform
> > > they are for, but USB_EHCI_MV was only recently added, and nobody
> > > has bothered to fix this yet.
> >
> > It's my understanding that will make the driver visible in menuconfig
> > for PLAT_PXA.  That may be useful, but what I'm trying to fix is a new
> > user (me) from selecting USB_EHCI_MV on PLAT_ORION.  It breaks when
> > you do that (at runtime).
> 
> Are those two things not the same? The dependency makes the driver
> visible only on PLAT_PXA, which means it is invisible on PLAT_ORION
> and you can no longer select it. PLAT_PXA and PLAT_ORION are mutually
> exclusive.

Ok, that's what I missed.

...
> > > > Maybe also -Werror for that one file to catch other similar cases?
> > > 
> > > No, we are actually trying to make sure that any configuration you pick
> > > results in a kernel that builds, so that would be counterproductive.
> > 
> > I would argue it should build and work.  Otherwise, there's no point
> > in having a successful compile.  So, maybe the answer is not to have
> > it as a configuration option.  Or, at least, invisible in menuconfig.
> 
> Making USB_EHCI_MV invisible everywhere would also be possible, in that
> case the right logic would be
> 
> config USB_EHCI_MV
> 	def_bool y
> 	depends on USB_EHCI_HCD && PLAT_PXA
> 	select USB_EHCI_ROOT_HUB_TT
> 
> This would unconditionally enable the pxa ehci driver whenever the
> common ehci code is enabled, which is a reasonable choice, and matches
> the behavior of the orion driver.

Ok, I'll gin up a patch for this and CC: stable / linux-usb.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
