From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 2/2] PCI: Rockchip: Add Rockchip PCIe controller support
Date: Fri, 1 Jul 2016 11:32:51 +0100
Message-ID: <577646D3.7040207@arm.com>
References: <1467336290-11282-1-git-send-email-shawn.lin@rock-chips.com>
 <1467336290-11282-2-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1467336290-11282-2-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/07/16 02:24, Shawn Lin wrote:
> This patch adds Rockchip PCIe controller support found
> on RK3399 Soc platform.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> ---

[...]

> +static void rockchip_pcie_legacy_int_handler(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	struct rockchip_pcie_port *port;
> +	u32 reg;
> +
> +	chained_irq_enter(chip, desc);
> +	port = irq_desc_get_handler_data(desc);
> +
> +	reg = pcie_read(port, PCIE_CLIENT_INT_STATUS);
> +	reg = (reg & ROCKCHIP_PCIE_RPIFR1_INTR_MASK) >>
> +	       ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT;
> +	if (reg)
> +		generic_handle_irq(irq_find_mapping(port->irq_domain,
> +						    ffs(reg)));

Can't you get multiple pending interrupts at the same time? Here, you
seem to only process one interrupt at a time, which is going to be
pretty inefficient.

How about something like:

	while (reg) {
		int hwirq = ffs(reg);
		int irq;
		
		reg &= ~BIT(hwirq);
		irq = irq_find_mapping(port->irq_domain, hwirq);
		if (irq)
			generic_handle_irq(irq);
	}

> +	chained_irq_exit(chip, desc);
> +}
> +

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
