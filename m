Return-Path: <SRS0=blGF=TQ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V4 02/28] PCI: tegra: Handle failure cases in tegra_pcie_power_on()
Date: Thu, 16 May 2019 11:22:41 +0530
Message-ID: <20190516055307.25737-3-mmaddireddy@nvidia.com>
In-Reply-To: <20190516055307.25737-1-mmaddireddy@nvidia.com>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Unroll the PCIe power on sequence if any one of the steps fail in
tegra_pcie_power_on().

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V4: No change

V3: No change

V2: New patch to handle error cleanup in tegra_pcie_power_on().

 drivers/pci/controller/pci-tegra.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index f4f53d092e00..8235d937951b 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1052,7 +1052,7 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 		err = clk_prepare_enable(pcie->pex_clk);
 		if (err) {
 			dev_err(dev, "failed to enable PEX clock: %d\n", err);
-			return err;
+			goto regulator_disable;
 		}
 		reset_control_deassert(pcie->pex_rst);
 	} else {
@@ -1061,7 +1061,7 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 							pcie->pex_rst);
 		if (err) {
 			dev_err(dev, "powerup sequence failed: %d\n", err);
-			return err;
+			goto regulator_disable;
 		}
 	}
 
@@ -1070,24 +1070,40 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
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
+			goto disable_afi_clk;
 		}
 	}
 
 	err = clk_prepare_enable(pcie->pll_e);
 	if (err < 0) {
 		dev_err(dev, "failed to enable PLLE clock: %d\n", err);
-		return err;
+		goto disable_cml_clk;
 	}
 
 	return 0;
+
+disable_cml_clk:
+	if (soc->has_cml_clk)
+		clk_disable_unprepare(pcie->cml_clk);
+disable_afi_clk:
+	clk_disable_unprepare(pcie->afi_clk);
+powergate:
+	reset_control_assert(pcie->afi_rst);
+	reset_control_assert(pcie->pex_rst);
+	clk_disable_unprepare(pcie->pex_clk);
+	if (!dev->pm_domain)
+		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
+regulator_disable:
+	regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
+
+	return err;
 }
 
 static int tegra_pcie_clocks_get(struct tegra_pcie *pcie)
-- 
2.17.1
