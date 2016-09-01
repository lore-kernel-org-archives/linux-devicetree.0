From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v8 02/16] of/numa: fix a memory@ node can only contains one memory block
Date: Thu, 1 Sep 2016 14:54:53 +0800
Message-ID: <1472712907-12700-3-git-send-email-thunder.leizhen@huawei.com>
References: <1472712907-12700-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1472712907-12700-1-git-send-email-thunder.leizhen@huawei.com>
Sender: owner-linux-mm@kvack.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank
 Rowand <frowand.list@gmail.com>, devicetree <devicetree@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm <linux-mm@kvack.org>
Cc: Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong
 Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>
List-Id: devicetree@vger.kernel.org

For a normal memory@ devicetree node, its reg property can contains more
memory blocks.

Because we don't known how many memory blocks maybe contained, so we try
from index=0, increase 1 until error returned(the end).

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 drivers/of/of_numa.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index fb71b4e..7b3fbdc 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -63,13 +63,9 @@ static int __init of_numa_parse_memory_nodes(void)
 	struct device_node *np = NULL;
 	struct resource rsrc;
 	u32 nid;
-	int r = 0;
-
-	for (;;) {
-		np = of_find_node_by_type(np, "memory");
-		if (!np)
-			break;
+	int i, r;

+	for_each_node_by_type(np, "memory") {
 		r = of_property_read_u32(np, "numa-node-id", &nid);
 		if (r == -EINVAL)
 			/*
@@ -78,23 +74,18 @@ static int __init of_numa_parse_memory_nodes(void)
 			 * "numa-node-id" property
 			 */
 			continue;
-		else if (r)
-			/* some other error */
-			break;

-		r = of_address_to_resource(np, 0, &rsrc);
-		if (r) {
-			pr_err("NUMA: bad reg property in memory node\n");
-			break;
-		}
+		for (i = 0; !r && !of_address_to_resource(np, i, &rsrc); i++)
+			r = numa_add_memblk(nid, rsrc.start, rsrc.end + 1);

-		r = numa_add_memblk(nid, rsrc.start, rsrc.end + 1);
-		if (r)
-			break;
+		if (!i || r) {
+			of_node_put(np);
+			pr_err("NUMA: bad property in memory node\n");
+			return r ? : -EINVAL;
+		}
 	}
-	of_node_put(np);

-	return r;
+	return 0;
 }

 static int __init of_numa_parse_distance_map_v1(struct device_node *map)
--
2.5.0


--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
