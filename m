From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [RFC, PATCH 2/2] of: assume big-endian properties,
	adding conversions where necessary
Date: Mon, 14 Dec 2009 11:37:13 +0800
Message-ID: <1260761833.382308.51882099499.2.gpush@pororo>
References: <1260761833.381500.196217689909.0.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1260761833.381500.196217689909.0.gpush@pororo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Properties in the device tree are specified as big-endian. At present,
the only platforms to support device trees are also big-endian, so we've
been acessing the properties as raw values.

We'd like to add device tree support to little-endian platforms too, so
add endian conversion to the sites where we access property values in
the common of code.

Compiled on powerpc (ppc44x_defconfig & ppc64_defconfig) and arm (fdt
support only for now).

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 drivers/of/base.c    |   12 +++++------
 drivers/of/fdt.c     |   45 +++++++++++++++++++++++--------------------
 drivers/of/gpio.c    |   13 ++++++------
 drivers/of/of_i2c.c  |    4 +--
 drivers/of/of_mdio.c |    8 +++----
 drivers/of/of_spi.c  |    6 ++---
 6 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index cdce832..974f64e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -37,7 +37,7 @@ int of_n_addr_cells(struct device_node *np)
 			np = np->parent;
 		ip = of_get_property(np, "#address-cells", NULL);
 		if (ip)
-			return *ip;
+			return be32_to_cpup(ip);
 	} while (np->parent);
 	/* No #address-cells property for the root node */
 	return OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
@@ -53,7 +53,7 @@ int of_n_size_cells(struct device_node *np)
 			np = np->parent;
 		ip = of_get_property(np, "#size-cells", NULL);
 		if (ip)
-			return *ip;
+			return be32_to_cpup(ip);
 	} while (np->parent);
 	/* No #size-cells property for the root node */
 	return OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
