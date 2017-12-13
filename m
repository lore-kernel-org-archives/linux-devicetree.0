From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 03/11] clk: qcom: ipq8074: fix missing GPLL0 divider width
Date: Wed, 13 Dec 2017 19:55:34 +0530
Message-ID: <1513175142-3702-4-git-send-email-absahu@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

GPLL0 uses 4 bits post divider which should be specified
in clock driver structure.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index ed2d00f..99906f6 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -84,6 +84,7 @@ enum {
 static struct clk_alpha_pll_postdiv gpll0 = {
 	.offset = 0x21000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
 		.parent_names = (const char *[]){
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

