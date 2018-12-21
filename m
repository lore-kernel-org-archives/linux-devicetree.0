From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2] arm64: dts: sdm845: Add cpufreq device node
Date: Fri, 21 Dec 2018 23:44:23 +0530
Message-ID: <1545416063-22552-1-git-send-email-tdas@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, david.brown@linaro.org, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, amit.kucheria@linaro.org, Matthias Kaehlcke <mka@chromium.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This change adds the cpufreq node as per the bindings example for SDM845.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 23a253b..a69a21e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -99,6 +99,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 				compatible = "cache";
@@ -114,6 +115,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&L2_100>;
 			L2_100: l2-cache {
 				compatible = "cache";
@@ -126,6 +128,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&L2_200>;
 			L2_200: l2-cache {
 				compatible = "cache";
@@ -138,6 +141,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&L2_300>;
 			L2_300: l2-cache {
 				compatible = "cache";
@@ -150,6 +154,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&L2_400>;
 			L2_400: l2-cache {
 				compatible = "cache";
@@ -162,6 +167,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&L2_500>;
 			L2_500: l2-cache {
 				compatible = "cache";
@@ -174,6 +180,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&L2_600>;
 			L2_600: l2-cache {
 				compatible = "cache";
@@ -186,6 +193,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&L2_700>;
 			L2_700: l2-cache {
 				compatible = "cache";
@@ -1686,6 +1694,17 @@
 				status = "disabled";
 			};
 		};
+
+		cpufreq_hw: cpufreq@17d43000 {
+			compatible = "qcom,cpufreq-hw";
+			reg = <0x17d43000 0x1400>, <0x17d45800 0x1400>;
+			reg-names = "freq-domain0", "freq-domain1";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+		};
 	};

 	thermal-zones {
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
