From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 5/7] clk: qcom: ipq4019: corrected sdcc frequency and parent name
Date: Wed, 21 Sep 2016 17:51:50 +0530
Message-ID: <1474460512-31994-6-git-send-email-absahu@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. The parent for sdcc clock is sdccpll so corrected the same
   in its parent map.
2. The frequency value was wrong so changed to correct
   frequency.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 160e0cf..b2decd5 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -120,7 +120,7 @@ static struct parent_map gcc_xo_sdcc1_500_map[] = {
 
 static const char * const gcc_xo_sdcc1_500[] = {
 	"xo",
-	"ddrpll",
+	"ddrpllsdcc",
 	"fepll500",
 };
 
@@ -540,13 +540,13 @@ static struct clk_branch gcc_gp3_clk = {
 };
 
 static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk[] = {
-	F(144000,    P_XO,			1,  3, 240),
-	F(400000,    P_XO,			1,  1, 0),
-	F(20000000,  P_FEPLL500,		1,  1, 25),
-	F(25000000,  P_FEPLL500,		1,  1, 20),
-	F(50000000,  P_FEPLL500,		1,  1, 10),
-	F(100000000, P_FEPLL500,		1,  1, 5),
-	F(193000000, P_DDRPLL,		1,  0, 0),
+	F(144000,    P_XO,       1,  3, 240),
+	F(400000,    P_XO,       1,  1, 0),
+	F(20000000,  P_FEPLL500, 1,  1, 25),
+	F(25000000,  P_FEPLL500, 1,  1, 20),
+	F(50000000,  P_FEPLL500, 1,  1, 10),
+	F(100000000, P_FEPLL500, 1,  1, 5),
+	F(190000000, P_DDRPLL,   1,  0, 0),
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
