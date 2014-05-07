From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 17/20] phy: Add support for USB cluster on the Armada
 375 SoC
Date: Wed, 7 May 2014 14:55:36 +0200
Message-ID: <20140507145536.29003dfa@free-electrons.com>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com>
	<1399335255-589-18-git-send-email-gregory.clement@free-electrons.com>
	<20140506205330.GA27308@arch.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140506205330.GA27308-nAQHv47ARr+vIlHkl8J1cg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Ezequiel Garcia,

On Tue, 6 May 2014 17:53:30 -0300, Ezequiel Garcia wrote:

> > +#define USB2_PHY_CONFIG_ENABLE BIT(0) /* active low */
> > +
> 
> I still think it's more readable to use USB2_PHY_CONFIG_DISABLE.
> It's just a nitpick, though.

Yes, fixed.

> > +static int armada375_usb_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct phy *phy;
> > +	struct device_node *np = dev->of_node;
> > +	struct phy_provider *phy_provider;
> > +	void __iomem *usb_cluster_base;
> > +	struct device_node *xhci_node;
> > +	int i;
> > +
> > +	usb_cluster_base = of_iomap(np, 0);
> > +	BUG_ON(!usb_cluster_base);
> > +
> 
> Isn't a bit extreme to call BUG_ON (and thus bring down the whole system)
> in a phy driver?

Indeed, fixed by a more normal error return.

> > +	for (i = 0; i < NB_PHY; i++) {
> > +		phy = devm_phy_create(dev, &armada375_usb_phy_ops, NULL);
> > +		if (IS_ERR(phy))
> > +			dev_err(dev, "failed to create PHY n%d\n", i);
> > +
> 
> I think you're missing a continue/break here.

Indeed, fixed, I just do a return from the ->probe() function if
creating the PHY fails.

> > +MODULE_DESCRIPTION("Armada 375 USB cluster driver");
> > +MODULE_AUTHOR("Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>");
> > +MODULE_LICENSE("GPL");
> 
> GPL v2 ?

Well, using just "GPL" seems to be the more common usage through the
kernel:

linux/drivers $ git grep MODULE_LICENSE | grep "\"GPL\"" | wc -l
4276
linux/drivers $ git grep MODULE_LICENSE | grep "\"GPLv2\"" | wc -l
5
linux/drivers $ git grep MODULE_LICENSE | grep "\"GPL v2\"" | wc -l
841

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
