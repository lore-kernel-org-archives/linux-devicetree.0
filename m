Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 16/30] PCI: tegra: Program AFI_CACHE* registers only for Tegra20
Date: Thu, 11 Apr 2019 22:33:41 +0530
Message-ID: <20190411170355.6882-17-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

AFI_CACHE* registers are available only in Tegra20, program them only
for Tegra20.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 8e5fdc8ce3d6..cdaaf13a9fd7 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -887,6 +887,7 @@ static irqreturn_t tegra_pcie_isr(int irq, void *arg)
  */
 static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
 {
+	struct device_node *np = pcie->dev->of_node;
 	u32 fpci_bar, size, axi_address;
 
 	/* Bar 0: type 1 extended configuration space */
@@ -927,11 +928,13 @@ static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
 	afi_writel(pcie, 0, AFI_AXI_BAR5_SZ);
 	afi_writel(pcie, 0, AFI_FPCI_BAR5);
 
-	/* map all upstream transactions as uncached */
-	afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
-	afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
-	afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
-	afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
+	if (of_device_is_compatible(np, "nvidia,tegra20-pcie")) {
+		/* map all upstream transactions as uncached */
+		afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
+		afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
+		afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
+		afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
+	}
 
 	/* MSI translations are setup only when needed */
 	afi_writel(pcie, 0, AFI_MSI_FPCI_BAR_ST);
-- 
2.17.1