@@ -752,8 +752,8 @@ int of_parse_phandles_with_args(struct device_node *np, const char *list_name,
 				const void **out_args)
 {
 	int ret = -EINVAL;
-	const u32 *list;
-	const u32 *list_end;
+	const __be32 *list;
+	const __be32 *list_end;
 	int size;
 	int cur_index = 0;
 	struct device_node *node = NULL;
@@ -767,7 +767,7 @@ int of_parse_phandles_with_args(struct device_node *np, const char *list_name,
 	list_end = list + size / sizeof(*list);
 
 	while (list < list_end) {
-		const u32 *cells;
+		const __be32 *cells;
 		const phandle *phandle;
 
 		phandle = list++;
@@ -791,7 +791,7 @@ int of_parse_phandles_with_args(struct device_node *np, const char *list_name,
 			goto err1;
 		}
 
-		list += *cells;
+		list += be32_to_cpup(cells);
 		if (list > list_end) {
 			pr_debug("%s: insufficient arguments length\n",
 				 np->full_name);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 04a90ca..3eaabe7 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -65,7 +65,7 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
 	int depth = -1;
 
 	do {
-		u32 tag = *((u32 *)p);
+		u32 tag = be32_to_cpup((__be32 *)p);
 		char *pathp;
 
 		p += 4;
@@ -78,7 +78,7 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
 		if (tag == OF_DT_END)
 			break;
 		if (tag == OF_DT_PROP) {
-			u32 sz = *((u32 *)p);
+			u32 sz = be32_to_cpup((__be32 *)p);
 			p += 8;
 			if (initial_boot_params->version < 0x10)
 				p = _ALIGN(p, sz >= 8 ? 8 : 4);
@@ -117,9 +117,9 @@ unsigned long __init of_get_flat_dt_root(void)
 	unsigned long p = ((unsigned long)initial_boot_params) +
 		initial_boot_params->off_dt_struct;
 
-	while (*((u32 *)p) == OF_DT_NOP)
+	while (be32_to_cpup((__be32 *)p) == OF_DT_NOP)
 		p += 4;
-	BUG_ON(*((u32 *)p) != OF_DT_BEGIN_NODE);
+	BUG_ON(be32_to_cpup((__be32 *)p) != OF_DT_BEGIN_NODE);
 	p += 4;
 	return _ALIGN(p + strlen((char *)p) + 1, 4);
 }
@@ -136,7 +136,7 @@ void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
 	unsigned long p = node;
 
 	do {
-		u32 tag = *((u32 *)p);
+		u32 tag = be32_to_cpup((__be32 *)p);
 		u32 sz, noff;
 		const char *nstr;
 
@@ -146,8 +146,8 @@ void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
 		if (tag != OF_DT_PROP)
 			return NULL;
 
-		sz = *((u32 *)p);
-		noff = *((u32 *)(p + 4));
+		sz = be32_to_cpup((__be32 *)p);
+		noff = be32_to_cpup((__be32 *)(p + 4));
 		p += 8;
 		if (initial_boot_params->version < 0x10)
 			p = _ALIGN(p, sz >= 8 ? 8 : 4);
@@ -224,7 +224,7 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 	int has_name = 0;
 	int new_format = 0;
 
-	tag = *((u32 *)(*p));
+	tag = be32_to_cpup((__be32 *)(*p));
 	if (tag != OF_DT_BEGIN_NODE) {
 		pr_err("Weird tag at start of node: %x\n", tag);
 		return mem;
@@ -299,7 +299,7 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 		u32 sz, noff;
 		char *pname;
 
-		tag = *((u32 *)(*p));
+		tag = be32_to_cpup((__be32 *)(*p));
 		if (tag == OF_DT_NOP) {
 			*p += 4;
 			continue;
@@ -307,8 +307,8 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 		if (tag != OF_DT_PROP)
 			break;
 		*p += 4;
-		sz = *((u32 *)(*p));
-		noff = *((u32 *)((*p) + 4));
+		sz = be32_to_cpup((__be32 *)(*p));
+		noff = be32_to_cpup((__be32 *)((*p) + 4));
 		*p += 8;
 		if (initial_boot_params->version < 0x10)
 			*p = _ALIGN(*p, sz >= 8 ? 8 : 4);
@@ -381,7 +381,7 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 	}
 	while (tag == OF_DT_BEGIN_NODE) {
 		mem = unflatten_dt_node(mem, p, np, allnextpp, fpsize);
-		tag = *((u32 *)(*p));
+		tag = be32_to_cpup((__be32 *)(*p));
 	}
 	if (tag != OF_DT_END_NODE) {
 		pr_err("Weird tag at end of node: %x\n", tag);
@@ -399,7 +399,7 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 void __init early_init_dt_check_for_initrd(unsigned long node)
 {
 	unsigned long len;
-	u32 *prop;
+	__be32 *prop;
 
 	pr_debug("Looking for initrd properties... ");
 
@@ -433,17 +433,22 @@ inline void early_init_dt_check_for_initrd(unsigned long node)
 int __init early_init_dt_scan_root(unsigned long node, const char *uname,
 				   int depth, void *data)
 {
-	u32 *prop;
+	__be32 *prop;
 
 	if (depth != 0)
 		return 0;
 
+	dt_root_size_cells = OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
+	dt_root_addr_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
+
 	prop = of_get_flat_dt_prop(node, "#size-cells", NULL);
-	dt_root_size_cells = prop ? *prop : OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
+	if (prop)
+		dt_root_size_cells = be32_to_cpup(prop);
 	pr_debug("dt_root_size_cells = %x\n", dt_root_size_cells);
 
 	prop = of_get_flat_dt_prop(node, "#address-cells", NULL);
-	dt_root_addr_cells = prop ? *prop : OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
+	if (prop)
+		dt_root_addr_cells = be32_to_cpup(prop);
 	pr_debug("dt_root_addr_cells = %x\n", dt_root_addr_cells);
 
 	/* break now */
@@ -690,7 +695,7 @@ void __init unflatten_device_tree(void)
 			__alignof__(struct device_node));
 	mem = (unsigned long) __va(mem);
 
-	((u32 *)mem)[size / 4] = 0xdeadbeef;
+	((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
 
 	pr_debug("  unflattening %lx...\n", mem);
 
@@ -698,11 +703,11 @@ void __init unflatten_device_tree(void)
 	start = ((unsigned long)initial_boot_params) +
 		initial_boot_params->off_dt_struct;
 	unflatten_dt_node(mem, &start, NULL, &allnextp, 0);
-	if (*((u32 *)start) != OF_DT_END)
+	if (be32_to_cpup((__be32 *)start) != OF_DT_END)
 		pr_warning("Weird tag at end of tree: %08x\n", *((u32 *)start));
-	if (((u32 *)mem)[size / 4] != 0xdeadbeef)
+	if (be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef)
 		pr_warning("End of tree marker overwritten: %08x\n",
-			   ((u32 *)mem)[size / 4]);
+			   be32_to_cpu(((__be32 *)mem)[size / 4]));
 	*allnextp = NULL;
 
 	/* Get pointer to OF "/chosen" node for use everywhere */
diff --git a/drivers/of/gpio.c b/drivers/of/gpio.c
index 6eea601..24c3606 100644
--- a/drivers/of/gpio.c
+++ b/drivers/of/gpio.c
@@ -36,7 +36,7 @@ int of_get_gpio_flags(struct device_node *np, int index,
 	struct of_gpio_chip *of_gc = NULL;
 	int size;
 	const void *gpio_spec;
-	const u32 *gpio_cells;
+	const __be32 *gpio_cells;
 
 	ret = of_parse_phandles_with_args(np, "gpios", "#gpio-cells", index,
 					  &gc, &gpio_spec);
@@ -55,7 +55,7 @@ int of_get_gpio_flags(struct device_node *np, int index,
 
 	gpio_cells = of_get_property(gc, "#gpio-cells", &size);
 	if (!gpio_cells || size != sizeof(*gpio_cells) ||
-			*gpio_cells != of_gc->gpio_cells) {
+			be32_to_cpup(gpio_cells) != of_gc->gpio_cells) {
 		pr_debug("%s: wrong #gpio-cells for %s\n",
 			 np->full_name, gc->full_name);
 		ret = -EINVAL;
@@ -127,7 +127,8 @@ EXPORT_SYMBOL(of_gpio_count);
 int of_gpio_simple_xlate(struct of_gpio_chip *of_gc, struct device_node *np,
 			 const void *gpio_spec, enum of_gpio_flags *flags)
 {
-	const u32 *gpio = gpio_spec;
+	const __be32 *gpio = gpio_spec;
+	const u32 n = be32_to_cpup(gpio);
 
 	/*
 	 * We're discouraging gpio_cells < 2, since that way you'll have to
@@ -140,13 +141,13 @@ int of_gpio_simple_xlate(struct of_gpio_chip *of_gc, struct device_node *np,
 		return -EINVAL;
 	}
 
-	if (*gpio > of_gc->gc.ngpio)
+	if (n > of_gc->gc.ngpio)
 		return -EINVAL;
 
 	if (flags)
-		*flags = gpio[1];
+		*flags = be32_to_cpu(gpio[1]);
 
-	return *gpio;
+	return n;
 }
 EXPORT_SYMBOL(of_gpio_simple_xlate);
 
diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
index fa65a2b..a3a708e 100644
--- a/drivers/of/of_i2c.c
+++ b/drivers/of/of_i2c.c
@@ -25,7 +25,7 @@ void of_register_i2c_devices(struct i2c_adapter *adap,
 	for_each_child_of_node(adap_node, node) {
 		struct i2c_board_info info = {};
 		struct dev_archdata dev_ad = {};
-		const u32 *addr;
+		const __be32 *addr;
 		int len;
 
 		if (of_modalias_node(node, info.type, sizeof(info.type)) < 0)
@@ -40,7 +40,7 @@ void of_register_i2c_devices(struct i2c_adapter *adap,
 
 		info.irq = irq_of_parse_and_map(node, 0);
 
-		info.addr = *addr;
+		info.addr = be32_to_cpup(addr);
 
 		dev_archdata_set_node(&dev_ad, node);
 		info.archdata = &dev_ad;
diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 4b22ba5..18ecae4 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -51,7 +51,7 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 
 	/* Loop over the child nodes and register a phy_device for each one */
 	for_each_child_of_node(np, child) {
-		const u32 *addr;
+		const __be32 *addr;
 		int len;
 
 		/* A PHY must have a reg property in the range [0-31] */
@@ -68,7 +68,7 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 				mdio->irq[*addr] = PHY_POLL;
 		}
 
-		phy = get_phy_device(mdio, *addr);
+		phy = get_phy_device(mdio, be32_to_cpup(addr));
 		if (!phy) {
 			dev_err(&mdio->dev, "error probing PHY at address %i\n",
 				*addr);
@@ -160,7 +160,7 @@ struct phy_device *of_phy_connect_fixed_link(struct net_device *dev,
 	struct device_node *net_np;
 	char bus_id[MII_BUS_ID_SIZE + 3];
 	struct phy_device *phy;
-	const u32 *phy_id;
+	const __be32 *phy_id;
 	int sz;
 
 	if (!dev->dev.parent)
@@ -174,7 +174,7 @@ struct phy_device *of_phy_connect_fixed_link(struct net_device *dev,
 	if (!phy_id || sz < sizeof(*phy_id))
 		return NULL;
 
-	sprintf(bus_id, PHY_ID_FMT, "0", phy_id[0]);
+	sprintf(bus_id, PHY_ID_FMT, "0", be32_to_cpu(phy_id[0]));
 
 	phy = phy_connect(dev, bus_id, hndlr, 0, iface);
 	return IS_ERR(phy) ? NULL : phy;
diff --git a/drivers/of/of_spi.c b/drivers/of/of_spi.c
index bed0ed6..f65f48b 100644
--- a/drivers/of/of_spi.c
+++ b/drivers/of/of_spi.c
@@ -23,7 +23,7 @@ void of_register_spi_devices(struct spi_master *master, struct device_node *np)
 {
 	struct spi_device *spi;
 	struct device_node *nc;
-	const u32 *prop;
+	const __be32 *prop;
 	int rc;
 	int len;
 
@@ -54,7 +54,7 @@ void of_register_spi_devices(struct spi_master *master, struct device_node *np)
 			spi_dev_put(spi);
 			continue;
 		}
-		spi->chip_select = *prop;
+		spi->chip_select = be32_to_cpup(prop);
 
 		/* Mode (clock phase/polarity/etc.) */
 		if (of_find_property(nc, "spi-cpha", NULL))
@@ -72,7 +72,7 @@ void of_register_spi_devices(struct spi_master *master, struct device_node *np)
 			spi_dev_put(spi);
 			continue;
 		}
-		spi->max_speed_hz = *prop;
+		spi->max_speed_hz = be32_to_cpup(prop);
 
 		/* IRQ */
 		spi->irq = irq_of_parse_and_map(nc, 0);
