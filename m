From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC/PATCH] of: of_find_node_by_name - stop dropping reference to
 'from' node
Date: Tue, 19 Apr 2016 10:05:40 -0700
Message-ID: <20160419170540.GA8327@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Majority of the callers of of_find_node_by_name() do not expect that it
will drop reference to the 'from' node if it was passed in, causing
potential refcount underflows, etc, so let's stop doing this.

Most of the callers that were handling dropping of reference done by
of_find_node_by_name() actually wanted for_each_node_by_name() instead.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

If this is acceptable I can make changes to other of_find_node_*()
methods...

 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c |  2 ++
 arch/powerpc/platforms/83xx/mpc832x_mds.c  |  2 +-
 arch/powerpc/platforms/83xx/mpc832x_rdb.c  |  2 +-
 arch/powerpc/platforms/83xx/mpc836x_mds.c  |  2 +-
 arch/powerpc/platforms/cell/interrupt.c    |  3 +--
 arch/powerpc/platforms/cell/setup.c        |  3 +--
 arch/powerpc/platforms/cell/spider-pic.c   |  3 +--
 arch/powerpc/platforms/powermac/feature.c  |  2 +-
 arch/powerpc/platforms/powermac/pic.c      |  2 --
 drivers/input/misc/twl4030-vibra.c         |  8 +-------
 drivers/of/base.c                          |  3 +--
 drivers/pci/hotplug/rpadlpar_core.c        |  4 ++--
 drivers/video/backlight/tps65217_bl.c      |  4 ++--
 include/linux/of.h                         | 12 +++++++++---
 14 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c b/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
index 9869a75..52e9880 100644
--- a/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
@@ -3920,6 +3920,8 @@ int __init omap3xxx_hwmod_init(void)
 			return r;
 	}
 
+	of_node_put(bus);
+
 	/*
 	 * Register hwmod links specific to certain ES levels of a
 	 * particular family of silicon (e.g., 34xx ES1.0)
diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c b/arch/powerpc/platforms/83xx/mpc832x_mds.c
index a973b2a..37e1fb7 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_mds.c
@@ -78,7 +78,7 @@ static void __init mpc832x_sys_setup_arch(void)
 		par_io_init(np);
 		of_node_put(np);
 
-		for (np = NULL; (np = of_find_node_by_name(np, "ucc")) != NULL;)
+		for_each_node_by_name(np, "ucc")
 			par_io_of_config(np);
 	}
 
diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index ea2b87d..bae127a 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -207,7 +207,7 @@ static void __init mpc832x_rdb_setup_arch(void)
 		par_io_init(np);
 		of_node_put(np);
 
-		for (np = NULL; (np = of_find_node_by_name(np, "ucc")) != NULL;)
+		for_each_node_by_name(np, "ucc")
 			par_io_of_config(np);
 	}
 #endif				/* CONFIG_QUICC_ENGINE */
diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
index dd70b85..bf19ac2 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
@@ -86,7 +86,7 @@ static void __init mpc836x_mds_setup_arch(void)
 		par_io_init(np);
 		of_node_put(np);
 
-		for (np = NULL; (np = of_find_node_by_name(np, "ucc")) != NULL;)
+		for_each_node_by_name(np, "ucc")
 			par_io_of_config(np);
 #ifdef CONFIG_QE_USB
 		/* Must fixup Par IO before QE GPIO chips are registered. */
diff --git a/arch/powerpc/platforms/cell/interrupt.c b/arch/powerpc/platforms/cell/interrupt.c
index 9f609fc..dd2b780 100644
--- a/arch/powerpc/platforms/cell/interrupt.c
+++ b/arch/powerpc/platforms/cell/interrupt.c
@@ -321,8 +321,7 @@ static int __init setup_iic(void)
 	struct cbe_iic_regs __iomem *node_iic;
 	const u32 *np;
 
