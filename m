From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] PCI: Mediatek: clear irq status after irq dispathed to
 avoid reentry
Date: Thu, 21 Dec 2017 09:37:14 +0800
Message-ID: <1513820234.25872.1.camel@mhfsdcap03>
References: <1513738334-26213-1-git-send-email-honghui.zhang@mediatek.com>
         <20171221005240.GC30595@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221005240.GC30595-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xinping.qian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2017-12-20 at 18:52 -0600, Bjorn Helgaas wrote:
> [+cc Lorenzo, please cc him on all drivers/{host,dwc,endpoint} material]
> 
> Please run "git log --oneline drivers/pci/host/pcie-mediatek.c" and
> make yours match.  Same capitalization, same sentence structure, etc.,
> e.g.,
> 
>   PCI: mediatek: Clear IRQ status ...
> 
> s/dispathed/dispatched/
> 
> s/irq/IRQ/ in the summary and all the English text below.

Thanks for your review and sorry for the mismatch, I will fix that in
next version.

> 
> On Wed, Dec 20, 2017 at 10:52:14AM +0800, honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > There maybe a same irq reentry scenario after irq received in current
> > irq handle flow:
> > 	EP device		PCIe host driver	EP driver
> > 1. issue an irq
> > 			2. received irq
> > 			3. clear irq status
> > 			4. dispatch irq
> > 						5. clear irq source
> > The irq status was not successfully cleared at step 2 since the irq
> > source was not cleared yet. So the PCIe host driver may receive the
> > same irq after step 5. Then there's an irq reentry occurred.
> > Even worse, if the reentry irq was not an irq that EP driver expected,
> > it may not handle the irq. Then we may run into the dead loop from
> 
> By "dead loop" I assume you mean "infinite loop"?  I don't think it's
> a deadlock since nothing is waiting.
> 
Yes, it should be "infinite loop", I will update the commit message in
next version.

thanks.
> > step 2 to step 4.
> > Clear the irq status after irq have been dispatched to avoid the irq
> > reentry.
> > 
> > Signed-off-by: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/pci/host/pcie-mediatek.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/host/pcie-mediatek.c b/drivers/pci/host/pcie-mediatek.c
> > index db93efd..3248771 100644
> > --- a/drivers/pci/host/pcie-mediatek.c
> > +++ b/drivers/pci/host/pcie-mediatek.c
> > @@ -605,11 +605,11 @@ static irqreturn_t mtk_pcie_intr_handler(int irq, void *data)
> >  
> >  	while ((status = readl(port->base + PCIE_INT_STATUS)) & INTX_MASK) {
> >  		for_each_set_bit_from(bit, &status, PCI_NUM_INTX + INTX_SHIFT) {
> > -			/* Clear the INTx */
> > -			writel(1 << bit, port->base + PCIE_INT_STATUS);
> >  			virq = irq_find_mapping(port->irq_domain,
> >  						bit - INTX_SHIFT);
> >  			generic_handle_irq(virq);
> > +			/* Clear the INTx */
> > +			writel(1 << bit, port->base + PCIE_INT_STATUS);
> >  		}
> >  	}
> >  
> > @@ -619,10 +619,10 @@ static irqreturn_t mtk_pcie_intr_handler(int irq, void *data)
> >  
> >  			while ((imsi_status = readl(port->base + PCIE_IMSI_STATUS))) {
> >  				for_each_set_bit(bit, &imsi_status, MTK_MSI_IRQS_NUM) {
> > -					/* Clear the MSI */
> > -					writel(1 << bit, port->base + PCIE_IMSI_STATUS);
> >  					virq = irq_find_mapping(port->msi_domain, bit);
> >  					generic_handle_irq(virq);
> > +					/* Clear the MSI */
> > +					writel(1 << bit, port->base + PCIE_IMSI_STATUS);
> >  				}
> >  			}
> >  			/* Clear MSI interrupt status */
> > -- 
> > 2.6.4
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
