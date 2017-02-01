From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] checks: Add infrastructure for setting bus type of
 nodes
Date: Wed, 1 Feb 2017 15:54:31 -0600
Message-ID: <20170201215431.txsjccticxj6urhe@rob-hp-laptop>
References: <20170124174534.3865-1-robh@kernel.org>
 <20170124174534.3865-5-robh@kernel.org>
 <20170131002634.GD14879@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170131002634.GD14879-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 31, 2017 at 11:26:34AM +1100, David Gibson wrote:
> On Tue, Jan 24, 2017 at 11:45:33AM -0600, Rob Herring wrote:
> > In preparation to support bus specific checks, add the necessary
> > infrastructure to determine and set the bus type for nodes.
> > 
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >  checks.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  dtc.h    | 11 +++++++++++
> >  2 files changed, 62 insertions(+)

[...]

> > +static void check_bus_bridge(struct check *c, struct dt_info *dti,
> > +			     struct node *node)
> > +{
> > +	struct bus_type *bt;
> > +
> > +	if (!node->bus_type)
> > +		return;
> > +
> > +	bt = node->bus_type;
> > +	if (bt->check_bridge)
> > +		bt->check_bridge(c, dti, node);
> > +}
> > +WARNING(bus_bridge, check_bus_bridge, NULL);
> 
> Hrm.  So, we have a double multiplex here, and I'm not sure that it's
> necessary.  First the table of checks themselves, then the table of
> bus types.  Could we eliminate that simply by having each bus type
> implement a check function which tests for that bus type then,
> performans any checks for the bridge then sets the bus_type field.
> 
> It would mean that if there are multiple bus-specific things we want
> to check about the bridge, we could put them into separate checks.
> That might be clearer in some cases, and it means our existing
> messages can show something informative via the check name which
> failed, rather than just saying "(bus_bridge)" for anything wrong with
> any bus bridge.
> 
> We could still use the bus_type field for "semi-generic" checks like
> validating unit names that are the same in outline between different
> buses, but differ in details.

Something like this what you have in mind? If we have additional checks 
to add, we can just use the existing prerq functionality.

8<--------------------------------------------------------------------------
>From 5cea821e6078f84eaae5af317651a4a696d1f0f7 Mon Sep 17 00:00:00 2001
From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Date: Wed, 1 Feb 2017 15:43:32 -0600
Subject: [PATCH v2] checks: Add bus checks for PCI buses

Add PCI bridge and device node checks. We identify PCI bridges with
'device_type = "pci"' as only PCI bridges should set that property. For
bridges, check that ranges is present and #address-cells and

For devices, the primary check is the reg property and the unit address.
Device unit addresses are in the form DD or DD,F where DD is the
device 0-0x1f and F is the function 0-7.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 dtc.h    |  4 +++-
 2 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 225ace39c698..b727c49d457c 100644
--- a/checks.c
+++ b/checks.c
@@ -702,6 +702,77 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 }
 WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
 
+static void check_pci_bridge(struct check *c, struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+
+	prop = get_property(node, "device_type");
+	if (!prop || strcmp(prop->val.val, "pci"))
+		return;
+
+	node->bus_type = PCI_BUS_TYPE;
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
+WARNING(pci_bridge, check_pci_bridge, NULL, &device_type_is_string,&addr_size_cells);
+
+static void check_pci_device(struct check *c, struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+	const char *unitname = get_unitname(node);
+	char unit_addr[5];
+	unsigned int dev, func, reg;
+
+	if (!node->parent || (node->parent->bus_type != PCI_BUS_TYPE))
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
@@ -775,6 +846,9 @@ static struct check *check_table[] = {
 	&unit_address_vs_reg,
 	&unit_address_format,
 
+	&pci_bridge,
+	&pci_device,
+
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
 
diff --git a/dtc.h b/dtc.h
index c6f125c68ba8..03c249c65101 100644
--- a/dtc.h
+++ b/dtc.h
@@ -146,6 +146,8 @@ struct property {
 	struct label *labels;
 };
 
+#define PCI_BUS_TYPE	1
+
 struct node {
 	bool deleted;
 	char *name;
@@ -159,7 +161,7 @@ struct node {
 	int basenamelen;
 
 	cell_t phandle;
-	int addr_cells, size_cells;
+	int addr_cells, size_cells, bus_type;
 
 	struct label *labels;
 };
-- 
2.10.1
