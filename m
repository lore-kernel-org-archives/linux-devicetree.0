From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv2 4/4] ARM: mvebu: implement L2/PCIe deadlock workaround
Date: Tue, 13 May 2014 13:13:39 +0200
Message-ID: <11503675.BOHdnE4xD3@wuerfel>
References: <1399975839-5311-1-git-send-email-thomas.petazzoni@free-electrons.com> <1399975839-5311-5-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399975839-5311-5-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Albin Tonnerre <albin.tonnerre-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 13 May 2014 12:10:39 Thomas Petazzoni wrote:
> +/*
> + * This ioremap hook is used on Armada 375/38x to ensure that PCIe
> + * memory areas are mapped as MT_MEMORY_RW_SO instead of
> + * MT_DEVICE. This is needed as a workaround for a deadlock issue
> + * between the PCIe interface and the cache controller.
> + */
> +static void __iomem *
> +armada_pcie_wa_ioremap_caller(phys_addr_t phys_addr, size_t size,
> +                             unsigned int mtype, void *caller)
> +{
> +       struct resource pcie_mem;
> +
> +       mvebu_mbus_get_pcie_mem_aperture(&pcie_mem);
> +
> +       if (pcie_mem.start <= phys_addr && (phys_addr + size) <= pcie_mem.end)
> +               mtype = MT_MEMORY_RW_SO;
> +
> +       return __arm_ioremap_caller(phys_addr, size, mtype, caller);
> +}

Hmm, I think this needs some more explanation about which flags
you are actually interested in. 

These are the three common mem types for ioremap:

#define PROT_PTE_DEVICE         L_PTE_PRESENT|L_PTE_YOUNG|L_PTE_DIRTY|L_PTE_XN
#define PROT_SECT_DEVICE        PMD_TYPE_SECT|PMD_SECT_AP_WRITE

        [MT_DEVICE] = {           /* Strongly ordered / ARMv6 shared device */
                .prot_pte       = PROT_PTE_DEVICE | L_PTE_MT_DEV_SHARED |
                                  L_PTE_SHARED,
                .prot_pte_s2    = s2_policy(PROT_PTE_S2_DEVICE) |
                                  s2_policy(L_PTE_S2_MT_DEV_SHARED) |
                                  L_PTE_SHARED,
                .prot_sect      = PROT_SECT_DEVICE | PMD_SECT_S,
                .domain         = DOMAIN_IO, 
        },                      
        [MT_DEVICE_CACHED] = {    /* ioremap_cached */
                .prot_pte       = PROT_PTE_DEVICE | L_PTE_MT_DEV_CACHED,
                .prot_sect      = PROT_SECT_DEVICE | PMD_SECT_WB,
                .domain         = DOMAIN_IO,
        },
        [MT_DEVICE_WC] = {      /* ioremap_wc */
                .prot_pte       = PROT_PTE_DEVICE | L_PTE_MT_DEV_WC,
                .prot_sect      = PROT_SECT_DEVICE,
                .domain         = DOMAIN_IO,
        },

and this is the one you enforce here:

        [MT_MEMORY_RW_SO] = {
                .prot_pte  = L_PTE_PRESENT | L_PTE_YOUNG | L_PTE_DIRTY |
                                L_PTE_MT_UNCACHED | L_PTE_XN,
                .prot_l1   = PMD_TYPE_TABLE,
                .prot_sect = PMD_TYPE_SECT | PMD_SECT_AP_WRITE | PMD_SECT_S |
                                PMD_SECT_UNCACHED | PMD_SECT_XN,
                .domain    = DOMAIN_KERNEL,
        },

So you set a different domain, and turn write-combined and cached mappings
into uncached mappings, and for uncached mappings you remove the "shared"
flag. Which of these changes is the one you actually need?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
