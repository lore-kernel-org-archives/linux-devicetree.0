From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH RFC 4/4] arm64: dts: qcom: sdm845: Add cpu OPP tables
Date: Thu, 27 Jun 2019 19:04:24 +0530
Message-ID: <20190627133424.4980-5-sibis@codeaurora.org>
References: <20190627133424.4980-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627133424.4980-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org, georgi.djakov@linaro.org
Cc: agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add OPP tables for the cpu nodes.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 343 +++++++++++++++++++++++++++
 1 file changed, 343 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 471cbb7d9bc39..8cabbb274d3e7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -197,6 +197,10 @@
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			/* path between CPU and DDR memory and CPU and L3 */
+			interconnects = <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC &osm_l3 SLAVE_OSM_L3>;
 			L2_0: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -218,6 +222,10 @@
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_100>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			/* path between CPU and DDR memory and CPU and L3 */
+			interconnects = <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC &osm_l3 SLAVE_OSM_L3>;
 			L2_100: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -236,6 +244,10 @@
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_200>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			/* path between CPU and DDR memory and CPU and L3 */
+			interconnects = <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC &osm_l3 SLAVE_OSM_L3>;
 			L2_200: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -254,6 +266,10 @@
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_300>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			/* path between CPU and DDR memory and CPU and L3 */
+			interconnects = <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC &osm_l3 SLAVE_OSM_L3>;
 			L2_300: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -272,6 +288,10 @@
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_400>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			/* path between CPU and DDR memory and CPU and L3 */
+			interconnects = <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC &osm_l3 SLAVE_OSM_L3>;
 			L2_400: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -290,6 +310,10 @@
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_500>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			/* path between CPU and DDR memory and CPU and L3 */
+			interconnects = <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC &osm_l3 SLAVE_OSM_L3>;
 			L2_500: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -308,6 +332,10 @@
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_600>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			/* path between CPU and DDR memory and CPU and L3 */
+			interconnects = <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC &osm_l3 SLAVE_OSM_L3>;
 			L2_600: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -326,6 +354,10 @@
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_700>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			/* path between CPU and DDR memory and CPU and L3 */
+			interconnects = <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC &osm_l3 SLAVE_OSM_L3>;
 			L2_700: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -423,6 +455,317 @@
 		};
 	};
 
