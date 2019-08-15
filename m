From: Anson.Huang@nxp.com
Subject: [PATCH 6/6] arm64: dts: imx8mn: Add cpu-freq support
Date: Thu, 15 Aug 2019 06:59:43 -0400
Message-ID: <1565866783-19672-6-git-send-email-Anson.Huang@nxp.com>
References: <1565866783-19672-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565866783-19672-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, leonard.crestez@nxp.com, abel.vesa@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add A53 OPP table, cpu regulator and speed grading node to
support cpu-freq driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts |  4 +++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi         | 41 +++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
index 10ebf77..11c705d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
@@ -27,6 +27,10 @@
 	};
 };
 
+&A53_0 {
+	cpu-supply = <&buck2_reg>;
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 1d8899b..785f4c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -51,6 +51,9 @@
 			clocks = <&clk IMX8MN_CLK_ARM>;
 			enable-method = "psci";
 			next-level-cache = <&A53_L2>;
+			operating-points-v2 = <&a53_opp_table>;
+			nvmem-cells = <&cpu_speed_grade>;
+			nvmem-cell-names = "speed_grade";
 		};
 
 		A53_1: cpu@1 {
@@ -61,6 +64,7 @@
 			clocks = <&clk IMX8MN_CLK_ARM>;
 			enable-method = "psci";
 			next-level-cache = <&A53_L2>;
+			operating-points-v2 = <&a53_opp_table>;
 		};
 
 		A53_2: cpu@2 {
@@ -71,6 +75,7 @@
 			clocks = <&clk IMX8MN_CLK_ARM>;
 			enable-method = "psci";
 			next-level-cache = <&A53_L2>;
+			operating-points-v2 = <&a53_opp_table>;
 		};
 
 		A53_3: cpu@3 {
@@ -81,6 +86,7 @@
 			clocks = <&clk IMX8MN_CLK_ARM>;
 			enable-method = "psci";
 			next-level-cache = <&A53_L2>;
+			operating-points-v2 = <&a53_opp_table>;
 		};
 
 		A53_L2: l2-cache0 {
@@ -88,6 +94,35 @@
 		};
 	};
 
+	a53_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <850000>;
+			opp-supported-hw = <0xb00>, <0x7>;
+			clock-latency-ns = <150000>;
+			opp-suspend;
+		};
+
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <950000>;
+			opp-supported-hw = <0x300>, <0x7>;
+			clock-latency-ns = <150000>;
+			opp-suspend;
+		};
+
+		opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <1000000>;
+			opp-supported-hw = <0x100>, <0x3>;
+			clock-latency-ns = <150000>;
+			opp-suspend;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x80000000>;
@@ -288,6 +323,12 @@
 				compatible = "fsl,imx8mn-ocotp", "fsl,imx7d-ocotp", "syscon";
 				reg = <0x30350000 0x10000>;
 				clocks = <&clk IMX8MN_CLK_OCOTP_ROOT>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				cpu_speed_grade: speed-grade@10 {
+					reg = <0x10 4>;
+				};
 			};
 
 			anatop: anatop@30360000 {
-- 
2.7.4
