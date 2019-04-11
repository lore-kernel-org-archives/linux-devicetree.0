Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 06/30] PCI: tegra: Program UPHY electrical settings for Tegra210
Date: Thu, 11 Apr 2019 22:33:31 +0530
Message-ID: <20190411170355.6882-7-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

UPHY electrical programming guidelines are documented in Tegra210 TRM.
Program these electrical settings for proper eye diagram in Gen1 and Gen2
link speeds.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 100 +++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 9ff1a0e2797f..a377245d254d 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -177,6 +177,32 @@
 
 #define AFI_PEXBIAS_CTRL_0		0x168
 
+#define RP_ECTL_2_R1	0x00000e84
+#define  RP_ECTL_2_R1_RX_CTLE_1C_MASK		0xffff
+
+#define RP_ECTL_4_R1	0x00000e8c
+#define  RP_ECTL_4_R1_RX_CDR_CTRL_1C_MASK	(0xffff << 16)
+#define  RP_ECTL_4_R1_RX_CDR_CTRL_1C_SHIFT	16
+
+#define RP_ECTL_5_R1	0x00000e90
+#define  RP_ECTL_5_R1_RX_EQ_CTRL_L_1C_MASK	0xffffffff
+
+#define RP_ECTL_6_R1	0x00000e94
+#define  RP_ECTL_6_R1_RX_EQ_CTRL_H_1C_MASK	0xffffffff
+
+#define RP_ECTL_2_R2	0x00000ea4
+#define  RP_ECTL_2_R2_RX_CTLE_1C_MASK	0xffff
+
+#define RP_ECTL_4_R2	0x00000eac
+#define  RP_ECTL_4_R2_RX_CDR_CTRL_1C_MASK	(0xffff << 16)
+#define  RP_ECTL_4_R2_RX_CDR_CTRL_1C_SHIFT	16
+
+#define RP_ECTL_5_R2	0x00000eb0
+#define  RP_ECTL_5_R2_RX_EQ_CTRL_L_1C_MASK	0xffffffff
+
+#define RP_ECTL_6_R2	0x00000eb4
+#define  RP_ECTL_6_R2_RX_EQ_CTRL_H_1C_MASK	0xffffffff
+
 #define RP_VEND_XP	0x00000f00
 #define  RP_VEND_XP_DL_UP	(1 << 30)
 
@@ -265,6 +291,19 @@ struct tegra_pcie_soc {
 	bool has_gen2;
 	bool force_pca_enable;
 	bool program_uphy;
+	struct {
+		struct {
+			u32 rp_ectl_2_r1;
+			u32 rp_ectl_4_r1;
+			u32 rp_ectl_5_r1;
+			u32 rp_ectl_6_r1;
+			u32 rp_ectl_2_r2;
+			u32 rp_ectl_4_r2;
+			u32 rp_ectl_5_r2;
+			u32 rp_ectl_6_r2;
+		} regs;
+		bool enable;
+	} ectl;
 };
 
 static inline struct tegra_msi *to_tegra_msi(struct msi_controller *chip)
@@ -491,6 +530,52 @@ static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
 	writel(value, port->base + RP_VEND_CTL1);
 }
 
