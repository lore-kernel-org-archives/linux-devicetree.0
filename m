From: Amit Nischal <anischal@codeaurora.org>
Subject: [PATCH v6 2/3] clk: qcom: Add support for BRANCH_NO_DELAY flag for branch clocks
Date: Mon, 30 Apr 2018 21:50:09 +0530
Message-ID: <1525105210-8689-3-git-send-email-anischal@codeaurora.org>
References: <1525105210-8689-1-git-send-email-anischal@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525105210-8689-1-git-send-email-anischal@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Amit Nischal <anischal@codeaurora.org>
List-Id: devicetree@vger.kernel.org

There could be few clocks where the clock status bit is not
required to be polled as the clock on/off would be controlled
by enabling/disabling external source. Add support for the
same by introducing new flag named as 'BRANCH_NO_DELAY'.

Signed-off-by: Amit Nischal <anischal@codeaurora.org>
---
 drivers/clk/qcom/clk-branch.c | 7 +++++--
 drivers/clk/qcom/clk-branch.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index 26f7af31..1a3db39 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -77,8 +77,11 @@ static int clk_branch_wait(const struct clk_branch *br, bool enabling,
 	bool voted = br->halt_check & BRANCH_VOTED;
 	const char *name = clk_hw_get_name(&br->clkr.hw);

-	/* Skip checking halt bit if the clock is in hardware gated mode */
-	if (clk_branch_in_hwcg_mode(br))
+	/*
+	 * Skip checking halt bit if halt_check is BRANCH_NO_DELAY or
+	 * the clock is in hardware gated mode
+	 */
+	if (br->halt_check == BRANCH_NO_DELAY || clk_branch_in_hwcg_mode(br))
 		return 0;

 	if (br->halt_check == BRANCH_HALT_DELAY || (!enabling && voted)) {
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 284df3f..5d621f3 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -42,6 +42,7 @@ struct clk_branch {
 #define BRANCH_HALT_ENABLE		1 /* pol: 0 = halt */
 #define BRANCH_HALT_ENABLE_VOTED	(BRANCH_HALT_ENABLE | BRANCH_VOTED)
 #define BRANCH_HALT_DELAY		2 /* No bit to check; just delay */
+#define BRANCH_NO_DELAY			3 /* No bit to check; without delay */

 	struct clk_regmap clkr;
 };
--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
