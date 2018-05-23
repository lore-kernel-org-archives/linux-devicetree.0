From: Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v11 3/8] clk: Use devm_ in the register fixed factor clock
Date: Wed, 23 May 2018 15:52:56 +0300
Message-ID: <1527079981-11179-4-git-send-email-ilialin@codeaurora.org>
References: <1527079981-11179-1-git-send-email-ilialin@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527079981-11179-1-git-send-email-ilialin@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, will.deacon@arm.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, vireshk@kernel.org, ilialin@codeaurora.org
List-Id: devicetree@vger.kernel.org

Use devm_clk_hw_register instead of clk_hw_register
to simplify the usage of this API. This way drivers that call
the clk_hw_register_fixed_factor won't need to maintain
a data structure for further cleanup.

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
---
 drivers/clk/clk-fixed-factor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index a5d402d..8e39bda 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -94,7 +94,7 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 	init.num_parents = 1;
 
 	hw = &fix->hw;
-	ret = clk_hw_register(dev, hw);
+	ret = devm_clk_hw_register(dev, hw);
 	if (ret) {
 		kfree(fix);
 		hw = ERR_PTR(ret);
-- 
1.9.1
