From: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v11 7/8] dt-bindings: Document devicetree binding for ARM DSU PMU
Date: Tue,  2 Jan 2018 11:25:32 +0000
Message-ID: <20180102112533.13640-8-suzuki.poulose@arm.com>
References: <20180102112533.13640-1-suzuki.poulose@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102112533.13640-1-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, jonathan.cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch documents the devicetree bindings for ARM DSU PMU.

Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
