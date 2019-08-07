From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] arm64: dts: sdm845: Add dynamic CPU power coefficients
Date: Wed,  7 Aug 2019 11:44:44 -0700
Message-ID: <20190807184444.248984-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Add dynamic power coefficients for the Silver and Gold CPU cores of
the Qualcomm SDM845.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
---
just noticed that this patch fell through the cracks, resending
a rebased version.

Changes in v2:
- added Reviewd-by tags from Doug and Amit
- rebased on agross/for-next
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 78ec373a2b18..12ae58d76f8b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -194,6 +194,7 @@
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
 			capacity-dmips-mhz = <607>;
+			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
@@ -215,6 +216,7 @@
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
 			capacity-dmips-mhz = <607>;
+			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_100>;
@@ -233,6 +235,7 @@
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
 			capacity-dmips-mhz = <607>;
+			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_200>;
@@ -251,6 +254,7 @@
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
 			capacity-dmips-mhz = <607>;
+			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_300>;
@@ -269,6 +273,7 @@
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
+			dynamic-power-coefficient = <396>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_400>;
@@ -287,6 +292,7 @@
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
+			dynamic-power-coefficient = <396>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_500>;
@@ -305,6 +311,7 @@
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
+			dynamic-power-coefficient = <396>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_600>;
@@ -323,6 +330,7 @@
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
+			dynamic-power-coefficient = <396>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_700>;
-- 
2.22.0.770.g0f2c4a37fd-goog
