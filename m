From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 5/5] clk: qcom: ipq4019: Added the turbo frequency for apps cpu
Date: Mon, 30 May 2016 20:02:38 +0530
Message-ID: <1464618758-20965-6-git-send-email-absahu@codeaurora.org>
References: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Added the CPU turbo frequency (710 Mhz) to frequency table of
APPS CPU clock.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 69a8250..c325618 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -665,11 +665,12 @@ static struct clk_apps_cpu_div gcc_apps_cpu_div_clk = {
 };
 
 static const struct freq_tbl ftbl_gcc_apps_clk[] = {
-	F(48000000, P_XO,	   1, 0, 0),
-	F(200000000, P_FEPLL200,   1, 0, 0),
-	F(500000000, P_FEPLL500,   1, 0, 0),
+	F(48000000, P_XO, 1, 0, 0),
+	F(200000000, P_FEPLL200, 1, 0, 0),
+	F(500000000, P_FEPLL500, 1, 0, 0),
 	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
-	{ }
+	F(710000000, P_DDRPLLAPSS, 1, 0, 0),
+	{}
 };
 
 static struct clk_rcg2 apps_clk_src = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

