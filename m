From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v3 2/3] usb: dwc3: qcom: Add support for MSM8998
Date: Mon, 21 Jan 2019 14:33:08 -0700
Message-ID: <1548106388-5079-1-git-send-email-jhugo@codeaurora.org>
References: <1548106307-4762-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548106307-4762-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, balbi@kernel.org
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add a MSM8998 specific DT compatible so that we can properly bind to the
device and enable the USB controller.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index a6d0203..184df4d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -595,6 +595,7 @@ static int __maybe_unused dwc3_qcom_runtime_resume(struct device *dev)
 static const struct of_device_id dwc3_qcom_of_match[] = {
 	{ .compatible = "qcom,dwc3" },
 	{ .compatible = "qcom,msm8996-dwc3" },
+	{ .compatible = "qcom,msm8998-dwc3" },
 	{ .compatible = "qcom,sdm845-dwc3" },
 	{ }
 };
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
