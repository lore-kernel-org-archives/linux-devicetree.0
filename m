From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v6 03/14] arm64/numa: add nid check for memory block
Date: Thu, 11 Aug 2016 17:33:37 +0800
Message-ID: <1470908028-8596-4-git-send-email-thunder.leizhen@huawei.com>
References: <1470908028-8596-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470908028-8596-1-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree <devicetree@vger.kernel.org>
Cc: Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>
List-Id: devicetree@vger.kernel.org

Use the same tactic to cpu and numa-distance nodes.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/of/of_numa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 7b3fbdc..afaeb9c 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -75,6 +75,11 @@ static int __init of_numa_parse_memory_nodes(void)
 			 */
 			continue;

+		if (nid >= MAX_NUMNODES) {
+			pr_warn("NUMA: Node id %u exceeds maximum value\n", nid);
+			return -EINVAL;
+		}
+
 		for (i = 0; !r && !of_address_to_resource(np, i, &rsrc); i++)
 			r = numa_add_memblk(nid, rsrc.start, rsrc.end + 1);

--
2.5.0
