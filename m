From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH v2 2/2] clk: meson-g12a: Add Temperature Sensor clock
Date: Fri, 12 Apr 2019 10:37:28 +0200
Message-ID: <20190412083728.21029-3-glaroque@baylibre.com>
References: <20190412083728.21029-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412083728.21029-1-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add TS clock used by two temperature sensor

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/clk/meson/g12a.c | 31 +++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 3a3134976534..cbb4abc0311e 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2335,6 +2335,33 @@ static struct clk_regmap g12a_mali = {
 	},
 };
 
+static struct clk_regmap g12a_ts_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_TS_CLK_CNTL,
+		.shift = 0,
+		.width = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ts_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap g12a_ts = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_TS_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ts",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "ts_div" },
+		.num_parents = 1,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(g12a_ddr,			HHI_GCLK_MPEG0,	0);
 static MESON_GATE(g12a_dos,			HHI_GCLK_MPEG0,	1);
@@ -2615,6 +2642,8 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
 		[CLKID_PCIE_PLL_OD]		= &g12a_pcie_pll_od.hw,
 		[CLKID_PCIE_PLL]		= &g12a_pcie_pll.hw,
+		[CLKID_TS_DIV]			= &g12a_ts_div.hw,
+		[CLKID_TS]			= &g12a_ts.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -2803,6 +2832,8 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_cpu_clk_trace,
 	&g12a_pcie_pll_od,
 	&g12a_pcie_pll_dco,
+	&g12a_ts_div,
+	&g12a_ts,
 };
 
 static const struct meson_eeclkc_data g12a_clkc_data = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 1393a09730a6..5633c72e432d 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -189,8 +189,9 @@
 #define CLKID_PCIE_PLL_DCO			198
 #define CLKID_PCIE_PLL_DCO_DIV2			199
 #define CLKID_PCIE_PLL_OD			200
+#define CLKID_TS_DIV				202
 
-#define NR_CLKS					202
+#define NR_CLKS					204
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.17.1
