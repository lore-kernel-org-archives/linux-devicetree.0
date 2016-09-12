From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 6/8 v2] arm: orion5x: Add DT-based support for Netgear WNR854T
Date: Mon, 12 Sep 2016 23:19:31 +0200
Message-ID: <2622432.deEWxomPCF@wuerfel>
References: <1472203264-21089-7-git-send-email-jm@lentin.co.uk> <20160912170625.GA7420@rob-hp-laptop> <2920481.EgEQnLmOkM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2920481.EgEQnLmOkM@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, September 12, 2016 11:13:33 PM CEST Arnd Bergmann wrote:
> On Monday, September 12, 2016 12:06:25 PM CEST Rob Herring wrote:
> > On Mon, Sep 05, 2016 at 10:07:26PM +0100, Jamie Lentin wrote:
> > > This is a router based on the mv88f5181 chipset.
> > > 
> > > http://www.netgear.com/support/product/WNR854T.aspx
> > > http://wiki.openwrt.org/toh/netgear/wnr854t
> > > 
> > > Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> > > ---
> > > This removes the contentious vendor partitioning scheme and goes back
> > > to the original partitioning scheme used in non-DT ports to this board.
> > > Using the same partitioning scheme should mean less surprises for
> > > someone trying to upgrade their router.
> > > 
> > > The non-DT PCI setup is still here, as there are other orion5x DT boards
> > > doing very similar things, and can all be converted at the same time.
> > 
> > If we keep accepting this duplicated, legacy PCI setup, who is going to 
> > be motivated to clean things up. But it's ultimately up to Arnd and 
> > Olof.
> > 
> 
> I mentioned before that I'm feeling a bit uneasy about this too.
> 
> Maybe we can instead leave out the PCI support from the new
> file for now and not delete the legacy board file?
> 

Another idea that has worked in the past is that we ask everyone
to do one piece of the puzzle. In this case that could be to
convert the existing PCI support to a proper host driver
in arch/arm/mach-orion5x/pci.c that is separate from the PCIe
support (for which we already have a driver IIRC) and have
it probed by calling pci_scan_root_bus() from a platform
driver init function. The next person who wants DT suppor for
an existing orion machine can then add DT support to that driver.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
