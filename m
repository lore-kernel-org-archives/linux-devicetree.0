From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v10 7/8] dt-bindings: Document devicetree binding for ARM DSU PMU
Date: Fri,  3 Nov 2017 17:51:04 +0000
Message-ID: <20171103175105.23546-8-suzuki.poulose@arm.com>
References: <20171103175105.23546-1-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171103175105.23546-1-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com, robh@kernel.org, sudeep.holla@arm.com, peterz@infradead.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, frowand.list@gmail.com, Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

This patch documents the devicetree bindings for ARM DSU PMU.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org
Cc: frowand.list@gmail.com
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since V3:
 - Fixed node name in the example, suggested by Rob
---
 .../devicetree/bindings/arm/arm-dsu-pmu.txt        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm-dsu-pmu.txt

diff --git a/Documentation/devicetree/bindings/arm/arm-dsu-pmu.txt b/Documentation/devicetree/bindings/arm/arm-dsu-pmu.txt
new file mode 100644
index 000000000000..6efabba530f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm-dsu-pmu.txt
@@ -0,0 +1,27 @@
+* ARM DynamIQ Shared Unit (DSU) Performance Monitor Unit (PMU)
+
+ARM DyanmIQ Shared Unit (DSU) integrates one or more CPU cores
+with a shared L3 memory system, control logic and external interfaces to
+form a multicore cluster. The PMU enables to gather various statistics on
+the operations of the DSU. The PMU provides independent 32bit counters that
+can count any of the supported events, along with a 64bit cycle counter.
+The PMU is accessed via CPU system registers and has no MMIO component.
+
+** DSU PMU required properties:
+
+- compatible	: should be one of :
+
+		"arm,dsu-pmu"
+
+- interrupts	: Exactly 1 SPI must be listed.
+
+- cpus		: List of phandles for the CPUs connected to this DSU instance.
+
+
+** Example:
+
+dsu-pmu-0 {
+	compatible = "arm,dsu-pmu";
+	interrupts = <GIC_SPI 02 IRQ_TYPE_LEVEL_HIGH>;
+	cpus = <&cpu_0>, <&cpu_1>;
+};
-- 
2.13.6
