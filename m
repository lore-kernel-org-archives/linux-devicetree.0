From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: dts: msm8916: Add and enable wcnss node
Date: Fri, 18 Nov 2016 22:42:32 -0800
Message-ID: <1479537752-28567-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the wcnss remoteproc node the SMD edge and the wcnss ctrl, bluetooth
and wifi nodes specified and enable this on db410c.

Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

This still require the last wcn36xx and scm-interrupted patches to land, but as
those won't affect the dts I'm posting this anyway.

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi  |  4 ++
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 13 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      | 73 +++++++++++++++++++++++++++++-
 3 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 08bd5ebafb4e..716d3ccbc309 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -306,6 +306,10 @@
                                 };
                         };
                 };
+
+		wcnss@a21b000 {
+			status = "okay";
+		};
 	};
 
 	usb2513 {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 10c83e11c272..4cb0b5834143 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -720,4 +720,17 @@
 			};
 		};
 	};
+
+	wcnss_pin_a: wcnss-active {
+		pinmux {
+			pins = "gpio40", "gpio41", "gpio42", "gpio43", "gpio44";
+			function = "wcss_wlan";
+		};
+
+		pinconf {
+			pins = "gpio40", "gpio41", "gpio42", "gpio43", "gpio44";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 4221b7d2c0ce..2c692650ae43 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8916.h>
 #include <dt-bindings/reset/qcom,gcc-msm8916.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. MSM8916";
@@ -82,7 +83,7 @@
 			no-map;
 		};
 
-		wcnss@89300000 {
+		wcnss_mem: wcnss@89300000 {
 			reg = <0x0 0x89300000 0x0 0x600000>;
 			no-map;
 		};
@@ -853,6 +854,76 @@
 				memory-region = <&mpss_mem>;
 			};
 		};
+
+		pronto: wcnss@a21b000 {
+			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
+			reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 0x3000>;
+			reg-names = "ccu", "dxe", "pmu";
+
+			memory-region = <&wcnss_mem>;
+
+			interrupts-extended = <&intc 0 149 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
+
+			vddmx-supply = <&pm8916_l3>;
+			vddpx-supply = <&pm8916_l7>;
+
+			qcom,state = <&wcnss_smp2p_out 0>;
+			qcom,state-names = "stop";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&wcnss_pin_a>;
+
+			status = "disabled";
+
+			iris {
+				compatible = "qcom,wcn3620";
+
+				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+				clock-names = "xo";
+
+				vddxo-supply = <&pm8916_l7>;
+				vddrfa-supply = <&pm8916_s3>;
+				vddpa-supply = <&pm8916_l9>;
+				vdddig-supply = <&pm8916_l5>;
+			};
+
+			smd-edge {
+				interrupts = <0 142 1>;
+
+				qcom,ipc = <&apcs 8 17>;
+				qcom,smd-edge = <6>;
+				qcom,remote-pid = <4>;
+
+				label = "pronto";
+
+				wcnss {
+					compatible = "qcom,wcnss";
+					qcom,smd-channels = "WCNSS_CTRL";
+
+					qcom,mmio = <&pronto>;
+
+					bt {
+						compatible = "qcom,wcnss-bt";
+					};
+
+					wifi {
+						compatible = "qcom,wcnss-wlan";
+
+						interrupts = <0 145 IRQ_TYPE_LEVEL_HIGH>,
+							     <0 146 IRQ_TYPE_LEVEL_HIGH>;
+						interrupt-names = "tx", "rx";
+
+						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
+						qcom,smem-state-names = "tx-enable", "tx-rings-empty";
+					};
+				};
+			};
+		};
 	};
 
 	smd {
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
