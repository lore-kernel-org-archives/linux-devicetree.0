From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/6] PCI: generic: Only fixup irqs for bus we are
 creating.
Date: Tue, 15 Sep 2015 18:36:55 +0100
Message-ID: <20150915173654.GJ31157@arm.com>
References: <1442013719-5001-1-git-send-email-ddaney.cavm@gmail.com>
 <1442013719-5001-3-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442013719-5001-3-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Sat, Sep 12, 2015 at 12:21:55AM +0100, David Daney wrote:
> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> 
> Use pci_walk_bus() to restrict the fixup irq actions to only the bus
> being created.
> 
> If we create multiple buses with pci-host-generic, or there are buses
> created by other drivers, we don't want to call pci_fixup_irqs() which
> operates on all devices, not just the devices on the bus being added.
> The consequence is that either the fixups are done more than once, or
> in some cases incorrect fixups could be applied.
> 
> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/host/pci-host-generic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/host/pci-host-generic.c b/drivers/pci/host/pci-host-generic.c
> index 265dd25..a0fb241 100644
> --- a/drivers/pci/host/pci-host-generic.c
> +++ b/drivers/pci/host/pci-host-generic.c
> @@ -205,6 +205,12 @@ static int gen_pci_parse_map_cfg_windows(struct gen_pci *pci)
>  	return 0;
>  }
>  
> +static int gen_pci_fixup_irq_cb(struct pci_dev *dev, void *arg)
> +{
> +	pdev_fixup_irq(dev, pci_common_swizzle, of_irq_parse_and_map_pci);
> +	return 0;
> +}
> +
>  static int gen_pci_probe(struct platform_device *pdev)
>  {
>  	int err;
> @@ -262,7 +268,7 @@ static int gen_pci_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	pci_fixup_irqs(pci_common_swizzle, of_irq_parse_and_map_pci);
> +	pci_walk_bus(bus, gen_pci_fixup_irq_cb, NULL);

Any chance we could put something in the core PCI code for this? I think
any host controller wanting to work with arm64 is potentially going to
run into the same problem.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
