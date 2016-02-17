From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v8 20/45] powerpc/powernv: Allocate PE# in reverse order
Date: Wed, 17 Feb 2016 14:44:03 +1100
Message-ID: <1455680668-23298-21-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, aik@ozlabs.ru, dja@axtens.net, bhelgaas@google.com, robherring2@gmail.com, grant.likely@linaro.org, Gavin Shan <gwshan@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

PE number for one particular PE can be allocated dynamically or
reserved according to the consumed M64 (64-bits prefetchable)
segments of the PE. The M64 resources, and hence their segments
and PE number are assigned/reserved in ascending order. The PE
numbers are allocated dynamically in ascending order as well.
It's not a problem as the PE numbers are reserved and then
allocated all at once in fine order. However, it will introduce
conflicts when PCI hotplug is supported: the PE number to be
reserved for newly added PE might have been assigned.

To resolve above conflicts, this forces the PE number to be
allocated dynamically in reverse order. With this patch applied,
the PE numbers are reserved in ascending order, but allocated
dynamically in reverse order.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index f182ca7..565725b 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -144,16 +144,14 @@ static void pnv_ioda_reserve_pe(struct pnv_phb *phb, int pe_no)
 
 static struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb)
 {
-	unsigned long pe;
+	unsigned long pe = phb->ioda.total_pe_num - 1;
 
-	do {
-		pe = find_next_zero_bit(phb->ioda.pe_alloc,
-					phb->ioda.total_pe_num, 0);
-		if (pe >= phb->ioda.total_pe_num)
-			return NULL;
-	} while(test_and_set_bit(pe, phb->ioda.pe_alloc));
+	for (pe = phb->ioda.total_pe_num - 1; pe >= 0; pe--) {
+		if (!test_and_set_bit(pe, phb->ioda.pe_alloc))
+			return pnv_ioda_init_pe(phb, pe);
+	}
 
-	return pnv_ioda_init_pe(phb, pe);
+	return NULL;
 }
 
 static void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
-- 
2.1.0
