From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 20 Mar 2012 20:57:38 +0000
Message-ID: <201203202057.38365.arnd@arndb.de>
References: <20120312214325.GD5050@titan.lakedaemon.net> <20120320194449.GH2484@titan.lakedaemon.net> <20120320204504.GE8315@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120320204504.GE8315-g2DYL2Zd6BY@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 20 March 2012, Andrew Lunn wrote:
> > Is there a scenario where someone would want to select
> > CONFIG_USB_EHCI_MV in menuconfig?
> 
> Not on an Orion platform, as far as i know. Maybe
> 
> config USB_EHCI_MV
>         bool "EHCI support for Marvell on-chip controller"
> -        depends on USB_EHCI_HCD
> +        depends on USB_EHCI_HCD && !PLAT_ORION
>         select USB_EHCI_ROOT_HUB_TT
>         ---help---
>           Enables support for Marvell (including PXA and MMP series) on-chip
>           USB SPH and OTG controller. SPH is a single port host, and it can
>           only be EHCI host. OTG is controller that can switch to host mode.

Well, rihgt now you can select it on anything, including non-ARM architectures,
and it fails whenever you select it in addition to another platform
driver.

If you want to add a dependency, it should be

	depends on PLAT_PXA

Most other platform drivers have a dependency on the platform
they are for, but USB_EHCI_MV was only recently added, and nobody
has bothered to fix this yet.

> Maybe also -Werror for that one file to catch other similar cases?

No, we are actually trying to make sure that any configuration you pick
results in a kernel that builds, so that would be counterproductive.

The problem will be much bigger when we get to the point where you
can actually build a multiplatform kernel, e.g. one that works
on both PXA and Kirkwood because then it will still be broken
for at least one of the two.

We recently had a discussion about how to solve this correctly, see
the email thread at http://lkml.org/lkml/2012/2/25/45 leading
up to http://lkml.org/lkml/2012/2/28/299 .
The problem is the same for ehci and ohci, and I think a lot of
people would welcome a proper fix for the situation.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
