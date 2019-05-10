From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCHv1 6/8] arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states
Date: Fri, 10 May 2019 16:59:44 +0530
Message-ID: <8648ba97d49a9f731001e4b36611be9650e37f37.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add device bindings for cpuidle states for cpu devices.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c761269caf80..b615bcb9e351 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -95,6 +95,7 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 			      compatible = "cache";
@@ -107,6 +108,7 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD>;
 			next-level-cache = <&L2_0>;
 		};
 
@@ -115,6 +117,7 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
 			      compatible = "cache";
@@ -127,6 +130,7 @@
 			compatible = "qcom,kryo";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD>;
 			next-level-cache = <&L2_1>;
 		};
 
@@ -151,6 +155,30 @@
 				};
 			};
 		};
+
+		idle-states {
+			entry-method="psci";
+
+			LITTLE_CPU_PD: little-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "standalone-power-collapse";
+				arm,psci-suspend-param = <0x00000004>;
+				entry-latency-us = <40>;
+				exit-latency-us = <40>;
+				min-residency-us = <300>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_PD: big-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "standalone-power-collapse";
+				arm,psci-suspend-param = <0x00000004>;
+				entry-latency-us = <40>;
+				exit-latency-us = <40>;
+				min-residency-us = <300>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.17.1
