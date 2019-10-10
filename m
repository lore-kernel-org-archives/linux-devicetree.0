From: Yuantian Tang <andy.tang@nxp.com>
Subject: [PATCH v2] arm64: dts: lx2160a: add tmu device node
Date: Thu, 10 Oct 2019 16:30:22 +0800
Message-ID: <20191010083022.6700-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the TMU (Thermal Monitoring Unit) device node to enable
TMU feature.

Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
---
v2:
	- sort the node and use micro to replace hardcoded number

 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 108 +++++++++++++++---
 1 file changed, 92 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 80268c6ed5fb..72054fe1cafe 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/thermal/thermal.h>
 
 /memreserve/ 0x80000000 0x00010000;
 
@@ -20,7 +21,7 @@
 		#size-cells = <0>;
 
 		// 8 clusters having 2 Cortex-A72 cores each
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -34,9 +35,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster0_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -50,9 +52,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster0_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@100 {
+		cpu100: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -66,9 +69,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster1_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@101 {
+		cpu101: cpu@101 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -82,9 +86,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster1_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@200 {
+		cpu200: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -98,9 +103,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster2_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@201 {
+		cpu201: cpu@201 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -114,9 +120,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster2_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@300 {
+		cpu300: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -130,9 +137,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster3_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@301 {
+		cpu301: cpu@301 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -146,9 +154,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster3_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@400 {
+		cpu400: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -162,9 +171,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster4_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@401 {
+		cpu401: cpu@401 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -178,9 +188,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster4_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@500 {
+		cpu500: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -194,9 +205,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster5_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@501 {
+		cpu501: cpu@501 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -210,9 +222,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster5_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@600 {
+		cpu600: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -226,9 +239,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster6_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@601 {
+		cpu601: cpu@601 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -242,9 +256,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster6_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@700 {
+		cpu700: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -258,9 +273,10 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster7_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@701 {
+		cpu701: cpu@701 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72";
 			enable-method = "psci";
@@ -274,6 +290,7 @@
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster7_l2>;
 			cpu-idle-states = <&cpu_pw20>;
+			#cooling-cells = <2>;
 		};
 
 		cluster0_l2: l2-cache0 {
@@ -418,6 +435,51 @@
 		clock-output-names = "sysclk";
 	};
 
+	thermal-zones {
+		core_thermal1: core-thermal1 {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&tmu 0>;
+
+			trips {
+				core_cluster_alert: core-cluster-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				core_cluster_crit: core-cluster-crit {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&core_cluster_alert>;
+					cooling-device =
+						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu200 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu201 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu300 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu301 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu400 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu401 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu500 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu501 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu600 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu601 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu700 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu701 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -478,6 +540,20 @@
 			little-endian;
 		};
 
+		tmu: tmu@1f80000 {
+			compatible = "fsl,qoriq-tmu";
+			reg = <0x0 0x1f80000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			fsl,tmu-range = <0x800000e6 0x8001017d>;
+			fsl,tmu-calibration =
+				/* Calibration data group 1 */
+				<0x00000000 0x00000035
+				/* Calibration data group 2 */
+				0x00010001 0x00000154>;
+			little-endian;
+			#thermal-sensor-cells = <1>;
+		};
+
 		i2c0: i2c@2000000 {
 			compatible = "fsl,vf610-i2c";
 			#address-cells = <1>;
-- 
2.17.1
