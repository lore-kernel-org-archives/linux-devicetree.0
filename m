Return-Path: <SRS0=9bdO=TN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V3 11/29] PCI: tegra: Process pending DLL transactions before entering L1 or L2
Date: Mon, 13 May 2019 23:37:26 +0530
Message-ID: <20190513180744.16493-12-mmaddireddy@nvidia.com>
In-Reply-To: <20190513180744.16493-1-mmaddireddy@nvidia.com>
References: <20190513180744.16493-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

PM message are truncated while entering L1 or L2, which is resulting in
receiver errors. Set the required bit to finish processing DLLP before
link enter L1 or L2.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V3: No change

V2: No change

 drivers/pci/controller/pci-tegra.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 17c6d858ddc6..d3da03a10e04 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -212,6 +212,9 @@
 #define RP_VEND_CTL1	0x00000f48
 #define  RP_VEND_CTL1_ERPT	(1 << 13)
 
+#define RP_VEND_XP_BIST	0x00000f4c
+#define  RP_VEND_XP_BIST_GOTO_L1_L2_AFTER_DLLP_DONE	(1 << 28)
+
 #define RP_VEND_CTL2 0x00000fa8
 #define  RP_VEND_CTL2_PCA_ENABLE (1 << 7)
 
@@ -538,6 +541,14 @@ static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
 	value |= RP_VEND_XP_OPPORTUNISTIC_ACK;
 	value |= RP_VEND_XP_OPPORTUNISTIC_UPDATEFC;
 	writel(value, port->base + RP_VEND_XP);
+
+	/*
+	 * LTSSM will wait for DLLP to finish before entering L1 or L2,
+	 * to avoid truncation of PM messages which results in receiver errors
+	 */
+	value = readl(port->base + RP_VEND_XP_BIST);
+	value |= RP_VEND_XP_BIST_GOTO_L1_L2_AFTER_DLLP_DONE;
+	writel(value, port->base + RP_VEND_XP_BIST);
 }
 
 static void tegra_pcie_program_ectl_settings(struct tegra_pcie_port *port)
-- 
2.17.1
