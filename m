From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 07/15] of: move of_irq_map_pci() into generic code
Date: Sat, 18 Dec 2010 08:16:37 +1100
Message-ID: <1292620597.16694.541.camel@pasglop>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	 <1292600033-12271-8-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1292600033-12271-8-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, sodaville@linutronix.de, x86@kernel.org, dirk.brandewie@gmail.com, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, 2010-12-17 at 16:33 +0100, Sebastian Andrzej Siewior wrote:
> +
> +#if defined(CONFIG_PPC64) || defined(CONFIG_X86)
> +static struct device_node *pci_get_parent_node(struct pci_dev *pdev)
> +{
> +       return pci_bus_to_OF_node(pdev->bus);
> +}
> +#endif
> +
> +#if defined(CONFIG_PPC32) || defined(CONFIG_MICROBLAZE)
> +static struct device_node *pci_get_parent_node(struct pci_dev *pdev)
> +{
> +       struct pci_controller *host;
> +
> +       host = pci_bus_to_host(pdev->bus);
> +       return host ? host->dn : NULL;
> +}
> +#endif
> + 

I'd like it better if instead you added pci_bus_to_OF_node() to ppc32
and microblaze.

The easy way to do so is to do:

	struct pci_controller *host;

	if (bus->self)
		return pci_device_to_OF_node(bus->self);
	host = pci_bus_to_host(pdev->bus);
	return host ? host->dn : NULL;

Cheers,
Ben.
