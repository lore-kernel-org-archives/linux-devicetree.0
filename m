From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/5] PCI: generic: Quit clobbering our pci_ops.
Date: Thu, 8 Oct 2015 10:02:16 -0500
Message-ID: <20151008150215.GB3885@localhost>
References: <1443811443-18878-1-git-send-email-ddaney.cavm@gmail.com>
 <1443811443-18878-4-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443811443-18878-4-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[+cc Arnd]

Arnd, you had comments on the previous version.  What do you think of
this one?

On Fri, Oct 02, 2015 at 11:44:01AM -0700, David Daney wrote:
> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> 
> The pci-host-generic driver keeps a global struct pci_ops which it
> then patches with the .map_bus method appropriate for the bus device.
> A problem arises when the driver is used for two different types of
> bus devices, the .map_bus method for the last device probed clobbers
> the method for all previous devices.  The result, only the last bus
> device probed has the proper .map_bus, and the others fail.
> 
> Move the struct pci_ops into the bus specific structure, and
> initialize a pointer to it when the bus device is probed.
> 
> Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> ---
> Change from v3: Use pointer to ops rather than make a copy.
> 
>  drivers/pci/host/pci-host-generic.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/host/pci-host-generic.c b/drivers/pci/host/pci-host-generic.c
> index 9e9f1c3..216ded5 100644
> --- a/drivers/pci/host/pci-host-generic.c
> +++ b/drivers/pci/host/pci-host-generic.c
> @@ -27,7 +27,7 @@
>  
>  struct gen_pci_cfg_bus_ops {
>  	u32 bus_shift;
> -	void __iomem *(*map_bus)(struct pci_bus *, unsigned int, int);
> +	struct pci_ops ops;
>  };
>  
>  struct gen_pci_cfg_windows {
> @@ -35,7 +35,7 @@ struct gen_pci_cfg_windows {
>  	struct resource				*bus_range;
>  	void __iomem				**win;
>  
> -	const struct gen_pci_cfg_bus_ops	*ops;
> +	struct gen_pci_cfg_bus_ops		*ops;
>  };
>  
>  /*
> @@ -65,7 +65,11 @@ static void __iomem *gen_pci_map_cfg_bus_cam(struct pci_bus *bus,
>  
>  static struct gen_pci_cfg_bus_ops gen_pci_cfg_cam_bus_ops = {
>  	.bus_shift	= 16,
> -	.map_bus	= gen_pci_map_cfg_bus_cam,
> +	.ops		= {
> +		.map_bus	= gen_pci_map_cfg_bus_cam,
> +		.read		= pci_generic_config_read,
> +		.write		= pci_generic_config_write,
> +	}
>  };
>  
>  static void __iomem *gen_pci_map_cfg_bus_ecam(struct pci_bus *bus,
> @@ -80,12 +84,11 @@ static void __iomem *gen_pci_map_cfg_bus_ecam(struct pci_bus *bus,
>  
>  static struct gen_pci_cfg_bus_ops gen_pci_cfg_ecam_bus_ops = {
>  	.bus_shift	= 20,
> -	.map_bus	= gen_pci_map_cfg_bus_ecam,
> -};
> -
> -static struct pci_ops gen_pci_ops = {
> -	.read	= pci_generic_config_read,
> -	.write	= pci_generic_config_write,
> +	.ops		= {
> +		.map_bus	= gen_pci_map_cfg_bus_ecam,
> +		.read		= pci_generic_config_read,
> +		.write		= pci_generic_config_write,
> +	}
>  };
>  
>  static const struct of_device_id gen_pci_of_match[] = {
> @@ -234,8 +237,7 @@ static int gen_pci_probe(struct platform_device *pdev)
>  	}
>  
>  	of_id = of_match_node(gen_pci_of_match, np);
> -	pci->cfg.ops = of_id->data;
> -	gen_pci_ops.map_bus = pci->cfg.ops->map_bus;
> +	pci->cfg.ops = (struct gen_pci_cfg_bus_ops *)of_id->data;
>  	pci->host.dev.parent = dev;
>  	INIT_LIST_HEAD(&pci->host.windows);
>  	INIT_LIST_HEAD(&pci->resources);
> @@ -256,7 +258,8 @@ static int gen_pci_probe(struct platform_device *pdev)
>  	if (!pci_has_flag(PCI_PROBE_ONLY))
>  		pci_add_flags(PCI_REASSIGN_ALL_RSRC | PCI_REASSIGN_ALL_BUS);
>  
> -	bus = pci_scan_root_bus(dev, 0, &gen_pci_ops, pci, &pci->resources);
> +	bus = pci_scan_root_bus(dev, 0,
> +				&pci->cfg.ops->ops, pci, &pci->resources);
>  	if (!bus) {
>  		dev_err(dev, "Scanning rootbus failed");
>  		return -ENODEV;
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
