From: andy.tang@nxp.com
Subject: [PATCH] clk: qoriq: Add ls1028a clock configuration
Date: Wed, 24 Apr 2019 09:19:12 +0800
Message-ID: <20190424011912.2179-1-andy.tang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuantian Tang <andy.tang@nxp.com>

Enable clock driver by adding clock configuration for ls1028a chip.

Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
---
 drivers/clk/clk-qoriq.c |   68 +++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 68 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 1212a9b..8b0cb0b 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -245,6 +245,58 @@ static u32 cg_in(struct clockgen *cg, u32 __iomem *reg)
 	},
 };
 
+static const struct clockgen_muxinfo ls1028a_hwa1 = {
+	{
+		{ CLKSEL_VALID, PLATFORM_PLL, PLL_DIV1 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV3 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV4 },
+		{},
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV3 },
+	},
+};
+
+static const struct clockgen_muxinfo ls1028a_hwa2 = {
+	{
+		{ CLKSEL_VALID, PLATFORM_PLL, PLL_DIV1 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV1 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV3 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV4 },
+		{},
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV3 },
+	},
+};
+
+static const struct clockgen_muxinfo ls1028a_hwa3 = {
+	{
+		{ CLKSEL_VALID, PLATFORM_PLL, PLL_DIV1 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV3 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV4 },
+		{},
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV3 },
+	},
+};
+
+static const struct clockgen_muxinfo ls1028a_hwa4 = {
+	{
+		{ CLKSEL_VALID, PLATFORM_PLL, PLL_DIV1 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV1 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV3 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV4 },
+		{},
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV3 },
+	},
+};
+
 static const struct clockgen_muxinfo ls1043a_hwa1 = {
 	{
 		{},
@@ -508,6 +560,21 @@ static void __init t4240_init_periph(struct clockgen *cg)
 		.pll_mask = 0x03,
 	},
 	{
+		.compat = "fsl,ls1028a-clockgen",
+		.cmux_groups = {
+			&clockgen2_cmux_cga12
+		},
+		.hwaccel = {
+			&ls1028a_hwa1, &ls1028a_hwa2,
+			&ls1028a_hwa3, &ls1028a_hwa4
+		},
+		.cmux_to_group = {
+			0, 0, 0, 0, -1
+		},
+		.pll_mask = 0x07,
+		.flags = CG_VER3 | CG_LITTLE_ENDIAN,
+	},
+	{
 		.compat = "fsl,ls1043a-clockgen",
 		.init_periph = t2080_init_periph,
 		.cmux_groups = {
@@ -1423,6 +1490,7 @@ static void __init clockgen_init(struct device_node *np)
 CLK_OF_DECLARE(qoriq_clockgen_b4860, "fsl,b4860-clockgen", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_ls1012a, "fsl,ls1012a-clockgen", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_ls1021a, "fsl,ls1021a-clockgen", clockgen_init);
+CLK_OF_DECLARE(qoriq_clockgen_ls1028a, "fsl,ls1028a-clockgen", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_ls1043a, "fsl,ls1043a-clockgen", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_ls1046a, "fsl,ls1046a-clockgen", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_ls1088a, "fsl,ls1088a-clockgen", clockgen_init);
-- 
1.7.1
