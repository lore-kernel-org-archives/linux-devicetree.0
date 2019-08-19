From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 4/4] clk: qcom: clk-rpmh: Add support for SM8150
Date: Mon, 19 Aug 2019 13:09:47 +0530
Message-ID: <20190819073947.17258-5-vkoul@kernel.org>
References: <20190819073947.17258-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819073947.17258-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for rpmh clocks found in SM8150

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-rpmh.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 16d689e5bb3c..3b304a3fb5c9 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -374,6 +374,32 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
 	.num_clks = ARRAY_SIZE(sdm845_rpmh_clocks),
 };
 
+DEFINE_CLK_RPMH_ARC(sm8150, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
+DEFINE_CLK_RPMH_VRM(sm8150, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
+DEFINE_CLK_RPMH_VRM(sm8150, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
+DEFINE_CLK_RPMH_VRM(sm8150, rf_clk1, rf_clk1_ao, "rfclka1", 1);
+DEFINE_CLK_RPMH_VRM(sm8150, rf_clk2, rf_clk2_ao, "rfclka2", 1);
+DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
+
+static struct clk_hw *sm8150_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &sm8150_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]	= &sm8150_bi_tcxo_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sm8150_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sm8150_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sm8150_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sm8150_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &sm8150_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &sm8150_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &sm8150_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &sm8150_rf_clk2_ao.hw,
+	[RPMH_RF_CLK3]		= &sm8150_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]	= &sm8150_rf_clk3_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
+	.clks = sm8150_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm8150_rpmh_clocks),
+};
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -453,6 +479,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
+	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
-- 
2.20.1
