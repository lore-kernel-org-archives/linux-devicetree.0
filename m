From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 4/5] arm64: dts: msm8916: Add thermal zones, tsens and qfprom nodes
Date: Tue, 12 Jul 2016 12:22:53 +0530
Message-ID: <1468306374-24153-5-git-send-email-rnayak@codeaurora.org>
References: <1468306374-24153-1-git-send-email-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468306374-24153-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add thermal zones, tsens and qfprom nodes

Acked-by: Eduardo Valentin <edubezval@gmail.com>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 11bdc24..0f850a1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -155,6 +155,57 @@
 		interrupts = <GIC_PPI 7 GIC_CPU_MASK_SIMPLE(4)>;
 	};
 
+	thermal-zones {
+		cpu-thermal0 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 4>;
+
+			trips {
+				cpu_alert0: trip@0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit0: trip@1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				/* TODO: Add when cpufreq support is available */
+			};
+		};
+
+		cpu-thermal1 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 3>;
+
+			trips {
+				cpu_alert1: trip@0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit1: trip@1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				/* TODO: Add when cpufreq support is available */
+			};
+		};
+
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
@@ -609,6 +660,27 @@
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";
 		};
+
+		qfprom: qfprom@5c000 {
+			compatible = "qcom,qfprom";
+			reg = <0x5c000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			tsens_caldata: caldata@d0 {
+				reg = <0xd0 0x8>;
+			};
+			tsens_calsel: calsel@ec {
+				reg = <0xec 0x4>;
+			};
+		};
+
+		tsens: thermal-sensor@4a8000 {
+			compatible = "qcom,msm8916-tsens";
+			reg = <0x4a8000 0x2000>;
+			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
+			nvmem-cell-names = "calib", "calib_sel";
+			#thermal-sensor-cells = <1>;
+		};
 	};
 
 	smd {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
