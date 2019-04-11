Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 02/30] PCI: tegra: Fix PCIe host power up sequence
Date: Thu, 11 Apr 2019 22:33:27 +0530
Message-ID: <20190411170355.6882-3-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

PCIe host power up sequence involves programming AFI(AXI to FPCI bridge)
registers first and then PCIe registers. Otherwise AFI register settings
may not latch to PCIe IP.

PCIe root port starts LTSSM as soon as PCIe xrst is deasserted.
So deassert PCIe xrst after programming PCIe registers.

Modify PCIe power up sequence as follows,
  - Power ungate PCIe partition
  - Enable AFI clock
  - Deassert AFI reset
  - Program AFI registers
  - Enable PCIe clock
  - Deassert PCIe reset
  - Program PCIe registers
  - Deassert PCIe xrst to start LTSSM

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 73 ++++++++++++++++++------------
 1 file changed, 43 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index f4f53d092e00..0bf270bcea34 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -966,9 +966,6 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
 		}
 	}
 
-	/* take the PCIe interface module out of reset */
-	reset_control_deassert(pcie->pcie_xrst);
-
 	/* finally enable PCIe */
 	value = afi_readl(pcie, AFI_CONFIGURATION);
 	value |= AFI_CONFIGURATION_EN_FPCI;
@@ -997,8 +994,6 @@ static void tegra_pcie_disable_controller(struct tegra_pcie *pcie)
 {
 	int err;
 
-	reset_control_assert(pcie->pcie_xrst);
-
 	if (pcie->soc->program_uphy) {
 		err = tegra_pcie_phy_power_off(pcie);
 		if (err < 0)
@@ -1014,13 +1009,11 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
 	int err;
 
 	reset_control_assert(pcie->afi_rst);
-	reset_control_assert(pcie->pex_rst);
 
 	clk_disable_unprepare(pcie->pll_e);
 	if (soc->has_cml_clk)
 		clk_disable_unprepare(pcie->cml_clk);
 	clk_disable_unprepare(pcie->afi_clk);
-	clk_disable_unprepare(pcie->pex_clk);
 
 	if (!dev->pm_domain)
 		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
@@ -1036,58 +1029,59 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 	const struct tegra_pcie_soc *soc = pcie->soc;
 	int err;
 
-	reset_control_assert(pcie->pcie_xrst);
-	reset_control_assert(pcie->afi_rst);
-	reset_control_assert(pcie->pex_rst);
-
-	if (!dev->pm_domain)
-		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
-
 	/* enable regulators */
 	err = regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
 	if (err < 0)
 		dev_err(dev, "failed to enable regulators: %d\n", err);
 
-	if (dev->pm_domain) {
-		err = clk_prepare_enable(pcie->pex_clk);
+	if (!dev->pm_domain) {
+		err = tegra_powergate_power_on(TEGRA_POWERGATE_PCIE);
 		if (err) {
-			dev_err(dev, "failed to enable PEX clock: %d\n", err);
-			return err;
+			dev_err(dev, "power ungate failed: %d\n", err);
+			goto regulator_disable;
 		}
-		reset_control_deassert(pcie->pex_rst);
-	} else {
-		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_PCIE,
-							pcie->pex_clk,
-							pcie->pex_rst);
+		err = tegra_powergate_remove_clamping(TEGRA_POWERGATE_PCIE);
 		if (err) {
-			dev_err(dev, "powerup sequence failed: %d\n", err);
-			return err;
+			dev_err(dev, "remove clamp failed: %d\n", err);
+			goto powergate;
 		}
 	}
 
-	reset_control_deassert(pcie->afi_rst);
-
 	err = clk_prepare_enable(pcie->afi_clk);
 	if (err < 0) {
 		dev_err(dev, "failed to enable AFI clock: %d\n", err);
-		return err;
+		goto powergate;
 	}
 
 	if (soc->has_cml_clk) {
 		err = clk_prepare_enable(pcie->cml_clk);
 		if (err < 0) {
 			dev_err(dev, "failed to enable CML clock: %d\n", err);
-			return err;
+			goto afi_clk_disable;
 		}
 	}
 
 	err = clk_prepare_enable(pcie->pll_e);
 	if (err < 0) {
 		dev_err(dev, "failed to enable PLLE clock: %d\n", err);
-		return err;
+		goto cml_clk_disable;
 	}
 
+	reset_control_deassert(pcie->afi_rst);
+
 	return 0;
+
+cml_clk_disable:
+	if (soc->has_cml_clk)
+		clk_disable_unprepare(pcie->cml_clk);
+afi_clk_disable:
+	clk_disable_unprepare(pcie->afi_clk);
+powergate:
+	if (!dev->pm_domain)
+		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
+regulator_disable:
+	regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
+	return err;
 }
 
 static int tegra_pcie_clocks_get(struct tegra_pcie *pcie)
@@ -2108,7 +2102,12 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
 			 port->index, port->lanes);
 
 		tegra_pcie_port_enable(port);
+	}
+
+	/* Start LTSSM from Tegra side */
+	reset_control_deassert(pcie->pcie_xrst);
 
+	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
 		if (tegra_pcie_port_check_link(port))
 			continue;
 
@@ -2123,6 +2122,8 @@ static void tegra_pcie_disable_ports(struct tegra_pcie *pcie)
 {
 	struct tegra_pcie_port *port, *tmp;
 
+	reset_control_assert(pcie->pcie_xrst);
+
 	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
 		tegra_pcie_port_disable(port);
 }
@@ -2472,6 +2473,9 @@ static int __maybe_unused tegra_pcie_pm_suspend(struct device *dev)
 
 	tegra_pcie_disable_ports(pcie);
 
+	reset_control_assert(pcie->pex_rst);
+	clk_disable_unprepare(pcie->pex_clk);
+
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		tegra_pcie_disable_msi(pcie);
 
@@ -2501,10 +2505,19 @@ static int __maybe_unused tegra_pcie_pm_resume(struct device *dev)
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		tegra_pcie_enable_msi(pcie);
 
+	err = clk_prepare_enable(pcie->pex_clk);
+	if (err) {
+		dev_err(dev, "failed to enable PEX clock: %d\n", err);
+		goto disable_controller;
+	}
+	reset_control_deassert(pcie->pex_rst);
+
 	tegra_pcie_enable_ports(pcie);
 
 	return 0;
 
+disable_controller:
+	tegra_pcie_disable_controller(pcie);
 poweroff:
 	tegra_pcie_power_off(pcie);
 
-- 
2.17.1