+	cpu0_opp_table: cpu0_opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu0_opp1: opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 762 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 4577 MB/s peak */
+			bandwidth-MBps = <0 762>, <0 4577>;
+		};
+
+		cpu0_opp2: opp-403200000 {
+			opp-hz = /bits/ 64 <403200000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 762 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 4577 MB/s peak */
+			bandwidth-MBps = <0 762>, <0 4577>;
+		};
+
+		cpu0_opp3: opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 762 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 6152 MB/s peak */
+			bandwidth-MBps = <0 762>, <0 6152>;
+		};
+
+		cpu0_opp4: opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 762 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 6152 MB/s peak */
+			bandwidth-MBps = <0 762>, <0 6152>;
+		};
+
+		cpu0_opp5: opp-652800000 {
+			opp-hz = /bits/ 64 <652800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 762 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 7324 MB/s peak */
+			bandwidth-MBps = <0 762>, <0 7324>;
+		};
+
+		cpu0_opp6: opp-748800000 {
+			opp-hz = /bits/ 64 <748800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 1720 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 8789 MB/s peak */
+			bandwidth-MBps = <0 1720>, <0 8789>;
+		};
+
+		cpu0_opp7: opp-825600000 {
+			opp-hz = /bits/ 64 <825600000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 1720 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 8789 MB/s peak */
+			bandwidth-MBps = <0 1720>, <0 8789>;
+		};
+
+		cpu0_opp8: opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 1720 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 9960 MB/s peak */
+			bandwidth-MBps = <0 1720>, <0 9960>;
+		};
+
+		cpu0_opp9: opp-979200000 {
+			opp-hz = /bits/ 64 <979200000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 1720 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 11425 MB/s peak */
+			bandwidth-MBps = <0 1720>, <0 11425>;
+		};
+
+		cpu0_opp10: opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 1720 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 11425 MB/s peak */
+			bandwidth-MBps = <0 1720>, <0 11425>;
+		};
+
+		cpu0_opp11: opp-1132800000 {
+			opp-hz = /bits/ 64 <1132800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 2086 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 12890 MB/s peak */
+			bandwidth-MBps = <0 2086>, <0 12890>;
+		};
+
+		cpu0_opp12: opp-1228800000 {
+			opp-hz = /bits/ 64 <1228800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 2086 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 14355 MB/s peak */
+			bandwidth-MBps = <0 2086>, <0 14355>;
+		};
+
+		cpu0_opp13: opp-1324800000 {
+			opp-hz = /bits/ 64 <1324800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 2086 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 15820 MB/s peak */
+			bandwidth-MBps = <0 2086>, <0 15820>;
+		};
+
+		cpu0_opp14: opp-1420800000 {
+			opp-hz = /bits/ 64 <1420800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 2086 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 17285 MB/s peak */
+			bandwidth-MBps = <0 2086>, <0 17285>;
+		};
+
+		cpu0_opp15: opp-1516800000 {
+			opp-hz = /bits/ 64 <1516800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 2597 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 18457 MB/s peak */
+			bandwidth-MBps = <0 2597>, <0 18457>;
+		};
+
+		cpu0_opp16: opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 3879 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 18457 MB/s peak */
+			bandwidth-MBps = <0 3879>, <0 18457>;
+		};
+
+		cpu0_opp17: opp-1689600000 {
+			opp-hz = /bits/ 64 <1689600000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 3879 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 19921 MB/s peak */
+			bandwidth-MBps = <0 3879>, <0 19921>;
+		};
+
+		cpu0_opp18: opp-1766400000 {
+			opp-hz = /bits/ 64 <1766400000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 3879 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 21386 MB/s peak */
+			bandwidth-MBps = <0 3879>, <0 21386>;
+		};
+	};
+
+	cpu4_opp_table: cpu4_opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu4_opp1: opp-825600000 {
+			opp-hz = /bits/ 64 <825600000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 1144 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 8789 MB/s peak */
+			bandwidth-MBps = <0 1144>, <0 8789>;
+		};
+
+		cpu4_opp2: opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 1144 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 8789 MB/s peak */
+			bandwidth-MBps = <0 1144>, <0 8789>;
+		};
+
+		cpu4_opp3: opp-979200000 {
+			opp-hz = /bits/ 64 <979200000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 1144 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 8789 MB/s peak */
+			bandwidth-MBps = <0 1144>, <0 8789>;
+		};
+
+		cpu4_opp4: opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 2929 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 11425 MB/s peak */
+			bandwidth-MBps = <0 2929>, <0 11425>;
+		};
+
+		cpu4_opp5: opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 3879 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 11425 MB/s peak */
+			bandwidth-MBps = <0 3879>, <0 11425>;
+		};
+
+		cpu4_opp6: opp-1286400000 {
+			opp-hz = /bits/ 64 <1286400000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 3879 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 11425 MB/s peak */
+			bandwidth-MBps = <0 3879>, <0 11425>;
+		};
+
+		cpu4_opp7: opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 3879 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 14355 MB/s peak */
+			bandwidth-MBps = <0 3879>, <0 14355>;
+		};
+
+		cpu4_opp8: opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 3879 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 14355 MB/s peak */
+			bandwidth-MBps = <0 3879>, <0 14355>;
+		};
+
+		cpu4_opp9: opp-1536000000 {
+			opp-hz = /bits/ 64 <1536000000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 3879 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 14355 MB/s peak */
+			bandwidth-MBps = <0 3879>, <0 14355>;
+		};
+
+		cpu4_opp10: opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 4943 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 14355 MB/s peak */
+			bandwidth-MBps = <0 4943>, <0 14355>;
+		};
+
+		cpu4_opp11: opp-1689600000 {
+			opp-hz = /bits/ 64 <1689600000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 4943 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 18457 MB/s peak */
+			bandwidth-MBps = <0 4943>, <0 18457>;
+		};
+
+		cpu4_opp12: opp-1766400000 {
+			opp-hz = /bits/ 64 <1766400000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 5931 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 18457 MB/s peak */
+			bandwidth-MBps = <0 5931>, <0 18457>;
+		};
+
+		cpu4_opp13: opp-1843200000 {
+			opp-hz = /bits/ 64 <1843200000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 5931 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 18457 MB/s peak */
+			bandwidth-MBps = <0 5931>, <0 18457>;
+		};
+
+		cpu4_opp14: opp-1920000000 {
+			opp-hz = /bits/ 64 <1920000000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 5931 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 18457 MB/s peak */
+			bandwidth-MBps = <0 5931>, <0 18457>;
+		};
+
+		cpu4_opp15: opp-1996800000 {
+			opp-hz = /bits/ 64 <1996800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 19921 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 19921>;
+		};
+
+		cpu4_opp16: opp-2092800000 {
+			opp-hz = /bits/ 64 <2092800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 19921 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 19921>;
+		};
+
+		cpu4_opp17: opp-2169600000 {
+			opp-hz = /bits/ 64 <2169600000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 19921 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 19921>;
+		};
+
+		cpu4_opp18: opp-2246400000 {
+			opp-hz = /bits/ 64 <2246400000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 19921 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 19921>;
+		};
+
+		cpu4_opp19: opp-2323200000 {
+			opp-hz = /bits/ 64 <2323200000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 19921 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 19921>;
+		};
+
+		cpu4_opp20: opp-2400000000 {
+			opp-hz = /bits/ 64 <2400000000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 21386 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 21386>;
+		};
+
+		cpu4_opp21: opp-2476800000 {
+			opp-hz = /bits/ 64 <2476800000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 21386 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 21386>;
+		};
+
+		cpu4_opp22: opp-2553600000 {
+			opp-hz = /bits/ 64 <2553600000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 21386 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 21386>;
+		};
+
+		cpu4_opp23: opp-2649600000 {
+			opp-hz = /bits/ 64 <2649600000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 21386 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 21386>;
+		};
+
+		cpu4_opp24: opp-2745600000 {
+			opp-hz = /bits/ 64 <2745600000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 22558 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 22558>;
+		};
+
+		cpu4_opp25: opp-2803200000 {
+			opp-hz = /bits/ 64 <2803200000>;
+			/* CPU<->DDR bandwidth: 0 MB/s average, 6881 MB/s peak */
+			/* CPU<->L3 bandwidth: 0 MB/s average, 22558 MB/s peak */
+			bandwidth-MBps = <0 6881>, <0 22558>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
