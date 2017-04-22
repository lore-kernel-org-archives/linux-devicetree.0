From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC 2/3] of: reserved_mem: Accessor for acquiring reserved_mem
Date: Sat, 22 Apr 2017 10:35:18 -0700
Message-ID: <20170422173519.5782-2-bjorn.andersson@linaro.org>
References: <20170422173519.5782-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170422173519.5782-1-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In some cases drivers referencing a reserved-memory region might want to
remap the entire region, but when defining the reserved-memory by "size"
the client driver has no means to know the associated base address of
the reserved memory region.

This patch adds an accessor for such drivers to acquire a handle to
their associated reserved-memory for this purpose.

Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

I would have preferred if we could provide a mechanism for drivers to find the
reserved_mem of their own device_node, but without a phandle I have not been
able to figure out a sane way to make the match.

Suggestions are very welcome.

 drivers/of/of_reserved_mem.c    | 26 ++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h |  8 ++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index d507c3569a88..aa69c9590a5c 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -397,3 +397,29 @@ void of_reserved_mem_device_release(struct device *dev)
 	rmem->ops->device_release(rmem, dev);
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_device_release);
+
+/**
+ * of_get_reserved_mem_by_idx() - acquire reserved_mem from memory-region
+ * @np:		node pointer containing the "memory-region"
+ * @idx:	index within memory-region
+ *
+ * This function allows drivers to acquire a reference to the reserved_mem
+ * struct which is referenced by their memory-region.
+ *
+ * Returns a reserved_mem reference, or NULL on error.
+ */
+struct reserved_mem *of_get_reserved_mem_by_idx(struct device_node *np, int idx)
+{
+	struct device_node *target;
+	struct reserved_mem *rmem;
+
+	target = of_parse_phandle(np, "memory-region", idx);
+	if (!target)
+		return NULL;
+
+	rmem = __find_rmem(target);
+	of_node_put(target);
+
+	return rmem;
+}
+EXPORT_SYMBOL_GPL(of_get_reserved_mem_by_idx);
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index f8e1992d6423..a9abbe7dd3de 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -34,6 +34,8 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 				       struct device_node *np, int idx);
 void of_reserved_mem_device_release(struct device *dev);
 
+struct reserved_mem *of_get_reserved_mem_by_idx(struct device_node *np, int idx);
+
 int early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 					     phys_addr_t align,
 					     phys_addr_t start,
@@ -52,6 +54,12 @@ static inline int of_reserved_mem_device_init_by_idx(struct device *dev,
 }
 static inline void of_reserved_mem_device_release(struct device *pdev) { }
 
+static inline struct reserved_mem *of_get_reserved_mem_by_idx(struct device_node *np,
+							      int idx);
+{
+	return NULL;
+}
+
 static inline void fdt_init_reserved_mem(void) { }
 static inline void fdt_reserved_mem_save_node(unsigned long node,
 		const char *uname, phys_addr_t base, phys_addr_t size) { }
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
