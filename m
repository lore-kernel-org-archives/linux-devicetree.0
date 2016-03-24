From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RFC 1/3] checks: Add infrastructure for setting bus type of nodes
Date: Wed, 23 Mar 2016 19:40:19 -0500
Message-ID: <1458780021-5052-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In preparation to support bus specific checks, add the necessary
infrastructure to determine the bus type for nodes. Initially, PCI and
simple bus are supported.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
David,

Hopefully this matches what you had in mind for bus checks.

Rob

 checks.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 dtc.h    | 11 +++++++++
 2 files changed, 90 insertions(+)

diff --git a/checks.c b/checks.c
index 386f956..48e926e 100644
--- a/checks.c
+++ b/checks.c
@@ -527,6 +527,84 @@ static void fixup_path_references(struct check *c, struct node *dt,
 ERROR(path_references, NULL, NULL, fixup_path_references, NULL,
       &duplicate_node_names);
 
+static bool is_pci_bridge(struct node *node)
+{
+	struct property *prop;
+
+	if (!node)
+		return false;
+
+	prop = get_property(node, "device_type");
+	if (!prop)
+		return false;
+
+	if (strcmp(prop->val.val, "pci") == 0)
+		return true;
+
+	return false;
+}
+
+struct bus_type pci_bus_type = {
+        .expected_addr_cells = 3,
+        .expected_size_cells = 2,
+        .is_type = is_pci_bridge,
+};
+
+static bool is_simple_bridge(struct node *node)
+{
+	struct property *prop;
+	int len = 0;
+
+	if (!node)
+		return false;
+
+	/* root node is special case defaulting to simple-bus */
+	if (!node->parent)
+		return true;
+
+	prop = get_property(node, "compatible");
+	if (!prop)
+		return false;
+
+	do {
+		const char *str = prop->val.val;
+
+		if (strcmp(str, "simple-bus") == 0)
+			return true;
+		len += strlen(str) + 1;
+		str += len;
+	} while (len < prop->val.len);
+
+	return false;
+}
+
+struct bus_type simple_bus_type = {
+	.expected_addr_cells = -1, /* For don't care */
+	.expected_size_cells = -1,
+	.is_type = is_simple_bridge,
+};
+
+struct bus_type *bus_types[] = {
+	&pci_bus_type,
+	&simple_bus_type,
+	NULL
+};
+
+static void fixup_bus_type(struct check *c, struct node *dt,
+				  struct node *node)
+{
+	struct bus_type **bus;
+
+	for (bus = bus_types; *bus != NULL; bus++) {
+		if (!(*bus)->is_type(node))
+			continue;
+
+		node->bus_type = *bus;
+		break;
+	}
+}
+ERROR(bus_type, NULL, fixup_bus_type, NULL, NULL);
+
 /*
  * Semantic checks
  */
@@ -685,6 +763,7 @@ static struct check *check_table[] = {
 
 	&explicit_phandles,
 	&phandle_references, &path_references,
+	&bus_type,
 
 	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
 	&device_type_is_string, &model_is_string, &status_is_string,
diff --git a/dtc.h b/dtc.h
index 56212c8..c1a1fe9 100644
--- a/dtc.h
+++ b/dtc.h
@@ -132,6 +132,16 @@ struct label {
 	struct label *next;
 };
 
+struct check;
+struct node;
+
+struct bus_type {
+        int expected_addr_cells;
+        int expected_size_cells;
+        bool (*is_type)(struct node *node);
+        void (*check_unit_addr)(struct check *c, struct node *dt, struct node *node);
+};
+
 struct property {
 	bool deleted;
 	char *name;
@@ -158,6 +168,7 @@ struct node {
 	int addr_cells, size_cells;
 
 	struct label *labels;
+	struct bus_type *bus_type;
 };
 
 #define for_each_label_withdel(l0, l) \
-- 
2.5.0
