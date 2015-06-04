From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v5 28/42] powerpc/powernv: Don't cover root bus in pnv_pci_reset_secondary_bus()
Date: Thu,  4 Jun 2015 16:41:57 +1000
Message-ID: <1433400131-18429-29-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, bhelgaas@google.com, aik@ozlabs.ru, panto@antoniou-consulting.com, robherring2@gmail.com, grant.likely@linaro.org, Gavin Shan <gwshan@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

There should have an upstream bridge for the PCI bus for which
pnv_pci_reset_secondary_bus() is called. It's impossible to call
the function for root buses. So we needn't do reset for root buses
in pnv_pci_reset_secondary_bus() and simply drop the logic.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
v5:
  * Split from PATCH[v4 10/21]
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 4669122..18167c5 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1057,16 +1057,8 @@ static int pnv_eeh_vf_pe_reset(struct eeh_pe *pe, int option)
 
 void pnv_pci_reset_secondary_bus(struct pci_dev *dev)
 {
-	struct pci_controller *hose;
-
-	if (pci_is_root_bus(dev->bus)) {
-		hose = pci_bus_to_host(dev->bus);
-		pnv_eeh_root_reset(hose, EEH_RESET_HOT);
-		pnv_eeh_root_reset(hose, EEH_RESET_DEACTIVATE);
-	} else {
-		pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
-		pnv_eeh_bridge_reset(dev, EEH_RESET_DEACTIVATE);
-	}
+	pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
+	pnv_eeh_bridge_reset(dev, EEH_RESET_DEACTIVATE);
 }
 
 /**
-- 
2.1.0
