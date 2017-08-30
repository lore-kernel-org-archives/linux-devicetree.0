From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] PCI: mediatek: take use of PCI_NUM_INTX
Date: Wed, 30 Aug 2017 08:24:39 -0500
Message-ID: <20170830132439.GA15438@bhelgaas-glaptop.roam.corp.google.com>
References: <1504055954-31545-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1504055954-31545-1-git-send-email-honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xinping.qian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 30, 2017 at 09:19:14AM +0800, honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Switch from using a custom NUM_INTX macro to the generic PCI_NUM_INTX
> definition for the number of INTx interrupts.
> 
> Signed-off-by: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

I rebased pci/host-mediatek on top of pci/irq-intx (which adds
PCI_NUM_INTX) and applied this for v4.14, thanks!

> ---
>  drivers/pci/host/pcie-mediatek.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/host/pcie-mediatek.c b/drivers/pci/host/pcie-mediatek.c
> index c567996..5c0ce9b 100644
> --- a/drivers/pci/host/pcie-mediatek.c
> +++ b/drivers/pci/host/pcie-mediatek.c
> @@ -77,7 +77,6 @@
>  #define PCIE_INT_MASK		0x420
>  #define INTX_MASK		GENMASK(19, 16)
>  #define INTX_SHIFT		16
> -#define INTX_NUM		4
>  #define PCIE_INT_STATUS		0x424
>  #define MSI_STATUS		BIT(23)
>  #define PCIE_IMSI_STATUS	0x42c
> @@ -576,7 +575,7 @@ static int mtk_pcie_init_irq_domain(struct mtk_pcie_port *port,
>  		return -ENODEV;
>  	}
>  
> -	port->irq_domain = irq_domain_add_linear(pcie_intc_node, INTX_NUM,
> +	port->irq_domain = irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
>  						 &intx_domain_ops, port);
>  	if (!port->irq_domain) {
>  		dev_err(dev, "failed to get INTx IRQ domain\n");
> @@ -594,7 +593,7 @@ static irqreturn_t mtk_pcie_intr_handler(int irq, void *data)
>  	u32 bit = INTX_SHIFT;
>  
>  	while ((status = readl(port->base + PCIE_INT_STATUS)) & INTX_MASK) {
> -		for_each_set_bit_from(bit, &status, INTX_NUM + INTX_SHIFT) {
> +		for_each_set_bit_from(bit, &status, PCI_NUM_INTX + INTX_SHIFT) {
>  			/* Clear the INTx */
>  			writel(1 << bit, port->base + PCIE_INT_STATUS);
>  			virq = irq_find_mapping(port->irq_domain,
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
