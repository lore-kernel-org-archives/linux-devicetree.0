From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: add Device Tree for the Armada 385 RD board
Date: Thu, 6 Mar 2014 15:21:17 +0100
Message-ID: <20140306142117.GL4780@lunn.ch>
References: <1394107868-26094-1-git-send-email-gregory.clement@free-electrons.com>
 <20140306131429.GJ4780@lunn.ch>
 <5318779C.8030901@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5318779C.8030901-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > Hi Gregory
> > 
> > I guess checkpatch.pl is probably complaining about missing vendor
> > prefix?
> > 
> 
> yes and also about m25p128 itself because it was not explicitly written
> in Documentation/devicetree/bindings/. Actually it was written to "see the
> "m25p_ids" table in drivers/mtd/devices/m25p80.c for the list of" the compatible
> name.
> 
> For the first warning I can add the vendor part, but for the other warning, do we
> really want to copy the m25p_ids table in Documentation/devicetree/bindings/mtd/m25p80.txt ?

I think the DT Maintainers and checkpatch.pl maintainers need to think
about this. Maybe a regex would be enough in
Documentation/devicetree/bindings/mtd/m25p80.txt?

For the moment i would suggest adding a vendor prefix, but nothing
more.


> >> +			/*
> >> +			 * The Ethernet nodes are not ordered by
> >> +			 * address on purpose. Indeed the first
> >> +			 * Ethernet port of the board (Giga0) is
> >> +			 * located at 0x70000 whereas the the second
> >> +			 * Ethernet(Giga 1) port is located at
> >> +			 * 0x30000.
> >> +			 */
> >> +
> >> +			ethernet@70000 {
> >> +				status = "okay";
> >> +				phy = <&phy0>;
> >> +				phy-mode = "rgmii";
> >> +			};
> >> +
> >> +			ethernet@30000 {
> >> +				status = "okay";
> >> +				phy = <&phy1>;
> >> +				phy-mode = "rgmii";
> >> +			};
> >> +
> > 
> > I think you can use aliases to get the order correct, independent of
> > how you list them in DT. That should be a lot safer than assuming
> > things are instantiated from top to bottom.
> 
> It sounds interesting, how would you do this?

As there already is in armada-370-xp.dtsi

        aliases {
                eth0 = &eth0;
                eth1 = &eth1;
        };


	eth0: ethernet@70000 {
	}
        eth1: ethernet@74000 {
	}

This at least works for i2c devices. The pdev->id is set using the
alias number.

      Andrew



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
