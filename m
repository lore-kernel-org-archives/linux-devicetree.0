From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Wed, 21 Mar 2012 09:34:28 +0100
Message-ID: <20120321083428.GA25111@lunn.ch>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203202057.38365.arnd@arndb.de>
 <20120320220156.GI2484@titan.lakedaemon.net>
 <201203202215.09227.arnd@arndb.de>
 <alpine.LFD.2.02.1203202348150.24151@xanadu.home>
 <CAN1soZymEsMiivL_76o_g+-P1HhLx72Z2vbV3HBDs0x+oeWn+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAN1soZymEsMiivL_76o_g+-P1HhLx72Z2vbV3HBDs0x+oeWn+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 21, 2012 at 04:21:45PM +0800, Haojian Zhuang wrote:
> On Wed, Mar 21, 2012 at 11:54 AM, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> wrote:
> > On Tue, 20 Mar 2012, Arnd Bergmann wrote:
> >
> >> ehci-orion only makes sense on PLAT_ORION, and they never have any
> >> other platform ehci driver.
> >>
> >> ehci-mv only makese sense on PLAT_PXA, and they ?also don't have any
> >> other platform ehci driver.
> >
> > BTW, as someone who once was the active maintainer for PXA, and later
> > the active maintainer for Orion, I should say that ehci-mv is a terribly
> > bad name (as demonstrated, not all Marvell SOCs use ehci-mv) and
> > confusion would be much reduced if it was renamed to ehci-pxa.
> >
> >
> OK. We could try to rename ehci-mv to ehci-pxa.
> 
> By the way, we aren't allowed to append "depends on PLAT_PXA" in Kconfig.

Hi Hoajian

Could you explain that a bit more? What was the reason you could not
append it? Is the driver used by some other platform as well?

       Thanks
  	Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
