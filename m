From: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v7 02/14] of/numa: fix a memory@ node can only contains one memory block
Date: Wed, 24 Aug 2016 15:44:41 +0800
Message-ID: <1472024693-12912-3-git-send-email-thunder.leizhen@huawei.com>
References: <1472024693-12912-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472024693-12912-1-git-send-email-thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For a normal memory@ devicetree node, its reg property can contains more
memory blocks.

Because we don't known how many memory blocks maybe contained, so we try
from index=0, increase 1 until error returned(the end).

Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
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
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
