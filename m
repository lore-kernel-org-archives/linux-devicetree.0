From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2 1/4] clk: qcom: smd: Add XO clock for MSM8998
Date: Sat, 16 Feb 2019 21:32:00 -0700
Message-ID: <1550377920-11337-1-git-send-email-jhugo@codeaurora.org>
References: <1550377885-10618-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550377885-10618-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, mturquette@baylibre.com, sboyd@kernel.org
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The XO clock generally feeds into other clock controllers as the parent
for a lot of clock generators.

Drop the "fake" XO clock in GCC now that it is redundant can will cause a
namespace conflict.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 24 ++++++++++++++++++++----
 drivers/clk/qcom/gcc-msm8998.c | 17 -----------------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 22dd42ad9223..55a622df3a68 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -68,7 +68,7 @@
 	}
 
 #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
-				    stat_id, r, key)			      \
+				    stat_id, r, key, ignore_unused)			      \
 	static struct clk_smd_rpm _platform##_##_active;		      \
 	static struct clk_smd_rpm _platform##_##_name = {		      \
 		.rpm_res_type = (type),					      \
@@ -83,6 +83,7 @@
 			.name = #_name,					      \
 			.parent_names = (const char *[]){ "xo_board" },	      \
 			.num_parents = 1,				      \
+			.flags = (ignore_unused) ? CLK_IGNORE_UNUSED : 0,     \
 		},							      \
 	};								      \
 	static struct clk_smd_rpm _platform##_##_active = {		      \
@@ -99,6 +100,7 @@
 			.name = #_active,				      \
 			.parent_names = (const char *[]){ "xo_board" },	      \
 			.num_parents = 1,				      \
+			.flags = (ignore_unused) ? CLK_IGNORE_UNUSED : 0,     \
 		},							      \
 	}
 
@@ -108,7 +110,17 @@
 
 #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
-		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE)
+		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE, false)
+
+/*
+ * Intended for XO clock where we don't want it turned off during late init
+ * if we don't have a consumer by then, but can turn it off later for deep
+ * sleep
+ */
+#define DEFINE_CLK_SMD_RPM_BRANCH_SKIP_UNUSED(_platform, _name, _active, type,\
+					      r_id, r)			      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
+		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE, true)
 
 #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
 		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
@@ -117,12 +129,12 @@
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id)	      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
-		QCOM_RPM_KEY_SOFTWARE_ENABLE)
+		QCOM_RPM_KEY_SOFTWARE_ENABLE, false)
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active, r_id) \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
-		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
+		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY, false)
 
 #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
 
@@ -656,6 +668,8 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 };
 
 /* msm8998 */
+DEFINE_CLK_SMD_RPM_BRANCH_SKIP_UNUSED(msm8998, xo, xo_a, QCOM_SMD_RPM_MISC_CLK,
+				      0, 19200000);
 DEFINE_CLK_SMD_RPM(msm8998, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8998, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
 DEFINE_CLK_SMD_RPM(msm8998, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
@@ -678,6 +692,8 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk2_pin, rf_clk2_a_pin, 5);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6);
 static struct clk_smd_rpm *msm8998_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &msm8998_xo,
+	[RPM_SMD_XO_A_CLK_SRC] = &msm8998_xo_a,
 	[RPM_SMD_SNOC_CLK] = &msm8998_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &msm8998_snoc_a_clk,
 	[RPM_SMD_CNOC_CLK] = &msm8998_cnoc_clk,
diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index c240fba794c7..b98e76cdc56a 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -117,17 +117,6 @@ static const char * const gcc_parent_names_5[] = {
 	"core_bi_pll_test_se",
 };
 
-static struct clk_fixed_factor xo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "xo",
-		.parent_names = (const char *[]){ "xo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 static struct pll_vco fabia_vco[] = {
 	{ 250000000, 2000000000, 0 },
 	{ 125000000, 1000000000, 1 },
@@ -2959,10 +2948,6 @@ static const struct regmap_config gcc_msm8998_regmap_config = {
 	.fast_io	= true,
 };
 
-static struct clk_hw *gcc_msm8998_hws[] = {
-	&xo.hw,
-};
-
 static const struct qcom_cc_desc gcc_msm8998_desc = {
 	.config = &gcc_msm8998_regmap_config,
 	.clks = gcc_msm8998_clocks,
@@ -2971,8 +2956,6 @@ static const struct qcom_cc_desc gcc_msm8998_desc = {
 	.num_resets = ARRAY_SIZE(gcc_msm8998_resets),
 	.gdscs = gcc_msm8998_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_msm8998_gdscs),
-	.clk_hws = gcc_msm8998_hws,
-	.num_clk_hws = ARRAY_SIZE(gcc_msm8998_hws),
 };
 
 static int gcc_msm8998_probe(struct platform_device *pdev)
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
