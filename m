From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 03/10] arm64: zynqmp: Add operating points
Date: Thu, 20 Jul 2017 14:17:02 +0200
Message-ID: <560c538494f80ec67b553d26365bfaf0918f4215.1500552941.git.michal.simek@xilinx.com>
References: <cover.1500552941.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1500552941.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1500552941.git.michal.simek@xilinx.com>
References: <cover.1500552941.git.michal.simek@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Duc Dang <dhdang@apm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-kernel@vger.kernel.org, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>, Carlo Caione <carlo@endlessm.com>, Catalin Marinas <catalin.marinas@arm.com>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Adding operating-points-v2 for zynqmp.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 8e6cf0cf3a69..50636e098724 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -24,6 +24,7 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			device_type = "cpu";
 			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table>;
 			reg = <0x0>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
@@ -33,6 +34,7 @@
 			device_type = "cpu";
 			enable-method = "psci";
 			reg = <0x1>;
+			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
@@ -41,6 +43,7 @@
 			device_type = "cpu";
 			enable-method = "psci";
 			reg = <0x2>;
+			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
@@ -49,6 +52,7 @@
 			device_type = "cpu";
 			enable-method = "psci";
 			reg = <0x3>;
+			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
@@ -66,6 +70,31 @@
 		};
 	};
 
+	cpu_opp_table: cpu_opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp00 {
+			opp-hz = /bits/ 64 <1199999988>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <599999994>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <399999996>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <299999997>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupt-parent = <&gic>;
-- 
1.9.1
