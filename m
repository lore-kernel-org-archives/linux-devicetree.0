From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 1/4] drivers: of: add automated assignment of reserved
 regions to client devices
Date: Mon, 14 Jul 2014 09:12:43 +0200
Message-ID: <1405321966-28184-2-git-send-email-m.szyprowski@samsung.com>
References: <1405321966-28184-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1405321966-28184-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joonsoo Kim <iamjoonsoo.kim-Hm3cg6mZ9cc@public.gmane.org>, "Aneesh Kumar K.V." <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds code for automated assignment of reserved memory regions
to struct device. reserved_mem->ops->device_init()/device_cleanup()
callbacks are called to perform reserved memory driver specific
initialization and cleanup

Based on previous code provided by Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/of/of_reserved_mem.c    | 70 +++++++++++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h |  7 +++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 632aae861375..59fb12e84e6b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -206,8 +206,16 @@ void __init fdt_init_reserved_mem(void)
 	for (i = 0; i < reserved_mem_count; i++) {
 		struct reserved_mem *rmem = &reserved_mem[i];
 		unsigned long node = rmem->fdt_node;
+		int len;
+		const __be32 *prop;
 		int err = 0;
 
+		prop = of_get_flat_dt_prop(node, "phandle", &len);
+		if (!prop)
+			prop = of_get_flat_dt_prop(node, "linux,phandle", &len);
+		if (prop)
+			rmem->phandle = of_read_number(prop, len/4);
+
 		if (rmem->size == 0)
 			err = __reserved_mem_alloc_size(node, rmem->name,
 						 &rmem->base, &rmem->size);
@@ -215,3 +223,65 @@ void __init fdt_init_reserved_mem(void)
 			__reserved_mem_init_node(rmem);
 	}
 }
+
+static inline struct reserved_mem *__find_rmem(struct device_node *node)
+{
+	unsigned int i;
+
+	if (!node->phandle)
+		return NULL;
+
+	for (i = 0; i < reserved_mem_count; i++)
+		if (reserved_mem[i].phandle == node->phandle)
+			return &reserved_mem[i];
+	return NULL;
+}
+
+/**
+ * of_reserved_mem_device_init() - assign reserved memory region to given device
+ *
+ * This function assign memory region pointed by "memory-region" device tree
+ * property to the given device.
+ */
+void of_reserved_mem_device_init(struct device *dev)
+{
+	struct reserved_mem *rmem;
+	struct device_node *np;
+
+	np = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!np)
+		return;
+
+	rmem = __find_rmem(np);
+	of_node_put(np);
+
+	if (!rmem || !rmem->ops || !rmem->ops->device_init)
+		return;
+
+	rmem->ops->device_init(rmem, dev);
+	dev_info(dev, "assigned reserved memory node %s\n", rmem->name);
+}
+
+/**
+ * of_reserved_mem_device_release() - release reserved memory device structures
+ *
+ * This function releases structures allocated for memory region handling for
+ * the given device.
+ */
+void of_reserved_mem_device_release(struct device *dev)
+{
+	struct reserved_mem *rmem;
+	struct device_node *np;
+
+	np = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!np)
+		return;
+
+	rmem = __find_rmem(np);
+	of_node_put(np);
+
+	if (!rmem || !rmem->ops || !rmem->ops->device_release)
+		return;
+
+	rmem->ops->device_release(rmem, dev);
+}
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 4669ddfdd5af..5b5efae09135 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -8,6 +8,7 @@ struct reserved_mem_ops;
 struct reserved_mem {
 	const char			*name;
 	unsigned long			fdt_node;
+	unsigned long			phandle;
 	const struct reserved_mem_ops	*ops;
 	phys_addr_t			base;
 	phys_addr_t			size;
@@ -27,10 +28,16 @@ typedef int (*reservedmem_of_init_fn)(struct reserved_mem *rmem);
 	_OF_DECLARE(reservedmem, name, compat, init, reservedmem_of_init_fn)
 
 #ifdef CONFIG_OF_RESERVED_MEM
+void of_reserved_mem_device_init(struct device *dev);
+void of_reserved_mem_device_release(struct device *dev);
+
 void fdt_init_reserved_mem(void);
 void fdt_reserved_mem_save_node(unsigned long node, const char *uname,
 			       phys_addr_t base, phys_addr_t size);
 #else
+static inline void of_reserved_mem_device_init(struct device *dev) { }
+static inline void of_reserved_mem_device_release(struct device *pdev) { }
+
 static inline void fdt_init_reserved_mem(void) { }
 static inline void fdt_reserved_mem_save_node(unsigned long node,
 		const char *uname, phys_addr_t base, phys_addr_t size) { }
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
