From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v4 07/14] of_numa: Use pr_fmt()
Date: Tue, 7 Jun 2016 16:08:11 +0800
Message-ID: <1465286898-13828-8-git-send-email-thunder.leizhen@huawei.com>
References: <1465286898-13828-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465286898-13828-1-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Robert Richter <rrichter@cavium.com>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
List-Id: devicetree@vger.kernel.org

From: Kefeng Wang <wangkefeng.wang@huawei.com>

Use pr_fmt to prefix kernel output.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/of/of_numa.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index ed7bd22..019738f 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -16,6 +16,8 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */

+#define pr_fmt(fmt) "OF: NUMA: " fmt
+
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/nodemask.h>
@@ -49,10 +51,9 @@ static void __init of_numa_parse_cpu_nodes(void)
 		if (r)
 			continue;

-		pr_debug("NUMA: CPU on %u\n", nid);
+		pr_debug("CPU on %u\n", nid);
 		if (nid >= MAX_NUMNODES)
-			pr_warn("NUMA: Node id %u exceeds maximum value\n",
-				nid);
+			pr_warn("Node id %u exceeds maximum value\n", nid);
 		else
 			node_set(nid, numa_nodes_parsed);
 	}
@@ -80,7 +81,7 @@ static int __init of_numa_parse_memory_nodes(void)

 		if (!i || r) {
 			of_node_put(np);
-			pr_err("NUMA: bad property in memory node\n");
+			pr_err("bad property in memory node\n");
 			return r ? : -EINVAL;
 		}
 	}
@@ -94,17 +95,17 @@ static int __init of_numa_parse_distance_map_v1(struct device_node *map)
 	int entry_count;
 	int i;

-	pr_info("NUMA: parsing numa-distance-map-v1\n");
+	pr_info("parsing numa-distance-map-v1\n");

 	matrix = of_get_property(map, "distance-matrix", NULL);
 	if (!matrix) {
-		pr_err("NUMA: No distance-matrix property in distance-map\n");
+		pr_err("No distance-matrix property in distance-map\n");
 		return -EINVAL;
 	}

 	entry_count = of_property_count_u32_elems(map, "distance-matrix");
 	if (entry_count <= 0) {
-		pr_err("NUMA: Invalid distance-matrix\n");
+		pr_err("Invalid distance-matrix\n");
 		return -EINVAL;
 	}

@@ -119,7 +120,7 @@ static int __init of_numa_parse_distance_map_v1(struct device_node *map)
 		matrix++;

 		numa_set_distance(nodea, nodeb, distance);
-		pr_debug("NUMA:  distance[node%d -> node%d] = %d\n",
+		pr_debug("distance[node%d -> node%d] = %d\n",
 			 nodea, nodeb, distance);

 		/* Set default distance of node B->A same as A->B */
@@ -166,7 +167,7 @@ int of_node_to_nid(struct device_node *device)
 		np = of_get_next_parent(np);
 	}
 	if (np && r)
-		pr_warn("NUMA: Invalid \"numa-node-id\" property in node %s\n",
+		pr_warn("Invalid \"numa-node-id\" property in node %s\n",
 			np->name);
 	of_node_put(np);
