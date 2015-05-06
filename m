From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Wed, 6 May 2015 13:49:10 -0700
Message-ID: <20150506204910.GJ32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <1430935194-7579-7-git-send-email-computersforpeace@gmail.com>
 <7101952.uOJDgn7tgf@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7101952.uOJDgn7tgf@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 06, 2015 at 09:12:43PM +0200, Arnd Bergmann wrote:
> On Wednesday 06 May 2015 10:59:50 Brian Norris wrote:
> > +       /*
> > +        * Some SoCs integrate this controller (e.g., its interrupt bits) in
> > +        * interesting ways
> > +        */
> > +       if (of_property_read_bool(dn, "brcm,nand-soc")) {
> > +               struct device_node *soc_dn;
> > +
> > +               soc_dn = of_parse_phandle(dn, "brcm,nand-soc", 0);
> > +               if (!soc_dn)
> > +                       return -ENODEV;
> > +
> > +               ctrl->soc = devm_brcmnand_probe_soc(dev, soc_dn);
> > +               if (!ctrl->soc) {
> > +                       dev_err(dev, "could not probe SoC data\n");
> > +                       of_node_put(soc_dn);
> > +                       return -ENODEV;
> > +               }
> > +
> > +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
> > +                                      DRV_NAME, ctrl);
> > +
> > +               /* Enable interrupt */
> > +               ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
> > +
> > +               of_node_put(soc_dn);
> > +       } else {
> > +               /* Use standard interrupt infrastructure */
> > +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
> > +                                      DRV_NAME, ctrl);
> > +       }
> > 
> 
> It looks to me like this should be handled as a nested irqchip, so the node
> you look up gets used as the "interrupt-parent" instead, making the behavior
> of this SoC transparent to the nand driver.

You snipped the rest of the patch, which involves more than just IRQ
handling. The same registers touch both interrupts and data bus endian
configuration, so it can't possibly be done transparently to the NAND
driver.

> We recently merged nested irqdomain support as well, which might help here,
> or might not be needed.

I'm not familiar with nested irqdomains. Do they address anything like
the above problem?

Brian
