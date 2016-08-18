From: Anshuman Gupta <anshexp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] populate platform device at late init
Date: Fri, 19 Aug 2016 00:25:33 +0530
Message-ID: <1471546533-3996-1-git-send-email-anshexp@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, anshexp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch enables to populate platform devices from device tree at late-init
As of now linux kernel has late-init call infrastructure which make a driver/module
init call at late-init.it is not specific to a platform device.
This patch make a platform device to be probe at late-init,
without making its driver a late-init call.

This will be useful in certain scenario when we have multiple instances of similar
platform devices and it is ok to defer specific device to late-init among the multiple
instance of similar devices.

Currently ARM based SOC has multiple instance of similar modules/controller
(i2c,uart,mmc controller), so for each module/controller device will get probe and
initialized at early boot, but for some instances of device it may not be needful
to be initialized it at early boot-up. If we can defer these device
probe/initialization at post init, it can improve boot up time with respect to other
system component.It can be useful in Linux based automotive infotainment platform,
where we need camera functionality (reverse view camera) as early as possible.

Example: if we have 4 i2c controller(i2c0~i2c3) and i2c0 controller is being used
by a camera driver,if camera driver is required at early boot then i2c controller driver
can not be initialized at late-init and i2c0 controller need to probe before camera driver,
but this force other i2c controller devices also to be probe at early boot-up itself,
which may not be really required.
This patch tested on freescale imx6 udoo quad board with kernel version 3.14.56.

Patch is made against 4.7 kernel.

In order to probe a platform device at late-init, we need to declare a late_init
property at desired device tree node, and invoke of_platform_populate_late_nodes exported
function call from desired board file init_late machine descriptor function.

Following files has been changed for this patch
	drivers/of/Kconfig
	drivers/of/base.c
	drivers/of/platform.c
	include/linux/of.h
	include/linux/of_platform.h

Signed-off-by: Anshuman Gupta <anshexp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/Kconfig          |   7 +++
 drivers/of/base.c           |  21 +++++++++
 drivers/of/platform.c       | 109 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h          |   3 ++
 include/linux/of_platform.h |  14 ++++++
 5 files changed, 154 insertions(+)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index bc07ad3..c8443f5 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -63,6 +63,13 @@ config OF_ADDRESS
 config OF_ADDRESS_PCI
 	bool
 
+config OF_LATE_NODES
+	def_bool n
+	depends on OF_ADDRESS
+	help
+	 This option makes probe of certain device nodes at late init,
+	 whichever device nodes have a late_init property true.
+
 config OF_IRQ
 	def_bool y
 	depends on !SPARC && IRQ_DOMAIN
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7792266..c40e9a7 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -304,6 +304,7 @@ const void *__of_get_property(const struct device_node *np,
 	return pp ? pp->value : NULL;
 }
 
+
 /*
  * Find a property with a given name for a given node
  * and return the value.
@@ -317,6 +318,26 @@ const void *of_get_property(const struct device_node *np, const char *name,
 }
 EXPORT_SYMBOL(of_get_property);
 
+int of_set_property(const struct device_node *np, const char *name,
+			const void *val, int len)
+{
+	struct property *pp;
+	int lenp;
+
+	if (!np)
+		return -ENOENT;
+
+	pp = of_find_property(np, name, &lenp);
+	if (pp) {
+		memcpy(pp->value, val, len);
+		pp->length = len;
+		}
+	else
+		return -ENOENT;
+	return 0;
+
+}
+EXPORT_SYMBOL(of_set_property);
 /*
  * arch_match_cpu_phys_id - Match the given logical CPU and physical id
  *
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 765390e..2f6bcb4 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -64,6 +64,11 @@ EXPORT_SYMBOL(of_find_device_by_node);
  * mechanism for creating devices from device tree nodes.
  */
 
+#ifdef CONFIG_OF_LATE_NODES
+static LIST_HEAD(late_device_node_list);
+static int of_add_late_device_node(struct device_node *bus,
+					struct device *parent);
+#endif
 /**
  * of_device_make_bus_id - Use the device node data to assign a unique name
  * @dev: pointer to device structure that is linked to a device tree node
@@ -368,6 +373,12 @@ static int of_platform_bus_create(struct device_node *bus,
 		return 0;
 	}
 
+#ifdef CONFIG_OF_LATE_NODES
+	if (of_device_is_late_node(bus)) {
+		of_add_late_device_node(bus, parent);
+		return 0;
+	}
+#endif
 	auxdata = of_dev_lookup(lookup, bus);
 	if (auxdata) {
 		bus_id = auxdata->name;
@@ -614,4 +625,102 @@ void of_platform_register_reconfig_notifier(void)
 }
 #endif /* CONFIG_OF_DYNAMIC */
 
