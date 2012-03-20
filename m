From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 20 Mar 2012 22:15:09 +0000
Message-ID: <201203202215.09227.arnd@arndb.de>
References: <20120312214325.GD5050@titan.lakedaemon.net> <201203202057.38365.arnd@arndb.de> <20120320220156.GI2484@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120320220156.GI2484-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 20 March 2012, Jason Cooper wrote:
> > If you want to add a dependency, it should be
> > 
> >       depends on PLAT_PXA
> > 
> > Most other platform drivers have a dependency on the platform
> > they are for, but USB_EHCI_MV was only recently added, and nobody
> > has bothered to fix this yet.
>
> It's my understanding that will make the driver visible in menuconfig
> for PLAT_PXA.  That may be useful, but what I'm trying to fix is a new
> user (me) from selecting USB_EHCI_MV on PLAT_ORION.  It breaks when
> you do that (at runtime).

Are those two things not the same? The dependency makes the driver
visible only on PLAT_PXA, which means it is invisible on PLAT_ORION
and you can no longer select it. PLAT_PXA and PLAT_ORION are mutually
exclusive.

> Andrew's logic (!PLAT_ORION) makes sure the driver is not visible in
> menuconfig (when ehci-hcd would pick it up) and is visible in
> non-PLAT_ORION boards (where ehci-hcd wouldn't pick it up).
> 
> My question is, are there any non-PLAT_ORION boards that would use this?
> Would it work on those boards if compiled outside of ehci-hcd?

ehci-orion only makes sense on PLAT_ORION, and they never have any
other platform ehci driver.

ehci-mv only makese sense on PLAT_PXA, and they  also don't have any
other platform ehci driver.

> Although, it worked when I added the module_platform_driver() macro.
> maybe we could put some logic around that:
> 
> #ifndef CONFIG_PLAT_ORION
> module_platform_driver(ehci_orion_driver);
> #endif

No, this is just wrong. It expands to module_init(), and
there is already a module_init in ehci-hcd.c, and you must
not have more than one of these when building as a module,
otherwise you get a duplicate symbol definition error.

> > > Maybe also -Werror for that one file to catch other similar cases?
> > 
> > No, we are actually trying to make sure that any configuration you pick
> > results in a kernel that builds, so that would be counterproductive.
> 
> I would argue it should build and work.  Otherwise, there's no point
> in having a successful compile.  So, maybe the answer is not to have
> it as a configuration option.  Or, at least, invisible in menuconfig.

Making USB_EHCI_MV invisible everywhere would also be possible, in that
case the right logic would be

config USB_EHCI_MV
	def_bool y
	depends on USB_EHCI_HCD && PLAT_PXA
	select USB_EHCI_ROOT_HUB_TT

This would unconditionally enable the pxa ehci driver whenever the
common ehci code is enabled, which is a reasonable choice, and matches
the behavior of the orion driver.

> > The problem will be much bigger when we get to the point where you
> > can actually build a multiplatform kernel, e.g. one that works
> > on both PXA and Kirkwood because then it will still be broken
> > for at least one of the two.
> 
> I think there are a few other things that would be broken first, right
> now.  ;-)

Yes, we're working on them one by one. At some point we'll get to this one.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
