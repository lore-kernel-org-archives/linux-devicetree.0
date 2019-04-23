Return-Path: <SRS0=zE5V=SZ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V2 13/28] PCI: tegra: Increase the deskew retry time
Date: Tue, 23 Apr 2019 14:58:10 +0530
Message-ID: <20190423092825.759-14-mmaddireddy@nvidia.com>
In-Reply-To: <20190423092825.759-1-mmaddireddy@nvidia.com>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Sometimes link speed change from Gen2 to Gen1 fails due to instability
in deskew logic on lane-0 in Tegra210. Increase the deskew retry time
to resolve this issue.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V2: Took care of typos in commit log and coding style comments.

 drivers/pci/controller/pci-tegra.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index cad1f651b10b..932d0617781a 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -209,6 +209,10 @@
 #define  RP_VEND_XP_OPPORTUNISTIC_ACK		(1 << 27)
 #define  RP_VEND_XP_OPPORTUNISTIC_UPDATEFC	(1 << 28)
 
+#define RP_VEND_CTL0	0x00000f44
+#define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH_MASK	(0xf << 12)
+#define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH	(0x9 << 12)
+
 #define RP_VEND_CTL1	0x00000f48
 #define  RP_VEND_CTL1_ERPT	(1 << 13)
 
@@ -305,6 +309,7 @@ struct tegra_pcie_soc {
 	bool force_pca_enable;
 	bool program_uphy;
 	bool update_clamp_threshold;
+	bool program_deskew_time;
 	struct {
 		struct {
 			u32 rp_ectl_2_r1;
@@ -620,6 +625,24 @@ static void tegra_pcie_program_ectl_settings(struct tegra_pcie_port *port)
 	writel(value, port->base + RP_ECTL_6_R2);
 }
 
+static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
+{
+	const struct tegra_pcie_soc *soc = port->pcie->soc;
+	u32 value;
+
+	/*
+	 * Sometimes link speed change from Gen2 to Gen1 fails due to
+	 * instability in deskew logic on lane-0. Increase the deskew
+	 * retry time to resolve this issue.
+	 */
+	if (soc->program_deskew_time) {
+		value = readl(port->base + RP_VEND_CTL0);
+		value &= ~RP_VEND_CTL0_DSK_RST_PULSE_WIDTH_MASK;
+		value |= RP_VEND_CTL0_DSK_RST_PULSE_WIDTH;
+		writel(value, port->base + RP_VEND_CTL0);
+	}
+}
+
 static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
 {
 	unsigned long ctrl = tegra_pcie_port_get_pex_ctrl(port);
@@ -649,6 +672,8 @@ static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
 
 	if (soc->ectl.enable)
 		tegra_pcie_program_ectl_settings(port);
+
+	tegra_pcie_apply_sw_fixup(port);
 }
 
 static void tegra_pcie_port_disable(struct tegra_pcie_port *port)
@@ -2357,6 +2382,7 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.force_pca_enable = false,
 	.program_uphy = true,
 	.update_clamp_threshold = false,
+	.program_deskew_time = false,
 	.ectl.enable = false,
 };
 
@@ -2382,6 +2408,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
 	.force_pca_enable = false,
 	.program_uphy = true,
 	.update_clamp_threshold = false,
+	.program_deskew_time = false,
 	.ectl.enable = false,
 };
 
@@ -2400,6 +2427,7 @@ static const struct tegra_pcie_soc tegra124_pcie = {
 	.force_pca_enable = false,
 	.program_uphy = true,
 	.update_clamp_threshold = true,
+	.program_deskew_time = false,
 	.ectl.enable = false,
 };
 
@@ -2418,6 +2446,7 @@ static const struct tegra_pcie_soc tegra210_pcie = {
 	.force_pca_enable = true,
 	.program_uphy = true,
 	.update_clamp_threshold = true,
+	.program_deskew_time = true,
 	.ectl = {
 		.regs = {
 			.rp_ectl_2_r1 = 0x0000000f,
@@ -2455,6 +2484,7 @@ static const struct tegra_pcie_soc tegra186_pcie = {
 	.force_pca_enable = false,
 	.program_uphy = false,
 	.update_clamp_threshold = false,
+	.program_deskew_time = false,
 	.ectl.enable = false,
 };
 
-- 
2.17.1
