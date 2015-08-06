From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v6 13/42] powerpc/pci: Cleanup on pci_controller_ops
Date: Thu,  6 Aug 2015 14:11:18 +1000
Message-ID: <1438834307-26960-14-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1438834307-26960-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1438834307-26960-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, aik@ozlabs.ru, Gavin Shan <gwshan@linux.vnet.ibm.com>, Daniel Axtens <dja@axtens.net>
List-Id: devicetree@vger.kernel.org

Each PHB maintains one instance of "struct pci_controller_ops",
which includes various callbacks called by PCI subsystem. In the
definition of this struct, some callbacks have explicit names for
its arguments, but the left don't have.

This adds all explicit names of the arguments to the callbacks in
"struct pci_controller_ops" so that the code looks consistent.

Cc: Daniel Axtens <dja@axtens.net>
Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/pci-bridge.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index c927d5b..d627abf 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -21,18 +21,19 @@ struct pci_controller_ops {
 	void		(*dma_dev_setup)(struct pci_dev *dev);
 	void		(*dma_bus_setup)(struct pci_bus *bus);
 
-	int		(*probe_mode)(struct pci_bus *);
+	int		(*probe_mode)(struct pci_bus *bus);
 
 	/* Called when pci_enable_device() is called. Returns true to
 	 * allow assignment/enabling of the device. */
-	bool		(*enable_device_hook)(struct pci_dev *);
+	bool		(*enable_device_hook)(struct pci_dev *dev);
 
-	void		(*disable_device)(struct pci_dev *);
+	void		(*disable_device)(struct pci_dev *dev);
 
-	void		(*release_device)(struct pci_dev *);
+	void		(*release_device)(struct pci_dev *dev);
 
 	/* Called during PCI resource reassignment */
-	resource_size_t (*window_alignment)(struct pci_bus *, unsigned long type);
+	resource_size_t (*window_alignment)(struct pci_bus *bus,
+					    unsigned long type);
 	void		(*reset_secondary_bus)(struct pci_dev *dev);
 
 #ifdef CONFIG_PCI_MSI
@@ -43,7 +44,7 @@ struct pci_controller_ops {
 
 	int             (*dma_set_mask)(struct pci_dev *dev, u64 dma_mask);
 
-	void		(*shutdown)(struct pci_controller *);
+	void		(*shutdown)(struct pci_controller *hose);
 };
 
 /*
-- 
2.1.0
