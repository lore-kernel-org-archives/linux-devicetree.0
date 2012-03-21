From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: EHCI_MV confusion was: Re: kirkwood devicetree respin
Date: Wed, 21 Mar 2012 09:36:09 -0400
Message-ID: <20120321133609.GK2484@titan.lakedaemon.net>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203202057.38365.arnd@arndb.de>
 <20120320220156.GI2484@titan.lakedaemon.net>
 <201203202215.09227.arnd@arndb.de>
 <alpine.LFD.2.02.1203202348150.24151@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.02.1203202348150.24151-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2012 at 11:54:53PM -0400, Nicolas Pitre wrote:
> On Tue, 20 Mar 2012, Arnd Bergmann wrote:
> 
> > ehci-orion only makes sense on PLAT_ORION, and they never have any
> > other platform ehci driver.
> > 
> > ehci-mv only makese sense on PLAT_PXA, and they  also don't have any
> > other platform ehci driver.
> 
> BTW, as someone who once was the active maintainer for PXA, and later 
> the active maintainer for Orion, I should say that ehci-mv is a terribly 
> bad name (as demonstrated, not all Marvell SOCs use ehci-mv) and 
> confusion would be much reduced if it was renamed to ehci-pxa.

How about like this (to differentiate against pxa168):

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 353cdd4..e1bc205 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -194,8 +194,8 @@ config USB_EHCI_S5P
        help
         Enable support for the S5P SOC's on-chip EHCI controller.
 
-config USB_EHCI_MV
-       bool "EHCI support for Marvell on-chip controller"
+config USB_EHCI_MV_PXA
+       bool "EHCI support for Marvell PXA on-chip controller"
        depends on USB_EHCI_HCD
        select USB_EHCI_ROOT_HUB_TT
        ---help---
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index a007a9f..4e1ec71 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1371,8 +1371,8 @@ MODULE_LICENSE ("GPL");
 #define PLATFORM_DRIVER                ehci_xls_driver
 #endif
 
-#ifdef CONFIG_USB_EHCI_MV
-#include "ehci-mv.c"
+#ifdef CONFIG_USB_EHCI_MV_PXA
+#include "ehci-mvpxa.c"
 #define        PLATFORM_DRIVER         ehci_mv_driver
 #endif

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
