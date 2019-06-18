Return-Path: <SRS0=nfyP=UR=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V6 21/27] PCI: tegra: Add AFI_PEX2_CTRL reg offset as part of soc struct
Date: Tue, 18 Jun 2019 23:32:00 +0530
Message-ID: <20190618180206.4908-22-mmaddireddy@nvidia.com>
In-Reply-To: <20190618180206.4908-1-mmaddireddy@nvidia.com>
References: <20190618180206.4908-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Tegra186 and Tegra30 have three PCIe root ports. AFI_PEX2_CTRL register
is defined for third root port. Offset of this register in Tegra186 is
different from Tegra30, so add offset as part of soc data structure.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V6: No change

V5: No change

V4: No change

V3: No change

V2: No change

 drivers/pci/controller/pci-tegra.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 73d5a8841405..347897271943 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -168,7 +168,6 @@
 
 #define AFI_PEX0_CTRL			0x110
 #define AFI_PEX1_CTRL			0x118
-#define AFI_PEX2_CTRL			0x128
 #define  AFI_PEX_CTRL_RST		(1 << 0)
 #define  AFI_PEX_CTRL_CLKREQ_EN		(1 << 1)
 #define  AFI_PEX_CTRL_REFCLK_EN		(1 << 3)
@@ -307,6 +306,7 @@ struct tegra_pcie_soc {
 	unsigned int num_ports;
 	const struct tegra_pcie_port_soc *ports;
 	unsigned int msi_base_shift;
+	unsigned long afi_pex2_ctrl;
 	u32 pads_pll_ctl;
 	u32 tx_ref_sel;
 	u32 pads_refclk_cfg0;
@@ -517,6 +517,7 @@ static struct pci_ops tegra_pcie_ops = {
 
 static unsigned long tegra_pcie_port_get_pex_ctrl(struct tegra_pcie_port *port)
 {
+	const struct tegra_pcie_soc *soc = port->pcie->soc;
 	unsigned long ret = 0;
 
 	switch (port->index) {
@@ -529,7 +530,7 @@ static unsigned long tegra_pcie_port_get_pex_ctrl(struct tegra_pcie_port *port)
 		break;
 
 	case 2:
-		ret = AFI_PEX2_CTRL;
+		ret = soc->afi_pex2_ctrl;
 		break;
 	}
 
@@ -2430,6 +2431,7 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.num_ports = 2,
 	.ports = tegra20_pcie_ports,
 	.msi_base_shift = 0,
+	.afi_pex2_ctrl = 0x128,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA20,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_DIV10,
 	.pads_refclk_cfg0 = 0xfa5cfa5c,
@@ -2547,6 +2549,7 @@ static const struct tegra_pcie_soc tegra186_pcie = {
 	.num_ports = 3,
 	.ports = tegra186_pcie_ports,
 	.msi_base_shift = 8,
+	.afi_pex2_ctrl = 0x19c,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
 	.pads_refclk_cfg0 = 0x80b880b8,
-- 
2.17.1
