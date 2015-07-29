From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6] PCI: Store PCIe bus address in struct of_pci_range
Date: Wed, 29 Jul 2015 12:20:53 -0500
Message-ID: <20150729172053.GE31170@google.com>
References: <1438010223-124422-1-git-send-email-gabriele.paoloni@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438010223-124422-1-git-send-email-gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, Liviu.Dudau-5wv7dgnIgG8@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yuanzhichang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhudacai-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Gabriele,

As far as I can tell, this is not specific to PCIe, so please use "PCI" in
the subject as a generic term that includes both PCI and PCIe.

On Mon, Jul 27, 2015 at 11:17:03PM +0800, Gabriele Paoloni wrote:
> From: gabriele paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> 
>     This patch is needed port PCIe designware to new DT parsing API
>     As discussed in
>     http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/317743.html
>     in designware we have a problem as the PCI addresses in the PCIe controller
>     address space are required in order to perform correct HW operation.
> 
>     In order to solve this problem commit f4c55c5a3 "PCI: designware:
>     Program ATU with untranslated address" added code to read the PCIe

Conventional reference is 12-char SHA1, like this:

  f4c55c5a3f7f ("PCI: designware: Program ATU with untranslated address")

>     controller start address directly from the DT ranges.
> 
>     In the new DT parsing API of_pci_get_host_bridge_resources() hides the
>     DT parser from the host controller drivers, so it is not possible
>     for drivers to parse values directly from the DT.
> 
>     In http://www.spinics.net/lists/linux-pci/msg42540.html we already tried
>     to use the new DT parsing API but there is a bug (obviously) in setting
>     the <*>_mod_base addresses
>     Applying this patch we can easily set "<*>_mod_base = win->__res.start"

By itself, this patch adds something.  It would help me understand it if
the *user* of this new something were in the same patch series.

>     This patch adds a new field in "struct of_pci_range" to store the
>     pci bus start address; it fills the field in of_pci_range_parser_one();
>     in of_pci_get_host_bridge_resources() it retrieves the resource entry
>     after it is created and added to the resource list and uses
>     entry->__res.start to store the pci controller address

struct of_pci_range is starting to get confusing to non-OF folks like me.
It now contains:

  u32 pci_space;
  u64 pci_addr;
  u64 cpu_addr;
  u64 bus_addr;

Can you explain what all these things mean, and maybe even add one-line
comments to the structure?

pci_space: The only uses I see are to determine whether to print
"Prefetch".  I don't see any real functionality that uses this.

pci_addr: I assume this is a PCI bus address, like what you would see if
you put an analyzer on the bus/link.  This address could go in a BAR.

cpu_addr: I assume this is a CPU physical address, like what you would see
in /proc/iomem and what you would pass to ioremap().

bus_addr: ?

I'm trying to imagine how this might be expressed in ACPI.  A host bridge
ACPI _CRS contains a CPU physical address and applying a _TRA (translation
offset) to the CPU address gives you a PCI bus address.  I know this code
is OF, not ACPI, but I assume that it should be possible to describe your
hardware via ACPI as well as by OF.

>     the patch is based on 4.2-rc1

You can put this after the "---" line because it's not relevant in the
permanent changelog.

>     Signed-off-by: Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>     Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
>     Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Please un-indent your changelog.

> ---
>  drivers/of/address.c       | 2 ++
>  drivers/of/of_pci.c        | 4 ++++
>  include/linux/of_address.h | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 8bfda6a..23a5793 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -253,6 +253,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
>  						struct of_pci_range *range)
>  {
>  	const int na = 3, ns = 2;
> +	const int p_ns = of_n_size_cells(parser->node);
>  
>  	if (!range)
>  		return NULL;
> @@ -265,6 +266,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
>  	range->pci_addr = of_read_number(parser->range + 1, ns);
>  	range->cpu_addr = of_translate_address(parser->node,
>  				parser->range + na);
> +	range->bus_addr = of_read_number(parser->range + na, p_ns);
>  	range->size = of_read_number(parser->range + parser->pna + na, ns);
>  
>  	parser->range += parser->np;
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index 5751dc5..fe57030 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -198,6 +198,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>  
>  	pr_debug("Parsing ranges property...\n");
>  	for_each_of_pci_range(&parser, &range) {
> +		struct resource_entry *entry;
>  		/* Read next ranges element */
>  		if ((range.flags & IORESOURCE_TYPE_BITS) == IORESOURCE_IO)
>  			snprintf(range_type, 4, " IO");
> @@ -240,6 +241,9 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>  		}
>  
>  		pci_add_resource_offset(resources, res,	res->start - range.pci_addr);
> +		entry = list_last_entry(resources, struct resource_entry, node);
> +		/* we are using __res for storing the PCI controller address */
> +		entry->__res.start = range.bus_addr;
>  	}
>  
>  	return 0;
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index d88e81b..865f96e 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -16,6 +16,7 @@ struct of_pci_range {
>  	u32 pci_space;
>  	u64 pci_addr;
>  	u64 cpu_addr;
> +	u64 bus_addr;
>  	u64 size;
>  	u32 flags;
>  };
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
