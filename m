From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V6 03/12] phy: st-miphy40lp: Add binding information
Date: Fri, 21 Feb 2014 15:25:27 +0000
Message-ID: <20140221152527.GC20449@e106331-lin.cambridge.arm.com>
References: <cover.1392109054.git.mohit.kumar@st.com>
 <2CC2A0A4A178534D93D5159BF3BCB66189FD2CAFB1@EAPEX1MAIL1.st.com>
 <20140218122324.GA23267@e106331-lin.cambridge.arm.com>
 <201402181558.14663.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201402181558.14663.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mohit KUMAR DCG <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>, Pratyush ANAND <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 02:58:14PM +0000, Arnd Bergmann wrote:
> On Tuesday 18 February 2014, Mark Rutland wrote:
> > > 
> > > - These are Spear SoC specific miscellaneous registers. Here these are used for
> > > to configure sata/pcie  aux clock.
> > > > 
> > > > > +- phy-id: Instance id of the phy.
> > > > > +- #phy-cells : from the generic PHY bindings, must be 1.
> > > > > + - 1st cell: phandle to the phy node.
> > > > > + - 2nd cell: 0 if phy (in 1st cell) is to be used for SATA, 1 for PCIe
> > > > > +   and 2 for Super Speed USB.
> > > > 
> > > > One cell or two?
> > > 
> > > - No of cells are two, is this the question?
> > 
> > The description of #phy-cells says it must be 1. Presumably it must be 2.
> 
> The description here is counting the phandle, while we normally only
> count the arguments following the phandle. #phy-cells=<1> is correct
> here, but the description should be written a bit clearer.

Ah, yes. I clearly hadn't read thoroughly enough.

We could just drop mention of the phandle under the #phy-cells
description; it's not relevant to the meaning of the single phy-specific
cell, and per the phy binding it's obviously required in clients.

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
