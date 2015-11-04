From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v7 15/50] powerpc/powernv: Rename pnv_pci_ioda_setup_dma_pe()
Date: Thu,  5 Nov 2015 00:12:15 +1100
Message-ID: <1446642770-4681-16-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, aik@ozlabs.ru, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, frowand.list@gmail.com, Gavin Shan <gwshan@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

This renames pnv_pci_ioda_setup_dma_pe() to pnv_pci_ioda1_setup_dma_pe()
as it's the counter-part of IODA2's pnv_pci_ioda2_setup_dma_pe().
No logical changes introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index bfe69f1..8a19454 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1845,9 +1845,10 @@ static struct iommu_table_ops pnv_ioda2_iommu_ops = {
 	.free = pnv_ioda2_table_free,
 };
 
-static void pnv_pci_ioda_setup_dma_pe(struct pnv_phb *phb,
-				      struct pnv_ioda_pe *pe, unsigned int base,
-				      unsigned int segs)
+static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
+				       struct pnv_ioda_pe *pe,
+				       unsigned int base,
+				       unsigned int segs)
 {
 
 	struct page *tce_mem = NULL;
@@ -2435,7 +2436,7 @@ static void pnv_ioda_setup_dma(struct pnv_phb *phb)
 		if (phb->type == PNV_PHB_IODA1) {
 			pe_info(pe, "DMA weight %d, assigned %d DMA32 segments\n",
 				pe->dma_weight, segs);
-			pnv_pci_ioda_setup_dma_pe(phb, pe, base, segs);
+			pnv_pci_ioda1_setup_dma_pe(phb, pe, base, segs);
 		} else {
 			pe_info(pe, "Assign DMA32 space\n");
 			segs = 0;
-- 
2.1.0
