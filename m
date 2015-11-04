From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 03/50] powerpc/pci: Cleanup on struct pci_controller_ops
Date: Thu,  5 Nov 2015 00:12:03 +1100
Message-ID: <1446642770-4681-4-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446642770-4681-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Each PHB has one instance of "struct pci_controller_ops", which
includes various callbacks called by PCI subsystem. In the definition
of this struct, some callbacks have explicit names for its arguments,
but the left don't have.

This adds all explicit names of the arguments to the callbacks in
"struct pci_controller_ops" so that the code looks consistent.

Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 arch/powerpc/include/asm/pci-bridge.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index 6076116..0f2ff3a 100644
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
 	void		(*setup_bridge)(struct pci_bus *bus,
 					unsigned long type);
 	void		(*reset_secondary_bus)(struct pci_dev *dev);
@@ -46,7 +47,7 @@ struct pci_controller_ops {
 	int             (*dma_set_mask)(struct pci_dev *dev, u64 dma_mask);
 	u64		(*dma_get_required_mask)(struct pci_dev *dev);
 
-	void		(*shutdown)(struct pci_controller *);
+	void		(*shutdown)(struct pci_controller *hose);
 };
 
 /*
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
