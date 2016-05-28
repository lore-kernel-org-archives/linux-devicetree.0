From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 2/5] of/numa: fix a memory@ node can only contains one memory block
Date: Sat, 28 May 2016 17:22:54 +0800
Message-ID: <1464427377-12712-3-git-send-email-thunder.leizhen@huawei.com>
References: <1464427377-12712-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464427377-12712-1-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Robert Richter <rrichter@cavium.com>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>
List-Id: devicetree@vger.kernel.org

For a normal memory@ devicetree node, its reg property can contains more
memory blocks.

Because we don't known how many memory blocks maybe contained, so we try
from index=0, increase 1 until error returned(the end).

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/of/of_numa.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index fb71b4e..fa85a51 100644
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
+	int i, r = 0;

+	for_each_node_by_type(np, "memory") {
 		r = of_property_read_u32(np, "numa-node-id", &nid);
 		if (r == -EINVAL)
 			/*
@@ -78,21 +74,17 @@ static int __init of_numa_parse_memory_nodes(void)
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
+		if (!i || r) {
+			of_node_put(np);
+			pr_err("NUMA: bad property in memory node\n");
+			r = r ? : -EINVAL;
 			break;
+		}
 	}
-	of_node_put(np);

 	return r;
 }
