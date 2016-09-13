From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 6/8 v2] arm: orion5x: Add DT-based support for Netgear
 WNR854T
Date: Tue, 13 Sep 2016 14:36:39 +0200
Message-ID: <20160913123639.GB15332@lunn.ch>
References: <1472203264-21089-7-git-send-email-jm@lentin.co.uk>
 <1473109646-23366-1-git-send-email-jm@lentin.co.uk>
 <20160912170625.GA7420@rob-hp-laptop>
 <2920481.EgEQnLmOkM@wuerfel>
 <20160912220344.GM11400@lunn.ch>
 <88e40f0c6cafec244dc16af5a03cfb44@jamie.lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <88e40f0c6cafec244dc16af5a03cfb44-SBYVURHw+sBNwP/n92qj9LVCufUGDwFn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 13, 2016 at 10:10:41AM +0100, Jamie Lentin wrote:
> On 2016-09-12 23:03, Andrew Lunn wrote:
> >>Maybe we can instead leave out the PCI support from the new
> >>file for now and not delete the legacy board file?
> 
> This seems a reasonable compromise. The PCI card the router comes
> with isn't supported by mwl8k mainline anyway (There's STA-only
> firmware that can be extracted from a windows driver and PCI IDs
> added, but stats reporting uses a different format), so it's not a
> huge loss, although many did replace the card with something
> Atheros-based.

O.K. So dropping the PCI code gets us going forward.
Have we missed the merge window?

> Unfortunately the power regulator on my spare router has stopped
> regulating, which will make more development tricky.

The Green Light of death?

> >Jamie, which interrupt do you see the WiFi card using?  If it is
> >IRQ_ORION5X_PCIE0_INT, (1 + 11), that is probably easier to deal with
> >than if it uses GPIO 4.
> 
> Definitely uses GPIO 4.

O.K, that makes it more interesting. As far as i can see, no other
PCIe system uses a GPIO for its interrupt. There is no core support
for this, or any bus driver doing it. So there is no binding to
follow.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
