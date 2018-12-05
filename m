From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of: Use of_node_name_eq for node name comparisons
Date: Wed,  5 Dec 2018 13:50:33 -0600
Message-ID: <20181205195050.4759-17-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

Convert string compares of DT node names to use of_node_name_eq helper
instead. This removes direct access to the node name pointer.

Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c  |  2 +-
 drivers/of/base.c     |  7 +++----
 drivers/of/property.c | 10 +++++-----
 drivers/of/resolver.c |  4 ++--
 drivers/of/unittest.c |  4 ++--
 5 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index ae48e121b6e7..2270373b30ab 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -371,7 +371,7 @@ EXPORT_SYMBOL(of_pci_range_to_resource);
 
 static int of_bus_isa_match(struct device_node *np)
 {
-	return !strcmp(np->name, "isa");
+	return of_node_name_eq(np, "isa");
 }
 
 static void of_bus_isa_count_cells(struct device_node *child,
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 57c837140a8b..998d032fcef9 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -496,7 +496,7 @@ static int __of_device_is_compatible(const struct device_node *device,
 
 	/* Matching name is a bit better than not */
 	if (name && name[0]) {
-		if (!device->name || of_node_cmp(name, device->name))
+		if (!of_node_name_eq(device, name))
 			return 0;
 		score++;
 	}
@@ -835,7 +835,7 @@ struct device_node *of_get_child_by_name(const struct device_node *node,
 	struct device_node *child;
 
 	for_each_child_of_node(node, child)
-		if (child->name && (of_node_cmp(child->name, name) == 0))
+		if (of_node_name_eq(child, name))
 			break;
 	return child;
 }
@@ -961,8 +961,7 @@ struct device_node *of_find_node_by_name(struct device_node *from,
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	for_each_of_allnodes_from(from, np)
-		if (np->name && (of_node_cmp(np->name, name) == 0)
-		    && of_node_get(np))
+		if (of_node_name_eq(np, name) && of_node_get(np))
 			break;
 	of_node_put(from);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
diff --git a/drivers/of/property.c b/drivers/of/property.c
index f46828e3b082..08430031bd28 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -571,7 +571,7 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
 	for_each_child_of_node(parent, port) {
 		u32 port_id = 0;
 
-		if (of_node_cmp(port->name, "port") != 0)
+		if (!of_node_name_eq(port, "port"))
 			continue;
 		of_property_read_u32(port, "reg", &port_id);
 		if (id == port_id)
@@ -646,7 +646,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 			port = of_get_next_child(parent, port);
 			if (!port)
 				return NULL;
-		} while (of_node_cmp(port->name, "port"));
+		} while (!of_node_name_eq(port, "port"));
 	}
 }
 EXPORT_SYMBOL(of_graph_get_next_endpoint);
@@ -715,7 +715,7 @@ struct device_node *of_graph_get_port_parent(struct device_node *node)
 	/* Walk 3 levels up only if there is 'ports' node. */
 	for (depth = 3; depth && node; depth--) {
 		node = of_get_next_parent(node);
-		if (depth == 2 && of_node_cmp(node->name, "ports"))
+		if (depth == 2 && !of_node_name_eq(node, "ports"))
 			break;
 	}
 	return node;
@@ -893,7 +893,7 @@ of_fwnode_get_named_child_node(const struct fwnode_handle *fwnode,
 	struct device_node *child;
 
 	for_each_available_child_of_node(node, child)
-		if (!of_node_cmp(child->name, childname))
+		if (of_node_name_eq(child, childname))
 			return of_fwnode_handle(child);
 
 	return NULL;
@@ -955,7 +955,7 @@ of_fwnode_graph_get_port_parent(struct fwnode_handle *fwnode)
 		return NULL;
 
 	/* Is this the "ports" node? If not, it's the port parent. */
-	if (of_node_cmp(np->name, "ports"))
+	if (!of_node_name_eq(np, "ports"))
 		return of_fwnode_handle(np);
 
 	return of_fwnode_handle(of_get_next_parent(np));
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 7edfac6f1914..c1b67dd7cd6e 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -281,7 +281,7 @@ int of_resolve_phandles(struct device_node *overlay)
 	adjust_overlay_phandles(overlay, phandle_delta);
 
 	for_each_child_of_node(overlay, local_fixups)
-		if (!of_node_cmp(local_fixups->name, "__local_fixups__"))
+		if (of_node_name_eq(local_fixups, "__local_fixups__"))
 			break;
 
 	err = adjust_local_phandle_references(local_fixups, overlay, phandle_delta);
@@ -291,7 +291,7 @@ int of_resolve_phandles(struct device_node *overlay)
 	overlay_fixups = NULL;
 
 	for_each_child_of_node(overlay, child) {
-		if (!of_node_cmp(child->name, "__fixups__"))
+		if (of_node_name_eq(child, "__fixups__"))
 			overlay_fixups = child;
 	}
 
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 49ae2aa744d6..39cf2ec1856f 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2339,7 +2339,7 @@ static __init void of_unittest_overlay_high_level(void)
 	 */
 	pprev = &overlay_base_root->child;
 	for (np = overlay_base_root->child; np; np = np->sibling) {
-		if (!of_node_cmp(np->name, "__local_fixups__")) {
+		if (of_node_name_eq(np, "__local_fixups__")) {
 			*pprev = np->sibling;
 			break;
 		}
@@ -2352,7 +2352,7 @@ static __init void of_unittest_overlay_high_level(void)
 		/* will have to graft properties from node into live tree */
 		pprev = &overlay_base_root->child;
 		for (np = overlay_base_root->child; np; np = np->sibling) {
-			if (!of_node_cmp(np->name, "__symbols__")) {
+			if (of_node_name_eq(np, "__symbols__")) {
 				overlay_base_symbols = np;
 				*pprev = np->sibling;
 				break;
-- 
2.19.1
