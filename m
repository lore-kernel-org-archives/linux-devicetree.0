Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 21/30] PCI: tegra: Add "pci" type check before parsing child device tree node
Date: Thu, 11 Apr 2019 22:33:46 +0530
Message-ID: <20190411170355.6882-22-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Each root port is added as a child device tree node of PCIe controller
node. These child nodes are parsed using open firmware PCI bus accessor
functions. If the child node is not of "pci" type then device tree
parsing fails. Add "pci" type check before parsing child device tree node.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 8fdc7934d4c9..d08a63132c77 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2197,6 +2197,9 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		unsigned int index;
 		u32 value;
 
+		if (!of_node_is_type(port, "pci"))
+			continue;
+
 		err = of_pci_get_devfn(port);
 		if (err < 0) {
 			dev_err(dev, "failed to parse address: %d\n", err);
-- 
2.17.1
