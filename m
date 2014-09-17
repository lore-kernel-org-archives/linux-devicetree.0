From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ARM: DT: ifc6410: Add board memory range.
Date: Wed, 17 Sep 2014 06:36:19 +0100
Message-ID: <1410932179-4652-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds memory details of IFC6410 as this is necessary to
fix the in-correct memory start comming from ATAGs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 90db8af..3287f12 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -4,6 +4,11 @@
 	model = "Qualcomm APQ8064/IFC6410";
 	compatible = "qcom,apq8064-ifc6410", "qcom,apq8064";
 
+	memory{
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
 	soc {
 		gsbi@16600000 {
 			status = "ok";
-- 
1.9.1
