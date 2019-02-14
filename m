From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V4 1/2] arm64: dts: freescale: imx8qxp: add cpu opp table
Date: Thu, 14 Feb 2019 01:54:01 +0000
Message-ID: <1550108915-574-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add i.MX8QXP CPU opp table to support cpufreq.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change since V3.
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 4021f25..593e2db 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -34,6 +34,10 @@
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&A35_L2>;
+			clocks = <&clk IMX_A35_CLK>;
+			clock-latency = <61036>;
+			#cooling-cells = <2>;
+			operating-points-v2 = <&a35_0_opp_table>;
 		};
 
 		A35_1: cpu@1 {
@@ -42,6 +46,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			next-level-cache = <&A35_L2>;
+			operating-points-v2 = <&a35_0_opp_table>;
 		};
 
 		A35_2: cpu@2 {
@@ -50,6 +55,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			next-level-cache = <&A35_L2>;
+			operating-points-v2 = <&a35_0_opp_table>;
 		};
 
 		A35_3: cpu@3 {
@@ -58,6 +64,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			next-level-cache = <&A35_L2>;
+			operating-points-v2 = <&a35_0_opp_table>;
 		};
 
 		A35_L2: l2-cache0 {
@@ -65,6 +72,24 @@
 		};
 	};
 
+	a35_0_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <150000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1100000>;
+			clock-latency-ns = <150000>;
+			opp-suspend;
+		};
+	};
+
 	gic: interrupt-controller@51a00000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
-- 
2.7.4
