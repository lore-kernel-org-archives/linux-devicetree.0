From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v6 01/42] PCI: Add pcibios_setup_bridge()
Date: Thu,  6 Aug 2015 14:11:06 +1000
Message-ID: <1438834307-26960-2-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1438834307-26960-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1438834307-26960-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, aik@ozlabs.ru, Gavin Shan <gwshan@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Currently, PowerPC PowerNV platform utilizes ppc_md.pcibios_fixup(),
which is called for once after PCI probing and resource assignment
are completed, to allocate platform required resources for PCI devices:
PE#, IO and MMIO mapping, DMA address translation (TCE) table etc.
Obviously, it's not hotplug friendly.

The patch adds weak function pcibios_setup_bridge(), which is called
by pci_setup_bridge(). PowerPC PowerNV platform will reuse the function
to assign above platform required resources to newly added PCI devices,
in order to support PCI hotplug in subsequent patches.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/setup-bus.c | 5 +++++
 include/linux/pci.h     | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 508cc56..a69eae1 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -696,11 +696,16 @@ static void __pci_setup_bridge(struct pci_bus *bus, unsigned long type)
 	pci_write_config_word(bridge, PCI_BRIDGE_CONTROL, bus->bridge_ctl);
 }
 
+void __weak pcibios_setup_bridge(struct pci_bus *bus, unsigned long type)
+{
+}
+
 void pci_setup_bridge(struct pci_bus *bus)
 {
 	unsigned long type = IORESOURCE_IO | IORESOURCE_MEM |
 				  IORESOURCE_PREFETCH;
 
+	pcibios_setup_bridge(bus, type);
 	__pci_setup_bridge(bus, type);
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 3fed437..0fa9712 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -816,6 +816,7 @@ void pci_stop_and_remove_bus_device_locked(struct pci_dev *dev);
 void pci_stop_root_bus(struct pci_bus *bus);
 void pci_remove_root_bus(struct pci_bus *bus);
 void pci_setup_cardbus(struct pci_bus *bus);
+void pcibios_setup_bridge(struct pci_bus *bus, unsigned long type);
 void pci_sort_breadthfirst(void);
 #define dev_is_pci(d) ((d)->bus == &pci_bus_type)
 #define dev_is_pf(d) ((dev_is_pci(d) ? to_pci_dev(d)->is_physfn : false))
-- 
2.1.0
