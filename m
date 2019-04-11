Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 03/30] PCI: tegra: Move REFCLK pad settings out of phy_power_on()
Date: Thu, 11 Apr 2019 22:33:28 +0530
Message-ID: <20190411170355.6882-4-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

In Tegra186 PHY programming is done by BPMP-FW, so PHY calls are skipped
in driver. REFCLK pad settings are independent of PHY and should be
programmed by driver. So move REFCLK pad settings out of phy_power_on().
These pad settings tune REFCLK peak to peak amplitude.

Fixes: cf5d31801278 ("PCI: tegra: Program PADS_REFCLK_CFG* always, not
just on legacy SoCs")

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 0bf270bcea34..a61ce9d475b4 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -852,7 +852,6 @@ static int tegra_pcie_port_phy_power_off(struct tegra_pcie_port *port)
 static int tegra_pcie_phy_power_on(struct tegra_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
-	const struct tegra_pcie_soc *soc = pcie->soc;
 	struct tegra_pcie_port *port;
 	int err;
 
@@ -878,12 +877,6 @@ static int tegra_pcie_phy_power_on(struct tegra_pcie *pcie)
 		}
 	}
 
-	/* Configure the reference clock driver */
-	pads_writel(pcie, soc->pads_refclk_cfg0, PADS_REFCLK_CFG0);
-
-	if (soc->num_ports > 2)
-		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
-
 	return 0;
 }
 
@@ -2092,11 +2085,24 @@ static bool tegra_pcie_port_check_link(struct tegra_pcie_port *port)
 	return false;
 }
 
+static void tegra_pcie_apply_pad_settings(struct tegra_pcie *pcie)
+{
+	const struct tegra_pcie_soc *soc = pcie->soc;
+
+	/* Configure the reference clock driver */
+	pads_writel(pcie, soc->pads_refclk_cfg0, PADS_REFCLK_CFG0);
+
+	if (soc->num_ports > 2)
+		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
+}
+
 static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	struct tegra_pcie_port *port, *tmp;
 
+	tegra_pcie_apply_pad_settings(pcie);
+
 	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
 		dev_info(dev, "probing port %u, using %u lanes\n",
 			 port->index, port->lanes);
-- 
2.17.1
