From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v8 03/16] of/numa: add nid check for memory block
Date: Thu, 1 Sep 2016 14:54:54 +0800
Message-ID: <1472712907-12700-4-git-send-email-thunder.leizhen@huawei.com>
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

If the numa-id which was configured in memory@ devicetree node is greater
than MAX_NUMNODES, we should report a warning. We have done this for cpus
and distance-map dt nodes, this patch help them to be consistent.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/of/of_numa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 7b3fbdc..c1bd62c 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -75,6 +75,11 @@ static int __init of_numa_parse_memory_nodes(void)
 			 */
 			continue;

+		if (nid >= MAX_NUMNODES) {
+			pr_warn("NUMA: Node id %u exceeds maximum value\n", nid);
+			r = -EINVAL;
+		}
+
 		for (i = 0; !r && !of_address_to_resource(np, i, &rsrc); i++)
 			r = numa_add_memblk(nid, rsrc.start, rsrc.end + 1);

--
2.5.0


--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
