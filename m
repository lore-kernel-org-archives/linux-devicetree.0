From: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v9 6/8] arm_pmu: Use of_cpu_node_to_id helper
Date: Tue, 31 Oct 2017 17:23:16 +0000
Message-ID: <20171031172318.11823-7-suzuki.poulose@arm.com>
References: <20171031172318.11823-1-suzuki.poulose@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171031172318.11823-1-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the new generic helper, of_cpu_node_to_id(), to map a
a phandle to the logical CPU number while parsing the
PMU irq affinity.

Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
