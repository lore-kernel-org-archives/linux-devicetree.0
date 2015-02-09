From: Andy Gross <agross@codeaurora.org>
Subject: [Patch v3 4/6] ARM: DT: ipq8064: Add TCSR support
Date: Mon,  9 Feb 2015 16:01:09 -0600
Message-ID: <1423519271-4238-5-git-send-email-agross@codeaurora.org>
References: <1423519271-4238-1-git-send-email-agross@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423519271-4238-1-git-send-email-agross@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch adds TCSR support for use by the GSBI to automatically configure ADM
CRCI values based on the GSBI port configuration.

Signed-off-by: Andy Gross <agross@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 63b2146..d3643fe 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -120,6 +120,7 @@
 
 		gsbi2: gsbi@12480000 {
 			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <2>;
 			reg = <0x12480000 0x100>;
 			clocks = <&gcc GSBI2_H_CLK>;
 			clock-names = "iface";
@@ -128,6 +129,8 @@
 			ranges;
 			status = "disabled";
 
+			syscon-tcsr = <&tcsr>;
+
 			serial@12490000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x12490000 0x1000>,
@@ -155,6 +158,7 @@
 
 		gsbi4: gsbi@16300000 {
 			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <4>;
 			reg = <0x16300000 0x100>;
 			clocks = <&gcc GSBI4_H_CLK>;
 			clock-names = "iface";
@@ -163,6 +167,8 @@
 			ranges;
 			status = "disabled";
 
+			syscon-tcsr = <&tcsr>;
+
 			serial@16340000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x16340000 0x1000>,
@@ -189,6 +195,7 @@
 
 		gsbi5: gsbi@1a200000 {
 			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <5>;
 			reg = <0x1a200000 0x100>;
 			clocks = <&gcc GSBI5_H_CLK>;
 			clock-names = "iface";
@@ -197,6 +204,8 @@
 			ranges;
 			status = "disabled";
 
+			syscon-tcsr = <&tcsr>;
+
 			serial@1a240000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x1a240000 0x1000>,
@@ -279,5 +288,10 @@
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
+
+		tcsr: syscon@1a400000 {
+			compatible = "qcom,tcsr-ipq8064", "syscon";
+			reg = <0x1a400000 0x100>;
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
