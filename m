From: frowand.list@gmail.com
Subject: [RFC PATCH 02/13] of: Remove excessive printks to reduce clutter
Date: Tue, 25 Oct 2016 13:58:55 -0700
Message-ID: <1477429146-27039-3-git-send-email-frowand.list@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 4ff0220d7aa2..93a7ca0bf98c 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -116,8 +116,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 
 	propval = kmalloc(rprop->length, GFP_KERNEL);
 	if (!propval) {
-		pr_err("%s: Could not copy value of '%s'\n",
-				__func__, rprop->name);
 		return -ENOMEM;
 	}
 	memcpy(propval, rprop->value, rprop->length);
@@ -129,8 +127,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 		nodestr = propcur;
 		s = strchr(propcur, ':');
 		if (!s) {
-			pr_err("%s: Illegal symbol entry '%s' (1)\n",
-				__func__, propcur);
 			err = -EINVAL;
 			goto err_fail;
 		}
@@ -139,8 +135,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 		propstr = s;
 		s = strchr(s, ':');
 		if (!s) {
-			pr_err("%s: Illegal symbol entry '%s' (2)\n",
-				__func__, (char *)rprop->value);
 			err = -EINVAL;
 			goto err_fail;
 		}
@@ -148,15 +142,11 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 		*s++ = '\0';
 		err = kstrtoint(s, 10, &offset);
 		if (err != 0) {
-			pr_err("%s: Could get offset '%s'\n",
-				__func__, (char *)rprop->value);
 			goto err_fail;
 		}
 
 		refnode = __of_find_node_by_full_name(node, nodestr);
 		if (!refnode) {
-			pr_warn("%s: Could not find refnode '%s'\n",
-				__func__, (char *)rprop->value);
 			continue;
 		}
 
@@ -167,8 +157,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 		of_node_put(refnode);
 
 		if (!sprop) {
-			pr_err("%s: Could not find property '%s'\n",
-				__func__, (char *)rprop->value);
 			err = -ENOENT;
 			goto err_fail;
 		}
@@ -220,8 +208,6 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 			continue;
 
 		if ((rprop->length % 4) != 0 || rprop->length == 0) {
-			pr_err("%s: Illegal property (size) '%s' @%s\n",
-					__func__, rprop->name, node->full_name);
 			return -EINVAL;
 		}
 		count = rprop->length / sizeof(__be32);
@@ -232,8 +218,6 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 		}
 
 		if (sprop == NULL) {
-			pr_err("%s: Could not find target property '%s' @%s\n",
-					__func__, rprop->name, node->full_name);
 			return -EINVAL;
 		}
 
@@ -241,9 +225,6 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 			off = be32_to_cpu(((__be32 *)rprop->value)[i]);
 			if (off >= sprop->length ||
 					(off + 4) > sprop->length) {
-				pr_err("%s: Illegal property '%s' @%s\n",
-						__func__, rprop->name,
-						node->full_name);
 				return -EINVAL;
 			}
 
@@ -262,8 +243,6 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 				break;
 
 		if (!childtarget) {
-			pr_err("%s: Could not find target child '%s' @%s\n",
-					__func__, child->name, node->full_name);
 			return -EINVAL;
 		}
 
@@ -364,15 +343,11 @@ int of_resolve_phandles(struct device_node *resolve)
 		err = of_property_read_string(root_sym,
 				rprop->name, &refpath);
 		if (err != 0) {
-			pr_err("%s: Could not find symbol '%s'\n",
-					__func__, rprop->name);
 			goto out;
 		}
 
 		refnode = of_find_node_by_path(refpath);
 		if (!refnode) {
-			pr_err("%s: Could not find node by path '%s'\n",
-					__func__, refpath);
 			err = -ENOENT;
 			goto out;
 		}
@@ -380,9 +355,6 @@ int of_resolve_phandles(struct device_node *resolve)
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
