From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/5] checks: Add infrastructure for setting bus type of nodes
Date: Tue, 24 Jan 2017 11:45:33 -0600
Message-ID: <20170124174534.3865-5-robh@kernel.org>
References: <20170124174534.3865-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170124174534.3865-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In preparation to support bus specific checks, add the necessary
infrastructure to determine and set the bus type for nodes.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 dtc.h    | 11 +++++++++++
 2 files changed, 62 insertions(+)

diff --git a/checks.c b/checks.c
index 8e310d69ca3d..5ef63a6a4317 100644
--- a/checks.c
+++ b/checks.c
@@ -587,6 +587,53 @@ static void fixup_path_references(struct check *c, struct dt_info *dti,
 }
 ERROR(path_references, fixup_path_references, NULL, &duplicate_node_names);
 
+struct bus_type *bus_types[] = {
+	NULL
+};
+
+static void fixup_bus_type(struct check *c, struct dt_info *dti,
+				  struct node *node)
+{
+	struct bus_type **bus;
+
+	for (bus = bus_types; *bus != NULL; bus++) {
+		if (!(*bus)->bridge_is_type(node))
+			continue;
+
+		node->bus_type = *bus;
+		break;
+	}
+}
+ERROR(bus_type, fixup_bus_type, NULL);
+
+static void check_bus_bridge(struct check *c, struct dt_info *dti,
+			     struct node *node)
+{
+	struct bus_type *bt;
+
+	if (!node->bus_type)
+		return;
+
+	bt = node->bus_type;
+	if (bt->check_bridge)
+		bt->check_bridge(c, dti, node);
+}
+WARNING(bus_bridge, check_bus_bridge, NULL);
+
+static void check_bus_device(struct check *c, struct dt_info *dti,
+			     struct node *node)
+{
+	struct bus_type *bt;
+
+	if (!node->parent || !node->parent->bus_type)
+		return;
+
+	bt = node->parent->bus_type;
+	if (bt->check_device)
+		bt->check_device(c, dti, node);
+}
+WARNING(bus_device, check_bus_device, NULL);
+
 /*
  * Semantic checks
  */
@@ -753,6 +800,7 @@ static struct check *check_table[] = {
 
 	&explicit_phandles,
 	&phandle_references, &path_references,
+	&bus_type,
 
 	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
 	&device_type_is_string, &model_is_string, &status_is_string,
@@ -764,6 +812,9 @@ static struct check *check_table[] = {
 
 	&unit_address_vs_reg,
 
+	&bus_bridge,
+	&bus_device,
+
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
 
diff --git a/dtc.h b/dtc.h
index c6f125c68ba8..f27397cd7622 100644
--- a/dtc.h
+++ b/dtc.h
@@ -136,6 +136,16 @@ struct label {
 	struct label *next;
 };
 
+struct check;
+struct node;
+struct dt_info;
+
+struct bus_type {
+        bool (*bridge_is_type)(struct node *node);
+        void (*check_bridge)(struct check *c, struct dt_info *dti, struct node *node);
+        void (*check_device)(struct check *c, struct dt_info *dti, struct node *node);
+};
+
 struct property {
 	bool deleted;
 	char *name;
@@ -162,6 +172,7 @@ struct node {
 	int addr_cells, size_cells;
 
 	struct label *labels;
+	struct bus_type *bus_type;
 };
 
 #define for_each_label_withdel(l0, l) \
-- 
2.10.1
