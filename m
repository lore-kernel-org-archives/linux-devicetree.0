From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 1/3] bus: simple-pm: add support to pm clocks
Date: Fri,  4 Nov 2016 12:59:45 +0000
Message-ID: <1478264387-17914-2-git-send-email-srinivas.kandagatla@linaro.org>
References: <1478264387-17914-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478264387-17914-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: svarbanov@mm-sol.com, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds support to pm clocks via device tree, so that the clocks
can be turned on and off during runtime pm. This patch is required for
Qualcomm msm8996 pcie controller which sits on a bus with its own
power-domain and clocks.

Without this patch the clock associated with the bus are never turned on.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/bus/simple-pm-bus.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index c5eb46c..63b7e8c 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 
 
@@ -22,17 +23,26 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	if (np)
+	if (np) {
+		of_pm_clk_add_clks(&pdev->dev);
 		of_platform_populate(np, NULL, NULL, &pdev->dev);
+	}
 
 	return 0;
 }
 
+static const struct dev_pm_ops simple_pm_bus_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend,
+			   pm_clk_resume, NULL)
+};
+
 static int simple_pm_bus_remove(struct platform_device *pdev)
 {
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
 	pm_runtime_disable(&pdev->dev);
+	pm_clk_destroy(&pdev->dev);
+
 	return 0;
 }
 
@@ -48,6 +58,7 @@ static struct platform_driver simple_pm_bus_driver = {
 	.driver = {
 		.name = "simple-pm-bus",
 		.of_match_table = simple_pm_bus_of_match,
+		.pm = &simple_pm_bus_pm_ops,
 	},
 };
 
-- 
2.10.1
