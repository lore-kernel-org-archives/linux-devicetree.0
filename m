Return-Path: <SRS0=blGF=TQ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V4 09/28] PCI: tegra: Enable opportunistic UpdateFC and ACK
Date: Thu, 16 May 2019 11:22:48 +0530
Message-ID: <20190516055307.25737-10-mmaddireddy@nvidia.com>
In-Reply-To: <20190516055307.25737-1-mmaddireddy@nvidia.com>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Enable opportunistic UpdateFC and ACK to allow data link layer send
pending ACKs and UpdateFC packets when link is idle instead of waiting
for timers to expire. This improves the PCIe performance due to better
utilization of PCIe bandwidth.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V4: No change

V3: No change

V2: No change

 drivers/pci/controller/pci-tegra.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 76d913ef5bf4..b1e2e398b4e8 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -204,7 +204,9 @@
 #define  RP_ECTL_6_R2_RX_EQ_CTRL_H_1C_MASK	0xffffffff
 
 #define RP_VEND_XP	0x00000f00
-#define  RP_VEND_XP_DL_UP	(1 << 30)
+#define  RP_VEND_XP_DL_UP			(1 << 30)
+#define  RP_VEND_XP_OPPORTUNISTIC_ACK		(1 << 27)
+#define  RP_VEND_XP_OPPORTUNISTIC_UPDATEFC	(1 << 28)
 
 #define RP_VEND_CTL1	0x00000f48
 #define  RP_VEND_CTL1_ERPT	(1 << 13)
@@ -529,6 +531,12 @@ static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
 	value = readl(port->base + RP_VEND_CTL1);
 	value |= RP_VEND_CTL1_ERPT;
 	writel(value, port->base + RP_VEND_CTL1);
+
+	/* Optimal settings to enhance bandwidth */
+	value = readl(port->base + RP_VEND_XP);
+	value |= RP_VEND_XP_OPPORTUNISTIC_ACK;
+	value |= RP_VEND_XP_OPPORTUNISTIC_UPDATEFC;
+	writel(value, port->base + RP_VEND_XP);
 }
 
 static void tegra_pcie_program_ectl_settings(struct tegra_pcie_port *port)
-- 
2.17.1
