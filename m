From: pierre Kuo <vichy.kuo@gmail.com>
Subject: [PATCH 1/1] of: reserved_mem: fix reserve memory leak
Date: Tue, 19 Feb 2019 15:45:00 +0800
Message-ID: <20190219074500.16454-1-vichy.kuo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pierre Kuo <vichy.kuo@gmail.com>
List-Id: devicetree@vger.kernel.org

The __reserved_mem_init_node will call region specific reserved memory
init codes, but once all compatibled init codes failed, the memory region
will left in memory.reserved and cause leakage.

Take cma reserve memory DTS for example, if user declare 1MB size,
which is not align to (PAGE_SIZE << max(MAX_ORDER - 1,
pageblock_order)), rmem_cma_setup will return -EINVAL.
Meanwhile, rmem_dma_setup will also return -EINVAL since "reusable"
property is not set. If finally there is no reserved memory init pick up
this memory, kernel will left the 1MB leak in memory.reserved.

This patch will remove this kind of memory from memory.reserved, only
when __reserved_mem_init_node return neither 0 nor -ENOENT.

Signed-off-by: pierre Kuo <vichy.kuo@gmail.com>
---
 drivers/of/of_reserved_mem.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 1977ee0adcb1..d3bde057ec46 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -181,6 +181,7 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
 {
 	extern const struct of_device_id __reservedmem_of_table[];
 	const struct of_device_id *i;
+	int ret = -ENOENT;
 
 	for (i = __reservedmem_of_table; i < &__rmem_of_table_sentinel; i++) {
 		reservedmem_of_init_fn initfn = i->data;
@@ -189,13 +190,14 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
 		if (!of_flat_dt_is_compatible(rmem->fdt_node, compat))
 			continue;
 
-		if (initfn(rmem) == 0) {
+		ret = initfn(rmem);
+		if (ret == 0) {
 			pr_info("initialized node %s, compatible id %s\n",
 				rmem->name, compat);
-			return 0;
+			break;
 		}
 	}
-	return -ENOENT;
+	return ret;
 }
 
 static int __init __rmem_cmp(const void *a, const void *b)
@@ -255,7 +257,9 @@ void __init fdt_init_reserved_mem(void)
 		int len;
 		const __be32 *prop;
 		int err = 0;
+		int nomap;
 
+		nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
 		prop = of_get_flat_dt_prop(node, "phandle", &len);
 		if (!prop)
 			prop = of_get_flat_dt_prop(node, "linux,phandle", &len);
@@ -265,8 +269,16 @@ void __init fdt_init_reserved_mem(void)
 		if (rmem->size == 0)
 			err = __reserved_mem_alloc_size(node, rmem->name,
 						 &rmem->base, &rmem->size);
-		if (err == 0)
-			__reserved_mem_init_node(rmem);
+		if (err == 0) {
+			err = __reserved_mem_init_node(rmem);
+			if (err != 0 && err != -ENOENT) {
+				pr_info("node %s compatible matching fail\n",
+					rmem->name);
+				memblock_free(rmem->base, rmem->size);
+				if (nomap)
+					memblock_add(rmem->base, rmem->size);
+			}
+		}
 	}
 }
 
-- 
2.17.1
