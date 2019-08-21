From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/4] reset: qcom: aoss: Add support for SC7180 SoCs
Date: Wed, 21 Aug 2019 15:24:40 +0530
Message-ID: <20190821095442.24495-3-sibis@codeaurora.org>
References: <20190821095442.24495-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821095442.24495-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add AOSS reset support for SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/reset/reset-qcom-aoss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-qcom-aoss.c b/drivers/reset/reset-qcom-aoss.c
index 36db967504507..a400db93eb7d2 100644
--- a/drivers/reset/reset-qcom-aoss.c
+++ b/drivers/reset/reset-qcom-aoss.c
@@ -115,6 +115,7 @@ static int qcom_aoss_reset_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_aoss_reset_of_match[] = {
+	{ .compatible = "qcom,sc7180-aoss-cc", .data = &sdm845_aoss_desc },
 	{ .compatible = "qcom,sdm845-aoss-cc", .data = &sdm845_aoss_desc },
 	{}
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
