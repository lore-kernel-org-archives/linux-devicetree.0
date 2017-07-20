From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 02/10] arm64: zynqmp: Add idle state for ZynqMP
Date: Thu, 20 Jul 2017 14:17:01 +0200
Message-ID: <096d94cc880d5ab61de3633bf6b22f2a001a1885.1500552941.git.michal.simek@xilinx.com>
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-kernel@vger.kernel.org, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Stefan Krsmanovic <stefan.krsmanovic@aggios.com>

Added the idle-states node to describe zynqmp idle states. Only
cpu-sleep-0 idle state is added in this patch. References to the
idle-states node are added in all CPU nodes. Time values: entry/exit
latencies and min-residency, needs to be tuned. arm,psci-suspend-param
is selected to comply with PSCIv1.0 and Extended StateID format.

Signed-off-by: Stefan Krsmanovic <stefan.krsmanovic@aggios.com>
Acked-by: Will Wong <willw@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 4f7d9905e235..8e6cf0cf3a69 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -25,6 +25,7 @@
 			device_type = "cpu";
 			enable-method = "psci";
 			reg = <0x0>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		cpu1: cpu@1 {
@@ -32,6 +33,7 @@
 			device_type = "cpu";
 			enable-method = "psci";
 			reg = <0x1>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		cpu2: cpu@2 {
@@ -39,6 +41,7 @@
 			device_type = "cpu";
 			enable-method = "psci";
 			reg = <0x2>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		cpu3: cpu@3 {
@@ -46,6 +49,20 @@
 			device_type = "cpu";
 			enable-method = "psci";
 			reg = <0x3>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+
+		idle-states {
+			entry-method = "arm,psci";
+
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x40000000>;
+				local-timer-stop;
+				entry-latency-us = <300>;
+				exit-latency-us = <600>;
+				min-residency-us = <10000>;
+			};
 		};
 	};
 
-- 
1.9.1
