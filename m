From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 1/3] checks: Add bus checks for PCI buses
Date: Mon, 20 Mar 2017 09:44:16 -0500
Message-ID: <20170320144418.5021-2-robh@kernel.org>
References: <20170320144418.5021-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170320144418.5021-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add PCI bridge and device node checks. We identify PCI bridges with
'device_type = "pci"' as only PCI bridges should set that property. For
bridges, check that node name is pci or pcie, ranges and bus-range are
present, and #address-cells and #size-cells are correct.

For devices, check the reg property fields are correct for the first
element (the config address). Check that the unit address is formatted
corectly based on the reg property. Device unit addresses are in the
form DD or DD,F where DD is the device 0-0x1f and F is the function 0-7.
Also, check that the bus number is within the expected range defined by
bridge's bus-ranges.

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v4:
- replace one last strcmp with streq
- Add pci_bridge dependency on pci_device_bus_num

v3:
- Use bus_type ptr for matching bus types
- Add a name string to bus_type
- Add a bus-range check
- Improve the PCI device reg value checking
- Use streq/strneq
- fix FAIL call changes from current master

v2:
- Remove bus_type functions. Combine test for bus_type and bridge check
  into single check.
- Add a check that PCI bridge node name is pci or pcie.

 checks.c | 136 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 dtc.h    |   5 +++
 2 files changed, 141 insertions(+)

diff --git a/checks.c b/checks.c
index 38f548e582c8..427a5787b004 100644
--- a/checks.c
+++ b/checks.c
@@ -681,6 +681,138 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 }
 WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
 
+static const struct bus_type pci_bus = {
+	.name = "PCI",
+};
+
+static void check_pci_bridge(struct check *c, struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+	cell_t *cells;
+
+	prop = get_property(node, "device_type");
+	if (!prop || !streq(prop->val.val, "pci"))
+		return;
+
+	node->bus = &pci_bus;
+
+	if (!strneq(node->name, "pci", node->basenamelen) &&
+	    !strneq(node->name, "pcie", node->basenamelen))
+		FAIL(c, dti, "Node %s node name is not \"pci\" or \"pcie\"",
+			     node->fullpath);
+
+	prop = get_property(node, "ranges");
+	if (!prop)
+		FAIL(c, dti, "Node %s missing ranges for PCI bridge (or not a bridge)",
+			     node->fullpath);
+
+	if (node_addr_cells(node) != 3)
+		FAIL(c, dti, "Node %s incorrect #address-cells for PCI bridge",
+			     node->fullpath);
+	if (node_size_cells(node) != 2)
+		FAIL(c, dti, "Node %s incorrect #size-cells for PCI bridge",
+			     node->fullpath);
+
+	prop = get_property(node, "bus-range");
+	if (!prop) {
+		FAIL(c, dti, "Node %s missing bus-range for PCI bridge",
+			     node->fullpath);
+		return;
+	}
+	if (prop->val.len != (sizeof(cell_t) * 2)) {
+		FAIL(c, dti, "Node %s bus-range must be 2 cells",
+			     node->fullpath);
+		return;
+	}
+	cells = (cell_t *)prop->val.val;
+	if (fdt32_to_cpu(cells[0]) > fdt32_to_cpu(cells[1]))
+		FAIL(c, dti, "Node %s bus-range 1st cell must be less than or equal to 2nd cell",
+			     node->fullpath);
+	if (fdt32_to_cpu(cells[1]) > 0xff)
+		FAIL(c, dti, "Node %s bus-range maximum bus number must be less than 256",
+			     node->fullpath);
+}
+WARNING(pci_bridge, check_pci_bridge, NULL,
+	&device_type_is_string, &addr_size_cells);
+
+static void check_pci_device_bus_num(struct check *c, struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+	unsigned int bus_num, min_bus, max_bus;
+	cell_t *cells;
+
+	if (!node->parent || (node->parent->bus != &pci_bus))
+		return;
+
+	prop = get_property(node, "reg");
+	if (!prop)
+		return;
+
+	cells = (cell_t *)prop->val.val;
+	bus_num = (fdt32_to_cpu(cells[0]) & 0x00ff0000) >> 16;
+
+	prop = get_property(node->parent, "bus-range");
+	if (!prop) {
+		min_bus = max_bus = 0;
+	} else {
+		cells = (cell_t *)prop->val.val;
+		min_bus = fdt32_to_cpu(cells[0]);
+		max_bus = fdt32_to_cpu(cells[0]);
+	}
+	if ((bus_num < min_bus) || (bus_num > max_bus))
+		FAIL(c, dti, "Node %s PCI bus number %d out of range, expected (%d - %d)",
+		     node->fullpath, bus_num, min_bus, max_bus);
+}
+WARNING(pci_device_bus_num, check_pci_device_bus_num, NULL, &reg_format, &pci_bridge);
+
+static void check_pci_device_reg(struct check *c, struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+	const char *unitname = get_unitname(node);
+	char unit_addr[5];
+	unsigned int dev, func, reg;
+	cell_t *cells;
+
+	if (!node->parent || (node->parent->bus != &pci_bus))
+		return;
+
+	prop = get_property(node, "reg");
+	if (!prop) {
+		FAIL(c, dti, "Node %s missing PCI reg property", node->fullpath);
+		return;
+	}
+
+	cells = (cell_t *)prop->val.val;
+	if (cells[1] || cells[2])
+		FAIL(c, dti, "Node %s PCI reg config space address cells 2 and 3 must be 0",
+			     node->fullpath);
+
+	reg = fdt32_to_cpu(cells[0]);
+	dev = (reg & 0xf800) >> 11;
+	func = (reg & 0x700) >> 8;
+
+	if (reg & 0xff000000)
+		FAIL(c, dti, "Node %s PCI reg address is not configuration space",
+			     node->fullpath);
+	if (reg & 0x000000ff)
+		FAIL(c, dti, "Node %s PCI reg config space address register number must be 0",
+			     node->fullpath);
+
+	if (func == 0) {
+		snprintf(unit_addr, sizeof(unit_addr), "%x", dev);
+		if (streq(unitname, unit_addr))
+			return;
+	}
+
+	snprintf(unit_addr, sizeof(unit_addr), "%x,%x", dev, func);
+	if (streq(unitname, unit_addr))
+		return;
+
+	FAIL(c, dti, "Node %s PCI unit address format error, expected \"%s\"",
+	     node->fullpath, unit_addr);
+}
+WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format);
+
 /*
  * Style checks
  */
@@ -753,6 +885,10 @@ static struct check *check_table[] = {
 
 	&unit_address_vs_reg,
 
+	&pci_bridge,
+	&pci_device_reg,
+	&pci_device_bus_num,
+
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
 
diff --git a/dtc.h b/dtc.h
index 403b79deab88..fc24e17510fd 100644
--- a/dtc.h
+++ b/dtc.h
@@ -135,6 +135,10 @@ struct label {
 	struct label *next;
 };
 
+struct bus_type {
+	const char *name;
+};
+
 struct property {
 	bool deleted;
 	char *name;
@@ -161,6 +165,7 @@ struct node {
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
