Return-Path: <SRS0=blGF=TQ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V4 17/28] PCI: tegra: Fix PLLE power down issue due to CLKREQ# signal
Date: Thu, 16 May 2019 11:22:56 +0530
Message-ID: <20190516055307.25737-18-mmaddireddy@nvidia.com>
In-Reply-To: <20190516055307.25737-1-mmaddireddy@nvidia.com>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Disable controllers which failed to link up and configure CLKREQ# signals
of these controllers as GPIO. This is required to avoid CLKREQ# signal of
inactive controllers interfering with PLLE power down sequence.

PCIE_CLKREQ_GPIO bits are defined only in Tegra186, however programming
these bits in other SoCs doesn't cause any side effects. Program these
bits for all Tegra SoCs to avoid conditional check.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V4: No change

V3: No change

V2: Corrected the comment in driver

 drivers/pci/controller/pci-tegra.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 9ee111062ab7..4767af9f3b88 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -160,6 +160,8 @@
 #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_211	(0x1 << 20)
 #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_411	(0x2 << 20)
 #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_111	(0x2 << 20)
+#define  AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(x)		(1 << ((x) + 29))
+#define  AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO_ALL		(0x7 << 29)
 
 #define AFI_FUSE			0x104
 #define  AFI_FUSE_PCIE_T0_GEN2_DIS	(1 << 2)
@@ -741,6 +743,12 @@ static void tegra_pcie_port_disable(struct tegra_pcie_port *port)
 
 	value &= ~AFI_PEX_CTRL_REFCLK_EN;
 	afi_writel(port->pcie, value, ctrl);
+
+	/* disable PCIe port and set CLKREQ# as GPIO to allow PLLE power down */
+	value = afi_readl(port->pcie, AFI_PCIE_CONFIG);
+	value |= AFI_PCIE_CONFIG_PCIE_DISABLE(port->index);
+	value |= AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(port->index);
+	afi_writel(port->pcie, value, AFI_PCIE_CONFIG);
 }
 
 static void tegra_pcie_port_free(struct tegra_pcie_port *port)
@@ -1153,9 +1161,12 @@ static void tegra_pcie_enable_controller(struct tegra_pcie *pcie)
 	value = afi_readl(pcie, AFI_PCIE_CONFIG);
 	value &= ~AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_MASK;
 	value |= AFI_PCIE_CONFIG_PCIE_DISABLE_ALL | pcie->xbar_config;
+	value |= AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO_ALL;
 
-	list_for_each_entry(port, &pcie->ports, list)
+	list_for_each_entry(port, &pcie->ports, list) {
 		value &= ~AFI_PCIE_CONFIG_PCIE_DISABLE(port->index);
+		value &= ~AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(port->index);
+	}
 
 	afi_writel(pcie, value, AFI_PCIE_CONFIG);
 
-- 
2.17.1
