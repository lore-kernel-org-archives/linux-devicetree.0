From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v7 07/50] powerpc/powernv: Reorder fields in struct pnv_phb
Date: Thu,  5 Nov 2015 00:12:07 +1100
Message-ID: <1446642770-4681-8-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, aik@ozlabs.ru, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, frowand.list@gmail.com, Gavin Shan <gwshan@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

This moves those fields in struct pnv_phb that are related to PE
allocation around. No logical change.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/pci.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 49e3baf..d655769 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -142,15 +142,14 @@ struct pnv_phb {
 			unsigned int		io_segsize;
 			unsigned int		io_pci_base;
 
-			/* PE allocation bitmap */
-			unsigned long		*pe_alloc;
-			/* PE allocation mutex */
+			/* PE allocation */
 			struct mutex		pe_alloc_mutex;
+			unsigned long		*pe_alloc;
+			struct pnv_ioda_pe	*pe_array;
 
 			/* M32 & IO segment maps */
 			unsigned int		*m32_segmap;
 			unsigned int		*io_segmap;
-			struct pnv_ioda_pe	*pe_array;
 
 			/* IRQ chip */
 			int			irq_chip_init;
-- 
2.1.0
