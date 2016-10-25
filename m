From: frowand.list@gmail.com
Subject: [RFC PATCH 01/13] of: Remove comments that state the obvious
Date: Tue, 25 Oct 2016 13:58:54 -0700
Message-ID: <1477429146-27039-2-git-send-email-frowand.list@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

Remove comments that state the obvious, to reduce clutter

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 46325d6394cf..4ff0220d7aa2 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -36,7 +36,6 @@ static struct device_node *__of_find_node_by_full_name(struct device_node *node,
 	if (node == NULL)
 		return NULL;
 
-	/* check */
 	if (of_node_cmp(node->full_name, full_name) == 0)
 		return of_node_get(node);
 
@@ -60,7 +59,6 @@ static phandle of_get_tree_max_phandle(void)
 	phandle phandle;
 	unsigned long flags;
 
-	/* now search recursively */
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	phandle = 0;
 	for_each_of_allnodes(node) {
@@ -75,8 +73,6 @@ static phandle of_get_tree_max_phandle(void)
 
 /*
  * Adjust a subtree's phandle values by a given delta.
- * Makes sure not to just adjust the device node's phandle value,
- * but modify the phandle properties values as well.
  */
 static void __of_adjust_tree_phandles(struct device_node *node,
 		int phandle_delta)
@@ -85,32 +81,25 @@ static void __of_adjust_tree_phandles(struct device_node *node,
 	struct property *prop;
 	phandle phandle;
 
-	/* first adjust the node's phandle direct value */
 	if (node->phandle != 0 && node->phandle != OF_PHANDLE_ILLEGAL)
 		node->phandle += phandle_delta;
 
-	/* now adjust phandle & linux,phandle values */
 	for_each_property_of_node(node, prop) {
 
-		/* only look for these two */
 		if (of_prop_cmp(prop->name, "phandle") != 0 &&
 		    of_prop_cmp(prop->name, "linux,phandle") != 0)
 			continue;
 
-		/* must be big enough */
 		if (prop->length < 4)
 			continue;
 
-		/* read phandle value */
 		phandle = be32_to_cpup(prop->value);
-		if (phandle == OF_PHANDLE_ILLEGAL)	/* unresolved */
+		if (phandle == OF_PHANDLE_ILLEGAL)
 			continue;
 
-		/* adjust */
 		*(uint32_t *)prop->value = cpu_to_be32(node->phandle);
 	}
 
-	/* now do the children recursively */
 	for_each_child_of_node(node, child)
 		__of_adjust_tree_phandles(child, phandle_delta);
 }
@@ -125,7 +114,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 	int offset, propcurlen;
 	int err = 0;
 
-	/* make a copy */
 	propval = kmalloc(rprop->length, GFP_KERNEL);
 	if (!propval) {
 		pr_err("%s: Could not copy value of '%s'\n",
@@ -165,7 +153,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 			goto err_fail;
 		}
 
-		/* look into the resolve node for the full path */
 		refnode = __of_find_node_by_full_name(node, nodestr);
 		if (!refnode) {
 			pr_warn("%s: Could not find refnode '%s'\n",
@@ -173,7 +160,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 			continue;
 		}
 
-		/* now find the property */
 		for_each_property_of_node(refnode, sprop) {
 			if (of_prop_cmp(sprop->name, propstr) == 0)
 				break;
@@ -240,7 +226,6 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 		}
 		count = rprop->length / sizeof(__be32);
 
-		/* now find the target property */
 		for_each_property_of_node(target, sprop) {
 			if (of_prop_cmp(sprop->name, rprop->name) == 0)
 				break;
@@ -254,7 +239,6 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 
 		for (i = 0; i < count; i++) {
 			off = be32_to_cpu(((__be32 *)rprop->value)[i]);
-			/* make sure the offset doesn't overstep (even wrap) */
 			if (off >= sprop->length ||
 					(off + 4) > sprop->length) {
 				pr_err("%s: Illegal property '%s' @%s\n",
@@ -264,7 +248,6 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 			}
 
 			if (phandle_delta) {
-				/* adjust */
 				phandle = be32_to_cpu(*(__be32 *)(sprop->value + off));
 				phandle += phandle_delta;
 				*(__be32 *)(sprop->value + off) = cpu_to_be32(phandle);
@@ -320,22 +303,18 @@ int of_resolve_phandles(struct device_node *resolve)
 	if (resolve && !of_node_check_flag(resolve, OF_DETACHED))
 		pr_err("%s: node %s not detached\n", __func__,
 			 resolve->full_name);
-	/* the resolve node must exist, and be detached */
 	if (!resolve || !of_node_check_flag(resolve, OF_DETACHED))
 		return -EINVAL;
 
-	/* first we need to adjust the phandles */
 	phandle_delta = of_get_tree_max_phandle() + 1;
 	__of_adjust_tree_phandles(resolve, phandle_delta);
 
-	/* locate the local fixups */
 	childroot = NULL;
 	for_each_child_of_node(resolve, childroot)
 		if (of_node_cmp(childroot->name, "__local_fixups__") == 0)
 			break;
 
 	if (childroot != NULL) {
-		/* resolve root is guaranteed to be the '/' */
 		err = __of_adjust_tree_phandle_references(childroot,
 				resolve, 0);
 		if (err != 0)
@@ -349,10 +328,8 @@ int of_resolve_phandles(struct device_node *resolve)
 	resolve_sym = NULL;
 	resolve_fix = NULL;
 
-	/* this may fail (if no fixups are required) */
 	root_sym = of_find_node_by_path("/__symbols__");
 
-	/* locate the symbols & fixups nodes on resolve */
 	for_each_child_of_node(resolve, child) {
 
 		if (!resolve_sym &&
@@ -363,18 +340,15 @@ int of_resolve_phandles(struct device_node *resolve)
 				of_node_cmp(child->name, "__fixups__") == 0)
 			resolve_fix = child;
 
-		/* both found, don't bother anymore */
 		if (resolve_sym && resolve_fix)
 			break;
 	}
 
-	/* we do allow for the case where no fixups are needed */
 	if (!resolve_fix) {
-		err = 0;	/* no error */
+		err = 0;
 		goto out;
 	}
 
-	/* we need to fixup, but no root symbols... */
 	if (!root_sym) {
 		pr_err("%s: no symbols in root of device tree.\n", __func__);
 		err = -EINVAL;
@@ -415,7 +389,6 @@ int of_resolve_phandles(struct device_node *resolve)
 	}
 
 out:
-	/* NULL is handled by of_node_put as NOP */
 	of_node_put(root_sym);
 
 	return err;
-- 
1.9.1
