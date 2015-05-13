From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 08/11] mtd: brcmnand: add BCM63138 support
Date: Wed, 13 May 2015 13:24:15 -0700
Message-ID: <20150513202415.GI11598@ld-irv-0074>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
 <7133995.DH7aRmliCR@wuerfel>
 <20150513194521.GF11598@ld-irv-0074>
 <5685584.0QXUdSHDpG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5685584.0QXUdSHDpG@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 13, 2015 at 10:02:49PM +0200, Arnd Bergmann wrote:
> On Wednesday 13 May 2015 12:45:21 Brian Norris wrote:
> > I could still avoid one pointer chase and one extra memory allocation by
> > embedding 'struct brcmnand_soc' in a 'struct bcm63138_nand_soc'. e.g.:
> > 
> > struct bcm63138_nand_soc {
> > 	void __iomem *base;
> > 	struct brcmnand_soc soc;
> > };
> > 
> > static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
> > {
> > 	struct bcm63138_nand_soc *priv;
> > 	priv = container_of(soc, struct bcm63138_nand_soc, soc);
> > 
> > 	...
> > }
> > 
> > static int bcm63138_nand_probe(...)
> > {
> > 	struct bcm63138_nand_soc *priv;
> > 
> > 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > 	...
> > 	return brcmnand_probe(pdev, &priv->soc);
> > }
> 
> That would make struct brcmnand_soc an empty structure, right?

No, it still contains the function pointers for our callbacks, which is
the entire point. I guess it's more of a 'nand_soc_ops' structure than a
'nand_soc' pointer now though.

> I think that's fine though, at least it avoids passing void pointers
> and it avoids one of the two allocations you do.
> 
> There is another variation of this model, which some drivers use:
> 
> static int bcm63138_nand_probe(...)
> {
> 	struct bcm63138_nand_soc *priv;
> 	struct brcmnand_controller *controller;
> 
> 	controller = brcmnand_controller_alloc(dev, sizeof (*priv));
> 
> 	priv = brcmnand_controller_priv(controller);
> 
> 	...
> 
> 	return brcmnand_register(controller);
> }
> 
> struct brcmnand_controller *brcmnand_controller_alloc(struct device *pdev, size_t extra)
> {
> 	struct brcmnand_controller *p = dev_kzalloc(dev, sizeof(*p) + extra);
> 
> 	...
> 
> 	return p;
> }
> 
> void *brcmnand_controller_priv(brcmnand_controller *p)
> {
> 	/* extra data follows at the next byte after the controller structure */
> 	return p + 1;
> }

Ah, so this allows the driver to still be agnostic about the contents of
brcmnand_controller.

> Some subsystem maintainers prefer this model over the other one, up to you.

I'll probably stick with mine. But thanks for the suggestion. I'll keep
it in mind. I was actually thinking of imitating this model for other
larger portions of drivers/mtd/nand/, to aid in bounding what drivers
are expected to do vs. allowing the core subsystem to handle things.

Brian
