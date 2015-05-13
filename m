From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 08/11] mtd: brcmnand: add BCM63138 support
Date: Wed, 13 May 2015 12:45:21 -0700
Message-ID: <20150513194521.GF11598@ld-irv-0074>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
 <1431478424-29230-9-git-send-email-computersforpeace@gmail.com>
 <7133995.DH7aRmliCR@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7133995.DH7aRmliCR@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 13, 2015 at 12:49:01PM +0200, Arnd Bergmann wrote:
> On Tuesday 12 May 2015 17:53:41 Brian Norris wrote:
> > +static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
> > +{
> > +       struct bcm63138_nand_soc_priv *priv = soc->priv;
> > +       void __iomem *mmio = priv->base + BCM63138_NAND_INT_STATUS;
> > +       u32 val = brcmnand_readl(mmio);
> > +
> > +       if (val & BCM63138_CTLRDY) {
> > +               brcmnand_writel(val & ~BCM63138_CTLRDY, mmio);
> > +               return true;
> > +       }
> > +
> > +       return false;
> > +}
> ...
> > +static int bcm63138_nand_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct bcm63138_nand_soc_priv *priv;
> > +       struct brcmnand_soc *soc;
> > +       struct resource *res;
> > +
> > +       soc = devm_kzalloc(dev, sizeof(*soc), GFP_KERNEL);
> > +       if (!soc)
> > +               return -ENOMEM;
> > +
> > +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> 
> This is a slightly unconventional method of doing the abstraction.
> For consistency with a lot of other drivers, I'd do it like this:
> 
> struct bcm63138_controller {
> 	void __iomem *base;
> 	brcmnand_controller parent;
> };

Does it really make sense to publicize all of the brcmnand_controller
details to each of the constituent drivers? I was intentionally keeping
them private, with a very small and well-defined interface provided for
shim SoC drivers.

This is kind of a problem that has plagued the wider MTD (and esp. NAND)
subsystem in general; we expose a ton of details to low-level drivers,
and they're free to muck with things however they want, as long as it
ends up working. I'd rather be more intentional in what I expose.

> static bool bcm63138_nand_intc_ack(struct brcmnand_controller *parent)
> {
> 	struct bcm63138_controller *controller;
> 	controller = container_of(parent, struct brcmnand_controller, parent);
> 
> 	...
> }
> 
> static int bcm63138_nand_probe(...)
> {
> 	struct bcm63138_controller *controller;
> 
> 	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> 	...
> 	return brcmnand_probe(pdev, &controller->parent);
> }
> 
> This also simplifies the probe() functions and means less pointer chasing.

I could still avoid one pointer chase and one extra memory allocation by
embedding 'struct brcmnand_soc' in a 'struct bcm63138_nand_soc'. e.g.:

struct bcm63138_nand_soc {
	void __iomem *base;
	struct brcmnand_soc soc;
};

static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
{
	struct bcm63138_nand_soc *priv;
	priv = container_of(soc, struct bcm63138_nand_soc, soc);

	...
}

static int bcm63138_nand_probe(...)
{
	struct bcm63138_nand_soc *priv;

	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
	...
	return brcmnand_probe(pdev, &priv->soc);
}

Brian
