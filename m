From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 20 Mar 2012 21:45:04 +0100
Message-ID: <20120320204504.GE8315@lunn.ch>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203131557.49488.arnd@arndb.de>
 <20120320172238.GC2484@titan.lakedaemon.net>
 <201203201915.08317.arnd@arndb.de>
 <20120320193222.GD8315@lunn.ch>
 <20120320194449.GH2484@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120320194449.GH2484-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > Hi Jason
> > 
> > I fell fowl of something in this area. Do you have CONFIG_USB_EHCI_MV=y?
> > Make sure you do not have this. 
> > 
> > drivers/usb/host/ehci-hcd.c has some unusual code, and if you have
> > both CONFIG_USB_EHCI_MV and CONFIG_PLAT_ORION, the CONFIG_USB_EHCI_MV
> > is given preference and the Orion driver never gets its probe
> > functions called etc.
> 
> waddaya know?  The compile warnings went away, and the d*mn thing booted
> fine.
> 
> Is there a scenario where someone would want to select
> CONFIG_USB_EHCI_MV in menuconfig?

Not on an Orion platform, as far as i know. Maybe

config USB_EHCI_MV
        bool "EHCI support for Marvell on-chip controller"
-        depends on USB_EHCI_HCD
+        depends on USB_EHCI_HCD && !PLAT_ORION
        select USB_EHCI_ROOT_HUB_TT
        ---help---
          Enables support for Marvell (including PXA and MMP series) on-chip
          USB SPH and OTG controller. SPH is a single port host, and it can
          only be EHCI host. OTG is controller that can switch to host mode.

Maybe also -Werror for that one file to catch other similar cases?

Andrew

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
