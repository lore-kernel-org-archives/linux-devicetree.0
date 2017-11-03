From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v10 6/8] arm_pmu: Use of_cpu_node_to_id helper
Date: Fri,  3 Nov 2017 17:51:03 +0000
Message-ID: <20171103175105.23546-7-suzuki.poulose@arm.com>
References: <20171103175105.23546-1-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171103175105.23546-1-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com, robh@kernel.org, sudeep.holla@arm.com, peterz@infradead.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, frowand.list@gmail.com, Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

Use the new generic helper, of_cpu_node_to_id(), to map a
a phandle to the logical CPU number while parsing the
PMU irq affinity.

Cc: Will Deacon <will.deacon@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/perf/arm_pmu_platform.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/perf/arm_pmu_platform.c b/drivers/perf/arm_pmu_platform.c
index 4eafa7a42e52..a96884e37eaf 100644
--- a/drivers/perf/arm_pmu_platform.c
+++ b/drivers/perf/arm_pmu_platform.c
@@ -81,19 +81,10 @@ static int pmu_parse_irq_affinity(struct device_node *node, int i)
 		return -EINVAL;
 	}
 
-	/* Now look up the logical CPU number */
-	for_each_possible_cpu(cpu) {
-		struct device_node *cpu_dn;
-
-		cpu_dn = of_cpu_device_node_get(cpu);
-		of_node_put(cpu_dn);
-
-		if (dn == cpu_dn)
-			break;
-	}
-
-	if (cpu >= nr_cpu_ids) {
+	cpu = of_cpu_node_to_id(dn);
+	if (cpu < 0) {
 		pr_warn("failed to find logical CPU for %s\n", dn->name);
+		cpu = nr_cpu_ids;
 	}
 
 	of_node_put(dn);
-- 
2.13.6
