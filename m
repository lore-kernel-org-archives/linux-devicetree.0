From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 4/7] clk: qcom: ipq4019: Added all the frequencies for apps cpu
Date: Wed, 21 Sep 2016 17:51:49 +0530
Message-ID: <1474460512-31994-5-git-send-email-absahu@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The APPS CPU clock does not contain all the frequencies in its
frequency table so this patch adds the same.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 211c68c..160e0cf 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -565,10 +565,20 @@ static struct clk_rcg2  sdcc1_apps_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_apps_clk[] = {
-	F(48000000, P_XO,	   1, 0, 0),
+	F(48000000,  P_XO,         1, 0, 0),
 	F(200000000, P_FEPLL200,   1, 0, 0),
+	F(380000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(409000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(444000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(484000000, P_DDRPLLAPSS, 1, 0, 0),
 	F(500000000, P_FEPLL500,   1, 0, 0),
+	F(507000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(532000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(560000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(592000000, P_DDRPLLAPSS, 1, 0, 0),
 	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(666000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(710000000, P_DDRPLLAPSS, 1, 0, 0),
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
