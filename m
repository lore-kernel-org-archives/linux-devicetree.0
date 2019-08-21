From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 4/4] reset: qcom: pdc: Add support for SC7180 SoCs
Date: Wed, 21 Aug 2019 15:24:42 +0530
Message-ID: <20190821095442.24495-5-sibis@codeaurora.org>
References: <20190821095442.24495-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821095442.24495-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add PCD Global support for SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/reset/reset-qcom-pdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-qcom-pdc.c b/drivers/reset/reset-qcom-pdc.c
index ab74bccd4a5b5..d876e48f05524 100644
--- a/drivers/reset/reset-qcom-pdc.c
+++ b/drivers/reset/reset-qcom-pdc.c
@@ -106,6 +106,7 @@ static int qcom_pdc_reset_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_pdc_reset_of_match[] = {
+	{ .compatible = "qcom,sc7180-pdc-global" },
 	{ .compatible = "qcom,sdm845-pdc-global" },
 	{}
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
