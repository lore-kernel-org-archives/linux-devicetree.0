From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 20 Mar 2012 23:54:53 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1203202348150.24151@xanadu.home>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203202057.38365.arnd@arndb.de>
 <20120320220156.GI2484@titan.lakedaemon.net> <201203202215.09227.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <201203202215.09227.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 20 Mar 2012, Arnd Bergmann wrote:

> ehci-orion only makes sense on PLAT_ORION, and they never have any
> other platform ehci driver.
> 
> ehci-mv only makese sense on PLAT_PXA, and they  also don't have any
> other platform ehci driver.

BTW, as someone who once was the active maintainer for PXA, and later 
the active maintainer for Orion, I should say that ehci-mv is a terribly 
bad name (as demonstrated, not all Marvell SOCs use ehci-mv) and 
confusion would be much reduced if it was renamed to ehci-pxa.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
