From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v10 2/6] mailbox: qcom: Create APCS child device for clock controller
Date: Fri,  1 Dec 2017 19:02:20 +0200
Message-ID: <20171201170224.25053-3-georgi.djakov@linaro.org>
References: <20171201170224.25053-1-georgi.djakov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171201170224.25053-1-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, robh@kernel.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

There is a clock controller functionality provided by the APCS hardware
block of msm8916 devices. The device-tree would represent an APCS node
with both mailbox and clock provider properties.
Create a platform child device for the clock controller functionality so
the driver can probe and use APCS as parent.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index ab344bc6fa63..57bde0dfd12f 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -29,6 +29,7 @@ struct qcom_apcs_ipc {
 
 	struct regmap *regmap;
 	unsigned long offset;
+	struct platform_device *clk;
 };
 
 static const struct regmap_config apcs_regmap_config = {
@@ -96,6 +97,14 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
+		apcs->clk = platform_device_register_data(&pdev->dev,
+							  "qcom-apcs-msm8916-clk",
+							  -1, NULL, 0);
+		if (IS_ERR(apcs->clk))
+			dev_err(&pdev->dev, "failed to register APCS clk\n");
+	}
+
 	platform_set_drvdata(pdev, apcs);
 
 	return 0;
@@ -104,8 +113,10 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 static int qcom_apcs_ipc_remove(struct platform_device *pdev)
 {
 	struct qcom_apcs_ipc *apcs = platform_get_drvdata(pdev);
+	struct platform_device *clk = apcs->clk;
 
 	mbox_controller_unregister(&apcs->mbox);
+	platform_device_unregister(clk);
 
 	return 0;
 }
