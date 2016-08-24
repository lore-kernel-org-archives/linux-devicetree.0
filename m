From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v7 01/14] of/numa: remove a duplicated pr_debug information
Date: Wed, 24 Aug 2016 15:44:40 +0800
Message-ID: <1472024693-12912-2-git-send-email-thunder.leizhen@huawei.com>
References: <1472024693-12912-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472024693-12912-1-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree <devicetree@vger.kernel.org>
Cc: Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>
List-Id: devicetree@vger.kernel.org

This information will be printed in the subfunction numa_add_memblk.
They are not the same, but very similar.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 drivers/of/of_numa.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index ed5a097..fb71b4e 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -88,10 +88,6 @@ static int __init of_numa_parse_memory_nodes(void)
 			break;
 		}

-		pr_debug("NUMA:  base = %llx len = %llx, node = %u\n",
-			 rsrc.start, rsrc.end - rsrc.start + 1, nid);
-
-
 		r = numa_add_memblk(nid, rsrc.start, rsrc.end + 1);
 		if (r)
 			break;
--
2.5.0
