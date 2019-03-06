From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/3] clk: qcom: branch: Add AON clock ops
Date: Wed,  6 Mar 2019 09:47:57 -0800
Message-ID: <20190306174758.22462-3-bjorn.andersson@linaro.org>
References: <20190306174758.22462-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306174758.22462-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some clocks can only be turned on by resetting the block containing
them, provide a clock type that allow us to reference these clocks and
have the client drivers enable and "disable" them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/clk-branch.c | 6 ++++++
 drivers/clk/qcom/clk-branch.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index 99446bf630aa..f869fc6aaed6 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -146,6 +146,12 @@ const struct clk_ops clk_branch2_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_branch2_ops);
 
+const struct clk_ops clk_branch2_aon_ops = {
+	.enable = clk_branch2_enable,
+	.is_enabled = clk_is_enabled_regmap,
+};
+EXPORT_SYMBOL_GPL(clk_branch2_aon_ops);
+
 const struct clk_ops clk_branch_simple_ops = {
 	.enable = clk_enable_regmap,
 	.disable = clk_disable_regmap,
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index b3561e0a3984..17a58119165e 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -40,6 +40,7 @@ struct clk_branch {
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
+extern const struct clk_ops clk_branch2_aon_ops;
 
 #define to_clk_branch(_hw) \
 	container_of(to_clk_regmap(_hw), struct clk_branch, clkr)
-- 
2.18.0
