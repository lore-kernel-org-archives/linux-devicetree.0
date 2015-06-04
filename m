From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 15/42] powerpc/powernv: Reserve PE# for root bus
Date: Thu,  4 Jun 2015 16:41:44 +1000
Message-ID: <1433400131-18429-16-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433400131-18429-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

pcibios_setup_bridge(), called to update PCI bridge windows, will
allocate PE for PCI buses. The function isn't called for root bus
that doesn't have upstream bridge. The patch reserves PE# for root
bus in advance so that we can setup it in next patch.

Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
v5:
  * Split from [PATCH v5 v4 06/21]
  * Replace "strip of" with "strip off" in comments
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 31 ++++++++++++++++++++++++++++++-
 arch/powerpc/platforms/powernv/pci.h      |  1 +
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 0d6539a..2eb8baa 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -230,6 +230,13 @@ static int pnv_ioda1_init_m64(struct pnv_phb *phb)
 		pr_warn("  Cannot strip M64 segment for reserved PE#%d\n",
 			phb->ioda.reserved_pe);
 
+	/* Strip off the segment used by PE for PCI root bus,
+	 * which is last supported PE#, or one next to the
+	 * reserved PE#
+	 */
+	if (phb->ioda.root_pe != IODA_INVALID_PE)
+		r->end -= phb->ioda.m64_segsize;
+
 	return 0;
 
 fail:
@@ -287,6 +294,13 @@ static int pnv_ioda2_init_m64(struct pnv_phb *phb)
 		pr_warn("  Cannot strip M64 segment for reserved PE#%d\n",
 			phb->ioda.reserved_pe);
 
+	/* Strip off the segment used by PE for PCI root bus,
+	 * which is last supported PE#, or one next to the
+	 * reserved PE#
+	 */
+	if (phb->ioda.root_pe != IODA_INVALID_PE)
+		r->end -= phb->ioda.m64_segsize;
+
 	return 0;
 
 fail:
@@ -3331,7 +3345,22 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	aux = memblock_virt_alloc(size, 0);
 	phb->ioda.pe_alloc = aux;
 	phb->ioda.pe_array = aux + pemap_off;
-	set_bit(phb->ioda.reserved_pe, phb->ioda.pe_alloc);
+
+	/* Choose number of PE for root bus, which shouldn't consume
+	 * any M64 resource. So we avoid picking low-end PE#, which
+	 * is usually binding with 64-bits prefetchable memory resources
+	 * closely.
+	 */
+	pnv_ioda_reserve_pe(phb, phb->ioda.reserved_pe);
+	if (phb->ioda.reserved_pe == 0) {
+		phb->ioda.root_pe = phb->ioda.total_pe - 1;
+		pnv_ioda_reserve_pe(phb, phb->ioda.root_pe);
+	} else if (phb->ioda.reserved_pe == (phb->ioda.total_pe - 1)) {
+		phb->ioda.root_pe = phb->ioda.reserved_pe - 1;
+		pnv_ioda_reserve_pe(phb, phb->ioda.root_pe);
+	} else {
+		phb->ioda.root_pe = IODA_INVALID_PE;
+	}
 
 	INIT_LIST_HEAD(&phb->ioda.pe_dma_list);
 	INIT_LIST_HEAD(&phb->ioda.pe_list);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 590f778..e372b9f 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -133,6 +133,7 @@ struct pnv_phb {
 		struct {
 			/* Global bridge info */
 			unsigned int		total_pe;
+			unsigned int		root_pe;
 			unsigned int		reserved_pe;
 
 			/* 32-bit MMIO window */
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
