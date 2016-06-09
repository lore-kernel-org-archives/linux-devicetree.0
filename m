From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2] drivers/of: Fix depth for sub-tree blob in unflatten_dt_nodes()
Date: Thu,  9 Jun 2016 15:50:49 +1000
Message-ID: <1465451449-27164-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrew.donnellan-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The function is unflattening device sub-tree blob if @dad passed to
the function is valid. Currently, this functionality is used by PPC
PowerNV PCI hotplug driver only. There are possibly multiple nodes
in the first level of depth, fdt_next_node() bails immediately when
@depth becomes negative before the second device node can be probed
successfully. It leads to the device nodes except the first one won't
be unflattened successfully.

This fixes the issue by setting the initial depth (@inital_depth) to
1 when this function is called to unflatten device sub-tree blob. No
logic changes when this function is used to unflatten non-sub-tree
blob.

Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Fixes: 78c44d910 ("drivers/of: Fix depth when unflattening devicetree")
Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Tested-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Andrew Donnellan <andrew.donnellan-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
---
v2: Change @depth before initializing @fpsizes[depth] and @nps[depth]
---
 drivers/of/fdt.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 14f2f8c..33daffc 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -395,7 +395,7 @@ static int unflatten_dt_nodes(const void *blob,
 			      struct device_node **nodepp)
 {
 	struct device_node *root;
-	int offset = 0, depth = 0;
+	int offset = 0, depth = 0, initial_depth = 0;
 #define FDT_MAX_DEPTH	64
 	unsigned int fpsizes[FDT_MAX_DEPTH];
 	struct device_node *nps[FDT_MAX_DEPTH];
@@ -405,11 +405,22 @@ static int unflatten_dt_nodes(const void *blob,
 	if (nodepp)
 		*nodepp = NULL;
 
+	/*
+	 * We're unflattening device sub-tree if @dad is valid. There are
+	 * possibly multiple nodes in the first level of depth. We need
+	 * set @depth to 1 to make fdt_next_node() happy as it bails
+	 * immediately when negative @depth is found. Otherwise, the device
+	 * nodes except the first one won't be unflattened successfully.
+	 */
+	if (dad)
+		depth = initial_depth = 1;
+
 	root = dad;
 	fpsizes[depth] = dad ? strlen(of_node_full_name(dad)) : 0;
 	nps[depth] = dad;
+
 	for (offset = 0;
-	     offset >= 0 && depth >= 0;
+	     offset >= 0 && depth >= initial_depth;
 	     offset = fdt_next_node(blob, offset, &depth)) {
 		if (WARN_ON_ONCE(depth >= FDT_MAX_DEPTH))
 			continue;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
