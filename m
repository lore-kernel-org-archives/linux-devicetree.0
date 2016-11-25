From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 4/6] clk: qcom: ipq4019: correct sdcc frequency and parent name
Date: Fri, 25 Nov 2016 21:11:31 +0530
Message-ID: <1480088493-4590-5-git-send-email-absahu@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, varada@codeaurora.org, pradeepb@codeaurora.org, snlakshm@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. The parent for sdcc clock is sdccpll.
2. The frequency value was wrong so modified the same.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 40187ae..320750c 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -124,7 +124,7 @@ struct clk_fepll {
 
 static const char * const gcc_xo_sdcc1_500[] = {
 	"xo",
-	"ddrpll",
+	"ddrpllsdcc",
 	"fepll500",
 };
 
@@ -550,7 +550,7 @@ struct clk_fepll {
 	F(25000000,  P_FEPLL500,		1,  1, 20),
 	F(50000000,  P_FEPLL500,		1,  1, 10),
 	F(100000000, P_FEPLL500,		1,  1, 5),
-	F(193000000, P_DDRPLL,		1,  0, 0),
+	F(192000000, P_DDRPLL,			1,  0, 0),
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