+static void tegra_pcie_program_ectl_settings(struct tegra_pcie_port *port)
+{
+	const struct tegra_pcie_soc *soc = port->pcie->soc;
+	u32 val;
+
+	val = readl(port->base + RP_ECTL_2_R1);
+	val &= ~RP_ECTL_2_R1_RX_CTLE_1C_MASK;
+	val |= soc->ectl.regs.rp_ectl_2_r1;
+	writel(val, port->base + RP_ECTL_2_R1);
+
+	val = readl(port->base + RP_ECTL_4_R1);
+	val &= ~RP_ECTL_4_R1_RX_CDR_CTRL_1C_MASK;
+	val |= soc->ectl.regs.rp_ectl_4_r1 << RP_ECTL_4_R1_RX_CDR_CTRL_1C_SHIFT;
+	writel(val, port->base + RP_ECTL_4_R1);
+
+	val = readl(port->base + RP_ECTL_5_R1);
+	val &= ~RP_ECTL_5_R1_RX_EQ_CTRL_L_1C_MASK;
+	val |= soc->ectl.regs.rp_ectl_5_r1;
+	writel(val, port->base + RP_ECTL_5_R1);
+
+	val = readl(port->base + RP_ECTL_6_R1);
+	val &= ~RP_ECTL_6_R1_RX_EQ_CTRL_H_1C_MASK;
+	val |= soc->ectl.regs.rp_ectl_6_r1;
+	writel(val, port->base + RP_ECTL_6_R1);
+
+	val = readl(port->base + RP_ECTL_2_R2);
+	val &= ~RP_ECTL_2_R2_RX_CTLE_1C_MASK;
+	val |= soc->ectl.regs.rp_ectl_2_r2;
+	writel(val, port->base + RP_ECTL_2_R2);
+
+	val = readl(port->base + RP_ECTL_4_R2);
+	val &= ~RP_ECTL_4_R2_RX_CDR_CTRL_1C_MASK;
+	val |= soc->ectl.regs.rp_ectl_4_r2 << RP_ECTL_4_R2_RX_CDR_CTRL_1C_SHIFT;
+	writel(val, port->base + RP_ECTL_4_R2);
+
+	val = readl(port->base + RP_ECTL_5_R2);
+	val &= ~RP_ECTL_5_R2_RX_EQ_CTRL_L_1C_MASK;
+	val |= soc->ectl.regs.rp_ectl_5_r2;
+	writel(val, port->base + RP_ECTL_5_R2);
+
+	val = readl(port->base + RP_ECTL_6_R2);
+	val &= ~RP_ECTL_6_R2_RX_EQ_CTRL_H_1C_MASK;
+	val |= soc->ectl.regs.rp_ectl_6_r2;
+	writel(val, port->base + RP_ECTL_6_R2);
+}
+
 static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
 {
 	unsigned long ctrl = tegra_pcie_port_get_pex_ctrl(port);
@@ -517,6 +602,8 @@ static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
 	}
 
 	tegra_pcie_enable_rp_features(port);
+	if (soc->ectl.enable)
+		tegra_pcie_program_ectl_settings(port);
 }
 
 static void tegra_pcie_port_disable(struct tegra_pcie_port *port)
@@ -2229,6 +2316,7 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.has_gen2 = false,
 	.force_pca_enable = false,
 	.program_uphy = true,
+	.ectl.enable = false,
 };
 
 static const struct tegra_pcie_port_soc tegra30_pcie_ports[] = {
@@ -2252,6 +2340,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
 	.has_gen2 = false,
 	.force_pca_enable = false,
 	.program_uphy = true,
+	.ectl.enable = false,
 };
 
 static const struct tegra_pcie_soc tegra124_pcie = {
@@ -2268,6 +2357,7 @@ static const struct tegra_pcie_soc tegra124_pcie = {
 	.has_gen2 = true,
 	.force_pca_enable = false,
 	.program_uphy = true,
+	.ectl.enable = false,
 };
 
 static const struct tegra_pcie_soc tegra210_pcie = {
@@ -2284,6 +2374,15 @@ static const struct tegra_pcie_soc tegra210_pcie = {
 	.has_gen2 = true,
 	.force_pca_enable = true,
 	.program_uphy = true,
+	.ectl.regs.rp_ectl_2_r1 = 0x0000000f,
+	.ectl.regs.rp_ectl_4_r1 = 0x00000067,
+	.ectl.regs.rp_ectl_5_r1 = 0x55010000,
+	.ectl.regs.rp_ectl_6_r1 = 0x00000001,
+	.ectl.regs.rp_ectl_2_r2 = 0x0000008f,
+	.ectl.regs.rp_ectl_4_r2 = 0x000000c7,
+	.ectl.regs.rp_ectl_5_r2 = 0x55010000,
+	.ectl.regs.rp_ectl_6_r2 = 0x00000001,
+	.ectl.enable = true,
 };
 
 static const struct tegra_pcie_port_soc tegra186_pcie_ports[] = {
@@ -2307,6 +2406,7 @@ static const struct tegra_pcie_soc tegra186_pcie = {
 	.has_gen2 = true,
 	.force_pca_enable = false,
 	.program_uphy = false,
+	.ectl.enable = false,
 };
 
 static const struct of_device_id tegra_pcie_of_match[] = {
-- 
2.17.1
