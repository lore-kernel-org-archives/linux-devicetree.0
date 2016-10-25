From: frowand.list@gmail.com
Subject: [RFC PATCH 03/13] of: Remove braces around single line blocks.
Date: Tue, 25 Oct 2016 13:58:56 -0700
Message-ID: <1477429146-27039-4-git-send-email-frowand.list@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

The single line blocks were created by previous patches in the series.

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 93a7ca0bf98c..c61ba99a1792 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -115,9 +115,8 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 	int err = 0;
 
 	propval = kmalloc(rprop->length, GFP_KERNEL);
-	if (!propval) {
+	if (!propval)
 		return -ENOMEM;
-	}
 	memcpy(propval, rprop->value, rprop->length);
 
 	propend = propval + rprop->length;
@@ -141,14 +140,12 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 
 		*s++ = '\0';
 		err = kstrtoint(s, 10, &offset);
-		if (err != 0) {
+		if (err != 0)
 			goto err_fail;
-		}
 
 		refnode = __of_find_node_by_full_name(node, nodestr);
-		if (!refnode) {
+		if (!refnode)
 			continue;
-		}
 
 		for_each_property_of_node(refnode, sprop) {
 			if (of_prop_cmp(sprop->name, propstr) == 0)
@@ -207,9 +204,8 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 		    of_prop_cmp(rprop->name, "linux,phandle") == 0)
 			continue;
 
-		if ((rprop->length % 4) != 0 || rprop->length == 0) {
+		if ((rprop->length % 4) != 0 || rprop->length == 0)
 			return -EINVAL;
-		}
 		count = rprop->length / sizeof(__be32);
 
 		for_each_property_of_node(target, sprop) {
@@ -217,16 +213,13 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 				break;
 		}
 
-		if (sprop == NULL) {
+		if (sprop == NULL)
 			return -EINVAL;
-		}
 
 		for (i = 0; i < count; i++) {
 			off = be32_to_cpu(((__be32 *)rprop->value)[i]);
-			if (off >= sprop->length ||
-					(off + 4) > sprop->length) {
+			if (off >= sprop->length || (off + 4) > sprop->length)
 				return -EINVAL;
-			}
 
 			if (phandle_delta) {
 				phandle = be32_to_cpu(*(__be32 *)(sprop->value + off));
@@ -242,9 +235,8 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 			if (__of_node_name_cmp(child, childtarget) == 0)
 				break;
 
-		if (!childtarget) {
+		if (!childtarget)
 			return -EINVAL;
-		}
 
 		err = __of_adjust_tree_phandle_references(child, childtarget,
 				phandle_delta);
@@ -342,9 +334,8 @@ int of_resolve_phandles(struct device_node *resolve)
 
 		err = of_property_read_string(root_sym,
 				rprop->name, &refpath);
-		if (err != 0) {
+		if (err != 0)
 			goto out;
-		}
 
 		refnode = of_find_node_by_path(refpath);
 		if (!refnode) {
-- 
1.9.1
