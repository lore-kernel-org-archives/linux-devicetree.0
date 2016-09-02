From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] pci: pci-aardvark: move to MSI handling using generic
 MSI support
Date: Fri, 2 Sep 2016 09:42:39 +0100
Message-ID: <57C93B7F.8050909@arm.com>
References: <1472744284-18305-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1472744284-18305-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472744284-18305-2-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Victor Gu <xigu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

I haven't checked things is details (mostly because the resulting diff
is impossible to read), but one thing caught my eye:

On 01/09/16 16:38, Thomas Petazzoni wrote:
> The MSI support introduced with the initial Aardvark driver was based
> on the msi_controller structure and the of_pci_msi_chip_add() /
> of_pci_find_msi_chip_by_node() API, which are being deprecated in
> favor of the generic MSI support.
> 
> Therefore, this commit updates the Aardvark driver to use the generic
> MSI support.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/pci/host/pci-aardvark.c | 172 ++++++++++++++++------------------------
>  1 file changed, 67 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/pci/host/pci-aardvark.c b/drivers/pci/host/pci-aardvark.c
> index ef9893f..0675cfa 100644
> --- a/drivers/pci/host/pci-aardvark.c
> +++ b/drivers/pci/host/pci-aardvark.c

[...]

> -static int advk_pcie_setup_msi_irq(struct msi_controller *chip,
> -				   struct pci_dev *pdev,
> -				   struct msi_desc *desc)
> +static int advk_msi_irq_domain_alloc(struct irq_domain *domain,
> +				     unsigned int virq,
> +				     unsigned int nr_irqs, void *args)
>  {
> -	struct advk_pcie *pcie = pdev->bus->sysdata;
> -	struct msi_msg msg;
> -	int virq, hwirq;
> -	phys_addr_t msi_msg_phys;
> -
> -	/* We support MSI, but not MSI-X */
> -	if (desc->msi_attrib.is_msix)
> -		return -EINVAL;

You used not to support MSIX...

[...]

> @@ -677,30 +650,25 @@ static int advk_pcie_init_msi_irq_domain(struct advk_pcie *pcie)
>  {
>  	struct device *dev = &pcie->pdev->dev;
>  	struct device_node *node = dev->of_node;
> -	struct irq_chip *msi_irq_chip;
> -	struct msi_controller *msi;
> +	struct irq_chip *bottom_ic, *msi_ic;
> +	struct msi_domain_info *msi_di;
>  	phys_addr_t msi_msg_phys;
> -	int ret;
> -
> -	msi_irq_chip = &pcie->msi_irq_chip;
>  
> -	msi_irq_chip->name = devm_kasprintf(dev, GFP_KERNEL, "%s-msi",
> -					    dev_name(dev));
> -	if (!msi_irq_chip->name)
> -		return -ENOMEM;
> +	mutex_init(&pcie->msi_used_lock);
>  
> -	msi_irq_chip->irq_enable = pci_msi_unmask_irq;
> -	msi_irq_chip->irq_disable = pci_msi_mask_irq;
> -	msi_irq_chip->irq_mask = pci_msi_mask_irq;
> -	msi_irq_chip->irq_unmask = pci_msi_unmask_irq;
> +	bottom_ic = &pcie->msi_bottom_irq_chip;
>  
> -	msi = &pcie->msi;
> +	bottom_ic->name = "MSI";
> +	bottom_ic->irq_compose_msi_msg = advk_msi_irq_compose_msi_msg;
> +	bottom_ic->irq_set_affinity = advk_msi_set_affinity;
>  
> -	msi->setup_irq = advk_pcie_setup_msi_irq;
> -	msi->teardown_irq = advk_pcie_teardown_msi_irq;
> -	msi->of_node = node;
> +	msi_ic = &pcie->msi_irq_chip;
> +	msi_ic->name = "advk-MSI";
>  
> -	mutex_init(&pcie->msi_used_lock);
> +	msi_di = &pcie->msi_domain_info;
> +	msi_di->flags = MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
> +		MSI_FLAG_PCI_MSIX;

And yet you now advertize MSIX support. Was this an oversight in the
original code?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
