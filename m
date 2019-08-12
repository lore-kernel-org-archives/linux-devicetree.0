From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH 7/7] arm64: dts: imx8mm: Add devfreq nodes
Date: Mon, 12 Aug 2019 21:49:51 +0300
Message-ID: <7fedd392f49dfd22b6365fdd1399ad362e5920b9.1565633880.git.leonard.crestez@nxp.com>
References: <cover.1565633880.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1565633880.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1565633880.git.leonard.crestez@nxp.com>
References: <cover.1565633880.git.leonard.crestez@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>, Abel Vesa <abel.vesa@nxp.com>, Saravana Kannan <saravanak@google.com>, Anson Huang <Anson.Huang@nxp.com>, linux-arm-kernel@lists.infradead.org, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org, linux-imx@nxp.com, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Will Deacon <will@kernel.org>, Alexandre Bailon <abailon@baylibre.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>
List-Id: devicetree@vger.kernel.org

Add initial support for bus scaling on imx8m, starting with noc and ddrc
because they're the biggest power hogs.

Add a devfreq-event link to the PMU in order to support on-demand
scaling of ddrc based on measured dram bandwith usage. Make ddrc a
parent of the NOC because all traffic to ddrc goes through

Support for proactive scaling via interconnect and support for scaling
additional NICs will come later. The high-performance bus masters which
need that (display, vpu, gpu) are not yet enabled in upstream anyway.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 51 ++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index e8560d15c130..a37d82133c06 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -122,10 +122,38 @@
 			clock-latency-ns = <150000>;
 			opp-suspend;
 		};
 	};
 
+	ddrc_opp_table: ddrc-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-25M {
+			opp-hz = /bits/ 64 <25000000>;
+		};
+		opp-100M {
+			opp-hz = /bits/ 64 <100000000>;
+		};
+		opp-750M {
+			opp-hz = /bits/ 64 <750000000>;
+		};
+	};
+
+	noc_opp_table: noc-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-150M {
+			opp-hz = /bits/ 64 <150000000>;
+		};
+		opp-375M {
+			opp-hz = /bits/ 64 <375000000>;
+		};
+		opp-750M {
+			opp-hz = /bits/ 64 <750000000>;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x80000000>;
 	};
 
@@ -748,10 +776,18 @@
 				status = "disabled";
 			};
 
 		};
 
+		noc: noc@32700000 {
+			compatible = "fsl,imx8mm-noc", "fsl,imx8m-noc";
+			reg = <0x32700000 0x100000>;
+			clocks = <&clk IMX8MM_CLK_NOC>;
+			devfreq = <&ddrc>;
+			operating-points-v2 = <&noc_opp_table>;
+		};
+
 		aips4: bus@32c00000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
@@ -832,11 +868,24 @@
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		ddr-pmu@3d800000 {
+		ddrc: dram-controller@3d400000 {
+			compatible = "fsl,imx8mm-ddrc", "fsl,imx8m-ddrc";
+			reg = <0x3d400000 0x400000>;
+			clock-names = "dram_core", "dram_pll", "dram_alt_root", "dram_alt", "dram_apb";
+			clocks = <&clk IMX8MM_CLK_DRAM_CORE>,
+				 <&clk IMX8MM_DRAM_PLL>,
+				 <&clk IMX8MM_CLK_DRAM_ALT_ROOT>,
+				 <&clk IMX8MM_CLK_DRAM_ALT>,
+				 <&clk IMX8MM_CLK_DRAM_APB>;
+			devfreq-events = <&ddr_pmu>;
+			operating-points-v2 = <&ddrc_opp_table>;
+		};
+
+		ddr_pmu: ddr-pmu@3d800000 {
 			compatible = "fsl,imx8mm-ddr-pmu", "fsl,imx8m-ddr-pmu";
 			reg = <0x3d800000 0x400000>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 		};
-- 
2.17.1
