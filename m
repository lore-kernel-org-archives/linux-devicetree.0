From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v3 3/5] arm64/numa: add nid check for memory block
Date: Thu, 2 Jun 2016 10:28:09 +0800
Message-ID: <1464834491-12024-4-git-send-email-thunder.leizhen@huawei.com>
References: <1464834491-12024-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464834491-12024-1-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Robert Richter <rrichter@cavium.com>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>
List-Id: devicetree@vger.kernel.org

Use the same tactic to cpu and numa-distance nodes.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 arch/arm64/mm/numa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index c7fe3ec..2601660 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -141,6 +141,11 @@ int __init numa_add_memblk(int nid, u64 start, u64 end)
 {
 	int ret;

+	if (nid >= MAX_NUMNODES) {
+		pr_warn("NUMA: Node id %u exceeds maximum value\n", nid);
+		return -EINVAL;
+	}
+
 	ret = memblock_set_node(start, (end - start), &memblock.memory, nid);
 	if (ret < 0) {
 		pr_err("NUMA: memblock [0x%llx - 0x%llx] failed to add on node %d\n",
