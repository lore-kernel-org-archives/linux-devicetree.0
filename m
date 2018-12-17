From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of: Remove struct device_node.type pointer
Date: Mon, 17 Dec 2018 11:28:38 -0600
Message-ID: <20181217172838.25495-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Now that all users of device_node.type pointer have been removed in
favor of accessor functions, we can remove it.

Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
All the dependencies for this are in linux-next now. I plan to apply and 
send this at the end of the merge window.

Rob

 drivers/of/dynamic.c | 3 ---
 drivers/of/fdt.c     | 4 ----
 drivers/of/overlay.c | 3 ---
 drivers/of/pdt.c     | 1 -
 include/linux/of.h   | 1 -
 5 files changed, 12 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index b4e5b90cb314..ae04a138a729 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -207,11 +207,8 @@ static void __of_attach_node(struct device_node *np)
 
 	if (!of_node_check_flag(np, OF_OVERLAY)) {
 		np->name = __of_get_property(np, "name", NULL);
-		np->type = __of_get_property(np, "device_type", NULL);
 		if (!np->name)
 			np->name = "<NULL>";
-		if (!np->type)
-			np->type = "<NULL>";
 
 		phandle = __of_get_property(np, "phandle", &sz);
 		if (!phandle)
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 7099c652c6a5..9cc1461aac7d 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -314,12 +314,8 @@ static bool populate_node(const void *blob,
 	populate_properties(blob, offset, mem, np, pathp, dryrun);
 	if (!dryrun) {
 		np->name = of_get_property(np, "name", NULL);
-		np->type = of_get_property(np, "device_type", NULL);
-
 		if (!np->name)
 			np->name = "<NULL>";
-		if (!np->type)
-			np->type = "<NULL>";
 	}
 
 	*pnp = np;
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 2b5ac43a5690..c423e94baf0f 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -423,12 +423,9 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
 
 		tchild->parent = target->np;
 		tchild->name = __of_get_property(node, "name", NULL);
-		tchild->type = __of_get_property(node, "device_type", NULL);
 
 		if (!tchild->name)
 			tchild->name = "<NULL>";
-		if (!tchild->type)
-			tchild->type = "<NULL>";
 
 		/* ignore obsolete "linux,phandle" */
 		phandle = __of_get_property(node, "phandle", &size);
diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
index d3185063d369..7eda43c66c91 100644
--- a/drivers/of/pdt.c
+++ b/drivers/of/pdt.c
@@ -155,7 +155,6 @@ static struct device_node * __init of_pdt_create_node(phandle node,
 	dp->parent = parent;
 
 	dp->name = of_pdt_get_one_property(node, "name");
-	dp->type = of_pdt_get_one_property(node, "device_type");
 	dp->phandle = node;
 
 	dp->properties = of_pdt_build_prop_list(node);
diff --git a/include/linux/of.h b/include/linux/of.h
index fe472e5195a9..e240992e5cb6 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -50,7 +50,6 @@ struct of_irq_controller;
 
 struct device_node {
 	const char *name;
-	const char *type;
 	phandle phandle;
 	const char *full_name;
 	struct fwnode_handle fwnode;
-- 
2.19.1
