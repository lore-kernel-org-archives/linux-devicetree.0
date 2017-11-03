From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v10 3/8] coresight: of: Use of_cpu_node_to_id helper
Date: Fri,  3 Nov 2017 17:51:00 +0000
Message-ID: <20171103175105.23546-4-suzuki.poulose@arm.com>
References: <20171103175105.23546-1-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171103175105.23546-1-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com, robh@kernel.org, sudeep.holla@arm.com, peterz@infradead.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, frowand.list@gmail.com, Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

Reuse the new generic helper, of_cpu_node_to_id() to map a
given CPU phandle to a logical CPU number.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Tested-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since V4:
 - Fix a regression introduced in v4, reported by bugrobot
Changes since V3:
 - Reflect the renaming of the helper and return value changes
---
 drivers/hwtracing/coresight/of_coresight.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
index a18794128bf8..7c375443ede6 100644
--- a/drivers/hwtracing/coresight/of_coresight.c
+++ b/drivers/hwtracing/coresight/of_coresight.c
@@ -104,26 +104,17 @@ static int of_coresight_alloc_memory(struct device *dev,
 int of_coresight_get_cpu(const struct device_node *node)
 {
 	int cpu;
-	bool found;
-	struct device_node *dn, *np;
+	struct device_node *dn;
 
 	dn = of_parse_phandle(node, "cpu", 0);
-
 	/* Affinity defaults to CPU0 */
 	if (!dn)
 		return 0;
-
-	for_each_possible_cpu(cpu) {
-		np = of_cpu_device_node_get(cpu);
-		found = (dn == np);
-		of_node_put(np);
-		if (found)
-			break;
-	}
+	cpu = of_cpu_node_to_id(dn);
 	of_node_put(dn);
 
 	/* Affinity to CPU0 if no cpu nodes are found */
-	return found ? cpu : 0;
+	return (cpu < 0) ? 0 : cpu;
 }
 EXPORT_SYMBOL_GPL(of_coresight_get_cpu);
 
-- 
2.13.6
