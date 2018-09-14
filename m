Return-Path: <SRS0=AnC+=L4=nvidia.com=pdeschrijver@kernel.org>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 03/14] clk: tegra: emc: simplify parent matching
Date: Fri, 14 Sep 2018 23:02:58 +0300
Message-ID: <1536955389-30442-4-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
References: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: vkuruturi@nvidia.com, linux-tegra=linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, robh+dt@kernel.org
Cc: daniel@octaforge.org, a.heider@gmail.com, swtcr0@gmail.com, Peter De Schrijver <pdeschrijver@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

We can't change the rate of a parent clock source when that clock source
in use. However pll_m_ud and pll_c_ud are just low jitter paths to the
same clock source, so when comparing clock sources we should treat those
as the same source.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-emc.c | 61 ++++++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index ce41d07..e836a9b 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -49,24 +49,10 @@
 	"pll_c2", "pll_c3", "pll_c_ud"
 };
 
-/*
- * List of clock sources for various parents the EMC clock can have.
- * When we change the timing to a timing with a parent that has the same
- * clock source as the current parent, we must first change to a backup
- * timing that has a different clock source.
- */
-
-#define EMC_SRC_PLL_M 0
-#define EMC_SRC_PLL_C 1
-#define EMC_SRC_PLL_P 2
-#define EMC_SRC_CLK_M 3
-#define EMC_SRC_PLL_C2 4
-#define EMC_SRC_PLL_C3 5
-
-static const char emc_parent_clk_sources[] = {
-	EMC_SRC_PLL_M, EMC_SRC_PLL_C, EMC_SRC_PLL_P, EMC_SRC_CLK_M,
-	EMC_SRC_PLL_M, EMC_SRC_PLL_C2, EMC_SRC_PLL_C3, EMC_SRC_PLL_C
-};
+#define TEGRA124_EMC_PARENT_PLL_M 0
+#define TEGRA124_EMC_PARENT_PLL_M_UD 4
+#define TEGRA124_EMC_PARENT_PLL_C 1
+#define TEGRA124_EMC_PARENT_PLL_C_UD 7
 
 struct emc_timing {
 	unsigned long rate, parent_rate;
@@ -266,6 +252,22 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
 	return 0;
 }
 
+static int normalize_parent_idx(int parent_idx)
+{
+	switch (parent_idx) {
+	case TEGRA124_EMC_PARENT_PLL_M:
+	case TEGRA124_EMC_PARENT_PLL_M_UD:
+		return TEGRA124_EMC_PARENT_PLL_M;
+
+	case TEGRA124_EMC_PARENT_PLL_C:
+	case TEGRA124_EMC_PARENT_PLL_C_UD:
+		return TEGRA124_EMC_PARENT_PLL_C:;
+
+	default:
+		return parent_idx;
+	}
+}
+
 /*
  * Get backup timing to use as an intermediate step when a change between
  * two timings with the same clock source has been requested. First try to
@@ -275,18 +277,20 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
 static struct emc_timing *get_backup_timing(struct tegra_clk_emc *tegra,
 					    int timing_index)
 {
-	int i;
+	int i, new_parent_idx;
 	u32 ram_code = tegra_read_ram_code();
 	struct emc_timing *timing;
 
+	new_parent_idx = tegra->timings[timing_index].parent_index;
+	new_parent_idx = normalize_parent_idx(new_parent_idx);
+
 	for (i = timing_index+1; i < tegra->num_timings; i++) {
 		timing = tegra->timings + i;
 		if (timing->ram_code != ram_code)
 			continue;
 
-		if (emc_parent_clk_sources[timing->parent_index] !=
-		    emc_parent_clk_sources[
-		      tegra->timings[timing_index].parent_index])
+		if (normalize_parent_idx(timing->parent_index)
+			!= new_parent_idx)
 			return timing;
 	}
 
@@ -295,9 +299,8 @@ static struct emc_timing *get_backup_timing(struct tegra_clk_emc *tegra,
 		if (timing->ram_code != ram_code)
 			continue;
 
-		if (emc_parent_clk_sources[timing->parent_index] !=
-		    emc_parent_clk_sources[
-		      tegra->timings[timing_index].parent_index])
+		if (normalize_parent_idx(timing->parent_index)
+			!= new_parent_idx)
 			return timing;
 	}
 
@@ -309,7 +312,7 @@ static int emc_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct tegra_clk_emc *tegra;
 	struct emc_timing *timing = NULL;
-	int i, err;
+	int i, err, new_parent_idx, cur_parent_idx;
 	u32 ram_code = tegra_read_ram_code();
 
 	tegra = container_of(hw, struct tegra_clk_emc, hw);
@@ -338,8 +341,10 @@ static int emc_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
-	if (emc_parent_clk_sources[emc_get_parent(hw)] ==
-	    emc_parent_clk_sources[timing->parent_index] &&
+	cur_parent_idx = normalize_parent_idx(emc_get_parent(hw));
+	new_parent_idx = normalize_parent_idx(timing->parent_index);
+
+	if (cur_parent_idx == new_parent_idx &&
 	    clk_get_rate(timing->parent) != timing->parent_rate) {
 		/*
 		 * Parent clock source not changed but parent rate has changed,
-- 
1.9.1
