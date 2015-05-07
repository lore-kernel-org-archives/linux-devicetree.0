From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Thu, 07 May 2015 12:01:02 +0200
Message-ID: <20781942.cIPodTiNzG@wuerfel>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com> <7101952.uOJDgn7tgf@wuerfel> <20150506204910.GJ32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150506204910.GJ32500@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 06 May 2015 13:49:10 Brian Norris wrote:
> On Wed, May 06, 2015 at 09:12:43PM +0200, Arnd Bergmann wrote:
> > On Wednesday 06 May 2015 10:59:50 Brian Norris wrote:
> > > +       /*
> > > +        * Some SoCs integrate this controller (e.g., its interrupt bits) in
> > > +        * interesting ways
> > > +        */
> > > +       if (of_property_read_bool(dn, "brcm,nand-soc")) {
> > > +               struct device_node *soc_dn;
> > > +
> > > +               soc_dn = of_parse_phandle(dn, "brcm,nand-soc", 0);
> > > +               if (!soc_dn)
> > > +                       return -ENODEV;
> > > +
> > > +               ctrl->soc = devm_brcmnand_probe_soc(dev, soc_dn);
> > > +               if (!ctrl->soc) {
> > > +                       dev_err(dev, "could not probe SoC data\n");
> > > +                       of_node_put(soc_dn);
> > > +                       return -ENODEV;
> > > +               }
> > > +
> > > +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
> > > +                                      DRV_NAME, ctrl);
> > > +
> > > +               /* Enable interrupt */
> > > +               ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
> > > +
> > > +               of_node_put(soc_dn);
> > > +       } else {
> > > +               /* Use standard interrupt infrastructure */
> > > +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
> > > +                                      DRV_NAME, ctrl);
> > > +       }
> > > 
> > 
> > It looks to me like this should be handled as a nested irqchip, so the node
> > you look up gets used as the "interrupt-parent" instead, making the behavior
> > of this SoC transparent to the nand driver.
> 
> You snipped the rest of the patch, which involves more than just IRQ
> handling. The same registers touch both interrupts and data bus endian
> configuration, so it can't possibly be done transparently to the NAND
> driver.

Anything else in there? The bus configuration would just involve writing
a constant value in some register, right? Doing that in the irqchip
is also a bit ugly, but may still be better overall than doing it the
way you have above.

> > We recently merged nested irqdomain support as well, which might help here,
> > or might not be needed.
> 
> I'm not familiar with nested irqdomains. Do they address anything like
> the above problem?

The problem that nested irqdomains address is when an interrupt is handled
by two irqchips, in particular when one irqchip handles a virtual interrupt
number that was claimed by another irqchip already.

	Arnd
