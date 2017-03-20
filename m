From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 2/3] checks: Add bus checks for simple-bus buses
Date: Mon, 20 Mar 2017 09:44:17 -0500
Message-ID: <20170320144418.5021-3-robh@kernel.org>
References: <20170320144418.5021-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170320144418.5021-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add checks to identify simple-bus bus types and checks for child
devices. Simple-bus type is generally identified by "simple-bus"
compatible string. We also treat the root as a simple-bus, but only for
child nodes with reg property.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v4:
- Avoid strlen overrunning property buffer in node_is_compatible
- Drop assuming root node is a simple-bus

v3:
- new patch

 checks.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/checks.c b/checks.c
index 427a5787b004..33036b8dbbc2 100644
--- a/checks.c
+++ b/checks.c
@@ -813,6 +813,73 @@ static void check_pci_device_reg(struct check *c, struct dt_info *dti, struct no
 }
 WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format);
 
+static const struct bus_type simple_bus = {
+	.name = "simple-bus",
+};
+
+static bool node_is_compatible(struct node *node, const char *compat)
+{
+	struct property *prop;
+	const char *str, *end;
+
+	prop = get_property(node, "compatible");
+	if (!prop)
+		return false;
+
+	for (str = prop->val.val, end = str + prop->val.len; str < end;
+	     str += strnlen(str, end - str) + 1) {
+		if (strneq(str, compat, end - str))
+			return true;
+	}
+	return false;
+}
+
+static void check_simple_bus_bridge(struct check *c, struct dt_info *dti, struct node *node)
+{
+	if (node_is_compatible(node, "simple-bus"))
+		node->bus = &simple_bus;
+}
+WARNING(simple_bus_bridge, check_simple_bus_bridge, NULL, &addr_size_cells);
+
+static void check_simple_bus_reg(struct check *c, struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+	const char *unitname = get_unitname(node);
+	char unit_addr[17];
+	unsigned int size;
+	uint64_t reg = 0;
+	cell_t *cells = NULL;
+
+	if (!node->parent || (node->parent->bus != &simple_bus))
+		return;
+
+	prop = get_property(node, "reg");
+	if (prop)
+		cells = (cell_t *)prop->val.val;
+	else {
+		prop = get_property(node, "ranges");
+		if (prop && prop->val.len)
+			/* skip of child address */
+			cells = ((cell_t *)prop->val.val) + node_addr_cells(node);
+	}
+
+	if (!cells) {
+		if (node->parent->parent && !(node->bus == &simple_bus))
+			FAIL(c, dti, "Node %s missing or empty reg/ranges property", node->fullpath);
+		return;
+	}
+
+	size = node_addr_cells(node->parent);
+	while (size--)
+		reg = (reg << 32) | fdt32_to_cpu(*(cells++));
+
+	snprintf(unit_addr, sizeof(unit_addr), "%lx", reg);
+	if (!streq(unitname, unit_addr))
+		FAIL(c, dti, "Node %s simple-bus unit address format error, expected \"%s\"",
+		     node->fullpath, unit_addr);
+}
+WARNING(simple_bus_reg, check_simple_bus_reg, NULL, &reg_format, &simple_bus_bridge);
+
 /*
  * Style checks
  */
@@ -889,6 +956,9 @@ static struct check *check_table[] = {
 	&pci_device_reg,
 	&pci_device_bus_num,
 
+	&simple_bus_bridge,
+	&simple_bus_reg,
+
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
 
-- 
2.10.1
