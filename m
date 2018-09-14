Return-Path: <SRS0=AnC+=L4=nvidia.com=pdeschrijver@kernel.org>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 04/14] clk: tegra: emc: prepare for Tegra210 parent table
Date: Fri, 14 Sep 2018 23:02:59 +0300
Message-ID: <1536955389-30442-5-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
References: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: vkuruturi@nvidia.com, linux-tegra=linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, robh+dt@kernel.org
Cc: daniel@octaforge.org, a.heider@gmail.com, swtcr0@gmail.com, Peter De Schrijver <pdeschrijver@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

The set of possible emc parents is different in Tegra124 compared to
Tegra210. Hence make this list a Tegra124 specific table and adjust the
users to allow for other tables.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-emc.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index e836a9b..84fa806 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -44,7 +44,7 @@
 #define CLK_SOURCE_EMC_EMC_2X_CLK_SRC(x) (((x) & CLK_SOURCE_EMC_EMC_2X_CLK_SRC_MASK) << \
 					  CLK_SOURCE_EMC_EMC_2X_CLK_SRC_SHIFT)
 
-static const char * const emc_parent_clk_names[] = {
+static const char * const tegra124_emc_parent_clk_names[] = {
 	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud",
 	"pll_c2", "pll_c3", "pll_c_ud"
 };
@@ -376,7 +376,9 @@ static int emc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static int load_one_timing_from_dt(struct tegra_clk_emc *tegra,
 				   struct emc_timing *timing,
-				   struct device_node *node)
+				   struct device_node *node,
+				   const * char const *parent_names,
+				   int num_parents)
 {
 	int err, i;
 	u32 tmp;
@@ -404,9 +406,9 @@ static int load_one_timing_from_dt(struct tegra_clk_emc *tegra,
 	}
 
 	timing->parent_index = 0xff;
-	for (i = 0; i < ARRAY_SIZE(emc_parent_clk_names); i++) {
-		if (!strcmp(emc_parent_clk_names[i],
-			    __clk_get_name(timing->parent))) {
+	for (i = 0; i < num_parents; i++) {
+		if (!strcmp(parent_names([i],
+			__clk_get_name(timing->parent)))) {
 			timing->parent_index = i;
 			break;
 		}
@@ -436,7 +438,9 @@ static int cmp_timings(const void *_a, const void *_b)
 
 static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 				struct device_node *node,
-				u32 ram_code)
+				u32 ram_code,
+				const * char const *parent_names,
+				int num_parents)
 {
 	struct device_node *child;
 	int child_count = of_get_child_count(node);
@@ -452,7 +456,8 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 	for_each_child_of_node(node, child) {
 		struct emc_timing *timing = tegra->timings + (i++);
 
-		err = load_one_timing_from_dt(tegra, timing, child);
+		err = load_one_timing_from_dt(tegra, timing, child,
+					      parent_names, num_parents);
 		if (err) {
 			of_node_put(child);
 			return err;
@@ -503,7 +508,9 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 		 * Store timings for all ram codes as we cannot read the
 		 * fuses until the apbmisc driver is loaded.
 		 */
-		err = load_timings_from_dt(tegra, node, node_ram_code);
+		err = load_timings_from_dt(tegra, node, node_ram_code,
+					   tegra124_emc_parents,
+					   ARRAY_SIZE(tegra124_emc_parents));
 		of_node_put(node);
 		if (err)
 			return ERR_PTR(err);
-- 
1.9.1
