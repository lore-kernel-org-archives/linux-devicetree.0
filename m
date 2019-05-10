From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCHv1 4/8] arm64: dts: qcom: msm8916: Use more generic idle state names
Date: Fri, 10 May 2019 16:59:42 +0530
Message-ID: <2a0626da4d8d5a1018c351b24b63e5e0d7a45a10.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Instead of using Qualcomm-specific terminology, use generic node names
for the idle states that are easier to understand. Move the description
into the "idle-state-name" property.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index ded1052e5693..400b609bb3fd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -110,7 +110,7 @@
 			reg = <0x0>;
 			next-level-cache = <&L2_0>;
 			enable-method = "psci";
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&apcs>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
@@ -122,7 +122,7 @@
 			reg = <0x1>;
 			next-level-cache = <&L2_0>;
 			enable-method = "psci";
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&apcs>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
@@ -134,7 +134,7 @@
 			reg = <0x2>;
 			next-level-cache = <&L2_0>;
 			enable-method = "psci";
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&apcs>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
@@ -146,7 +146,7 @@
 			reg = <0x3>;
 			next-level-cache = <&L2_0>;
 			enable-method = "psci";
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&apcs>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
@@ -160,8 +160,9 @@
 		idle-states {
 			entry-method="psci";
 
-			CPU_SPC: spc {
+			CPU_SLEEP_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "standalone-power-collapse";
 				arm,psci-suspend-param = <0x40000002>;
 				entry-latency-us = <130>;
 				exit-latency-us = <150>;
-- 
2.17.1
