From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 5/5] checks: Add bus checks for PCI buses
Date: Tue, 24 Jan 2017 11:45:34 -0600
Message-ID: <20170124174534.3865-6-robh@kernel.org>
References: <20170124174534.3865-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170124174534.3865-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add PCI bridge and device node checks. We identify PCI bridges with
'device_type = "pci"' as only PCI bridges should set that property. For
bridges, we do a secondary check that the bridge has a ranges property
in cases of nodes incorrectly setting 'device_type = "pci"'.

For devices, the primary check is the reg property and the unit address.
Device unit addresses are in the form DD or DD,F where DD is the
device 0-0x1f and F is the function 0-7.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 5 deletions(-)

diff --git a/checks.c b/checks.c
index 5ef63a6a4317..f5fcd625a19b 100644
--- a/checks.c
+++ b/checks.c
@@ -20,6 +20,11 @@
 
 #include "dtc.h"
 
+#define node_addr_cells(n) \
+	(((n)->addr_cells == -1) ? 2 : (n)->addr_cells)
+#define node_size_cells(n) \
+	(((n)->size_cells == -1) ? 1 : (n)->size_cells)
+
 #ifdef TRACE_CHECKS
 #define TRACE(c, ...) \
 	do { \
@@ -587,7 +592,88 @@ static void fixup_path_references(struct check *c, struct dt_info *dti,
 }
 ERROR(path_references, fixup_path_references, NULL, &duplicate_node_names);
 
+static bool is_pci_bridge(struct node *node)
+{
+	struct property *prop;
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
+static void pci_check_bridge(struct check *c, struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+
+	prop = get_property(node, "ranges");
+	if (!prop) {
+		FAIL(c, "Node %s missing ranges for PCI bridge (or not a bridge)",
+			     node->fullpath);
+		return;
+	}
+
+	if (node_addr_cells(node) != 3)
+		FAIL(c, "Node %s incorrect #address-cells for PCI bridge",
+			     node->fullpath);
+	if (node_size_cells(node) != 2)
+		FAIL(c, "Node %s incorrect #size-cells for PCI bridge",
+			     node->fullpath);
+}
+
+static void pci_check_device(struct check *c, struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+	const char *unitname = get_unitname(node);
+	char unit_addr[5];
+	unsigned int dev, func, reg;
+
+	prop = get_property(node, "reg");
+	if (!prop)
+		return;
+
+	reg = fdt32_to_cpu(*((cell_t *)prop->val.val));
+
+	dev = (reg & 0xf800) >> 11;
+	func = (reg & 0x700) >> 8;
+
+	if (reg & 0xff000000)
+		FAIL(c, "Node %s PCI reg address is not configuration space",
+			     node->fullpath);
+
+	if (dev > 0x1f)
+		FAIL(c, "Node %s PCI device number out of range",
+			     node->fullpath);
+	if (func > 7)
+		FAIL(c, "Node %s PCI function number out of range",
+		     node->fullpath);
+
+	if (func == 0) {
+		snprintf(unit_addr, sizeof(unit_addr), "%x", dev);
+		if (!strcmp(unitname, unit_addr))
+			return;
+	}
+
+	snprintf(unit_addr, sizeof(unit_addr), "%x,%x", dev, func);
+	if (!strcmp(unitname, unit_addr))
+		return;
+
+	FAIL(c, "Node %s PCI unit address format error, expected \"%s\"",
+	     node->fullpath, unit_addr);
+}
+
+struct bus_type pci_bus_type = {
+        .bridge_is_type = is_pci_bridge,
+        .check_bridge = pci_check_bridge,
+        .check_device = pci_check_device,
+};
+
 struct bus_type *bus_types[] = {
+	&pci_bus_type,
 	NULL
 };
 
@@ -664,11 +750,6 @@ static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
 WARNING(addr_size_cells, fixup_addr_size_cells, NULL,
 	&address_cells_is_cell, &size_cells_is_cell);
 
-#define node_addr_cells(n) \
-	(((n)->addr_cells == -1) ? 2 : (n)->addr_cells)
-#define node_size_cells(n) \
-	(((n)->size_cells == -1) ? 1 : (n)->size_cells)
-
 static void check_reg_format(struct check *c, struct dt_info *dti,
 			     struct node *node)
 {
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
