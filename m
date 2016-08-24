From: Brendan Jackman <brendan.jackman@arm.com>
Subject: [RFC 5/6] arm64: dts: Add Juno r0 CPU power domain tree
Date: Wed, 24 Aug 2016 14:48:21 +0100
Message-ID: <20160824134822.3591-6-brendan.jackman@arm.com>
References: <1470351902-43103-3-git-send-email-lina.iyer@linaro.org>
 <20160824134822.3591-1-brendan.jackman@arm.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160824134822.3591-1-brendan.jackman@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: ulf.hansson@linaro.org, khilman@kernel.org, rjw@rjwysocki.net
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org, Axel Haslam <ahaslam+renesas@baylibre.com>, devicetree@vger.kernel.org, Marc Titinger <mtitinger+renesas@baylibre.com>, Lina Iyer <lina.iyer@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

---
 arch/arm64/boot/dts/arm/juno.dts | 47 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
index a7270ef..4e086ec 100644
--- a/arch/arm64/boot/dts/arm/juno.dts
+++ b/arch/arm64/boot/dts/arm/juno.dts
@@ -90,6 +90,7 @@
 			next-level-cache = <&A57_L2>;
 			clocks = <&scpi_dvfs 0>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+			power-domains = <&A57_0_PD>;
 		};
 
 		A57_1: cpu@1 {
@@ -100,6 +101,7 @@
 			next-level-cache = <&A57_L2>;
 			clocks = <&scpi_dvfs 0>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+			power-domains = <&A57_1_PD>;
 		};
 
 		A53_0: cpu@100 {
@@ -110,6 +112,7 @@
 			next-level-cache = <&A53_L2>;
 			clocks = <&scpi_dvfs 1>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+			power-domains = <&A53_0_PD>;
 		};
 
 		A53_1: cpu@101 {
@@ -120,6 +123,7 @@
 			next-level-cache = <&A53_L2>;
 			clocks = <&scpi_dvfs 1>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+			power-domains = <&A53_1_PD>;
 		};
 
 		A53_2: cpu@102 {
@@ -130,6 +134,7 @@
 			next-level-cache = <&A53_L2>;
 			clocks = <&scpi_dvfs 1>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+			power-domains = <&A53_2_PD>;
 		};
 
 		A53_3: cpu@103 {
@@ -140,6 +145,7 @@
 			next-level-cache = <&A53_L2>;
 			clocks = <&scpi_dvfs 1>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+			power-domains = <&A53_3_PD>;
 		};
 
 		A57_L2: l2-cache0 {
@@ -151,6 +157,47 @@
 		};
 	};
 
+	power-domains {
+		CLUSTER_A57_PD: cluster-a57-pd {
+			#power-domain-cells = <0>;
+		};
+
+		A57_0_PD: a57-pd@0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_A57_PD>;
+		};
+
+		A57_1_PD: a57-pd@1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_A57_PD>;
+		};
+
+
+		CLUSTER_A53_PD: cluster-a53-pd {
+			#power-domain-cells = <0>;
+		};
+
+		A53_0_PD: a53-pd@0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_A53_PD>;
+		};
+
+		A53_1_PD: a53-pd@1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_A53_PD>;
+		};
+
+		A53_2_PD: a53-pd@2 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_A53_PD>;
+		};
+
+		A53_3_PD: a53-pd@3 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_A53_PD>;
+		};
+	};
+
 	pmu_a57 {
 		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 02 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.9.3
