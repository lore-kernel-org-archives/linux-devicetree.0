From: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 3/6] ARM: DT: apq8064: Add TCSR support
Date: Tue, 27 Jan 2015 16:10:41 -0600
Message-ID: <1422396644-21714-4-git-send-email-agross@codeaurora.org>
References: <1422396644-21714-1-git-send-email-agross@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422396644-21714-1-git-send-email-agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds TCSR support for use by the GSBI to automatically configure ADM
CRCI values based on the GSBI port configuration.

Signed-off-by: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index b3154c0..f9a947c 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -165,7 +165,7 @@
 
 		gsbi1: gsbi@12440000 {
 			status = "disabled";
-			compatible = "qcom,gsbi-v1.0.0";
+			compatible = "qcom,gsbi-apq8064";
 			reg = <0x12440000 0x100>;
 			clocks = <&gcc GSBI1_H_CLK>;
 			clock-names = "iface";
@@ -173,6 +173,9 @@
 			#size-cells = <1>;
 			ranges;
 
+			qcom,gsbi-num = <1>;
+			syscon-tcsr = <&tcsr>;
+
 			i2c1: i2c@12460000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
 				reg = <0x12460000 0x1000>;
@@ -186,7 +189,7 @@
 
 		gsbi2: gsbi@12480000 {
 			status = "disabled";
-			compatible = "qcom,gsbi-v1.0.0";
+			compatible = "qcom,gsbi-apq8064";
 			reg = <0x12480000 0x100>;
 			clocks = <&gcc GSBI2_H_CLK>;
 			clock-names = "iface";
@@ -194,6 +197,9 @@
 			#size-cells = <1>;
 			ranges;
 
+			qcom,gsbi-num = <2>;
+			syscon-tcsr = <&tcsr>;
+
 			i2c2: i2c@124a0000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
 				reg = <0x124a0000 0x1000>;
@@ -207,7 +213,7 @@
 
 		gsbi7: gsbi@16600000 {
 			status = "disabled";
-			compatible = "qcom,gsbi-v1.0.0";
+			compatible = "qcom,gsbi-apq8064";
 			reg = <0x16600000 0x100>;
 			clocks = <&gcc GSBI7_H_CLK>;
 			clock-names = "iface";
@@ -215,6 +221,9 @@
 			#size-cells = <1>;
 			ranges;
 
+			qcom,gsbi-num = <7>;
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
