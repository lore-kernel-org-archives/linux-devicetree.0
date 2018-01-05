From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 2/3] PCI: mobiveil: Add Mobiveil PCIe Host Bridge IP
 driver
Date: Fri, 5 Jan 2018 14:01:02 +0000
Message-ID: <20180105140102.GA24933@red-moon>
References: <1513181317-19914-1-git-send-email-l.subrahmanya@mobiveil.co.in>
 <20171220170307.GC1709@red-moon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171220170307.GC1709@red-moon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Subrahmanya Lingappa <l.subrahmanya-DTHOJn6Rh8lhmhkoCovsdw@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mingkai.hu-3arQi8VN3Tc@public.gmane.org, peter.newton-3arQi8VN3Tc@public.gmane.org, minghuan.lian-3arQi8VN3Tc@public.gmane.org, rajesh.raina-3arQi8VN3Tc@public.gmane.org, rajan.kapoor-3arQi8VN3Tc@public.gmane.org, prabhjot.singh-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 20, 2017 at 05:03:07PM +0000, Lorenzo Pieralisi wrote:

[...]

> > +static int mobiveil_pcie_init_irq_domain(struct mobiveil_pcie *pcie)
> > +{
> > +	struct device *dev = &pcie->pdev->dev;
> > +	struct device_node *node = dev->of_node;
> > +	int ret;
> 
> ret is unused
> 
> > +	/* setup INTx */
> > +	pcie->intx_domain = irq_domain_add_linear(node,
> > +				PCI_NUM_INTX + 1, &intx_domain_ops, pcie);
> 
> You should use PCI_NUM_INTX and add pci_irqd_intx_xlate() as the
> domain ops .xlate.

Actually that's not quite correct - so scrap this. The point here is,
the PCI host controller interrupt domain has to have 4 hwirqs (this
is a pseudo interrupt controller - a multiplexer) and it
is through DT interrupt-map that INTx pins (1-4) can be mapped to the
"PCI interrupt controller hwirq inputs" that we consider numbered
from 0 to 3.

It is not that clean-cut but IMO it is the DT interrupt mapping that
should carry out the translation.

See for instance:

arch/arm64/boot/dts/marvell/armada-37xx.dtsi

This requires DT/irqchip maintainers acknowledgement before proceeding.

Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
