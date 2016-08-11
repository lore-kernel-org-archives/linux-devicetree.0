From: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 12/14] arm64/numa: remove some useless code
Date: Thu, 11 Aug 2016 17:33:46 +0800
Message-ID: <1470908028-8596-13-git-send-email-thunder.leizhen@huawei.com>
References: <1470908028-8596-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470908028-8596-1-git-send-email-thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

1. Currently only cpu0 set on cpu_possible_mask and percpu areas have not
   been initialized.
2. No reason to limit cpu0 must belongs to node0.

Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/mm/numa.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 30d3279..1796789 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -93,7 +93,6 @@ void numa_clear_node(unsigned int cpu)
  */
 static void __init setup_node_to_cpumask_map(void)
 {
-	unsigned int cpu;
 	int node;

 	/* setup nr_node_ids if not done yet */
@@ -106,9 +105,6 @@ static void __init setup_node_to_cpumask_map(void)
 		cpumask_clear(node_to_cpumask_map[node]);
 	}

-	for_each_possible_cpu(cpu)
-		set_cpu_numa_node(cpu, NUMA_NO_NODE);
-
 	/* cpumask_of_node() will now work */
 	pr_debug("Node to cpumask map for %d nodes\n", nr_node_ids);
 }
@@ -374,10 +370,6 @@ static int __init numa_init(int (*init_func)(void))

 	setup_node_to_cpumask_map();

-	/* init boot processor */
-	cpu_to_node_map[0] = 0;
-	map_cpu_to_node(0, 0);
-
 	return 0;
 }

--
2.5.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
