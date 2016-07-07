From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 2/2] PCI: Rockchip: Add Rockchip PCIe controller support
Date: Wed, 6 Jul 2016 17:44:06 -0700
Message-ID: <20160707004404.GA57063@google.com>
References: <1467789398-13501-1-git-send-email-shawn.lin@rock-chips.com>
 <1467789398-13501-2-git-send-email-shawn.lin@rock-chips.com>
 <20160707001254.GA100467@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160707001254.GA100467-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi again,

On Wed, Jul 06, 2016 at 05:12:55PM -0700, Brian Norris wrote:
> On Wed, Jul 06, 2016 at 03:16:38PM +0800, Shawn Lin wrote:
> > +static void rockchip_pcie_legacy_int_handler(struct irq_desc *desc)
> > +{
> > +	struct irq_chip *chip = irq_desc_get_chip(desc);
> > +	struct rockchip_pcie_port *port;
> > +	u32 reg;
> > +	u32 hwirq;
> > +	u32 virq;
> > +
> > +	chained_irq_enter(chip, desc);
> > +	port = irq_desc_get_handler_data(desc);
> > +
> > +	reg = pcie_read(port, PCIE_CLIENT_INT_STATUS);
> > +	reg = (reg & ROCKCHIP_PCIE_RPIFR1_INTR_MASK) >>
> > +	       ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT;
> > +
> > +	while (reg) {
> > +		hwirq = ffs(reg);

As I noted on the DT binding patch, the use of 'ffs' here is causing you
to make the interrupt controller binding implicitly 1-based, where it
would seemingly make more sense to be 0-based I think.

> > +		reg &= ~BIT(hwirq);
> 
> Per Marc's suggestion, you have created an infinite loop :)
> 
> This should be:
> 
> 	hwirq = ffs(reg);
> 	reg &= ~BIT(hwirq - 1);

So, this should actually be:

		hwirq = ffs(reg) - 1;
		reg &= ~BIT(hwirq);

> ...which brings me to this question: are you ever testing non-MSI (i.e.,
> "legacy") interrupts on this driver? There seems to be quite a bit of
> discussion about the structuring of the interrupt-map and
> interrupt-controller handling, but it appears this mostly/only gets
> actually *used* for the legacy interrupt case, and on my tests, legacy
> interrupts aren't really working, at least not with the new binding
> examples that you proposed. But then, you didn't send a rk3399.dtsi
> update, so perhaps I constructed my DTS wrong...
> 
> If you haven't been testing legacy interrupts, I'd recommend booting
> with "pci=nomsi" and see what happens.
> 
> > +
> > +		virq = irq_find_mapping(port->irq_domain, hwirq);
> > +		if (virq)
> > +			generic_handle_irq(virq);
> > +		else
> > +			dev_err(port->dev, "unexpected IRQ, INT%d\n", hwirq);
> > +	}
> > +
> > +	chained_irq_exit(chip, desc);
> > +}
> > +

Brian
