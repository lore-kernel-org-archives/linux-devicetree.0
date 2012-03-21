From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: EHCI_MV confusion was: Re: kirkwood devicetree respin
Date: Wed, 21 Mar 2012 12:27:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1203211226310.1369-100000@iolanthe.rowland.org>
References: <alpine.LFD.2.02.1203211216010.24151@xanadu.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.02.1203211216010.24151-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 21 Mar 2012, Nicolas Pitre wrote:

> On Wed, 21 Mar 2012, Alan Stern wrote:
> 
> > On Wed, 21 Mar 2012, Jason Cooper wrote:
> > 
> > > On Tue, Mar 20, 2012 at 11:54:53PM -0400, Nicolas Pitre wrote:
> > > > On Tue, 20 Mar 2012, Arnd Bergmann wrote:
> > > > 
> > > > > ehci-orion only makes sense on PLAT_ORION, and they never have any
> > > > > other platform ehci driver.
> > > > > 
> > > > > ehci-mv only makese sense on PLAT_PXA, and they  also don't have any
> > > > > other platform ehci driver.
> > > > 
> > > > BTW, as someone who once was the active maintainer for PXA, and later 
> > > > the active maintainer for Orion, I should say that ehci-mv is a terribly 
> > > > bad name (as demonstrated, not all Marvell SOCs use ehci-mv) and 
> > > > confusion would be much reduced if it was renamed to ehci-pxa.

> I think there is still value in the rename.  "mv" is a really bad 
> qualifier for an IP block from a company that has many of them for the 
> same purpose.

Then you should discuss this with the driver's maintainer (CC'ed).

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
