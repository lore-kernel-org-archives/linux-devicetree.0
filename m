From: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v8 07/16] of_numa: Use pr_fmt()
Date: Thu, 1 Sep 2016 14:54:58 +0800
Message-ID: <1472712907-12700-8-git-send-email-thunder.leizhen@huawei.com>
References: <1472712907-12700-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472712907-12700-1-git-send-email-thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-mm <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>
Cc: Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Use pr_fmt to prefix kernel output.

Signed-off-by: Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/of_numa.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 0d7459b..f63d4b0d 100644
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
@@ -76,7 +77,7 @@ static int __init of_numa_parse_memory_nodes(void)
 			continue;

 		if (nid >= MAX_NUMNODES) {
-			pr_warn("NUMA: Node id %u exceeds maximum value\n", nid);
+			pr_warn("Node id %u exceeds maximum value\n", nid);
 			r = -EINVAL;
 		}

@@ -85,7 +86,7 @@ static int __init of_numa_parse_memory_nodes(void)

 		if (!i || r) {
 			of_node_put(np);
-			pr_err("NUMA: bad property in memory node\n");
+			pr_err("bad property in memory node\n");
 			return r ? : -EINVAL;
 		}
 	}
@@ -99,17 +100,17 @@ static int __init of_numa_parse_distance_map_v1(struct device_node *map)
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

@@ -124,7 +125,7 @@ static int __init of_numa_parse_distance_map_v1(struct device_node *map)
 		matrix++;

 		numa_set_distance(nodea, nodeb, distance);
-		pr_debug("NUMA:  distance[node%d -> node%d] = %d\n",
+		pr_debug("distance[node%d -> node%d] = %d\n",
 			 nodea, nodeb, distance);

 		/* Set default distance of node B->A same as A->B */
@@ -171,7 +172,7 @@ int of_node_to_nid(struct device_node *device)
 		np = of_get_next_parent(np);
 	}
 	if (np && r)
-		pr_warn("NUMA: Invalid \"numa-node-id\" property in node %s\n",
+		pr_warn("Invalid \"numa-node-id\" property in node %s\n",
 			np->name);
 	of_node_put(np);

--
2.5.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
