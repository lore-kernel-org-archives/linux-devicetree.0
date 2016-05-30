From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 3/5] clk: qcom: ipq4019: Added the cpu pll divider and changed regmap limit
Date: Mon, 30 May 2016 20:02:36 +0530
Message-ID: <1464618758-20965-4-git-send-email-absahu@codeaurora.org>
References: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch adds the APSS CPU PLL divider in clock framework and
its binding in IPQ4019 device tree binding.

Also, it changed the max_register value to 0x2FFFF in regmap config
to support the APSS CPU PLL divider operations.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c               | 6 ++++--
 include/dt-bindings/clock/qcom,gcc-ipq4019.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 45f4749..263577c 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -143,7 +143,7 @@ static const char * const gcc_xo_ddr_500_200[] = {
 	"xo",
 	"fepll200",
 	"fepll500",
-	"ddrpllapss",
+	"gcc_apps_cpu_div_clk",
 };
 
 #define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
@@ -682,6 +682,7 @@ static struct clk_rcg2 apps_clk_src = {
 		.parent_names = gcc_xo_ddr_500_200,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1355,6 +1356,7 @@ static struct clk_regmap *gcc_ipq4019_clocks[] = {
 	[GCC_WCSS5G_CLK] = &gcc_wcss5g_clk.clkr,
 	[GCC_WCSS5G_REF_CLK] = &gcc_wcss5g_ref_clk.clkr,
 	[GCC_WCSS5G_RTC_CLK] = &gcc_wcss5g_rtc_clk.clkr,
+	[GCC_APPS_CLK_CPU_DIV] = &gcc_apps_cpu_div_clk.cdiv.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq4019_resets[] = {
@@ -1435,7 +1437,7 @@ static const struct regmap_config gcc_ipq4019_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0x2dfff,
+	.max_register	= 0x2FFFF,
 	.fast_io	= true,
 };
 
diff --git a/include/dt-bindings/clock/qcom,gcc-ipq4019.h b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
index 6240e5b..417a722 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq4019.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
@@ -154,5 +154,6 @@
 #define GCC_QDSS_BCR					69
 #define GCC_MPM_BCR					70
 #define GCC_SPDM_BCR					71
+#define GCC_APPS_CLK_CPU_DIV				72
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
