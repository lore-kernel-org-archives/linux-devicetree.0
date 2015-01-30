From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] clk: qcom: gcc-msm8960: add child devices support.
Date: Fri, 30 Jan 2015 09:51:27 +0000
Message-ID: <1422611487-15259-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1422611459-15217-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422611459-15217-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, edubezval@gmail.com, nrajan@codeaurora.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds support to add child devices to gcc as some of the
registers mapped by gcc are used by drivers like thermal sensors.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8960.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 0cd3e26..2315b64 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -15,6 +15,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/of_platform.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -3677,12 +3678,16 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	return qcom_cc_probe(pdev, match->data);
+	qcom_cc_probe(pdev, match->data);
+
+	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
 }
 
 static int gcc_msm8960_remove(struct platform_device *pdev)
 {
 	qcom_cc_remove(pdev);
+	of_platform_depopulate(&pdev->dev);
+
 	return 0;
 }
 
-- 
1.9.1
