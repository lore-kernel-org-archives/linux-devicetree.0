From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 4/5] clk: qcom: ipq4019: Added the all frequencies for apps cpu
Date: Tue, 21 Jun 2016 19:19:21 +0530
Message-ID: <1466516962-18087-5-git-send-email-absahu@codeaurora.org>
References: <1466516962-18087-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1466516962-18087-1-git-send-email-absahu@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The APPS CPU clock does not contain all the frequencies in its
frequency table so this patch adds the same.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 0bef36d..df159c2 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -554,11 +554,21 @@ static struct clk_rcg2  sdcc1_apps_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_apps_clk[] = {
-	F(48000000, P_XO,	   1, 0, 0),
-	F(200000000, P_FEPLL200,   1, 0, 0),
-	F(500000000, P_FEPLL500,   1, 0, 0),
-	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
-	{ }
+	{48000000, P_XO,          1, 0, 0},
+	{200000000, P_FEPLL200,   1, 0, 0},
+	{380000000, P_DDRPLLAPSS, 1, 0, 0},
+	{409000000, P_DDRPLLAPSS, 1, 0, 0},
+	{444000000, P_DDRPLLAPSS, 1, 0, 0},
+	{484000000, P_DDRPLLAPSS, 1, 0, 0},
+	{500000000, P_FEPLL500,   1, 0, 0},
+	{507000000, P_DDRPLLAPSS, 1, 0, 0},
+	{532000000, P_DDRPLLAPSS, 1, 0, 0},
+	{560000000, P_DDRPLLAPSS, 1, 0, 0},
+	{592000000, P_DDRPLLAPSS, 1, 0, 0},
+	{626000000, P_DDRPLLAPSS, 1, 0, 0},
+	{666000000, P_DDRPLLAPSS, 1, 0, 0},
+	{710000000, P_DDRPLLAPSS, 1, 0, 0},
+	{}
 };
 
 static struct clk_rcg2 apps_clk_src = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

