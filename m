From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 1/5] clk: qcom: rcg: update the DFS macro for RCG
Date: Mon, 14 Oct 2019 15:53:04 +0530
Message-ID: <20191014102308.27441-2-tdas@codeaurora.org>
References: <20191014102308.27441-1-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014102308.27441-1-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Update the init data name for each of the dynamic frequency switch
controlled clock associated with the RCG clock name, so that it can be
generated as per the hardware plan. Thus update the macro accordingly.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg.h    |  2 +-
 drivers/clk/qcom/gcc-sdm845.c | 96 +++++++++++++++++------------------
 2 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index c25b57c3cbc8..78358b81d249 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -168,7 +168,7 @@ struct clk_rcg_dfs_data {
 };
 
 #define DEFINE_RCG_DFS(r) \
-	{ .rcg = &r##_src, .init = &r##_init }
+	{ .rcg = &r, .init = &r##_init }
 
 extern int qcom_cc_register_rcg_dfs(struct regmap *regmap,
 				    const struct clk_rcg_dfs_data *rcgs,
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 95be125c3bdd..d2142fe46a8e 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -408,7 +408,7 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
 	{ }
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s0_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s0_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -421,10 +421,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s0_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s0_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s1_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s1_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -437,10 +437,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s1_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s1_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s2_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s2_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -453,10 +453,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s2_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s2_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s3_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s3_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -469,10 +469,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s3_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s3_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s4_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s4_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -485,10 +485,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s4_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s4_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s5_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s5_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -501,10 +501,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s5_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s5_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s6_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s6_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -517,10 +517,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s6_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s6_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s7_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s7_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -533,10 +533,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s7_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s7_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s0_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s0_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -549,10 +549,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s0_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s0_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s1_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s1_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -565,10 +565,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s1_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s1_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s2_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s2_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -581,10 +581,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s2_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s2_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s3_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s3_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -597,10 +597,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s3_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s3_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s4_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s4_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -613,10 +613,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s4_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s4_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s5_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s5_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -629,10 +629,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s5_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s5_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s6_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s6_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -645,10 +645,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s6_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s6_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s7_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s7_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -661,7 +661,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s7_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s7_clk_src_init,
 };
 
 static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
@@ -3577,22 +3577,22 @@ static const struct of_device_id gcc_sdm845_match_table[] = {
 MODULE_DEVICE_TABLE(of, gcc_sdm845_match_table);
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s6_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s7_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s6_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s7_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s7_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s7_clk_src),
 };
 
 static int gcc_sdm845_probe(struct platform_device *pdev)
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
