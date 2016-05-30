From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 1/5] clk: qcom: ipq4019: Modified the fixed clock rate to proper values
Date: Mon, 30 May 2016 20:02:34 +0530
Message-ID: <1464618758-20965-2-git-send-email-absahu@codeaurora.org>
References: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Modified the fixed clock rate initialization in the IPQ4019 clock
probe function with correct values.

Also some of the fixed clocks entries were not added in the current
driver file so added the same.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 3cd1af0..db24cb8 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -80,7 +80,7 @@ static struct parent_map gcc_xo_sdcc1_500_map[] = {
 
 static const char * const gcc_xo_sdcc1_500[] = {
 	"xo",
-	"ddrpll",
+	"ddrpllsdcc",
 	"fepll500",
 };
 
@@ -1317,13 +1317,15 @@ static int gcc_ipq4019_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
-	clk_register_fixed_rate(dev, "fepll125", "xo", 0, 200000000);
-	clk_register_fixed_rate(dev, "fepll125dly", "xo", 0, 200000000);
-	clk_register_fixed_rate(dev, "fepllwcss2g", "xo", 0, 200000000);
-	clk_register_fixed_rate(dev, "fepllwcss5g", "xo", 0, 200000000);
+	clk_register_fixed_rate(dev, "fepll125", "xo", 0, 125000000);
+	clk_register_fixed_rate(dev, "fepll125dly", "xo", 0, 125000000);
+	clk_register_fixed_rate(dev, "fepllwcss2g", "xo", 0, 250000000);
+	clk_register_fixed_rate(dev, "fepllwcss5g", "xo", 0, 250000000);
 	clk_register_fixed_rate(dev, "fepll200", "xo", 0, 200000000);
-	clk_register_fixed_rate(dev, "fepll500", "xo", 0, 200000000);
+	clk_register_fixed_rate(dev, "fepll500", "xo", 0, 500000000);
 	clk_register_fixed_rate(dev, "ddrpllapss", "xo", 0, 666000000);
+	clk_register_fixed_rate(dev, "ddrpllsdcc", "xo", 0, 193000000);
+	clk_register_fixed_rate(dev, "pcnoc_clk_src", "xo", 0, 100000000);
 
 	return qcom_cc_probe(pdev, &gcc_ipq4019_desc);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