+#ifdef CONFIG_OF_LATE_NODES
+/**
+ * of_device_is_late_node() - check a device node whether it is late init node.
+ * @device: pointer to device tree node.
+ *
+ * Checks if late_init property of device node holds true and rturn true
+ *
+ * Returns 0 on success, < 0 on failure.
+ */
+int of_device_is_late_node(const struct device_node *device)
+{
+	const char *status;
+	int statlen;
+
+	status = of_get_property(device, "late_init", &statlen);
+	if (status == NULL)
+		return 0;
+
+	if (statlen > 0) {
+		if (!strcmp(status, "true"))
+			return 1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_device_is_late_node);
+
+/**
+ * of_add_late_device_node() - add late init device node to late_device_node_list
+ * @bus: pointer to device tree node.
+ * @parent: parent for new device
+ *
+ * This function add a late init node to a list of late init nodes
+ *
+ * Returns 0 on success, < 0 on failure.
+ */
+static int of_add_late_device_node(struct device_node *bus, struct device *parent)
+{
+	struct of_late_device_node *late_dev_node;
+	char *data = "false";
+	int len;
+
+	late_dev_node = kmalloc(sizeof(struct of_late_device_node), GFP_KERNEL);
+
+	if (!late_dev_node)
+		return -ENOMEM;
+
+	late_dev_node->late_device_node = bus;
+	late_dev_node->late_node_parent = parent;
+	INIT_LIST_HEAD(&late_dev_node->late_node);
+
+	if (list_empty(&late_dev_node->late_node)) {
+		pr_debug("added to late device node list\n");
+		list_add_tail(&late_dev_node->late_node, &late_device_node_list);
+	}
+
+	len = strlen(data) + 1;
+		of_set_property(bus, "late_init", (void *)data, len);
+	return 0;
+}
+
+/**
+ * of_platform_populate_late_nodes() - Populate late init platform devices
+ * @root: parent of the first level to probe or NULL for the root of the tree
+ * @matches: match table, NULL to use the default
+ * @lookup: auxdata table for matching id and platform_data with device nodes
+ *
+ * This function walks late init node link list,
+ * and creates platform devices from nodes.
+ *
+ * Returns 0 on success, < 0 on failure.
+ */
+int of_platform_populate_late_nodes(struct device_node *root,
+			const struct of_device_id *matches,
+			const struct of_dev_auxdata *lookup)
+{
+	struct device_node *child;
+	struct of_late_device_node *temp;
+	static struct device *parent;
+	int rc = 0;
+
+	while (!list_empty(&late_device_node_list)) {
+		temp = list_first_entry(&late_device_node_list,
+					struct of_late_device_node, late_node);
+		child = temp->late_device_node;
+		parent = temp->late_node_parent;
+
+		rc = of_platform_bus_create(child, matches, lookup, parent, true);
+		list_del_init(&temp->late_node);
+		kfree(temp);
+		if (rc)
+			break;
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(of_platform_populate_late_nodes);
+#endif /* CONFIG_OF_LATE_NODES */
 #endif /* CONFIG_OF_ADDRESS */
diff --git a/include/linux/of.h b/include/linux/of.h
index 3d9ff8e..74f4664 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -324,6 +324,9 @@ extern bool of_device_is_big_endian(const struct device_node *device);
 extern const void *of_get_property(const struct device_node *node,
 				const char *name,
 				int *lenp);
+extern int of_set_property(const struct device_node *node,
+				const char *name, const void *val,
+				int len);
 extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
 #define for_each_property_of_node(dn, pp) \
 	for (pp = dn->properties; pp != NULL; pp = pp->next)
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 956a100..d348f2d 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -51,6 +51,13 @@ struct of_dev_auxdata {
 	{ .compatible = _compat, .phys_addr = _phys, .name = _name, \
 	  .platform_data = _pdata }
 
+#ifdef CONFIG_OF_LATE_NODES
+struct of_late_device_node {
+	struct device_node *late_device_node;
+	struct device *late_node_parent;
+	struct list_head late_node;
+};
+#endif
 extern const struct of_device_id of_default_bus_match_table[];
 
 /* Platform drivers register/unregister */
@@ -76,6 +83,13 @@ extern int of_platform_default_populate(struct device_node *root,
 					const struct of_dev_auxdata *lookup,
 					struct device *parent);
 extern void of_platform_depopulate(struct device *parent);
+#ifdef CONFIG_OF_LATE_NODES
+extern int of_platform_populate_late_nodes(struct device_node *root,
+				const struct of_device_id *matches,
+				const struct of_dev_auxdata *lookup);
+
+extern int of_device_is_late_node(const struct device_node *device);
+#endif
 #else
 static inline int of_platform_populate(struct device_node *root,
 					const struct of_device_id *matches,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
