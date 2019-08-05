Return-Path: <SRS0=xLqw=WB=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 4/8] clk: mvebu: ap80x-cpu: add AP807 CPU clock support
Date: Mon,  5 Aug 2019 12:03:06 +0200
Message-Id: <20190805100310.29048-5-miquel.raynal@bootlin.com>
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Marcin Wojtas <mw@semihalf.com>, Stefan Chulski <stefanc@marvell.com>, Yan Markman <ymarkman@marvell.com>, Ben Peled <bpeled@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

From: Ben Peled <bpeled@marvell.com>

Enhance the ap-cpu-clk driver to support both AP806 and AP807 CPU
clocks.

Signed-off-by: Ben Peled <bpeled@marvell.com>
[<miquel.raynal@bootlin.com>: use device data instead of conditions on
the compatible]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/ap-cpu-clk.c | 59 ++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
index 784104f6793b..af5e5acad370 100644
--- a/drivers/clk/mvebu/ap-cpu-clk.c
+++ b/drivers/clk/mvebu/ap-cpu-clk.c
@@ -45,6 +45,7 @@ struct cpu_dfs_regs {
 	unsigned int cluster_offset;
 	unsigned int force_mask;
 	int divider_offset;
+	int divider_ratio;
 	int ratio_offset;
 	int ratio_state_offset;
 	int ratio_state_cluster_offset;
@@ -58,6 +59,7 @@ struct cpu_dfs_regs {
 
 #define AP806_CA72MP2_0_PLL_CR_CLUSTER_OFFSET		0x14
 #define AP806_PLL_CR_0_CPU_CLK_DIV_RATIO_OFFSET		0
+#define AP806_PLL_CR_CPU_CLK_DIV_RATIO			0
 #define AP806_PLL_CR_0_CPU_CLK_DIV_RATIO_MASK \
 			(0x3f << AP806_PLL_CR_0_CPU_CLK_DIV_RATIO_OFFSET)
 #define AP806_PLL_CR_0_CPU_CLK_RELOAD_FORCE_OFFSET	24
@@ -81,11 +83,47 @@ static const struct cpu_dfs_regs ap806_dfs_regs = {
 	.cluster_offset = AP806_CA72MP2_0_PLL_CR_CLUSTER_OFFSET,
 	.force_mask = AP806_PLL_CR_0_CPU_CLK_RELOAD_FORCE_MASK,
 	.divider_offset = AP806_PLL_CR_0_CPU_CLK_DIV_RATIO_OFFSET,
+	.divider_ratio = AP806_PLL_CR_CPU_CLK_DIV_RATIO,
 	.ratio_offset = AP806_PLL_CR_0_CPU_CLK_RELOAD_RATIO_OFFSET,
 	.ratio_state_offset = AP806_CA72MP2_0_PLL_RATIO_STABLE_OFFSET,
 	.ratio_state_cluster_offset = AP806_CA72MP2_0_PLL_RATIO_STABLE_OFFSET,
 };
 
+/* AP807 CPU DFS register mapping */
+#define AP807_DEVICE_GENERAL_CONTROL_10_REG_OFFSET		0x278
+#define AP807_DEVICE_GENERAL_CONTROL_11_REG_OFFSET		0x27c
+#define AP807_DEVICE_GENERAL_STATUS_6_REG_OFFSET		0xc98
+#define AP807_CA72MP2_0_PLL_CR_CLUSTER_OFFSET			0x8
+#define AP807_PLL_CR_0_CPU_CLK_DIV_RATIO_OFFSET			18
+#define AP807_PLL_CR_0_CPU_CLK_DIV_RATIO_MASK \
+		(0x3f << AP807_PLL_CR_0_CPU_CLK_DIV_RATIO_OFFSET)
+#define AP807_PLL_CR_1_CPU_CLK_DIV_RATIO_OFFSET			12
+#define AP807_PLL_CR_1_CPU_CLK_DIV_RATIO_MASK \
+		(0x3f << AP807_PLL_CR_1_CPU_CLK_DIV_RATIO_OFFSET)
+#define AP807_PLL_CR_CPU_CLK_DIV_RATIO				3
+#define AP807_PLL_CR_0_CPU_CLK_RELOAD_FORCE_OFFSET		0
+#define AP807_PLL_CR_0_CPU_CLK_RELOAD_FORCE_MASK \
+		(0x3 << AP807_PLL_CR_0_CPU_CLK_RELOAD_FORCE_OFFSET)
+#define AP807_PLL_CR_0_CPU_CLK_RELOAD_RATIO_OFFSET		6
+#define	AP807_CA72MP2_0_PLL_CLKDIV_RATIO_STABLE_OFFSET		20
+#define AP807_CA72MP2_0_PLL_CLKDIV_RATIO_STABLE_CLUSTER_OFFSET	3
+
+static const struct cpu_dfs_regs ap807_dfs_regs = {
+	.divider_reg = AP807_DEVICE_GENERAL_CONTROL_10_REG_OFFSET,
+	.force_reg = AP807_DEVICE_GENERAL_CONTROL_11_REG_OFFSET,
+	.ratio_reg = AP807_DEVICE_GENERAL_CONTROL_11_REG_OFFSET,
+	.ratio_state_reg = AP807_DEVICE_GENERAL_STATUS_6_REG_OFFSET,
+	.divider_mask = AP807_PLL_CR_0_CPU_CLK_DIV_RATIO_MASK,
+	.cluster_offset = AP807_CA72MP2_0_PLL_CR_CLUSTER_OFFSET,
+	.force_mask = AP807_PLL_CR_0_CPU_CLK_RELOAD_FORCE_MASK,
+	.divider_offset = AP807_PLL_CR_0_CPU_CLK_DIV_RATIO_OFFSET,
+	.divider_ratio = AP807_PLL_CR_CPU_CLK_DIV_RATIO,
+	.ratio_offset = AP807_PLL_CR_0_CPU_CLK_RELOAD_RATIO_OFFSET,
+	.ratio_state_offset = AP807_CA72MP2_0_PLL_CLKDIV_RATIO_STABLE_OFFSET,
+	.ratio_state_cluster_offset =
+		AP807_CA72MP2_0_PLL_CLKDIV_RATIO_STABLE_CLUSTER_OFFSET
+};
+
 /*
  * struct ap806_clk: CPU cluster clock controller instance
  * @cluster: Cluster clock controller index
@@ -133,8 +171,21 @@ static int ap_cpu_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	cpu_ratio_reg = clk->pll_regs->ratio_reg +
 		(clk->cluster * clk->pll_regs->cluster_offset);
 
-	regmap_update_bits(clk->pll_cr_base, cpu_clkdiv_reg,
-			   clk->pll_regs->divider_mask, divider);
+	regmap_read(clk->pll_cr_base, cpu_clkdiv_reg, &reg);
+	reg &= ~(clk->pll_regs->divider_mask);
+	reg |= (divider << clk->pll_regs->divider_offset);
+
+	/*
+	 * AP807 CPU divider has two channels with ratio 1:3 and divider_ratio
+	 * is 1. Otherwise, in the case of the AP806, divider_ratio is 0.
+	 */
+	if (clk->pll_regs->divider_ratio) {
+		reg &= ~(AP807_PLL_CR_1_CPU_CLK_DIV_RATIO_MASK);
+		reg |= ((divider * clk->pll_regs->divider_ratio) <<
+				AP807_PLL_CR_1_CPU_CLK_DIV_RATIO_OFFSET);
+	}
+	regmap_write(clk->pll_cr_base, cpu_clkdiv_reg, reg);
+
 
 	regmap_update_bits(clk->pll_cr_base, cpu_force_reg,
 			   clk->pll_regs->force_mask,
@@ -287,6 +338,10 @@ static const struct of_device_id ap_cpu_clock_of_match[] = {
 		.compatible = "marvell,ap806-cpu-clock",
 		.data = &ap806_dfs_regs,
 	},
+	{
+		.compatible = "marvell,ap807-cpu-clock",
+		.data = &ap807_dfs_regs,
+	},
 	{ }
 };
 
-- 
2.20.1
