From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v1 5/6] usb: dwc3: qcom: Add support for MSM8998
Date: Fri,  4 Jan 2019 09:51:02 -0700
Message-ID: <1546620662-2504-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, balbi@kernel.org
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add a MSM8998 specific DT compatible so that we can properly bind to the
device and enable the USB controller.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 1 +
 drivers/usb/dwc3/dwc3-qcom.c                        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
index 95afdcf..cb695aa 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible:		Compatible list, contains
 			"qcom,dwc3"
 			"qcom,msm8996-dwc3" for msm8996 SOC.
+			"qcom,msm8998-dwc3" for msm8998 SOC.
 			"qcom,sdm845-dwc3" for sdm845 SOC.
 - reg:			Offset and length of register set for QSCRATCH wrapper
 - power-domains:	specifies a phandle to PM domain provider node
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
