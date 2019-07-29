From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 4/6] mailbox: qcom: Add support for Qualcomm SM8150 and SC7180 SoCs
Date: Mon, 29 Jul 2019 17:36:31 +0530
Message-ID: <20190729120633.20451-5-sibis@codeaurora.org>
References: <20190729120633.20451-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729120633.20451-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org
Cc: mark.rutland@arm.com, agross@kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add the corresponding APSS shared offset for SM8150 and SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 705e17a5479cc..d5dbfd5f8417f 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -119,6 +119,8 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = (void *)8 },
 	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = (void *)8 },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = (void *)12 },
+	{ .compatible = "qcom,sm8150-apss-shared", .data = (void *)12 },
+	{ .compatible = "qcom,sc7180-apss-shared", .data = (void *)12 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
