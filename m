From: Abel Vesa <abelvesa@gmail.com>
Subject: [RFC 2/2] arm64: dts: imx8mq: Add idle states and gpcv2 wake_request broken property
Date: Mon, 10 Jun 2019 15:13:46 +0300
Message-ID: <20190610121346.15779-3-abel.vesa@nxp.com>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610121346.15779-1-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Lucas Stach <l.stach@pengutronix.de>, Bai Ping <ping.bai@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add the cpu-sleep idle state with all the necessary parameters and also add
the cpu-idle-states to the cpu nodes.

The 'broken-wake-request-signals' property is used to let the irq-imx-gpcv2
driver know that the wake request signals from GIC are not linked to the
GPC at all and, therefore, the driver should  make use of the dedicated
workaround to explicitly wake up the target core on every IPI.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d09b808..7217138 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -103,6 +103,7 @@
 			#cooling-cells = <2>;
 			nvmem-cells = <&cpu_speed_grade>;
 			nvmem-cell-names = "speed_grade";
+			cpu-idle-states = <&CPU_SLEEP>;
 		};
 
 		A53_1: cpu@1 {
@@ -115,6 +116,7 @@
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_SLEEP>;
 		};
 
 		A53_2: cpu@2 {
@@ -127,6 +129,7 @@
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_SLEEP>;
 		};
 
 		A53_3: cpu@3 {
@@ -139,11 +142,27 @@
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_SLEEP>;
 		};
 
 		A53_L2: l2-cache0 {
 			compatible = "cache";
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			CPU_SLEEP: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010033>;
+				local-timer-stop;
+				entry-latency-us = <1000>;
+				exit-latency-us = <700>;
+				min-residency-us = <2700>;
+				wakeup-latency-us = <1500>;
+			};
+		};
+
 	};
 
 	a53_opp_table: opp-table {
@@ -502,6 +521,7 @@
 				reg = <0x303a0000 0x10000>;
 				interrupt-parent = <&gic>;
 				interrupt-controller;
+				broken-wake-request-signals;
 				#interrupt-cells = <3>;
 
 				pgc {
-- 
2.7.4
