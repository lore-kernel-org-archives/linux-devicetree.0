From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pci/of: Remove dead code
Date: Tue, 29 Apr 2014 13:58:22 +0100
Message-ID: <20140429125822.CF71EC4094A@trevor.secretlab.ca>
References: <1398695541-25921-1-git-send-email-ian.molton@codethink.co.uk>
	<1398695541-25921-2-git-send-email-ian.molton@codethink.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398695541-25921-2-git-send-email-ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 28 Apr 2014 15:32:21 +0100, Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org> wrote:
> 	Commit 98d9f30c820d509145757e6ecbc36013aa02f7bc
> "pci/of: Match PCI devices to OF nodes dynamically" introduced a lot of code
> derived from the PPC PCI code, including some likes which were redundant.
> 
> Remove these lines.
> 
> Reviewed-by: William Towle <william.towle-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> Signed-off-by: Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>

Good catch. Applied.

g.

> ---
>  drivers/of/of_pci_irq.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/of/of_pci_irq.c b/drivers/of/of_pci_irq.c
> index 8736bc7..7e4e214 100644
> --- a/drivers/of/of_pci_irq.c
> +++ b/drivers/of/of_pci_irq.c
> @@ -19,7 +19,6 @@ int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq
>  	struct device_node *dn, *ppnode;
>  	struct pci_dev *ppdev;
>  	u32 lspec;
> -	__be32 lspec_be;
>  	__be32 laddr[3];
>  	u8 pin;
>  	int rc;
> @@ -87,7 +86,6 @@ int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq
>  	out_irq->np = ppnode;
>  	out_irq->args_count = 1;
>  	out_irq->args[0] = lspec;
> -	lspec_be = cpu_to_be32(lspec);
>  	laddr[0] = cpu_to_be32((pdev->bus->number << 16) | (pdev->devfn << 8));
>  	laddr[1] = laddr[2] = cpu_to_be32(0);
>  	return of_irq_parse_raw(laddr, out_irq);
> -- 
> 1.9.1
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
