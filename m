Return-Path: <SRS0=AnC+=L4=nvidia.com=pdeschrijver@kernel.org>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 02/14] clk: tegra: rename emc timing functions
Date: Fri, 14 Sep 2018 23:02:57 +0300
Message-ID: <1536955389-30442-3-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
References: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: vkuruturi@nvidia.com, linux-tegra=linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, robh+dt@kernel.org
Cc: daniel@octaforge.org, a.heider@gmail.com, swtcr0@gmail.com, Peter De Schrijver <pdeschrijver@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Tegra210 emc scaling is similar but sufficiently different to require a new
implementation of the clock driver and the emc timing code. Hence rename
the existing tegra_emc_prepare_timing_change and
tegra_emc_complete_timing_change to tegra124_emc_prepare_timing_change
and tegra124_emc_complete_timing_change because they really only
apply to Tegra124.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-emc.c         | 4 ++--
 drivers/memory/tegra/tegra124-emc.c | 8 ++++----
 include/soc/tegra/emc.h             | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 11a5066..ce41d07 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -237,7 +237,7 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
 
 	div = timing->parent_rate / (timing->rate / 2) - 2;
 
-	err = tegra_emc_prepare_timing_change(emc, timing->rate);
+	err = tegra124_emc_prepare_timing_change(emc, timing->rate);
 	if (err)
 		return err;
 
@@ -255,7 +255,7 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
 
 	spin_unlock_irqrestore(tegra->lock, flags);
 
-	tegra_emc_complete_timing_change(emc, timing->rate);
+	tegra124_emc_complete_timing_change(emc, timing->rate);
 
 	clk_hw_reparent(&tegra->hw, __clk_get_hw(timing->parent));
 	clk_disable_unprepare(tegra->prev_parent);
diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 392dc8d..7140ec8 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -562,8 +562,8 @@ static struct emc_timing *tegra_emc_find_timing(struct tegra_emc *emc,
 	return timing;
 }
 
-int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
-				    unsigned long rate)
+int tegra124_emc_prepare_timing_change(struct tegra_emc *emc,
+				       unsigned long rate)
 {
 	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
 	struct emc_timing *last = &emc->last_timing;
@@ -790,8 +790,8 @@ int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
 	return 0;
 }
 
-void tegra_emc_complete_timing_change(struct tegra_emc *emc,
-				      unsigned long rate)
+void tegra124_emc_complete_timing_change(struct tegra_emc *emc,
+					 unsigned long rate)
 {
 	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
 	struct emc_timing *last = &emc->last_timing;
diff --git a/include/soc/tegra/emc.h b/include/soc/tegra/emc.h
index f6db33b..625f77d 100644
--- a/include/soc/tegra/emc.h
+++ b/include/soc/tegra/emc.h
@@ -11,9 +11,9 @@
 
 struct tegra_emc;
 
-int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
-				    unsigned long rate);
-void tegra_emc_complete_timing_change(struct tegra_emc *emc,
-				      unsigned long rate);
+int tegra124_emc_prepare_timing_change(struct tegra_emc *emc,
+				       unsigned long rate);
+void tegra124_emc_complete_timing_change(struct tegra_emc *emc,
+					 unsigned long rate);
 
 #endif /* __SOC_TEGRA_EMC_H__ */
-- 
1.9.1
