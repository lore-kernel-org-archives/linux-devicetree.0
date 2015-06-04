From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v5 11/42] powerpc/powernv: Increase PE# capacity
Date: Thu,  4 Jun 2015 16:41:40 +1000
Message-ID: <1433400131-18429-12-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, bhelgaas@google.com, aik@ozlabs.ru, panto@antoniou-consulting.com, robherring2@gmail.com, grant.likely@linaro.org, Gavin Shan <gwshan@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Each PHB maintains an array helping to translate RID (Request
ID) to PE# with the assumption that PE# takes 8 bits, indicating
that we can't have more than 256 PEs. However, pci_dn->pe_number
already had 4-bytes for the PE#.

The patch extends the PE# capacity so that each of them will be
4-bytes long. Then we can use IODA_INVALID_PE to check one entry
in phb->pe_rmap[] is valid or not.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
v5:
  * Split from [PATCH v5 v4 06/21]
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 5 ++++-
 arch/powerpc/platforms/powernv/pci.h      | 5 ++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 2087c5c..d8b0ef5 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -840,7 +840,7 @@ static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 
 	/* Clear the reverse map */
 	for (rid = pe->rid; rid < rid_end; rid++)
-		phb->ioda.pe_rmap[rid] = 0;
+		phb->ioda.pe_rmap[rid] = IODA_INVALID_PE;
 
 	/* Release from all parents PELT-V */
 	while (parent) {
@@ -3303,6 +3303,9 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	if (prop32)
 		phb->ioda.reserved_pe = be32_to_cpup(prop32);
 
+	/* Invalidate RID to PE# mapping */
+	memset(phb->ioda.pe_rmap, 0xff, sizeof(phb->ioda.pe_rmap));
+
 	/* Parse 64-bit MMIO range */
 	pnv_ioda_parse_m64_window(phb);
 
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 94ef1df..590f778 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -175,11 +175,10 @@ struct pnv_phb {
 			struct list_head	pe_list;
 			struct mutex            pe_list_mutex;
 
-			/* Reverse map of PEs, will have to extend if
-			 * we are to support more than 256 PEs, indexed
+			/* Reverse map of PEs, indexed by
 			 * bus { bus, devfn }
 			 */
-			unsigned char		pe_rmap[0x10000];
+			int			pe_rmap[0x10000];
 
 			/* Number of 32-bit DMA segments */
 			unsigned long		dma32_segcount;
-- 
2.1.0
