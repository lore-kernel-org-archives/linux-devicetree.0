From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 2/3] of/numa: fix a memory@ dt node can only contains one memory block
Date: Thu, 26 May 2016 10:43:58 +0800
Message-ID: <1464230639-9852-2-git-send-email-thunder.leizhen@huawei.com>
References: <1464230639-9852-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464230639-9852-1-git-send-email-thunder.leizhen@huawei.com>
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
 drivers/of/of_numa.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 21d831f..2c5f249 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -63,7 +63,7 @@ static int __init of_numa_parse_memory_nodes(void)
 	struct device_node *np = NULL;
 	struct resource rsrc;
 	u32 nid;
-	int r = 0;
+	int i, r = 0;

 	for (;;) {
 		np = of_find_node_by_type(np, "memory");
@@ -82,17 +82,27 @@ static int __init of_numa_parse_memory_nodes(void)
 			/* some other error */
 			break;

-		r = of_address_to_resource(np, 0, &rsrc);
-		if (r) {
-			pr_err("NUMA: bad reg property in memory node\n");
-			break;
+		for (i = 0; ; i++) {
+			r = of_address_to_resource(np, i, &rsrc);
+			if (r) {
+				/* reached the end of of_address */
+				if (i > 0) {
+					r = 0;
+					break;
+				}
+
+				pr_err("NUMA: bad reg property in memory node\n");
+				goto finished;
+			}
+
+			r = numa_add_memblk(nid, rsrc.start,
+					    rsrc.end - rsrc.start + 1);
+			if (r)
+				goto finished;
 		}
-
-		r = numa_add_memblk(nid, rsrc.start,
-				    rsrc.end - rsrc.start + 1);
-		if (r)
-			break;
 	}
+
+finished:
 	of_node_put(np);

 	return r;
