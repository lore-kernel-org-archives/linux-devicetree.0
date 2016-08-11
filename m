From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v6 05/14] arm64/numa: avoid inconsistent information to be
 printed
Date: Thu, 11 Aug 2016 17:33:39 +0800
Message-ID: <1470908028-8596-6-git-send-email-thunder.leizhen@huawei.com>
References: <1470908028-8596-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470908028-8596-1-git-send-email-thunder.leizhen@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank
 Rowand <frowand.list@gmail.com>, devicetree <devicetree@vger.kernel.org>
Cc: Xinwei Hu <huxinwei@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>, Zefan Li <lizefan@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>
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
index c7fe3ec..fe26ed9 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -333,8 +333,10 @@ static int __init numa_init(int (*init_func)(void))
 	if (ret < 0)
 		return ret;

-	if (nodes_empty(numa_nodes_parsed))
+	if (nodes_empty(numa_nodes_parsed)) {
+		pr_info("No NUMA configuration found\n");
 		return -EINVAL;
+	}

 	ret = numa_register_nodes();
 	if (ret < 0)
@@ -365,8 +367,6 @@ static int __init dummy_numa_init(void)

 	if (numa_off)
 		pr_info("NUMA disabled\n"); /* Forced off on command line. */
-	else
-		pr_info("No NUMA configuration found\n");
 	pr_info("NUMA: Faking a node at [mem %#018Lx-%#018Lx]\n",
 	       0LLU, PFN_PHYS(max_pfn) - 1);

--
2.5.0
