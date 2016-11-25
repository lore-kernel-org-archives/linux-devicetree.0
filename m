From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 6/6] clk: qcom: ipq4019: Add the cpu clock frequency change notifier
Date: Fri, 25 Nov 2016 21:11:33 +0530
Message-ID: <1480088493-4590-7-git-send-email-absahu@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, varada@codeaurora.org, pradeepb@codeaurora.org, snlakshm@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current driver code gives the crash or gets hang while switching
the CPU frequency some time. The APSS CPU Clock divider is not glitch
free so it the APPS clock need to be switched for stable clock during
the change.

This patch adds the frequency change notifier for APSS CPU clock. It
changes the parent of this clock to stable PLL FEPLL500 when it gets
for PRE_RATE_CHANGE event. This event will be generated before actual
clock set operations. The clock set operation will again change its
corresponding parent by getting the same from frequency table.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 45 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index eeafca2..94df10d 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -22,6 +22,7 @@
 #include <linux/reset-controller.h>
 #include <linux/math64.h>
 #include <linux/delay.h>
+#include <linux/clk.h>
 
 #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
 
@@ -1736,13 +1737,55 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 };
 MODULE_DEVICE_TABLE(of, gcc_ipq4019_match_table);
 
+/* Contains index for safe clock during APSS freq change */
+static int gcc_ipq4019_cpu_safe_parent;
+static int
+gcc_ipq4019_cpu_clk_notifier_fn(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	int err = 0;
+
+	if (action == PRE_RATE_CHANGE)
+		err = clk_rcg2_ops.set_parent(&apps_clk_src.clkr.hw,
+					      gcc_ipq4019_cpu_safe_parent);
+
+	return notifier_from_errno(err);
+}
+
+static struct notifier_block gcc_ipq4019_cpu_clk_notifier = {
+	.notifier_call = gcc_ipq4019_cpu_clk_notifier_fn,
+};
+
 static int gcc_ipq4019_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &gcc_ipq4019_desc);
+	int err;
+
+	err = qcom_cc_probe(pdev, &gcc_ipq4019_desc);
+	if (err)
+		return err;
+
+	gcc_ipq4019_cpu_safe_parent = qcom_find_src_index(&apps_clk_src.clkr.hw,
+						apps_clk_src.parent_map,
+						P_FEPLL500);
+	if (gcc_ipq4019_cpu_safe_parent < 0)
+		err = gcc_ipq4019_cpu_safe_parent;
+
+	if (!err)
+		err = clk_notifier_register(apps_clk_src.clkr.hw.clk,
+				      &gcc_ipq4019_cpu_clk_notifier);
+
+	return err;
+}
+
+static int gcc_ipq4019_remove(struct platform_device *pdev)
+{
+	return clk_notifier_unregister(apps_clk_src.clkr.hw.clk,
+					&gcc_ipq4019_cpu_clk_notifier);
 }
 
 static struct platform_driver gcc_ipq4019_driver = {
 	.probe		= gcc_ipq4019_probe,
+	.remove		= gcc_ipq4019_remove,
 	.driver		= {
 		.name	= "qcom,gcc-ipq4019",
 		.of_match_table = gcc_ipq4019_match_table,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

