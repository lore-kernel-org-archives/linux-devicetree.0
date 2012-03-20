From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 20 Mar 2012 15:33:19 -0400
Message-ID: <20120320193319.GG2484@titan.lakedaemon.net>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203131557.49488.arnd@arndb.de>
 <20120320172238.GC2484@titan.lakedaemon.net>
 <201203201915.08317.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203201915.08317.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding linux-usb to the CC:.

We're trying to figure out how to compile the orion-ehci.c driver into
the kernel.  This is needed for the Globalscale Technologies Dreamplug
to boot and find it's root filesystem (on an internal usb attached
microsd card).

On Tue, Mar 20, 2012 at 07:15:07PM +0000, Arnd Bergmann wrote:
> On Tuesday 20 March 2012, Jason Cooper wrote:
> > diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> > index 6c6a5a3..0808417 100644
> > --- a/drivers/usb/host/ehci-orion.c
> > +++ b/drivers/usb/host/ehci-orion.c
> > @@ -318,3 +318,5 @@ static struct platform_driver ehci_orion_driver = {
> >         .shutdown       = usb_hcd_platform_shutdown,
> >         .driver.name    = "orion-ehci",
> >  };
> > +
> > +module_platform_driver(ehci_orion_driver);
> > 
> This actually looks wrong to me, because the ehci driver has an
> interesting way of pulling in platform specific drivers.
> 
> I'm pretty sure that it will break modular builds, which can only
> have one module_init function in them. It's not clear to me why this
> patch actually fixes the problem either. Could it be that you have
> multiple platform driver back-ends for ehci enabled at the same time?

Yes, it depends on ehci-hcd:

config USB_EHCI_MV
        bool "EHCI support for Marvell on-chip controller"
        depends on USB_EHCI_HCD
        select USB_EHCI_ROOT_HUB_TT

> That should not be possible in theory and at least give a warning, but
> the ehci probing method is a bit fragile so I would not be too surprised.

I used to get the following build warning:

  CC      drivers/usb/host/ehci-hcd.o
  CC      kernel/module.o
drivers/usb/host/ehci-hcd.c:1376:0: warning: "PLATFORM_DRIVER" redefined
drivers/usb/host/ehci-hcd.c:1296:0: note: this is the location of the
previous definition
drivers/usb/host/ehci-orion.c:315:31: warning: 'ehci_orion_driver'
defined but not used
  LD      kernel/built-in.o
  LD      drivers/usb/host/built-in.o
  LD      drivers/usb/built-in.o
  LD      drivers/built-in.o


But after the patch, I get this:

  CC      drivers/usb/host/ehci-hcd.o
  CC      kernel/module.o
drivers/usb/host/ehci-hcd.c:1376:0: warning: "PLATFORM_DRIVER" redefined
drivers/usb/host/ehci-hcd.c:1296:0: note: this is the location of the
previous definition
  LD      kernel/built-in.o
  LD      drivers/usb/host/built-in.o
  LD      drivers/usb/built-in.o
  LD      drivers/built-in.o


As for boot,

ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver 
orion-ehci orion-ehci.0: Marvell Orion EHCI 
orion-ehci orion-ehci.0: new USB bus registered, assigned bus number 1 
orion-ehci orion-ehci.0: irq 19, io mem 0xf1050000 
orion-ehci orion-ehci.0: USB 2.0 started, EHCI 1.00 
hub 1-0:1.0: USB hub found 
hub 1-0:1.0: 1 port detected 


No errors/warnings reported.

without the patch, I get the first line (ehci_hcd:...) and nothing else.
Then, a panic because it can't find /dev/sda2.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
