From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] PCI: Mediatek: clear irq status after irq dispathed to
 avoid reentry
Date: Wed, 20 Dec 2017 11:08:15 +0800
Message-ID: <1513739295.18782.1.camel@mtkswgap22>
References: <1513738334-26213-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513738334-26213-1-git-send-email-honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xinping.qian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-12-20 at 10:52 +0800, honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> There maybe a same irq reentry scenario after irq received in current
> irq handle flow:
> 	EP device		PCIe host driver	EP driver
> 1. issue an irq
> 			2. received irq
> 			3. clear irq status
> 			4. dispatch irq
> 						5. clear irq source
> The irq status was not successfully cleared at step 2 since the irq
> source was not cleared yet. So the PCIe host driver may receive the
> same irq after step 5. Then there's an irq reentry occurred.
> Even worse, if the reentry irq was not an irq that EP driver expected,
> it may not handle the irq. Then we may run into the dead loop from
> step 2 to step 4.
> Clear the irq status after irq have been dispatched to avoid the irq
> reentry.
> 
> Signed-off-by: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/pci/host/pcie-mediatek.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/host/pcie-mediatek.c b/drivers/pci/host/pcie-mediatek.c
> index db93efd..3248771 100644
> --- a/drivers/pci/host/pcie-mediatek.c
> +++ b/drivers/pci/host/pcie-mediatek.c
> @@ -605,11 +605,11 @@ static irqreturn_t mtk_pcie_intr_handler(int irq, void *data)
>  
>  	while ((status = readl(port->base + PCIE_INT_STATUS)) & INTX_MASK) {
>  		for_each_set_bit_from(bit, &status, PCI_NUM_INTX + INTX_SHIFT) {
> -			/* Clear the INTx */
> -			writel(1 << bit, port->base + PCIE_INT_STATUS);
>  			virq = irq_find_mapping(port->irq_domain,
>  						bit - INTX_SHIFT);
>  			generic_handle_irq(virq);
> +			/* Clear the INTx */
> +			writel(1 << bit, port->base + PCIE_INT_STATUS);
>  		}
>  	}
>  
> @@ -619,10 +619,10 @@ static irqreturn_t mtk_pcie_intr_handler(int irq, void *data)
>  
>  			while ((imsi_status = readl(port->base + PCIE_IMSI_STATUS))) {
>  				for_each_set_bit(bit, &imsi_status, MTK_MSI_IRQS_NUM) {
> -					/* Clear the MSI */
> -					writel(1 << bit, port->base + PCIE_IMSI_STATUS);
>  					virq = irq_find_mapping(port->msi_domain, bit);
>  					generic_handle_irq(virq);
> +					/* Clear the MSI */
> +					writel(1 << bit, port->base + PCIE_IMSI_STATUS);
>  				}
>  			}
>  			/* Clear MSI interrupt status */

Acked-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Thanks.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
