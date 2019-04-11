Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 22/30] PCI: tegra: Access endpoint config only if PCIe link is up
Date: Thu, 11 Apr 2019 22:33:47 +0530
Message-ID: <20190411170355.6882-23-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Add PCIe link up check in config read and write callback functions
before accessing endpoint config registers.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index d08a63132c77..c050687020f0 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -426,6 +426,14 @@ static inline u32 pads_readl(struct tegra_pcie *pcie, unsigned long offset)
 	return readl(pcie->pads + offset);
 }
 
+static bool tegra_pcie_link_status(struct tegra_pcie_port *port)
+{
+	u32 value;
+
+	value = readl(port->base + RP_LINK_CONTROL_STATUS);
+	return !!(value & RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE);
+}
+
 /*
  * The configuration space mapping on Tegra is somewhat similar to the ECAM
  * defined by PCIe. However it deviates a bit in how the 4 bits for extended
@@ -491,20 +499,50 @@ static void __iomem *tegra_pcie_map_bus(struct pci_bus *bus,
 static int tegra_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 				  int where, int size, u32 *value)
 {
+	struct tegra_pcie *pcie = bus->sysdata;
+	struct pci_dev *bridge;
+	struct tegra_pcie_port *port;
+
 	if (bus->number == 0)
 		return pci_generic_config_read32(bus, devfn, where, size,
 						 value);
 
+	bridge = pcie_find_root_port(bus->self);
+
+	list_for_each_entry(port, &pcie->ports, list)
+		if (port->index + 1 == PCI_SLOT(bridge->devfn))
+			break;
+
+	/* If there is no link, then there is no device */
+	if (!tegra_pcie_link_status(port)) {
+		*value = 0xffffffff;
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	}
+
 	return pci_generic_config_read(bus, devfn, where, size, value);
 }
 
 static int tegra_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
 				   int where, int size, u32 value)
 {
+	struct tegra_pcie *pcie = bus->sysdata;
+	struct tegra_pcie_port *port;
+	struct pci_dev *bridge;
+
 	if (bus->number == 0)
 		return pci_generic_config_write32(bus, devfn, where, size,
 						  value);
 
+	bridge = pcie_find_root_port(bus->self);
+
+	list_for_each_entry(port, &pcie->ports, list)
+		if (port->index + 1 == PCI_SLOT(bridge->devfn))
+			break;
+
+	/* If there is no link, then there is no device */
+	if (!tegra_pcie_link_status(port))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
 	return pci_generic_config_write(bus, devfn, where, size, value);
 }
 
-- 
2.17.1
