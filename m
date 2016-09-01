From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v8 06/16] of_numa: Use of_get_next_parent to simplify code
Date: Thu, 1 Sep 2016 14:54:57 +0800
Message-ID: <1472712907-12700-7-git-send-email-thunder.leizhen@huawei.com>
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

From: Kefeng Wang <wangkefeng.wang@huawei.com>

Use of_get_next_parent() instead of open-code.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 drivers/of/of_numa.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 625b057..0d7459b 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -158,8 +158,6 @@ int of_node_to_nid(struct device_node *device)
 	np = of_node_get(device);

 	while (np) {
-		struct device_node *parent;
-
 		r = of_property_read_u32(np, "numa-node-id", &nid);
 		/*
 		 * -EINVAL indicates the property was not found, and
@@ -170,9 +168,7 @@ int of_node_to_nid(struct device_node *device)
 		if (r != -EINVAL)
 			break;

-		parent = of_get_parent(np);
-		of_node_put(np);
-		np = parent;
+		np = of_get_next_parent(np);
 	}
 	if (np && r)
 		pr_warn("NUMA: Invalid \"numa-node-id\" property in node %s\n",
--
2.5.0


--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
