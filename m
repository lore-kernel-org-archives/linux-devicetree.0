From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 5/5] Microblaze: Modifying microblaze PCI subsytem to
 support  generic Xilinx  AXI PCIe Host Bridge IP driver
Date: Wed, 3 Feb 2016 10:32:07 -0600
Message-ID: <20160203163207.GC32546@localhost>
References: <1452620173-4905-1-git-send-email-bharatku@xilinx.com>
 <1452620173-4905-6-git-send-email-bharatku@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452620173-4905-6-git-send-email-bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, russell.joyce-3oYoeGyd3e21Qrn1Bg8BZw@public.gmane.org, sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Ravi Kiran Gummaluri <rgummal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[+cc Ben, pcibios_get_phb_of_node() question]

On Tue, Jan 12, 2016 at 11:06:13PM +0530, Bharat Kumar Gogada wrote:
> This patch does required modifications to microblaze PCI subsystem, to
> work with generic driver (drivers/pci/host/pcie-xilinx.c) on Microblaze
> and Zynq.
> 
> Signed-off-by: Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Ravi Kiran Gummaluri <rgummal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>...

>  resource_size_t pcibios_align_resource(void *data, const struct resource *res,
>  				resource_size_t size, resource_size_t align)
>  {
> -	struct pci_dev *dev = data;
>  	resource_size_t start = res->start;
>  
> -	if (res->flags & IORESOURCE_IO) {
> -		if (skip_isa_ioresource_align(dev))
> -			return start;
> -		if (start & 0x300)
> -			start = (start + 0x3ff) & ~0x3ff;
> -	}
> -
>  	return start;

"return res->start;" is sufficient; no need for a temporary variable.

>  }
>  EXPORT_SYMBOL(pcibios_align_resource);
>  
> +int pcibios_add_device(struct pci_dev *dev)
> +{
> +	dev->irq = of_irq_parse_and_map_pci(dev, 0, 0);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(pcibios_add_device);
> +
>  /*
>   * Reparent resource children of pr that conflict with res
>   * under res, and make res replace those children.
> @@ -1335,9 +1308,21 @@ static void pcibios_setup_phb_resources(struct pci_controller *hose,
>  
>  struct device_node *pcibios_get_phb_of_node(struct pci_bus *bus)
>  {
> -	struct pci_controller *hose = bus->sysdata;
> +	struct device_node *np;
> +
> +	for_each_node_by_type(np, "pci") {
> +		const void *prop;
> +		unsigned int bus_min;
> +
> +		prop = of_get_property(np, "bus-range", NULL);
> +		if (!prop)
> +			continue;
> +		bus_min = be32_to_cpup(prop);
> +		if (bus->number == bus_min)
> +			return np;
> +	}
>  
> -	return of_node_get(hose->dn);
> +	return NULL;

Hmmm.  The old microblaze code ("return of_node_get(hose->dn);") is
basically the same as the mips and powerpc versions.  The new code is
basically the same as the x86 version.

I like the generic weak version in drivers/pci/of.c because it doesn't
use any arch-specific data, and it looks like if we just set the
struct device.of_node members correctly, everything should Just Work.

But Ben added both the generic and the x86 versions the same day, so
there must be some complication:

  98d9f30c820d ("pci/of: Match PCI devices to OF nodes dynamically")
  3d5fe5a65af9 ("x86/devicetree: Use generic PCI <-> OF matching")

So I guess my question is, why do we need a microblaze-specific
version at all?

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
