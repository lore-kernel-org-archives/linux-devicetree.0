From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 4/4] checks: Add bus checks for PCI buses
Date: Fri, 10 Feb 2017 10:47:17 -0600
Message-ID: <20170210164717.1234-5-robh@kernel.org>
References: <20170210164717.1234-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170210164717.1234-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add PCI bridge and device node checks. We identify PCI bridges with
'device_type = "pci"' as only PCI bridges should set that property. For
bridges, check that ranges is present and #address-cells and

For devices, the primary check is the reg property and the unit address.
Device unit addresses are in the form DD or DD,F where DD is the
device 0-0x1f and F is the function 0-7.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- Remove bus_type functions. Combine test for bus_type and bridge check
  into single check.
- Add a check that PCI bridge node name is pci or pcie.

 checks.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 dtc.h    |  7 ++++++
 2 files changed, 90 insertions(+)

diff --git a/checks.c b/checks.c
index 16d17d20caec..9ebb148f947a 100644
--- a/checks.c
+++ b/checks.c
@@ -702,6 +702,86 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 }
 WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
 
+static const struct bus_type pci_bus = {
+	.type = PCI_BUS_TYPE,
+};
+
+static void check_pci_bridge(struct check *c, struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+
+	prop = get_property(node, "device_type");
+	if (!prop || strcmp(prop->val.val, "pci"))
+		return;
+
+	node->bus = &pci_bus;
+
+	if (strncmp(node->name, "pci", node->basenamelen) &&
+	    strncmp(node->name, "pcie", node->basenamelen))
+		FAIL(c, "Node %s node name is not \"pci\" or \"pcie\"",
+			     node->fullpath);
+
+	prop = get_property(node, "ranges");
+	if (!prop)
+		FAIL(c, "Node %s missing ranges for PCI bridge (or not a bridge)",
+			     node->fullpath);
+
+	if (node_addr_cells(node) != 3)
+		FAIL(c, "Node %s incorrect #address-cells for PCI bridge",
+			     node->fullpath);
+	if (node_size_cells(node) != 2)
+		FAIL(c, "Node %s incorrect #size-cells for PCI bridge",
+			     node->fullpath);
+}
+WARNING(pci_bridge, check_pci_bridge, NULL,
+	&device_type_is_string, &addr_size_cells);
+
+static void check_pci_device(struct check *c, struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+	const char *unitname = get_unitname(node);
+	char unit_addr[5];
+	unsigned int dev, func, reg;
+
+	if (!node->parent || !node->parent->bus ||
+	    (node->parent->bus->type != PCI_BUS_TYPE))
+		return;
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
+WARNING(pci_device, check_pci_device, NULL, &reg_format);
+
 /*
  * Style checks
  */
@@ -775,6 +855,9 @@ static struct check *check_table[] = {
 	&unit_address_vs_reg,
 	&unit_address_format,
 
+	&pci_bridge,
+	&pci_device,
+
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
 
diff --git a/dtc.h b/dtc.h
index c6f125c68ba8..c538ef4afafb 100644
--- a/dtc.h
+++ b/dtc.h
@@ -136,6 +136,12 @@ struct label {
 	struct label *next;
 };
 
+#define PCI_BUS_TYPE	1
+
+struct bus_type {
+	int type;
+};
+
 struct property {
 	bool deleted;
 	char *name;
@@ -162,6 +168,7 @@ struct node {
 	int addr_cells, size_cells;
 
 	struct label *labels;
+	const struct bus_type *bus;
 };
 
 #define for_each_label_withdel(l0, l) \
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
