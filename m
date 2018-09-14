Return-Path: <SRS0=AnC+=L4=nvidia.com=pdeschrijver@kernel.org>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 08/14] clk: tegra: clock changes for emc scaling
Date: Fri, 14 Sep 2018 23:03:03 +0300
Message-ID: <1536955389-30442-9-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
References: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: vkuruturi@nvidia.com, linux-tegra=linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, robh+dt@kernel.org
Cc: daniel@octaforge.org, a.heider@gmail.com, swtcr0@gmail.com, Peter De Schrijver <pdeschrijver@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

1) Introduce low jitter paths for pllp and pll_mb used by the EMC scaling code
2) Remove the old emc_mux clock and don't use the common EMC clock definition.
   This will be replaced by a new clock defined in the EMC scaling code
3) Export functions to allow accessing the CAR register required for EMC
   clock scaling. This function will be used to access the CAR register as
   part of the scaling sequence. The scaling sequence may also need to be
   run when the DRAM temperature crosses a certain limit. To avoid
   deadlocks it's easier to keep the whole sequence in one place.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c         | 53 ++++++++++++++++++++++++++------
 include/dt-bindings/clock/tegra210-car.h |  2 ++
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 72de0e9..6286b1a 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2368,7 +2368,7 @@ struct utmi_clk_param {
 	[tegra_clk_i2c2] = { .dt_id = TEGRA210_CLK_I2C2, .present = true },
 	[tegra_clk_uartc_8] = { .dt_id = TEGRA210_CLK_UARTC, .present = true },
 	[tegra_clk_mipi_cal] = { .dt_id = TEGRA210_CLK_MIPI_CAL, .present = true },
-	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = true },
+	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = false },
 	[tegra_clk_usb2] = { .dt_id = TEGRA210_CLK_USB2, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA210_CLK_BSEV, .present = true },
 	[tegra_clk_uartd_8] = { .dt_id = TEGRA210_CLK_UARTD, .present = true },
@@ -2780,6 +2780,34 @@ void tegra210_put_utmipll_out_iddq(void)
 }
 EXPORT_SYMBOL_GPL(tegra210_put_utmipll_out_iddq);
 
+void tegra210_clk_emc_update_setting(u32 emc_src_value)
+{
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(&emc_lock, flags);
+
+	writel_relaxed(emc_src_value, clk_base + CLK_SOURCE_EMC);
+	readl(clk_base + CLK_SOURCE_EMC);
+
+	spin_unlock_irqrestore(&emc_lock, flags);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
+
+u32 tegra210_clk_emc_get_setting(void)
+{
+	unsigned long flags = 0;
+	u32 val;
+
+	spin_lock_irqsave(&emc_lock, flags);
+
+	val = readl_relaxed(clk_base + CLK_SOURCE_EMC);
+
+	spin_unlock_irqrestore(&emc_lock, flags);
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_get_setting);
+
 static void tegra210_utmi_param_configure(void)
 {
 	u32 reg;
@@ -3016,13 +3044,8 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 	clk = tegra_clk_register_periph("la", la_parents,
 			ARRAY_SIZE(la_parents), &tegra210_la, clk_base,
 			CLK_SOURCE_LA, 0);
-	/* emc mux */
-	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
-			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
-			       clk_base + CLK_SOURCE_EMC,
-			       29, 3, 0, &emc_lock);
 
-	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
+	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC,
 				    &emc_lock);
 	clks[TEGRA210_CLK_MC] = clk;
 
@@ -3088,13 +3111,13 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 
 	/* PLLM */
 	clk = tegra_clk_register_pllm("pll_m", "osc", clk_base, pmc,
-			     CLK_SET_RATE_GATE, &pll_m_params, NULL);
+			     CLK_IS_CRITICAL | CLK_SET_RATE_GATE, &pll_m_params, NULL);
 	clk_register_clkdev(clk, "pll_m", NULL);
 	clks[TEGRA210_CLK_PLL_M] = clk;
 
 	/* PLLMB */
 	clk = tegra_clk_register_pllmb("pll_mb", "osc", clk_base, pmc,
-			     CLK_SET_RATE_GATE, &pll_mb_params, NULL);
+			     CLK_IS_CRITICAL | CLK_SET_RATE_GATE, &pll_mb_params, NULL);
 	clk_register_clkdev(clk, "pll_mb", NULL);
 	clks[TEGRA210_CLK_PLL_MB] = clk;
 
@@ -3104,6 +3127,18 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	clk_register_clkdev(clk, "pll_m_ud", NULL);
 	clks[TEGRA210_CLK_PLL_M_UD] = clk;
 
+	/* PLLMB_UD */
+	clk = clk_register_fixed_factor(NULL, "pll_mb_ud", "pll_mb",
+					CLK_SET_RATE_PARENT, 1, 1);
+	clk_register_clkdev(clk, "pll_mb_ud", NULL);
+	clks[TEGRA210_CLK_PLL_MB_UD] = clk;
+
+	/* PLLP_UD */
+	clk = clk_register_fixed_factor(NULL, "pll_p_ud", "pll_p",
+					0, 1, 1);
+	clks[TEGRA210_CLK_PLL_P_UD] = clk;
+
+
 	/* PLLU_VCO */
 	if (!tegra210_init_pllu()) {
 		clk = clk_register_fixed_rate(NULL, "pll_u_vco", "pll_ref", 0,
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 5df857a..453f814 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -396,6 +396,8 @@
 #define TEGRA210_CLK_PLL_M_UD 363
 #define TEGRA210_CLK_PLL_C_UD 364
 #define TEGRA210_CLK_SCLK_MUX 365
+#define TEGRA210_CLK_PLL_MB_UD 366
+#define TEGRA210_CLK_PLL_P_UD 367
 
 #define TEGRA210_CLK_ACLK 370
 
-- 
1.9.1
