From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v9 5/8] arm64: Use of_cpu_node_to_id helper for CPU topology parsing
Date: Tue, 31 Oct 2017 17:23:15 +0000
Message-ID: <20171031172318.11823-6-suzuki.poulose@arm.com>
References: <20171031172318.11823-1-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171031172318.11823-1-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com, robh@kernel.org, sudeep.holla@arm.com, peterz@infradead.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, frowand.list@gmail.com, Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

Make use of the new generic helper to convert an of_node of a CPU
to the logical CPU id in parsing the topology.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Leo Yan <leo.yan@linaro.org>
Cc: Will Deacon <will.deacon@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kernel/topology.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 8d48b233e6ce..21868530018e 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -37,18 +37,14 @@ static int __init get_cpu_for_node(struct device_node *node)
 	if (!cpu_node)
 		return -1;
 
-	for_each_possible_cpu(cpu) {
-		if (of_get_cpu_node(cpu, NULL) == cpu_node) {
-			topology_parse_cpu_capacity(cpu_node, cpu);
-			of_node_put(cpu_node);
-			return cpu;
-		}
-	}
-
-	pr_crit("Unable to find CPU node for %pOF\n", cpu_node);
+	cpu = of_cpu_node_to_id(cpu_node);
+	if (cpu >= 0)
+		topology_parse_cpu_capacity(cpu_node, cpu);
+	else
+		pr_crit("Unable to find CPU node for %pOF\n", cpu_node);
 
 	of_node_put(cpu_node);
-	return -1;
+	return cpu;
 }
 
 static int __init parse_core(struct device_node *core, int cluster_id,
-- 
2.13.6
