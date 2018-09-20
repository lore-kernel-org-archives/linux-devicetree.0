From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] mailbox: qcom: Add QCS404 APPS Global compatible
Date: Wed, 19 Sep 2018 18:44:08 -0700
Message-ID: <20180920014408.14645-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for the QCS404 APPS Global block with IPC register at offset
8.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt        | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index 6e8a9ab0fdae..1232fc9fc709 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -11,6 +11,7 @@ platforms.
 		    "qcom,msm8916-apcs-kpss-global",
 		    "qcom,msm8996-apcs-hmss-global"
 		    "qcom,msm8998-apcs-hmss-global"
+		    "qcom,qcs404-apcs-apps-global"
 		    "qcom,sdm845-apss-shared"
 
 - reg:
diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 333ed4a9d4b8..aed23ac9550d 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -126,6 +126,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = (void *)8 },
 	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = (void *)16 },
 	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = (void *)8 },
+	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = (void *)8 },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = (void *)12 },
 	{}
 };
-- 
2.18.0
