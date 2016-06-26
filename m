From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 2/2] of: fdt: mark unflattened tree as detached
Date: Sun, 26 Jun 2016 22:11:59 +0200
Message-ID: <01da4c372750e6618638a0320e7ea2f656da3ae5.1466971467.git.hramrach@gmail.com>
References: <cover.1466971467.git.hramrach@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1466971467.git.hramrach@gmail.com>
In-Reply-To: <cover.1466971467.git.hramrach@gmail.com>
References: <cover.1466971467.git.hramrach@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michal Suchanek <hramrach@gmail.com>
List-Id: devicetree@vger.kernel.org

The tree returned from of_fdt_unflatten_tree cannot be attached to the
live tree because it is not marked as detached so mark it as such. The
dt resolver checks the flag and refuses to process the tree otherwise.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/of/fdt.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 3349d2a..7b075cf 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -384,7 +384,8 @@ static void * unflatten_dt_node(const void *blob,
  */
 static void __unflatten_device_tree(const void *blob,
 			     struct device_node **mynodes,
-			     void * (*dt_alloc)(u64 size, u64 align))
+			     void * (*dt_alloc)(u64 size, u64 align),
+			     bool detached)
 {
 	unsigned long size;
 	int start;
@@ -428,6 +429,10 @@ static void __unflatten_device_tree(const void *blob,
 	if (be32_to_cpup(mem + size) != 0xdeadbeef)
 		pr_warning("End of tree marker overwritten: %08x\n",
 			   be32_to_cpup(mem + size));
+	if (detached) {
+		of_node_set_flag(*mynodes, OF_DETACHED);
+		pr_debug("unflattened tree is detached\n");
+	}
 
 	pr_debug(" <- unflatten_device_tree()\n");
 }
@@ -451,7 +456,7 @@ void of_fdt_unflatten_tree(const unsigned long *blob,
 			struct device_node **mynodes)
 {
 	mutex_lock(&of_fdt_unflatten_mutex);
-	__unflatten_device_tree(blob, mynodes, &kernel_tree_alloc);
+	__unflatten_device_tree(blob, mynodes, &kernel_tree_alloc, true);
 	mutex_unlock(&of_fdt_unflatten_mutex);
 }
 EXPORT_SYMBOL_GPL(of_fdt_unflatten_tree);
@@ -1119,7 +1124,8 @@ bool __init early_init_dt_scan(void *params)
 void __init unflatten_device_tree(void)
 {
 	__unflatten_device_tree(initial_boot_params, &of_root,
-				early_init_dt_alloc_memory_arch);
+				early_init_dt_alloc_memory_arch,
+				false);
 
 	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
 	of_alias_scan(early_init_dt_alloc_memory_arch);
-- 
2.8.1
