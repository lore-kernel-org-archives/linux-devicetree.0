From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv5 4/4] ARM: mvebu: use pci_ioremap_set_mem_type() to map
 PCI I/O as strongly ordered
Date: Mon, 19 May 2014 10:59:49 +0100
Message-ID: <20140519095949.GD5113@arm.com>
References: <1400487234-4501-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1400487234-4501-5-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400487234-4501-5-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Albin Tonnerre <Albin.Tonnerre-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 19, 2014 at 09:13:54AM +0100, Thomas Petazzoni wrote:
> Part of the workaround for the PCIe/SMP/PL310 deadlock on Armada
> 375/38x is to map PCI mappings strongly ordered. Mapping PCI memory
> regions as strongly ordered was already done thanks to the
> arch_ioremap_caller mechanism. This patch does the same for the PCI
> I/O regions by using the new pci_ioremap_set_mem_type() function.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/mach-mvebu/coherency.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
> index f6be9c6..0215614 100644
> --- a/arch/arm/mach-mvebu/coherency.c
> +++ b/arch/arm/mach-mvebu/coherency.c
> @@ -335,6 +335,7 @@ static void __init armada_375_380_coherency_init(struct device_node *np)
>  
>  	coherency_cpu_base = of_iomap(np, 0);
>  	arch_ioremap_caller = armada_pcie_wa_ioremap_caller;
> +	pci_ioremap_set_mem_type(MT_UNCACHED);

The patch is fine but for this to work in the UP case we need to fix
MT_UNCACHED definition for sections. It seems to create SO memory but
not necessarily writable (unless I miss something). Anyway, untested,
something like this:

diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index b68c6b22e1c8..db1bf8cb3a3e 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -267,7 +267,7 @@ static struct mem_type mem_types[] = {
 	[MT_UNCACHED] = {
 		.prot_pte	= PROT_PTE_DEVICE,
 		.prot_l1	= PMD_TYPE_TABLE,
-		.prot_sect	= PMD_TYPE_SECT | PMD_SECT_XN,
+		.prot_sect	= PROT_SECT_DEVICE,
 		.domain		= DOMAIN_IO,
 	},
 	[MT_CACHECLEAN] = {
@@ -461,6 +461,7 @@ static void __init build_mem_type_table(void)
 			mem_types[MT_DEVICE_NONSHARED].prot_sect |= PMD_SECT_XN;
 			mem_types[MT_DEVICE_CACHED].prot_sect |= PMD_SECT_XN;
 			mem_types[MT_DEVICE_WC].prot_sect |= PMD_SECT_XN;
+			mem_types[MT_UNCACHED].prot_sect |= PMD_SECT_XN;
 
 			/* Also setup NX memory mapping */
 			mem_types[MT_MEMORY_RW].prot_sect |= PMD_SECT_XN;

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
