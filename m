From: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v10 5/8] arm64: Use of_cpu_node_to_id helper for CPU topology parsing
Date: Fri,  3 Nov 2017 17:51:02 +0000
Message-ID: <20171103175105.23546-6-suzuki.poulose@arm.com>
References: <20171103175105.23546-1-suzuki.poulose@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171103175105.23546-1-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Make use of the new generic helper to convert an of_node of a CPU
to the logical CPU id in parsing the topology.

Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
