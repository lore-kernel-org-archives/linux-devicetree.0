From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 10/42] powerpc/powernv: Trace DMA32 segments consumed by PE
Date: Thu,  4 Jun 2015 16:41:39 +1000
Message-ID: <1433400131-18429-11-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433400131-18429-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On P7IOC, the whole DMA32 space is divided evenly to 256MB segments.
Each PE can consume one or multiple DMA32 segments. Current code
doesn't trace the available DMA32 segments and those consumed by
one particular PE. It's conflicting with PCI hotplug.

The patch introduces one bitmap to PHB to trace the available
DMA32 segments for allocation, more fields to "struct pnv_ioda_pe"
to trace the consumed DMA32 segments by the PE, which is going to
be released when the PE is destroyed at PCI unplugging time.

Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
v5:
  * Split from PATCH[v4 07/21]
  * Added space before open parenthesis reported by checkpatch.pl
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 24 +++++++++++++++++++++++-
 arch/powerpc/platforms/powernv/pci.h      |  4 ++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 63fad4d..2087c5c 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2071,6 +2071,7 @@ static void pnv_pci_ioda_setup_dma_pe(struct pnv_phb *phb,
 
 	/* Grab a 32-bit TCE table */
 	pe->dma32_seg = base;
+	pe->dma32_segcount = segs;
 	pe_info(pe, " Setting up 32-bit TCE table at %08x..%08x\n",
 		(base << 28), ((base + segs) << 28) - 1);
 
@@ -2131,8 +2132,10 @@ static void pnv_pci_ioda_setup_dma_pe(struct pnv_phb *phb,
 	return;
  fail:
 	/* XXX Failure: Try to fallback to 64-bit only ? */
-	if (pe->dma32_seg >= 0)
+	if (pe->dma32_seg >= 0) {
+		bitmap_clear(phb->ioda.dma32_segmap, base, segs);
 		pe->dma32_seg = -1;
+	}
 	if (tce_mem)
 		__free_pages(tce_mem, get_order(TCE32_TABLE_SIZE * segs));
 	if (tbl) {
@@ -2531,6 +2534,7 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
 
 	/* The PE will reserve all possible 32-bits space */
 	pe->dma32_seg = 0;
+	pe->dma32_segcount = 1;
 	pe_info(pe, "Setting up 32-bit TCE table at 0..%08x\n",
 		phb->ioda.m32_pci_base);
 
@@ -2588,6 +2592,24 @@ static void pnv_ioda_setup_dma(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 			segs = (pe->dma32_weight *
 				phb->ioda.dma32_segcount) / dma_weight;
 
+		/* Allocate DMA32 segments as required. We might not have
+		 * enough available resource. However, we expect at least
+		 * one segment is allocated.
+		 */
+		do {
+			base = bitmap_find_next_zero_area(
+					phb->ioda.dma32_segmap,
+					phb->ioda.dma32_segcount,
+					0, segs, 0);
+			if (base < phb->ioda.dma32_segcount) {
+				bitmap_set(phb->ioda.dma32_segmap, base, segs);
+				break;
+			}
+		} while (--segs);
+
+		if (!segs)
+			return;
+
 		pe_info(pe, "DMA weight %d, assigned %d DMA32 segments\n",
 			pe->dma32_weight, segs);
 		pnv_pci_ioda_setup_dma_pe(phb, pe, base, segs);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 5ea33ca..94ef1df 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -61,6 +61,7 @@ struct pnv_ioda_pe {
 	/* "Base" iommu table, ie, 4K TCEs, 32-bit DMA */
 	struct iommu_table_group table_group;
 	int			dma32_seg;
+	int			dma32_segcount;
 	unsigned int		dma32_weight;
 
 	/* 64-bit TCE bypass region */
@@ -161,6 +162,9 @@ struct pnv_phb {
 			unsigned long		m32_segmap[8];
 			unsigned long		m64_segmap[8];
 
+			/* DMA32 segment maps */
+			unsigned long		dma32_segmap[8];
+
 			/* IRQ chip */
 			int			irq_chip_init;
 			struct irq_chip		irq_chip;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
