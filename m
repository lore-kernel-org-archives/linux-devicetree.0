From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 2/5] clk: qcom: common: Return NULL from clk_hw OF provider
Date: Mon, 14 Oct 2019 15:53:05 +0530
Message-ID: <20191014102308.27441-3-tdas@codeaurora.org>
References: <20191014102308.27441-1-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014102308.27441-1-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Return NULL in the cases where the clk_hw is not registered with the
clock provider, but the clock consumer still requests for a clock id.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 28ddc747d703..caba81d18c70 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -218,7 +218,7 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 		return ERR_PTR(-EINVAL);
 	}

-	return cc->rclks[idx] ? &cc->rclks[idx]->hw : ERR_PTR(-ENOENT);
+	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
 }

 int qcom_cc_really_probe(struct platform_device *pdev,
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
