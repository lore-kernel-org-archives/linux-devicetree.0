From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/3] mailbox: Add support for Qualcomm SDM845 SoCs
Date: Wed, 25 Apr 2018 20:08:02 +0530
Message-ID: <20180425143803.11260-2-sibis@codeaurora.org>
References: <20180425143803.11260-1-sibis@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180425143803.11260-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, mark.rutland@arm.com, bjorn.andersson@linaro.org
Cc: david.brown@linaro.org, linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com, will.deacon@arm.com, catalin.marinas@arm.com, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add the corresponding APSS shared offset for SDM845 SoC

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 57bde0dfd12f..75da44d25fac 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -125,6 +125,7 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
 static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = (void *)8 },
 	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = (void *)16 },
+	{ .compatible = "qcom,sdm845-apss-shared", .data = (void *)12 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
