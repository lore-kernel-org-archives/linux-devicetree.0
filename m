From: Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 5/6] arm64: dts: Convert to the hierarchical CPU topology layout for sdm845
Date: Fri, 23 Aug 2019 13:47:02 +0530
Message-ID: <20190823081703.17325-6-mkshah@codeaurora.org>
References: <20190823081703.17325-1-mkshah@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823081703.17325-1-mkshah@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swboyd@chromium.org, agross@kernel.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bjorn.andersson@linaro.org, evgreen@chromium.org, dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org, ulf.hansson@linaro.org, Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In the hierarchical layout, we are creating power domains around each CPU
and describes the idle states for them inside the power domain provider
node. Note that, the CPU's idle states still needs to be compatible with
"arm,idle-state".

Furthermore, represent the CPU cluster as a separate master power domain,
powering the CPU's power domains. The cluster node, contains the idle
states for the cluster and each idle state needs to be compatible with
the "domain-idle-state".

If the running platform is using a PSCI FW that supports the OS initiated
CPU suspend mode, which likely should be the case unless the PSCI FW is
very old, this change triggers the PSCI driver to enable it.

Cc: devicetree@vger.kernel.org
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 103 ++++++++++++++++++++-------
 1 file changed, 78 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4babff5f19b5..0e7f36d2a7d9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -190,9 +190,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-					   &LITTLE_CPU_SLEEP_1
-					   &CLUSTER_SLEEP_0>;
+			power-domains = <&CPU_PD0>;
+			power-domain-names = "psci";
 			capacity-dmips-mhz = <607>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -211,9 +210,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
-			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-					   &LITTLE_CPU_SLEEP_1
-					   &CLUSTER_SLEEP_0>;
+			power-domains = <&CPU_PD1>;
+			power-domain-names = "psci";
 			capacity-dmips-mhz = <607>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -229,9 +227,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
-			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-					   &LITTLE_CPU_SLEEP_1
-					   &CLUSTER_SLEEP_0>;
+			power-domains = <&CPU_PD2>;
+			power-domain-names = "psci";
 			capacity-dmips-mhz = <607>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -247,9 +244,8 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
-			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-					   &LITTLE_CPU_SLEEP_1
-					   &CLUSTER_SLEEP_0>;
+			power-domains = <&CPU_PD3>;
+			power-domain-names = "psci";
 			capacity-dmips-mhz = <607>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -266,9 +262,8 @@
 			reg = <0x0 0x400>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&BIG_CPU_SLEEP_0
-					   &BIG_CPU_SLEEP_1
-					   &CLUSTER_SLEEP_0>;
+			power-domains = <&CPU_PD4>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_400>;
@@ -284,9 +279,8 @@
 			reg = <0x0 0x500>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&BIG_CPU_SLEEP_0
-					   &BIG_CPU_SLEEP_1
-					   &CLUSTER_SLEEP_0>;
+			power-domains = <&CPU_PD5>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_500>;
@@ -302,9 +296,8 @@
 			reg = <0x0 0x600>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&BIG_CPU_SLEEP_0
-					   &BIG_CPU_SLEEP_1
-					   &CLUSTER_SLEEP_0>;
+			power-domains = <&CPU_PD6>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_600>;
@@ -320,9 +313,8 @@
 			reg = <0x0 0x700>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&BIG_CPU_SLEEP_0
-					   &BIG_CPU_SLEEP_1
-					   &CLUSTER_SLEEP_0>;
+			power-domains = <&CPU_PD7>;
+			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_700>;
@@ -412,7 +404,7 @@
 			};
 
 			CLUSTER_SLEEP_0: cluster-sleep-0 {
-				compatible = "arm,idle-state";
+				compatible = "domain-idle-state";
 				idle-state-name = "cluster-power-down";
 				arm,psci-suspend-param = <0x400000F4>;
 				entry-latency-us = <3263>;
@@ -618,6 +610,67 @@
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		CPU_PD0: cpu-pd0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>,
+						<&LITTLE_CPU_SLEEP_1>;
+		};
+
+		CPU_PD1: cpu-pd1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>,
+						<&LITTLE_CPU_SLEEP_1>;
+		};
+
+		CPU_PD2: cpu-pd2 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>,
+						<&LITTLE_CPU_SLEEP_1>;
+		};
+
+		CPU_PD3: cpu-pd3 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0>,
+						<&LITTLE_CPU_SLEEP_1>;
+		};
+
+		CPU_PD4: cpu-pd4 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>,
+						<&BIG_CPU_SLEEP_1>;
+		};
+
+		CPU_PD5: cpu-pd5 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>,
+						<&BIG_CPU_SLEEP_1>;
+		};
+
+		CPU_PD6: cpu-pd6 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>,
+						<&BIG_CPU_SLEEP_1>;
+		};
+
+		CPU_PD7: cpu-pd7 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0>,
+						<&BIG_CPU_SLEEP_1>;
+		};
+
+		CLUSTER_PD: cluster-pd {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&CLUSTER_SLEEP_0>;
+		};
 	};
 
 	soc: soc {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by The Linux Foundation.
