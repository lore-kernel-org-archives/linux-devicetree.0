From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 3/5] arm: dts: apq8084: Add thermal zones, tsens and qfprom nodes
Date: Wed, 17 Aug 2016 10:48:46 +0530
Message-ID: <1471411128-4002-4-git-send-email-rnayak@codeaurora.org>
References: <1471411128-4002-1-git-send-email-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471411128-4002-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add thermal zones, tsens and qfprom nodes

Acked-by: Eduardo Valentin <edubezval@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 103 ++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 7c2df06..39eb7a4 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -94,6 +94,88 @@
 		};
 	};
 
+	thermal-zones {
+		cpu-thermal0 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 5>;
+
+			trips {
+				cpu_alert0: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit0: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal1 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 6>;
+
+			trips {
+				cpu_alert1: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit1: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal2 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 7>;
+
+			trips {
+				cpu_alert2: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit2: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal3 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 8>;
+
+			trips {
+				cpu_alert3: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit3: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
 		interrupts = <1 7 0xf04>;
@@ -150,6 +232,27 @@
 			reg = <0xf9011000 0x1000>;
 		};
 
+		qfprom: qfprom@fc4bc000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "qcom,qfprom";
+			reg = <0xfc4bc000 0x1000>;
+			tsens_calib: calib@d0 {
+				reg = <0xd0 0x18>;
+			};
+			tsens_backup: backup@440 {
+				reg = <0x440 0x10>;
+			};
+		};
+
+		tsens: thermal-sensor@fc4a8000 {
+			compatible = "qcom,msm8974-tsens";
+			reg = <0xfc4a8000 0x2000>;
+			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+			nvmem-cell-names = "calib", "calib_backup";
+			#thermal-sensor-cells = <1>;
+		};
+
 		timer@f9020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
