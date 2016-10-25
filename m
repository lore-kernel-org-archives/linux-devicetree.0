From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC PATCH 04/13] of: Convert comparisons to zero or NULL to simplify logical expressions
Date: Tue, 25 Oct 2016 13:58:57 -0700
Message-ID: <1477429146-27039-5-git-send-email-frowand.list@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477429146-27039-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

A small number of such comparisons remain where they provide more
clarity of the numeric nature of a variable.

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 drivers/of/resolver.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index c61ba99a1792..31fd3800787a 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -33,10 +33,10 @@ static struct device_node *__of_find_node_by_full_name(struct device_node *node,
 {
 	struct device_node *child, *found;
 
-	if (node == NULL)
+	if (!node)
 		return NULL;
 
-	if (of_node_cmp(node->full_name, full_name) == 0)
+	if (!of_node_cmp(node->full_name, full_name))
 		return of_node_get(node);
 
 	for_each_child_of_node(node, child) {
@@ -86,8 +86,8 @@ static void __of_adjust_tree_phandles(struct device_node *node,
 
 	for_each_property_of_node(node, prop) {
 
-		if (of_prop_cmp(prop->name, "phandle") != 0 &&
-		    of_prop_cmp(prop->name, "linux,phandle") != 0)
+		if (of_prop_cmp(prop->name, "phandle") &&
+		    of_prop_cmp(prop->name, "linux,phandle"))
 			continue;
 
 		if (prop->length < 4)
@@ -140,7 +140,7 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 
 		*s++ = '\0';
 		err = kstrtoint(s, 10, &offset);
-		if (err != 0)
+		if (err)
 			goto err_fail;
 
 		refnode = __of_find_node_by_full_name(node, nodestr);
@@ -148,7 +148,7 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 			continue;
 
 		for_each_property_of_node(refnode, sprop) {
-			if (of_prop_cmp(sprop->name, propstr) == 0)
+			if (!of_prop_cmp(sprop->name, propstr))
 				break;
 		}
 		of_node_put(refnode);
@@ -193,15 +193,15 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 	unsigned int off;
 	phandle phandle;
 
-	if (node == NULL)
+	if (!node)
 		return 0;
 
 	for_each_property_of_node(node, rprop) {
 
 		/* skip properties added automatically */
-		if (of_prop_cmp(rprop->name, "name") == 0 ||
-		    of_prop_cmp(rprop->name, "phandle") == 0 ||
-		    of_prop_cmp(rprop->name, "linux,phandle") == 0)
+		if (!of_prop_cmp(rprop->name, "name") ||
+		    !of_prop_cmp(rprop->name, "phandle") ||
+		    !of_prop_cmp(rprop->name, "linux,phandle"))
 			continue;
 
 		if ((rprop->length % 4) != 0 || rprop->length == 0)
@@ -209,11 +209,11 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 		count = rprop->length / sizeof(__be32);
 
 		for_each_property_of_node(target, sprop) {
-			if (of_prop_cmp(sprop->name, rprop->name) == 0)
+			if (!of_prop_cmp(sprop->name, rprop->name))
 				break;
 		}
 
-		if (sprop == NULL)
+		if (!sprop)
 			return -EINVAL;
 
 		for (i = 0; i < count; i++) {
@@ -232,7 +232,7 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 	for_each_child_of_node(node, child) {
 
 		for_each_child_of_node(target, childtarget)
-			if (__of_node_name_cmp(child, childtarget) == 0)
+			if (!__of_node_name_cmp(child, childtarget))
 				break;
 
 		if (!childtarget)
@@ -240,7 +240,7 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 
 		err = __of_adjust_tree_phandle_references(child, childtarget,
 				phandle_delta);
-		if (err != 0)
+		if (err)
 			return err;
 	}
 
@@ -282,13 +282,13 @@ int of_resolve_phandles(struct device_node *resolve)
 
 	childroot = NULL;
 	for_each_child_of_node(resolve, childroot)
-		if (of_node_cmp(childroot->name, "__local_fixups__") == 0)
+		if (!of_node_cmp(childroot->name, "__local_fixups__"))
 			break;
 
 	if (childroot != NULL) {
 		err = __of_adjust_tree_phandle_references(childroot,
 				resolve, 0);
-		if (err != 0)
+		if (err)
 			return err;
 
 		BUG_ON(__of_adjust_tree_phandle_references(childroot,
@@ -303,12 +303,10 @@ int of_resolve_phandles(struct device_node *resolve)
 
 	for_each_child_of_node(resolve, child) {
 
-		if (!resolve_sym &&
-				of_node_cmp(child->name, "__symbols__") == 0)
+		if (!resolve_sym && !of_node_cmp(child->name, "__symbols__"))
 			resolve_sym = child;
 
-		if (!resolve_fix &&
-				of_node_cmp(child->name, "__fixups__") == 0)
+		if (!resolve_fix && !of_node_cmp(child->name, "__fixups__"))
 			resolve_fix = child;
 
 		if (resolve_sym && resolve_fix)
@@ -329,12 +327,12 @@ int of_resolve_phandles(struct device_node *resolve)
 	for_each_property_of_node(resolve_fix, rprop) {
 
 		/* skip properties added automatically */
-		if (of_prop_cmp(rprop->name, "name") == 0)
+		if (!of_prop_cmp(rprop->name, "name"))
 			continue;
 
 		err = of_property_read_string(root_sym,
 				rprop->name, &refpath);
-		if (err != 0)
+		if (err)
 			goto out;
 
 		refnode = of_find_node_by_path(refpath);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
