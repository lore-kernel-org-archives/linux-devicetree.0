From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 2/3] checks: Add bus checks for simple-bus buses
Date: Tue, 28 Feb 2017 16:43:09 -0600
Message-ID: <20170228224310.14162-3-robh@kernel.org>
References: <20170228224310.14162-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170228224310.14162-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add checks to identify simple-bus bus types and checks for child
devices. Simple-bus type is generally identified by "simple-bus"
compatible string. We also treat the root as a simple-bus, but only for
child nodes with reg property.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- new patch

 checks.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/checks.c b/checks.c
index 5ed91ac50a10..c4865b4c8da0 100644
--- a/checks.c
+++ b/checks.c
@@ -817,6 +817,72 @@ static void check_pci_device_reg(struct check *c, struct dt_info *dti, struct no
 }
 WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format);

+static const struct bus_type simple_bus = {
+	.name = "simple-bus",
+};
+
+static bool node_is_compatible(struct node *node, const char *compat)
+{
+	struct property *prop;
+	const char *str;
+
+	prop = get_property(node, "compatible");
+	if (!prop)
+		return false;
+
+	for (str = prop->val.val; str < prop->val.val + prop->val.len; str += strlen(str) + 1) {
+		if (streq(str, compat))
+			return true;
+	}
+	return false;
+}
+
+static void check_simple_bus_bridge(struct check *c, struct dt_info *dti, struct node *node)
+{
+	if (node_is_compatible(node, "simple-bus") || !node->parent)
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
@@ -893,6 +959,9 @@ static struct check *check_table[] = {
 	&pci_device_reg,
 	&pci_device_bus_num,

+	&simple_bus_bridge,
+	&simple_bus_reg,
+
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,

--
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
