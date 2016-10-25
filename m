From: frowand.list@gmail.com
Subject: [RFC PATCH 06/13] of: Remove prefix "__of_" and prefix "__" from local function names
Date: Tue, 25 Oct 2016 13:58:59 -0700
Message-ID: <1477429146-27039-7-git-send-email-frowand.list@gmail.com>
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
 drivers/of/resolver.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 3d123b612789..0ce38aa0ed3c 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -28,7 +28,7 @@
  * Find a node with the give full name by recursively following any of
  * the child node links.
  */
-static struct device_node *__of_find_node_by_full_name(struct device_node *node,
+static struct device_node *find_node_by_full_name(struct device_node *node,
 		const char *full_name)
 {
 	struct device_node *child, *found;
@@ -40,7 +40,7 @@ static struct device_node *__of_find_node_by_full_name(struct device_node *node,
 		return of_node_get(node);
 
 	for_each_child_of_node(node, child) {
-		found = __of_find_node_by_full_name(child, full_name);
+		found = find_node_by_full_name(child, full_name);
 		if (found != NULL) {
 			of_node_put(child);
 			return found;
@@ -143,7 +143,7 @@ static int update_usages_of_a_phandle_reference(struct device_node *node,
 		if (err)
 			goto err_fail;
 
-		refnode = __of_find_node_by_full_name(node, nodestr);
+		refnode = find_node_by_full_name(node, nodestr);
 		if (!refnode)
 			continue;
 
@@ -168,7 +168,7 @@ static int update_usages_of_a_phandle_reference(struct device_node *node,
 }
 
 /* compare nodes taking into account that 'name' strips out the @ part */
-static int __of_node_name_cmp(const struct device_node *dn1,
+static int node_name_cmp(const struct device_node *dn1,
 		const struct device_node *dn2)
 {
 	const char *n1 = strrchr(dn1->full_name, '/') ? : "/";
@@ -232,7 +232,7 @@ static int adjust_local_phandle_references(struct device_node *node,
 	for_each_child_of_node(node, child) {
 
 		for_each_child_of_node(target, childtarget)
-			if (!__of_node_name_cmp(child, childtarget))
+			if (!node_name_cmp(child, childtarget))
 				break;
 
 		if (!childtarget)
-- 
1.9.1
