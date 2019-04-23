Return-Path: <SRS0=zE5V=SZ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V2 05/28] PCI: tegra: Fix PCIe host power up sequence
Date: Tue, 23 Apr 2019 14:58:02 +0530
Message-ID: <20190423092825.759-6-mmaddireddy@nvidia.com>
In-Reply-To: <20190423092825.759-1-mmaddireddy@nvidia.com>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
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
 - Program PCIe PHY
 - Program PCIe pad control registers
 - Program PCIe root port registers
 - Deassert PCIe xrst to start LTSSM

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V2: Error cleanup changes are moved to new patch and only sequence
correction is done in this patch.

 drivers/pci/controller/pci-tegra.c | 51 +++++++++++++++++-------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 8c0ad038699d..ed0cfd355b28 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -949,9 +949,6 @@ static void tegra_pcie_enable_controller(struct tegra_pcie *pcie)
 		afi_writel(pcie, value, AFI_FUSE);
 	}
 
-	/* take the PCIe interface module out of reset */
-	reset_control_deassert(pcie->pcie_xrst);
-
 	/* finally enable PCIe */
 	value = afi_readl(pcie, AFI_CONFIGURATION);
 	value |= AFI_CONFIGURATION_EN_FPCI;
@@ -981,13 +978,11 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
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
@@ -1015,25 +1010,19 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 	if (err < 0)
 		dev_err(dev, "failed to enable regulators: %d\n", err);
 
-	if (dev->pm_domain) {
-		err = clk_prepare_enable(pcie->pex_clk);
+	if (!dev->pm_domain) {
+		err = tegra_powergate_power_on(TEGRA_POWERGATE_PCIE);
 		if (err) {
-			dev_err(dev, "failed to enable PEX clock: %d\n", err);
+			dev_err(dev, "failed to power ungate: %d\n", err);
 			goto regulator_disable;
 		}
-		reset_control_deassert(pcie->pex_rst);
-	} else {
-		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_PCIE,
-							pcie->pex_clk,
-							pcie->pex_rst);
+		err = tegra_powergate_remove_clamping(TEGRA_POWERGATE_PCIE);
 		if (err) {
-			dev_err(dev, "powerup sequence failed: %d\n", err);
-			goto regulator_disable;
+			dev_err(dev, "failed to remove clamp: %d\n", err);
+			goto powergate;
 		}
 	}
 
-	reset_control_deassert(pcie->afi_rst);
-
 	err = clk_prepare_enable(pcie->afi_clk);
 	if (err < 0) {
 		dev_err(dev, "failed to enable AFI clock: %d\n", err);
@@ -1054,6 +1043,8 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 		goto disable_cml_clk;
 	}
 
+	reset_control_deassert(pcie->afi_rst);
+
 	return 0;
 
 disable_cml_clk:
@@ -1062,9 +1053,6 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 disable_afi_clk:
 	clk_disable_unprepare(pcie->afi_clk);
 powergate:
-	reset_control_assert(pcie->afi_rst);
-	reset_control_assert(pcie->pex_rst);
-	clk_disable_unprepare(pcie->pex_clk);
 	if (!dev->pm_domain)
 		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
 regulator_disable:
@@ -2114,7 +2102,12 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
 			 port->index, port->lanes);
 
 		tegra_pcie_port_enable(port);
+	}
 
+	/* Start LTSSM from Tegra side */
+	reset_control_deassert(pcie->pcie_xrst);
+
+	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
 		if (tegra_pcie_port_check_link(port))
 			continue;
 
@@ -2129,6 +2122,8 @@ static void tegra_pcie_disable_ports(struct tegra_pcie *pcie)
 {
 	struct tegra_pcie_port *port, *tmp;
 
+	reset_control_assert(pcie->pcie_xrst);
+
 	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
 		tegra_pcie_port_disable(port);
 }
@@ -2490,10 +2485,12 @@ static int __maybe_unused tegra_pcie_pm_suspend(struct device *dev)
 			dev_err(dev, "failed to power off PHY(s): %d\n", err);
 	}
 
+	reset_control_assert(pcie->pex_rst);
+	clk_disable_unprepare(pcie->pex_clk);
+
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		tegra_pcie_disable_msi(pcie);
 
-	reset_control_assert(pcie->pcie_xrst);
 	tegra_pcie_power_off(pcie);
 
 	return 0;
@@ -2515,11 +2512,18 @@ static int __maybe_unused tegra_pcie_pm_resume(struct device *dev)
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		tegra_pcie_enable_msi(pcie);
 
+	err = clk_prepare_enable(pcie->pex_clk);
+	if (err) {
+		dev_err(dev, "failed to enable PEX clock: %d\n", err);
+		goto poweroff;
+	}
+	reset_control_deassert(pcie->pex_rst);
+
 	if (pcie->soc->program_uphy) {
 		err = tegra_pcie_phy_power_on(pcie);
 		if (err < 0) {
 			dev_err(dev, "failed to power on PHY(s): %d\n", err);
-			goto poweroff;
+			goto disable_pex_clk;
 		}
 	}
 
@@ -2528,6 +2532,9 @@ static int __maybe_unused tegra_pcie_pm_resume(struct device *dev)
 
 	return 0;
 
+disable_pex_clk:
+	reset_control_assert(pcie->pex_rst);
+	clk_disable_unprepare(pcie->pex_clk);
 poweroff:
 	tegra_pcie_power_off(pcie);
 
-- 
2.17.1
