From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 6/7] clk: qcom: ipq4019: changed the frequency value for ddr pll
Date: Wed, 21 Sep 2016 17:51:51 +0530
Message-ID: <1474460512-31994-7-git-send-email-absahu@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The feedback divider for DDR PLL has been changed in IPQ4019
bootloader from 111 to 112 so changed the frequency values
for the same.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 52 +++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index b2decd5..a2809db 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -546,7 +546,7 @@ static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk[] = {
 	F(25000000,  P_FEPLL500, 1,  1, 20),
 	F(50000000,  P_FEPLL500, 1,  1, 10),
 	F(100000000, P_FEPLL500, 1,  1, 5),
-	F(190000000, P_DDRPLL,   1,  0, 0),
+	F(192000000, P_DDRPLL,   1,  0, 0),
 	{ }
 };
 
@@ -567,18 +567,18 @@ static struct clk_rcg2  sdcc1_apps_clk_src = {
 static const struct freq_tbl ftbl_gcc_apps_clk[] = {
 	F(48000000,  P_XO,         1, 0, 0),
 	F(200000000, P_FEPLL200,   1, 0, 0),
-	F(380000000, P_DDRPLLAPSS, 1, 0, 0),
-	F(409000000, P_DDRPLLAPSS, 1, 0, 0),
-	F(444000000, P_DDRPLLAPSS, 1, 0, 0),
-	F(484000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(384000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(413000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(448000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(488000000, P_DDRPLLAPSS, 1, 0, 0),
 	F(500000000, P_FEPLL500,   1, 0, 0),
-	F(507000000, P_DDRPLLAPSS, 1, 0, 0),
-	F(532000000, P_DDRPLLAPSS, 1, 0, 0),
-	F(560000000, P_DDRPLLAPSS, 1, 0, 0),
-	F(592000000, P_DDRPLLAPSS, 1, 0, 0),
-	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
-	F(666000000, P_DDRPLLAPSS, 1, 0, 0),
-	F(710000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(512000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(537000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(565000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(597000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(632000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(672000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(716000000, P_DDRPLLAPSS, 1, 0, 0),
 	{ }
 };
 
@@ -1381,20 +1381,20 @@ static const struct clk_ops clk_regmap_cpu_div_ops = {
 };
 
 static const struct freq_tbl ftbl_apps_ddr_pll[] = {
-	{ 380000000, P_XO, 0xd, 0, 0 },
-	{ 409000000, P_XO, 0xc, 0, 0 },
-	{ 444000000, P_XO, 0xb, 0, 0 },
-	{ 484000000, P_XO, 0xa, 0, 0 },
-	{ 507000000, P_XO, 0x9, 0, 0 },
-	{ 532000000, P_XO, 0x8, 0, 0 },
-	{ 560000000, P_XO, 0x7, 0, 0 },
-	{ 592000000, P_XO, 0x6, 0, 0 },
-	{ 626000000, P_XO, 0x5, 0, 0 },
-	{ 666000000, P_XO, 0x4, 0, 0 },
-	{ 710000000, P_XO, 0x3, 0, 0 },
-	{ 761000000, P_XO, 0x2, 0, 0 },
-	{ 819000000, P_XO, 0x1, 0, 0 },
-	{ 888000000, P_XO, 0x0, 0, 0 },
+	{ 384000000, P_XO, 0xd, 0, 0 },
+	{ 413000000, P_XO, 0xc, 0, 0 },
+	{ 448000000, P_XO, 0xb, 0, 0 },
+	{ 488000000, P_XO, 0xa, 0, 0 },
+	{ 512000000, P_XO, 0x9, 0, 0 },
+	{ 537000000, P_XO, 0x8, 0, 0 },
+	{ 565000000, P_XO, 0x7, 0, 0 },
+	{ 597000000, P_XO, 0x6, 0, 0 },
+	{ 632000000, P_XO, 0x5, 0, 0 },
+	{ 672000000, P_XO, 0x4, 0, 0 },
+	{ 716000000, P_XO, 0x3, 0, 0 },
+	{ 768000000, P_XO, 0x2, 0, 0 },
+	{ 823000000, P_XO, 0x1, 0, 0 },
+	{ 896000000, P_XO, 0x0, 0, 0 },
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
