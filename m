From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v5 21/42] powerpc/powernv: Drop pnv_ioda_setup_dev_PE()
Date: Thu,  4 Jun 2015 16:41:50 +1000
Message-ID: <1433400131-18429-22-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, bhelgaas@google.com, aik@ozlabs.ru, panto@antoniou-consulting.com, robherring2@gmail.com, grant.likely@linaro.org, Gavin Shan <gwshan@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Nobody is using the this function. The patch drops it.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v5:
  * Derived from PATCH[v4 08/21]
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 71 -------------------------------
 1 file changed, 71 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index e9165fa..8a79403 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1111,77 +1111,6 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
 }
 #endif /* CONFIG_PCI_IOV */
 
-#if 0
-static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
-{
-	struct pci_controller *hose = pci_bus_to_host(dev->bus);
-	struct pnv_phb *phb = hose->private_data;
-	struct pci_dn *pdn = pci_get_pdn(dev);
-	struct pnv_ioda_pe *pe;
-	int pe_num;
-
-	if (!pdn) {
-		pr_err("%s: Device tree node not associated properly\n",
-			   pci_name(dev));
-		return NULL;
-	}
-	if (pdn->pe_number != IODA_INVALID_PE)
-		return NULL;
-
-	/* PE#0 has been pre-set */
-	if (dev->bus->number == 0)
-		pe_num = 0;
-	else
-		pe_num = pnv_ioda_alloc_pe(phb);
-	if (pe_num == IODA_INVALID_PE) {
-		pr_warning("%s: Not enough PE# available, disabling device\n",
-			   pci_name(dev));
-		return NULL;
-	}
-
-	/* NOTE: We get only one ref to the pci_dev for the pdn, not for the
-	 * pointer in the PE data structure, both should be destroyed at the
-	 * same time. However, this needs to be looked at more closely again
-	 * once we actually start removing things (Hotplug, SR-IOV, ...)
-	 *
-	 * At some point we want to remove the PDN completely anyways
-	 */
-	pe = &phb->ioda.pe_array[pe_num];
-	pci_dev_get(dev);
-	pdn->pcidev = dev;
-	pdn->pe_number = pe_num;
-	pe->pdev = dev;
-	pe->pbus = NULL;
-	pe->tce32_seg = -1;
-	pe->mve_number = -1;
-	pe->rid = dev->bus->number << 8 | pdn->devfn;
-
-	pe_info(pe, "Associated device to PE\n");
-
-	if (pnv_ioda_configure_pe(phb, pe)) {
-		/* XXX What do we do here ? */
-		if (pe_num)
-			pnv_ioda_free_pe(phb, pe_num);
-		pdn->pe_number = IODA_INVALID_PE;
-		pe->pdev = NULL;
-		pci_dev_put(dev);
-		return NULL;
-	}
-
-	/* Assign a DMA weight to the device */
-	pe->dma_weight = pnv_ioda_dma_weight(dev);
-	if (pe->dma_weight != 0) {
-		phb->ioda.dma_weight += pe->dma_weight;
-		phb->ioda.dma_pe_count++;
-	}
-
-	/* Link the PE */
-	pnv_ioda_link_pe_by_weight(phb, pe);
-
-	return pe;
-}
-#endif /* Useful for SRIOV case */
-
 static void pnv_ioda_setup_same_PE(struct pci_bus *bus, struct pnv_ioda_pe *pe)
 {
 	struct pci_dev *dev;
-- 
2.1.0
