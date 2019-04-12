From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH v3 2/2] clk: meson-g12a: Add Temperature Sensor clock
Date: Fri, 12 Apr 2019 12:02:21 +0200
Message-ID: <20190412100221.26740-3-glaroque@baylibre.com>
References: <20190412100221.26740-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412100221.26740-1-glaroque@baylibre.com>
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
index 86a7c1b5bd42..0a1cf782670b 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2480,6 +2480,33 @@ static struct clk_regmap g12a_mali = {
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
@@ -2769,6 +2796,8 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_VDEC_HEVCF_SEL]		= &g12a_vdec_hevcf_sel.hw,
 		[CLKID_VDEC_HEVCF_DIV]		= &g12a_vdec_hevcf_div.hw,
 		[CLKID_VDEC_HEVCF]		= &g12a_vdec_hevcf.hw,
+		[CLKID_TS_DIV]			= &g12a_ts_div.hw,
+		[CLKID_TS]			= &g12a_ts.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -2966,6 +2995,8 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_vdec_hevcf_sel,
 	&g12a_vdec_hevcf_div,
 	&g12a_vdec_hevcf,
+	&g12a_ts_div,
+	&g12a_ts,
 };
 
 static const struct meson_eeclkc_data g12a_clkc_data = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 39c41af70804..877b8d205f12 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -195,8 +195,9 @@
 #define CLKID_VDEC_HEVC_DIV			206
 #define CLKID_VDEC_HEVCF_SEL			208
 #define CLKID_VDEC_HEVCF_DIV			209
+#define CLKID_TS_DIV				211
 
-#define NR_CLKS					211
+#define NR_CLKS					213
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.17.1
