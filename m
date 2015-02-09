From: Andy Gross <agross@codeaurora.org>
Subject: [Patch v3 5/6] ARM: DT: msm8660: Add TCSR support
Date: Mon,  9 Feb 2015 16:01:10 -0600
Message-ID: <1423519271-4238-6-git-send-email-agross@codeaurora.org>
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
 arch/arm/boot/dts/qcom-msm8660.dtsi |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 0affd61..20bbd19 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -82,6 +82,7 @@
 
 		gsbi12: gsbi@19c00000 {
 			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <12>;
 			reg = <0x19c00000 0x100>;
 			clocks = <&gcc GSBI12_H_CLK>;
 			clock-names = "iface";
@@ -89,6 +90,8 @@
 			#size-cells = <1>;
 			ranges;
 
+			syscon-tcsr = <&tcsr>;
+
 			serial@19c40000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x19c40000 0x1000>,
@@ -196,6 +199,11 @@
 				vmmc-supply = <&vsdcc_fixed>;
 			};
 		};
+
+		tcsr: syscon@1a400000 {
+			compatible = "qcom,tcsr-msm8660", "syscon";
+			reg = <0x1a400000 0x100>;
+		};
 	};
 
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
