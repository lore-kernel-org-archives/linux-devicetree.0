From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v8 12/16] arm64/numa: remove some useless code
Date: Thu, 1 Sep 2016 14:55:03 +0800
Message-ID: <1472712907-12700-13-git-send-email-thunder.leizhen@huawei.com>
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

When the deleted code is executed, only the bit of cpu0 was set on
cpu_possible_mask. So that, only set_cpu_numa_node(0, NUMA_NO_NODE); will
be executed. And map_cpu_to_node(0, 0) will soon be called. So these code
can be safely removed.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 arch/arm64/mm/numa.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 891bdaa..72f4539 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -95,7 +95,6 @@ void numa_clear_node(unsigned int cpu)
  */
 static void __init setup_node_to_cpumask_map(void)
 {
-	unsigned int cpu;
 	int node;

 	/* setup nr_node_ids if not done yet */
@@ -108,9 +107,6 @@ static void __init setup_node_to_cpumask_map(void)
 		cpumask_clear(node_to_cpumask_map[node]);
 	}

-	for_each_possible_cpu(cpu)
-		set_cpu_numa_node(cpu, NUMA_NO_NODE);
-
 	/* cpumask_of_node() will now work */
 	pr_debug("Node to cpumask map for %d nodes\n", nr_node_ids);
 }
--
2.5.0


--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
