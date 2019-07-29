From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 6/6] soc: qcom: aoss: Add AOSS QMP support
Date: Mon, 29 Jul 2019 17:36:33 +0530
Message-ID: <20190729120633.20451-7-sibis@codeaurora.org>
References: <20190729120633.20451-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729120633.20451-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org
Cc: mark.rutland@arm.com, agross@kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add AOSS QMP support for SM8150 and SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 5f885196f4d0f..e2f8c7c9a5a0a 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -462,6 +462,8 @@ static int qmp_remove(struct platform_device *pdev)
 
 static const struct of_device_id qmp_dt_match[] = {
 	{ .compatible = "qcom,sdm845-aoss-qmp", },
+	{ .compatible = "qcom,sm8150-aoss-qmp", },
+	{ .compatible = "qcom,sc7180-aoss-qmp", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qmp_dt_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
