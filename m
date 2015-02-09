From: Andy Gross <agross@codeaurora.org>
Subject: [Patch v3 3/6] ARM: DT: apq8064: Add TCSR support
Date: Mon,  9 Feb 2015 16:01:08 -0600
Message-ID: <1423519271-4238-4-git-send-email-agross@codeaurora.org>
References: <1423519271-4238-1-git-send-email-agross@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1423519271-4238-1-git-send-email-agross@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch adds TCSR support for use by the GSBI to automatically configure ADM
CRCI values based on the GSBI port configuration.

Signed-off-by: Andy Gross <agross@codeaurora.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index b3154c0..f607900 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -166,6 +166,7 @@
 		gsbi1: gsbi@12440000 {
 			status = "disabled";
 			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <1>;
 			reg = <0x12440000 0x100>;
 			clocks = <&gcc GSBI1_H_CLK>;
 			clock-names = "iface";
@@ -173,6 +174,8 @@
 			#size-cells = <1>;
 			ranges;
 
+			syscon-tcsr = <&tcsr>;
+
 			i2c1: i2c@12460000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
 				reg = <0x12460000 0x1000>;
@@ -187,6 +190,7 @@
 		gsbi2: gsbi@12480000 {
 			status = "disabled";
 			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <2>;
 			reg = <0x12480000 0x100>;
 			clocks = <&gcc GSBI2_H_CLK>;
 			clock-names = "iface";
@@ -194,6 +198,8 @@
 			#size-cells = <1>;
 			ranges;
 
+			syscon-tcsr = <&tcsr>;
+
 			i2c2: i2c@124a0000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
 				reg = <0x124a0000 0x1000>;
@@ -208,6 +214,7 @@
 		gsbi7: gsbi@16600000 {
 			status = "disabled";
 			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <7>;
 			reg = <0x16600000 0x100>;
 			clocks = <&gcc GSBI7_H_CLK>;
 			clock-names = "iface";
@@ -215,6 +222,8 @@
 			#size-cells = <1>;
 			ranges;
 
+			syscon-tcsr = <&tcsr>;
+
 			serial@16640000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x16640000 0x1000>,
@@ -349,5 +358,10 @@
 				pinctrl-0 = <&sdc4_gpios>;
 			};
 		};
+
+		tcsr: syscon@1a400000 {
+			compatible = "qcom,tcsr-apq8064", "syscon";
+			reg = <0x1a400000 0x100>;
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
