From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv5 07/20] usb: host: xhci-plat: add clock support
Date: Mon, 12 May 2014 16:46:31 +0200
Message-ID: <5370DEC7.9080708@free-electrons.com>
References: <1399832288-19899-1-git-send-email-thomas.petazzoni@free-electrons.com> <1399832288-19899-8-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399832288-19899-8-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mathias, Felipe,

On 11/05/2014 20:17, Thomas Petazzoni wrote:
> From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> Some platforms (such as the Armada 38x ones) can gate the clock of
> their USB controller. This patch adds the support for one clock in
> xhci-plat, by enabling it during probe and disabling it on remove.
> 
> To achieve this, it adds a 'struct clk *' member in xhci_hcd. While
> only used for now in xhci-plat, it might be used by other drivers in
> the future. Moreover, the xhci_hcd structure already holds other
> members such as msix_count and msix_entries, which are MSI-X specific,
> and therefore only used by xhci-pci.

Felpie,

would you agree to add your acked-by on this patch. You gave it on
the 3rd version however as pointed by Thomas there was some issues,
what do you think of this version?


Mathias,

as the xHCI maintainer what is your opinion on this patch. Do you plan
to take it? do you expect a pull request?

We submitted the first version of this series one month ago and we didn't
receive any feedback from you. Maybe it was just because you were happy
with the patch sent, but I would like to be sure that you noticed this
series.

I have the same question for the patch before: "[PATCHv5 06/20] usb: host:
xhci-plat: sort the headers in alphabetic order" and the three following:
"[PATCHv5 07/20] usb: host: xhci-plat: add clock support", "[PATCHv5 08/20]
 usb: host: xhci-plat: add support for the Armada 375/38x XHCI controllers"
and "[PATCHv5 09/20] Documentation: dt-bindings: update xhci-platform DT
binding".


Thanks,

Gregory


> 
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/usb/host/xhci-plat.c | 24 +++++++++++++++++++++++-
>  drivers/usb/host/xhci.h      |  2 ++
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index f5351af..8108e58 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -11,6 +11,7 @@
>   * version 2 as published by the Free Software Foundation.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -91,6 +92,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
>  	struct xhci_hcd		*xhci;
>  	struct resource         *res;
>  	struct usb_hcd		*hcd;
> +	struct clk              *clk;
>  	int			ret;
>  	int			irq;
>  
> @@ -137,14 +139,27 @@ static int xhci_plat_probe(struct platform_device *pdev)
>  		goto release_mem_region;
>  	}
>  
> +	/*
> +	 * Not all platforms have a clk so it is not an error if the
> +	 * clock does not exists.
> +	 */
> +	clk = devm_clk_get(&pdev->dev, NULL);
> +	if (!IS_ERR(clk)) {
> +		ret = clk_prepare_enable(clk);
> +		if (ret)
> +			goto unmap_registers;
> +	}
> +
>  	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (ret)
> -		goto unmap_registers;
> +		goto disable_clk;
> +
>  	device_wakeup_enable(hcd->self.controller);
>  
>  	/* USB 2.0 roothub is stored in the platform_device now. */
>  	hcd = platform_get_drvdata(pdev);
>  	xhci = hcd_to_xhci(hcd);
> +	xhci->clk = clk;
>  	xhci->shared_hcd = usb_create_shared_hcd(driver, &pdev->dev,
>  			dev_name(&pdev->dev), hcd);
>  	if (!xhci->shared_hcd) {
> @@ -173,6 +188,10 @@ put_usb3_hcd:
>  dealloc_usb2_hcd:
>  	usb_remove_hcd(hcd);
>  
> +disable_clk:
> +	if (!IS_ERR(clk))
> +		clk_disable_unprepare(clk);
> +
>  unmap_registers:
>  	iounmap(hcd->regs);
>  
> @@ -189,11 +208,14 @@ static int xhci_plat_remove(struct platform_device *dev)
>  {
>  	struct usb_hcd	*hcd = platform_get_drvdata(dev);
>  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
> +	struct clk *clk = xhci->clk;
>  
>  	usb_remove_hcd(xhci->shared_hcd);
>  	usb_put_hcd(xhci->shared_hcd);
>  
>  	usb_remove_hcd(hcd);
> +	if (!IS_ERR(clk))
> +		clk_disable_unprepare(clk);
>  	iounmap(hcd->regs);
>  	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
>  	usb_put_hcd(hcd);
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index d280e92..003dc09 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1478,6 +1478,8 @@ struct xhci_hcd {
>  	/* msi-x vectors */
>  	int		msix_count;
>  	struct msix_entry	*msix_entries;
> +	/* optional clock */
> +	struct clk		*clk;
>  	/* data structures */
>  	struct xhci_device_context_array *dcbaa;
>  	struct xhci_ring	*cmd_ring;
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
