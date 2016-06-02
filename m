From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v3 5/5] arm64/numa: avoid inconsistent information to be printed
Date: Thu, 2 Jun 2016 10:28:11 +0800
Message-ID: <1464834491-12024-6-git-send-email-thunder.leizhen@huawei.com>
References: <1464834491-12024-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464834491-12024-1-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Robert Richter <rrichter@cavium.com>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>
List-Id: devicetree@vger.kernel.org

numa_init(of_numa_init) may returned error because of numa configuration
error. So "No NUMA configuration found" is inaccurate. In fact, specific
configuration error information should be immediately printed by the
testing branch.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 arch/arm64/mm/numa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 2601660..1b9622c 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -338,8 +338,10 @@ static int __init numa_init(int (*init_func)(void))
 	if (ret < 0)
 		return ret;

-	if (nodes_empty(numa_nodes_parsed))
+	if (nodes_empty(numa_nodes_parsed)) {
+		pr_info("No NUMA configuration found\n");
 		return -EINVAL;
+	}

 	ret = numa_register_nodes();
 	if (ret < 0)
@@ -370,8 +372,6 @@ static int __init dummy_numa_init(void)

 	if (numa_off)
 		pr_info("NUMA disabled\n"); /* Forced off on command line. */
-	else
-		pr_info("No NUMA configuration found\n");
 	pr_info("NUMA: Faking a node at [mem %#018Lx-%#018Lx]\n",
 	       0LLU, PFN_PHYS(max_pfn) - 1);
