From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v5 19/42] powerpc/powernv: Remove DMA32 list of PEs
Date: Thu,  4 Jun 2015 16:41:48 +1000
Message-ID: <1433400131-18429-20-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, bhelgaas@google.com, aik@ozlabs.ru, panto@antoniou-consulting.com, robherring2@gmail.com, grant.likely@linaro.org, Gavin Shan <gwshan@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

PEs were put into the list, maintained by PHB, according its DMA32
weight. After that, the list was iterated to initialize PE's DMA
capability. For now, the PE is created and its DMA capability is
initialized right way. So we don't need the list and the patch
removes that.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
v5:
  * Newly introduced
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 18 ------------------
 arch/powerpc/platforms/powernv/pci.h      |  6 ------
 2 files changed, 24 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index f0b54ab..0447534 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -992,20 +992,6 @@ out:
 	return 0;
 }
 
-static void pnv_ioda_link_pe_by_weight(struct pnv_phb *phb,
-				       struct pnv_ioda_pe *pe)
-{
-	struct pnv_ioda_pe *lpe;
-
-	list_for_each_entry(lpe, &phb->ioda.pe_dma_list, dma_link) {
-		if (lpe->dma32_weight < pe->dma32_weight) {
-			list_add_tail(&pe->dma_link, &lpe->dma_link);
-			return;
-		}
-	}
-	list_add_tail(&pe->dma_link, &phb->ioda.pe_dma_list);
-}
-
 static unsigned int pnv_ioda_dev_dma_weight(struct pci_dev *dev)
 {
 	struct pci_controller *hose = pci_bus_to_host(dev->bus);
@@ -1296,9 +1282,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, int all)
 	/* Put PE to the list */
 	list_add_tail(&pe->list, &phb->ioda.pe_list);
 
-	/* Link the PE */
-	pnv_ioda_link_pe_by_weight(phb, pe);
-
 	return pe;
 }
 
@@ -3421,7 +3404,6 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 		phb->ioda.root_pe = IODA_INVALID_PE;
 	}
 
-	INIT_LIST_HEAD(&phb->ioda.pe_dma_list);
 	INIT_LIST_HEAD(&phb->ioda.pe_list);
 	mutex_init(&phb->ioda.pe_list_mutex);
 
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 64c7f03..bf63481 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -79,7 +79,6 @@ struct pnv_ioda_pe {
 	struct list_head	slaves;
 
 	/* Link in list of PE#s */
-	struct list_head	dma_link;
 	struct list_head	list;
 };
 
@@ -186,11 +185,6 @@ struct pnv_phb {
 			/* Number of 32-bit DMA segments */
 			unsigned long		dma32_segcount;
 
-			/* Sorted list of used PE's, sorted at
-			 * boot for resource allocation purposes
-			 */
-			struct list_head	pe_dma_list;
-
 			/* TCE cache invalidate registers (physical and
 			 * remapped)
 			 */
-- 
2.1.0
