Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 14/30] PCI: tegra: Set target speed as Gen1 before link up
Date: Thu, 11 Apr 2019 22:33:39 +0530
Message-ID: <20190411170355.6882-15-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Some of the legacy PCIe endpoints doesn't enumerate if root port advertises
both Gen-1 and Gen-2 speeds. Hence, the strategy followed here is to
initially advertise only Gen-1 and after link is up, retrain link to Gen-2
speed.

Following two cards display this behaviour,
  - Fusion HDTV 5 Express card
  - IOGear SIL - PCIE - SATA card

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 7dc728cc5f51..7e24eac12668 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -670,6 +670,17 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
 		value |= soc->update_fc_val;
 		writel(value, port->base + RP_VEND_XP);
 	}
+
+	/*
+	 * PCIe link doesn't come up with few legacy PCIe endpoints
+	 * if root port advertises both Gen-1 and Gen-2 speeds.
+	 * Hence, the strategy followed here is to initially advertise
+	 * only Gen-1 and after link is up, retrain link to Gen-2 speed
+	 */
+	value = readl(port->base + RP_LINK_CONTROL_STATUS_2);
+	value &= ~PCI_EXP_LNKSTA_CLS;
+	value |= PCI_EXP_LNKSTA_CLS_2_5GB;
+	writel(value, port->base + RP_LINK_CONTROL_STATUS_2);
 }
 
 static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
-- 
2.17.1