-	for (dn = NULL;
-	     (dn = of_find_node_by_name(dn,"interrupt-controller")) != NULL;) {
+	for_each_node_by_name(dn, "interrupt-controller") {
 		if (!of_device_is_compatible(dn,
 				     "IBM,CBEA-Internal-Interrupt-Controller"))
 			continue;
diff --git a/arch/powerpc/platforms/cell/setup.c b/arch/powerpc/platforms/cell/setup.c
index 36cff28..0924ad3 100644
--- a/arch/powerpc/platforms/cell/setup.c
+++ b/arch/powerpc/platforms/cell/setup.c
@@ -192,8 +192,7 @@ static void __init mpic_init_IRQ(void)
 	struct device_node *dn;
 	struct mpic *mpic;
 
-	for (dn = NULL;
-	     (dn = of_find_node_by_name(dn, "interrupt-controller"));) {
+	for_each_node_by_name(dn, "interrupt-controller") {
 		if (!of_device_is_compatible(dn, "CBEA,platform-open-pic"))
 			continue;
 
diff --git a/arch/powerpc/platforms/cell/spider-pic.c b/arch/powerpc/platforms/cell/spider-pic.c
index 54ee574..a986b9a 100644
--- a/arch/powerpc/platforms/cell/spider-pic.c
+++ b/arch/powerpc/platforms/cell/spider-pic.c
@@ -343,8 +343,7 @@ void __init spider_init_IRQ(void)
 	 * device-tree is bogus anyway) so all we can do is pray or maybe test
 	 * the address and deduce the node-id
 	 */
-	for (dn = NULL;
-	     (dn = of_find_node_by_name(dn, "interrupt-controller"));) {
+	for_each_node_by_name(dn, "interrupt-controller") {
 		if (of_device_is_compatible(dn, "CBEA,platform-spider-pic")) {
 			if (of_address_to_resource(dn, 0, &r)) {
 				printk(KERN_WARNING "spider-pic: Failed\n");
diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 1e02328..ea718da 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -2641,7 +2641,7 @@ static void __init probe_one_macio(const char *name, const char *compat, int typ
 	phys_addr_t		addr;
 	u64			size;
 
-	for (node = NULL; (node = of_find_node_by_name(node, name)) != NULL;) {
+	for_each_node_by_name(node, name) {
 		if (!compat)
 			break;
 		if (of_device_is_compatible(node, compat))
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 9815463..5a3dd83d 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -324,8 +324,6 @@ static void __init pmac_pic_probe_oldstyle(void)
 
 		/* We might have a second cascaded heathrow */
 
-		/* Compensate for of_node_put() in of_find_node_by_name() */
-		of_node_get(master);
 		slave = of_find_node_by_name(master, "mac-io");
 
 		/* Check ordering of master & slave */
diff --git a/drivers/input/misc/twl4030-vibra.c b/drivers/input/misc/twl4030-vibra.c
index 10c4e3d..1b844df 100644
--- a/drivers/input/misc/twl4030-vibra.c
+++ b/drivers/input/misc/twl4030-vibra.c
@@ -183,13 +183,7 @@ static bool twl4030_vibra_check_coexist(struct twl4030_vibra_data *pdata,
 	if (pdata && pdata->coexist)
 		return true;
 
-	node = of_find_node_by_name(node, "codec");
-	if (node) {
-		of_node_put(node);
-		return true;
-	}
-
-	return false;
+	return of_find_node_by_name(node, "codec");
 }
 
 static int twl4030_vibra_probe(struct platform_device *pdev)
diff --git a/drivers/of/base.c b/drivers/of/base.c
index b299de2..45fc458 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -826,7 +826,7 @@ EXPORT_SYMBOL(of_find_node_opts_by_path);
  *	@from:	The node to start searching from or NULL, the node
  *		you pass will not be searched, only the next one
  *		will; typically, you pass what the previous call
- *		returned. of_node_put() will be called on it
+ *		returned.
  *	@name:	The name string to match against
  *
  *	Returns a node pointer with refcount incremented, use
@@ -843,7 +843,6 @@ struct device_node *of_find_node_by_name(struct device_node *from,
 		if (np->name && (of_node_cmp(np->name, name) == 0)
 		    && of_node_get(np))
 			break;
-	of_node_put(from);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
 }
diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
index b46b57d..d73d7a1 100644
--- a/drivers/pci/hotplug/rpadlpar_core.c
+++ b/drivers/pci/hotplug/rpadlpar_core.c
@@ -63,12 +63,12 @@ static struct device_node *find_vio_slot_node(char *drc_name)
 static struct device_node *find_php_slot_pci_node(char *drc_name,
 						  char *drc_type)
 {
-	struct device_node *np = NULL;
+	struct device_node *np;
 	char *name;
 	char *type;
 	int rc;
 
-	while ((np = of_find_node_by_name(np, "pci"))) {
+	for_each_node_by_name(np, "pci") {
 		rc = rpaphp_get_drc_props(np, NULL, &name, &type, NULL);
 		if (rc == 0)
 			if (!strcmp(drc_name, name) && !strcmp(drc_type, type))
diff --git a/drivers/video/backlight/tps65217_bl.c b/drivers/video/backlight/tps65217_bl.c
index fd524ad..0c1a934 100644
--- a/drivers/video/backlight/tps65217_bl.c
+++ b/drivers/video/backlight/tps65217_bl.c
@@ -184,11 +184,11 @@ static struct tps65217_bl_pdata *
 tps65217_bl_parse_dt(struct platform_device *pdev)
 {
 	struct tps65217 *tps = dev_get_drvdata(pdev->dev.parent);
-	struct device_node *node = of_node_get(tps->dev->of_node);
+	struct device_node *node;
 	struct tps65217_bl_pdata *pdata, *err;
 	u32 val;
 
-	node = of_find_node_by_name(node, "backlight");
+	node = of_find_node_by_name(tps->dev->of_node, "backlight");
 	if (!node)
 		return ERR_PTR(-ENODEV);
 
diff --git a/include/linux/of.h b/include/linux/of.h
index 7fcb681..86408c3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -880,9 +880,15 @@ static inline int of_property_read_s32(const struct device_node *np,
 		s;						\
 		s = of_prop_next_string(prop, s))
 
-#define for_each_node_by_name(dn, name) \
-	for (dn = of_find_node_by_name(NULL, name); dn; \
-	     dn = of_find_node_by_name(dn, name))
+#define for_each_node_by_name(dn, name)			\
+	for (dn = of_find_node_by_name(NULL, name);	\
+	     dn;					\
+	     {						\
+		struct device_node *_pdn = dn;		\
+		dn = of_find_node_by_name(_pdn, name);	\
+		of_put_node(_pdn);			\
+	     }						\
+	)
 #define for_each_node_by_type(dn, type) \
 	for (dn = of_find_node_by_type(NULL, type); dn; \
 	     dn = of_find_node_by_type(dn, type))
-- 
2.8.0.rc3.226.g39d4020


-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
