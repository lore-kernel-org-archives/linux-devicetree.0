From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 7/7] clk: qcom: ipq4019: changed i2c freq table
Date: Wed, 21 Sep 2016 17:51:52 +0530
Message-ID: <1474460512-31994-8-git-send-email-absahu@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current I2C freq table uses MND values which is not
applicable for I2C since its RCG does not have MND
counter. This patch updates the freq table for 19.05
MHz clk frequency with FEPLL_200 parent.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index a2809db..314aa35 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -225,8 +225,7 @@ static struct clk_branch gcc_audio_pwm_clk = {
 };
 
 static const struct freq_tbl ftbl_gcc_blsp1_qup1_2_i2c_apps_clk[] = {
-	F(19200000, P_XO, 1, 2, 5),
-	F(24000000, P_XO, 1, 1, 2),
+	F(19050000, P_FEPLL200, 10.5, 1, 1),
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
