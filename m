From: kbuild test robot <fengguang.wu@intel.com>
Subject: [RFC PATCH] clk: qcom: gcc_lpass_sway_clk can be static
Date: Thu, 14 Jun 2018 18:38:11 +0800
Message-ID: <20180614103811.GA29920@lkp-sb05>
References: <1528961943-12506-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1528961943-12506-3-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh@kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rohit Kumar <rohitkr@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org


Fixes: 035d2520712d ("clk: qcom: Add lpass clock controller driver for SDM845")
Signed-off-by: kbuild test robot <fengguang.wu@intel.com>
---
 lpasscc-sdm845.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
index d04a4c8..5b9ad76 100644
--- a/drivers/clk/qcom/lpasscc-sdm845.c
+++ b/drivers/clk/qcom/lpasscc-sdm845.c
@@ -29,7 +29,7 @@ static struct clk_branch gcc_lpass_q6_axi_clk = {
 	},
 };
 
-struct clk_branch gcc_lpass_sway_clk = {
+static struct clk_branch gcc_lpass_sway_clk = {
 	.halt_reg = 0x8,
 	.halt_check = BRANCH_HALT,
 	.clkr = {
