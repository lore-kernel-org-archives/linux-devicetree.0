From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 2/5] arm: dts: apq8064: Add thermal zones, tsens and qfprom nodes
Date: Wed, 10 Aug 2016 12:13:56 +0530
Message-ID: <1470811439-1992-3-git-send-email-rnayak@codeaurora.org>
References: <1470811439-1992-1-git-send-email-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470811439-1992-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

TSENS is part of GCC, hence add TSENS properties as part of GCC node.
Also add thermal zones and qfprom nodes.
Update GCC bindings doc to mention the possibility of optional TSENS
properties that can be part of GCC node.

Acked-by: Eduardo Valentin <edubezval@gmail.com>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gcc.txt         |  18 ++++
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 103 +++++++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index 9a60fde..16e2f84 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -23,6 +23,13 @@ Required properties :
 Optional properties :
 - #power-domain-cells : shall contain 1
 
+Optional properties:
+- Qualcomm TSENS (thermal sensor device) on some devices can
+be part of GCC and hence the TSENS properties can also be
+part of the GCC/clock-controller node.
+For more details on the TSENS properties please refer
+Documentation/devicetree/bindings/thermal/qcom-tsens.txt
+
 Example:
 	clock-controller@900000 {
 		compatible = "qcom,gcc-msm8960";
@@ -31,3 +38,14 @@ Example:
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
 	};
+
+Example of GCC with TSENS properties:
+	clock-controller@900000 {
+		compatible = "qcom,gcc-apq8064";
+		reg = <0x00900000 0x4000>;
+		nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+		nvmem-cell-names = "calib", "calib_backup";
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#thermal-sensor-cells = <1>;
+	};
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 74a9b6c..9cd13ab 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -86,6 +86,92 @@
 		};
 	};
 
+	thermal-zones {
+		cpu-thermal0 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&gcc 7>;
+			coefficients = <1199 0>;
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
+			thermal-sensors = <&gcc 8>;
+			coefficients = <1132 0>;
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
+			thermal-sensors = <&gcc 9>;
+			coefficients = <1199 0>;
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
+			thermal-sensors = <&gcc 10>;
+			coefficients = <1132 0>;
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
 		interrupts = <1 10 0x304>;
@@ -611,11 +697,28 @@
 			};
 		};
 
+		qfprom: qfprom@00700000 {
+			compatible	= "qcom,qfprom";
+			reg		= <0x00700000 0x1000>;
+			#address-cells	= <1>;
+			#size-cells	= <1>;
+			ranges;
+			tsens_calib: calib {
+				reg = <0x404 0x10>;
+			};
+			tsens_backup: backup_calib {
+				reg = <0x414 0x10>;
+			};
+		};
+
 		gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-apq8064";
 			reg = <0x00900000 0x4000>;
+			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+			nvmem-cell-names = "calib", "calib_backup";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#thermal-sensor-cells = <1>;
 		};
 
 		lcc: clock-controller@28000000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
