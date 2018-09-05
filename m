From: Rob Herring <robh@kernel.org>
Subject: [PATCH 20/21] of: use for_each_of_cpu_node iterator
Date: Wed,  5 Sep 2018 14:37:37 -0500
Message-ID: <20180905193738.19325-21-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
has the side effect of defaulting to iterating using "cpu" node names in
preference to the deprecated (for FDT) device_type == "cpu".

Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take via the DT tree. This is dependent on the
first 2 patches.

 drivers/of/base.c    |  2 +-
 drivers/of/of_numa.c | 15 ++-------------
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6389aeb2f48c..8285c07cab44 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -389,7 +389,7 @@ struct device_node *of_get_cpu_node(int cpu, unsigned int *thread)
 {
 	struct device_node *cpun;

-	for_each_node_by_type(cpun, "cpu") {
+	for_each_of_cpu_node(cpun) {
 		if (arch_find_n_match_cpu_physical_id(cpun, cpu, thread))
 			return cpun;
 	}
diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 27d9b4bba535..f165fe28f49d 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -24,18 +24,9 @@ static void __init of_numa_parse_cpu_nodes(void)
 {
 	u32 nid;
 	int r;
-	struct device_node *cpus;
-	struct device_node *np = NULL;
-
-	cpus = of_find_node_by_path("/cpus");
-	if (!cpus)
-		return;
-
-	for_each_child_of_node(cpus, np) {
-		/* Skip things that are not CPUs */
-		if (of_node_cmp(np->type, "cpu") != 0)
-			continue;
+	struct device_node *np;

+	for_each_of_cpu_node(np) {
 		r = of_property_read_u32(np, "numa-node-id", &nid);
 		if (r)
 			continue;
@@ -46,8 +37,6 @@ static void __init of_numa_parse_cpu_nodes(void)
 		else
 			node_set(nid, numa_nodes_parsed);
 	}
-
-	of_node_put(cpus);
 }

 static int __init of_numa_parse_memory_nodes(void)
--
2.17.1
