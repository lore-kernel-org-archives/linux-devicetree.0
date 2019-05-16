Return-Path: <SRS0=blGF=TQ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V4 22/28] PCI: tegra: Access endpoint config only if PCIe link is up
Date: Thu, 16 May 2019 11:23:01 +0530
Message-ID: <20190516055307.25737-23-mmaddireddy@nvidia.com>
In-Reply-To: <20190516055307.25737-1-mmaddireddy@nvidia.com>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Few endpoints like Wi-Fi supports power on/off and to leverage that
root port must support hot-plug and hot-unplug. Tegra PCIe doesn't
support hot-plug and hot-unplug, however it supports endpoint power
on/off feature as follows,
 - Power off sequence:
   - Transition of PCIe link to L2
   - Power off endpoint
   - Leave root port in power up state with the link in L2
 - Power on sequence:
   - Power on endpoint
   - Apply hot reset to get PCIe link up

PCIe client driver stops accessing PCIe endpoint config and BAR registers
after endpoint is powered off. However, software applications like x11
server or lspci can access endpoint config registers in which case
host controller raises "response decoding" errors. To avoid this scenario,
add PCIe link up check in config read and write callback functions before
accessing endpoint config registers.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V4: No change

V3: Update the commit log with explanation for the need of this patch

V2: Change tegra_pcie_link_status() to tegra_pcie_link_up()

 drivers/pci/controller/pci-tegra.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index d20c88a79e00..33f4dfab9e35 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -428,6 +428,14 @@ static inline u32 pads_readl(struct tegra_pcie *pcie, unsigned long offset)
 	return readl(pcie->pads + offset);
 }
 
+static bool tegra_pcie_link_up(struct tegra_pcie_port *port)
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
@@ -493,20 +501,50 @@ static void __iomem *tegra_pcie_map_bus(struct pci_bus *bus,
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
+	if (!tegra_pcie_link_up(port)) {
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
+	if (!tegra_pcie_link_up(port))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
 	return pci_generic_config_write(bus, devfn, where, size, value);
 }
 
-- 
2.17.1
