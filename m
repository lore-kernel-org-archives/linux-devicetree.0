From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states
Date: Tue, 21 May 2019 15:05:17 +0530
Message-ID: <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, niklas.cassel@linaro.org, marc.w.gonzalez@free.fr, sibis@codeaurora.org, daniel.lezcano@linaro.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add device bindings for cpuidle states for cpu devices.

Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 3fd0769fe648..54810980fcf9 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -78,6 +78,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
@@ -97,6 +98,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_1: l1-icache {
@@ -112,6 +114,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_2: l1-icache {
@@ -127,6 +130,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_3: l1-icache {
@@ -142,6 +146,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
@@ -161,6 +166,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_101: l1-icache {
@@ -176,6 +182,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_102: l1-icache {
@@ -191,6 +198,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_103: l1-icache {
@@ -238,6 +246,48 @@
 				};
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-retention";
+				arm,psci-suspend-param = <0x00000002>;
+				entry-latency-us = <43>;
+				exit-latency-us = <86>;
+				min-residency-us = <200>;
+			};
+
+			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-collapse";
+				arm,psci-suspend-param = <0x00000003>;
+				entry-latency-us = <100>;
+				exit-latency-us = <612>;
+				min-residency-us = <1000>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-retention";
+				arm,psci-suspend-param = <0x00000002>;
+				entry-latency-us = <41>;
+				exit-latency-us = <82>;
+				min-residency-us = <200>;
+			};
+
+			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-collapse";
+				arm,psci-suspend-param = <0x00000003>;
+				entry-latency-us = <100>;
+				exit-latency-us = <525>;
+				min-residency-us = <1000>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {
-- 
2.17.1
