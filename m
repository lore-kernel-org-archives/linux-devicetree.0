From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 17/20] phy: Add support for USB cluster on the Armada
 375 SoC
Date: Wed, 7 May 2014 14:52:39 +0200
Message-ID: <20140507145239.433acdf4@free-electrons.com>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com>
	<1399335255-589-18-git-send-email-gregory.clement@free-electrons.com>
	<20140506135427.GG6503@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140506135427.GG6503-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Tue, 6 May 2014 15:54:27 +0200, Andrew Lunn wrote:

> > +enum {
> > +	PHY_USB2 = 0,
> > +	PHY_USB3 = 1,
> > +};
> > +
> > +struct armada375_cluster_phy {
> > +	struct phy *phy;
> > +	void __iomem *reg;
> > +	bool enable;
> > +	bool use_usb3;
> 
> Hi Gregory
> 
> nit: How about using the enum you just defined?

Nope, I don't think it's a good idea, because they mean different
things. The enum is used to index the arrays of two PHYs: PHY_USB2 is
the first one, PHY_USB3 is the second one.

On the other hand, the 'use_usb3' field indicates in which mode is a
particular PHY. So it could apply on either of the PHYs, and is
therefore not related to the index of the PHYs in the array.


> > +	usb_cluster_base = of_iomap(np, 0);
> 
> devm_ API?
> 
> Check the return value for an error?

Indeed, I'll use devm_ioremap_resource() here.

> > +	BUG_ON(!usb_cluster_base);
> > +
> > +	for (i = 0; i < NB_PHY; i++) {
> > +		phy = devm_phy_create(dev, &armada375_usb_phy_ops, NULL);
> > +		if (IS_ERR(phy))
> > +			dev_err(dev, "failed to create PHY n%d\n", i);
> > +
> > +		usb_cluster_phy[i].phy = phy;
> > +		usb_cluster_phy[i].reg = usb_cluster_base;
> > +		usb_cluster_phy[i].enable = false;
> > +		phy_set_drvdata(phy, &usb_cluster_phy[i]);
> > +	}
> > +
> > +	usb_cluster_phy[PHY_USB2].use_usb3 = false;
> > +	usb_cluster_phy[PHY_USB3].use_usb3 = true;
> > +
> > +	/*
> > +	 * We can't use the first usb2 unit and usb3 at the same time
> > +	 * to manage a USB2 device, so let's disable usb2 if usb3 is
> > +	 * slelected. In this case USB2 device will be managed by the
> 
> selected

Fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
