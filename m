From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCHv1 8/8] arm64: dts: qcom: sdm845: Add PSCI cpuidle low power states
Date: Fri, 10 May 2019 16:59:46 +0530
Message-ID: <044cd74e461a1dd7934f44531802f4b557264365.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>, devicetree@vger.kernel.org, mkshah@codeaurora.org
List-Id: devicetree@vger.kernel.org

From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>

Add device bindings for cpuidle states for cpu devices.

[amit: rename the idle-states to more generic names and fixups]

Cc: <devicetree@vger.kernel.org>
Cc: <mkshah@codeaurora.org>
Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
Reviewed-by: Evan Green <evgreen@chromium.org>
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 62 ++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5308f1671824..2c8c54e4bd77 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -119,6 +119,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
@@ -136,6 +137,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_100>;
@@ -150,6 +152,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_200>;
@@ -164,6 +167,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_300>;
@@ -178,6 +182,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_400>;
@@ -192,6 +197,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_500>;
@@ -206,6 +212,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_600>;
@@ -220,6 +227,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_700>;
@@ -228,6 +236,60 @@
 				next-level-cache = <&L3_0>;
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_PD: little-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <350>;
+				exit-latency-us = <461>;
+				min-residency-us = <1890>;
+				local-timer-stop;
+			};
+
+			LITTLE_CPU_RPD: little-rail-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-rail-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <360>;
+				exit-latency-us = <531>;
+				min-residency-us = <3934>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_PD: big-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <264>;
+				exit-latency-us = <621>;
+				min-residency-us = <952>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_RPD: big-rail-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-rail-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <1061>;
+				min-residency-us = <4488>;
+				local-timer-stop;
+			};
+
+			CLUSTER_PD: cluster-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x400000F4>;
+				entry-latency-us = <3263>;
+				exit-latency-us = <6562>;
+				min-residency-us = <9987>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	pmu {
-- 
2.17.1
