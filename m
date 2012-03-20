From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 20 Mar 2012 15:44:49 -0400
Message-ID: <20120320194449.GH2484@titan.lakedaemon.net>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203131557.49488.arnd@arndb.de>
 <20120320172238.GC2484@titan.lakedaemon.net>
 <201203201915.08317.arnd@arndb.de>
 <20120320193222.GD8315@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120320193222.GD8315-g2DYL2Zd6BY@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2012 at 08:32:22PM +0100, Andrew Lunn wrote:
> On Tue, Mar 20, 2012 at 07:15:07PM +0000, Arnd Bergmann wrote:
> > On Tuesday 20 March 2012, Jason Cooper wrote:
> > > diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> > > index 6c6a5a3..0808417 100644
> > > --- a/drivers/usb/host/ehci-orion.c
> > > +++ b/drivers/usb/host/ehci-orion.c
> > > @@ -318,3 +318,5 @@ static struct platform_driver ehci_orion_driver = {
> > >         .shutdown       = usb_hcd_platform_shutdown,
> > >         .driver.name    = "orion-ehci",
> > >  };
> > > +
> > > +module_platform_driver(ehci_orion_driver);
> > > 
> > This actually looks wrong to me, because the ehci driver has an
> > interesting way of pulling in platform specific drivers.
> > 
> > I'm pretty sure that it will break modular builds, which can only
> > have one module_init function in them. It's not clear to me why this
> > patch actually fixes the problem either. Could it be that you have
> > multiple platform driver back-ends for ehci enabled at the same time?
> > 
> > That should not be possible in theory and at least give a warning, but
> > the ehci probing method is a bit fragile so I would not be too surprised.
> 
> Hi Jason
> 
> I fell fowl of something in this area. Do you have CONFIG_USB_EHCI_MV=y?
> Make sure you do not have this. 
> 
> drivers/usb/host/ehci-hcd.c has some unusual code, and if you have
> both CONFIG_USB_EHCI_MV and CONFIG_PLAT_ORION, the CONFIG_USB_EHCI_MV
> is given preference and the Orion driver never gets its probe
> functions called etc.

waddaya know?  The compile warnings went away, and the d*mn thing booted
fine.

Is there a scenario where someone would want to select
CONFIG_USB_EHCI_MV in menuconfig?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
