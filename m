From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 4/5] clk: qcom: ipq4019: Added the cpu clock frequency change notifier
Date: Mon, 30 May 2016 20:02:37 +0530
Message-ID: <1464618758-20965-5-git-send-email-absahu@codeaurora.org>
References: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current IPQ4019 clock driver code gives the crash or gets hang
while switching the CPU frequency some time. The APSS CPU Clock
divider is not glitch free so the APPS clock need to be switched for
stable clock duringthe change.

This patch adds the frequency change notifier for APSS CPU clock.
It changes the parent of this clock to stable PLL FEPLL500 when it
gets for PRE_RATE_CHANGE event. This event will be generated before
actual clock set operations. The clock set operation will again change
its corresponding parent by getting the same from frequency table.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 263577c..69a8250 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1455,9 +1455,27 @@ static const struct of_device_id gcc_ipq4019_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, gcc_ipq4019_match_table);
 
+int cpu_clk_notifier_fn(struct notifier_block *nb,
+			unsigned long action, void *data)
+{
+	int err = 0;
+
+	if (action == PRE_RATE_CHANGE) {
+		err = clk_rcg2_ops.set_parent(&apps_clk_src.clkr.hw,
+							P_FEPLL500);
+	}
+
+	return notifier_from_errno(err);
+}
+
+struct notifier_block cpu_clk_notifier = {
+	.notifier_call = cpu_clk_notifier_fn,
+};
+
 static int gcc_ipq4019_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	int err;
 
 	clk_register_fixed_rate(dev, "fepll125", "xo", 0, 125000000);
 	clk_register_fixed_rate(dev, "fepll125dly", "xo", 0, 125000000);
@@ -1469,7 +1487,13 @@ static int gcc_ipq4019_probe(struct platform_device *pdev)
 	clk_register_fixed_rate(dev, "ddrpllsdcc", "xo", 0, 193000000);
 	clk_register_fixed_rate(dev, "pcnoc_clk_src", "xo", 0, 100000000);
 
-	return qcom_cc_probe(pdev, &gcc_ipq4019_desc);
+	err = qcom_cc_probe(pdev, &gcc_ipq4019_desc);
+
+	if (!err)
+		clk_notifier_register(apps_clk_src.clkr.hw.clk,
+					&cpu_clk_notifier);
+
+	return err;
 }
 
 static struct platform_driver gcc_ipq4019_driver = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
