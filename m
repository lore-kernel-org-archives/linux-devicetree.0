From: frowand.list@gmail.com
Subject: [PATCH 02/12] of: Remove excessive printks to reduce clutter.
Date: Fri, 28 Oct 2016 23:26:22 -0700
Message-ID: <1477722392-32172-3-git-send-email-frowand.list@gmail.com>
References: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

Remove extra debug and error printks.  A single pr_err() will
be added at the end of this series to replace many of these
error messages.

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 53 ++++++++-------------------------------------------
 1 file changed, 8 insertions(+), 45 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 4ff0220d7aa2..c61ba99a1792 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -115,11 +115,8 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 	int err = 0;
 
 	propval = kmalloc(rprop->length, GFP_KERNEL);
-	if (!propval) {
-		pr_err("%s: Could not copy value of '%s'\n",
-				__func__, rprop->name);
+	if (!propval)
 		return -ENOMEM;
-	}
 	memcpy(propval, rprop->value, rprop->length);
 
 	propend = propval + rprop->length;
@@ -129,8 +126,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 		nodestr = propcur;
 		s = strchr(propcur, ':');
 		if (!s) {
-			pr_err("%s: Illegal symbol entry '%s' (1)\n",
-				__func__, propcur);
 			err = -EINVAL;
 			goto err_fail;
 		}
@@ -139,26 +134,18 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 		propstr = s;
 		s = strchr(s, ':');
 		if (!s) {
-			pr_err("%s: Illegal symbol entry '%s' (2)\n",
-				__func__, (char *)rprop->value);
 			err = -EINVAL;
 			goto err_fail;
 		}
 
 		*s++ = '\0';
 		err = kstrtoint(s, 10, &offset);
-		if (err != 0) {
-			pr_err("%s: Could get offset '%s'\n",
-				__func__, (char *)rprop->value);
+		if (err != 0)
 			goto err_fail;
-		}
 
 		refnode = __of_find_node_by_full_name(node, nodestr);
-		if (!refnode) {
-			pr_warn("%s: Could not find refnode '%s'\n",
-				__func__, (char *)rprop->value);
+		if (!refnode)
 			continue;
-		}
 
 		for_each_property_of_node(refnode, sprop) {
 			if (of_prop_cmp(sprop->name, propstr) == 0)
@@ -167,8 +154,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 		of_node_put(refnode);
 
 		if (!sprop) {
-			pr_err("%s: Could not find property '%s'\n",
-				__func__, (char *)rprop->value);
 			err = -ENOENT;
 			goto err_fail;
 		}
@@ -219,11 +204,8 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 		    of_prop_cmp(rprop->name, "linux,phandle") == 0)
 			continue;
 
-		if ((rprop->length % 4) != 0 || rprop->length == 0) {
-			pr_err("%s: Illegal property (size) '%s' @%s\n",
-					__func__, rprop->name, node->full_name);
+		if ((rprop->length % 4) != 0 || rprop->length == 0)
 			return -EINVAL;
-		}
 		count = rprop->length / sizeof(__be32);
 
 		for_each_property_of_node(target, sprop) {
@@ -231,21 +213,13 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 				break;
 		}
 
-		if (sprop == NULL) {
-			pr_err("%s: Could not find target property '%s' @%s\n",
-					__func__, rprop->name, node->full_name);
+		if (sprop == NULL)
 			return -EINVAL;
-		}
 
 		for (i = 0; i < count; i++) {
 			off = be32_to_cpu(((__be32 *)rprop->value)[i]);
-			if (off >= sprop->length ||
-					(off + 4) > sprop->length) {
-				pr_err("%s: Illegal property '%s' @%s\n",
-						__func__, rprop->name,
-						node->full_name);
+			if (off >= sprop->length || (off + 4) > sprop->length)
 				return -EINVAL;
-			}
 
 			if (phandle_delta) {
 				phandle = be32_to_cpu(*(__be32 *)(sprop->value + off));
@@ -261,11 +235,8 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 			if (__of_node_name_cmp(child, childtarget) == 0)
 				break;
 
-		if (!childtarget) {
-			pr_err("%s: Could not find target child '%s' @%s\n",
-					__func__, child->name, node->full_name);
+		if (!childtarget)
 			return -EINVAL;
-		}
 
 		err = __of_adjust_tree_phandle_references(child, childtarget,
 				phandle_delta);
@@ -363,16 +334,11 @@ int of_resolve_phandles(struct device_node *resolve)
 
 		err = of_property_read_string(root_sym,
 				rprop->name, &refpath);
-		if (err != 0) {
-			pr_err("%s: Could not find symbol '%s'\n",
-					__func__, rprop->name);
+		if (err != 0)
 			goto out;
-		}
 
 		refnode = of_find_node_by_path(refpath);
 		if (!refnode) {
-			pr_err("%s: Could not find node by path '%s'\n",
-					__func__, refpath);
 			err = -ENOENT;
 			goto out;
 		}
@@ -380,9 +346,6 @@ int of_resolve_phandles(struct device_node *resolve)
 		phandle = refnode->phandle;
 		of_node_put(refnode);
 
-		pr_debug("%s: %s phandle is 0x%08x\n",
-				__func__, rprop->name, phandle);
-
 		err = __of_adjust_phandle_ref(resolve, rprop, phandle);
 		if (err)
 			break;
-- 
1.9.1
