From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v5 12/42] powerpc/pci: Cleanup on pci_controller_ops
Date: Thu,  4 Jun 2015 16:41:41 +1000
Message-ID: <1433400131-18429-13-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, bhelgaas@google.com, aik@ozlabs.ru, panto@antoniou-consulting.com, robherring2@gmail.com, grant.likely@linaro.org, Gavin Shan <gwshan@linux.vnet.ibm.com>, Daniel Axtens <dja@axtens.net>
List-Id: devicetree@vger.kernel.org

Each PHB maintains one instance of "struct pci_controller_ops",
which includes various callbacks called by PCI subsystem. In the
definition of this struct, some callbacks have explicit names for
its arguments, but the left don't have.

The patch removes all explicit names of the arguments to the
callbacks in "struct pci_controller_ops" to keep the code look
consistent.

Cc: Daniel Axtens <dja@axtens.net>
Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
v5:
  * Newly introduced
---
 arch/powerpc/include/asm/pci-bridge.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index 744884b..1252cd5 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -18,8 +18,8 @@ struct device_node;
  * PCI controller operations
  */
 struct pci_controller_ops {
-	void		(*dma_dev_setup)(struct pci_dev *dev);
-	void		(*dma_bus_setup)(struct pci_bus *bus);
+	void		(*dma_dev_setup)(struct pci_dev *);
+	void		(*dma_bus_setup)(struct pci_bus *);
 
 	int		(*probe_mode)(struct pci_bus *);
 
@@ -28,8 +28,8 @@ struct pci_controller_ops {
 	bool		(*enable_device_hook)(struct pci_dev *);
 
 	/* Called during PCI resource reassignment */
-	resource_size_t (*window_alignment)(struct pci_bus *, unsigned long type);
-	void		(*reset_secondary_bus)(struct pci_dev *dev);
+	resource_size_t (*window_alignment)(struct pci_bus *, unsigned long);
+	void		(*reset_secondary_bus)(struct pci_dev *);
 };
 
 /*
-- 
2.1.0
