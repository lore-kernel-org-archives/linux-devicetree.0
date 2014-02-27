From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 3/7] dma: of: introduce of_dma_get_range() helper
Date: Thu, 27 Feb 2014 16:17:48 -0500
Message-ID: <1393535872-20915-4-git-send-email-santosh.shilimkar@ti.com>
References: <1393535872-20915-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393535872-20915-1-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>

The of_dma_get_range() allows to find "dma-range" property for
the specified device and parse it.
 dma-ranges format:
   DMA addr (dma_addr)		: naddr cells
   CPU addr (phys_addr_t)	: pna cells
   size				: nsize cells

Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
---
 drivers/dma/of-dma.c   |   86 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_dma.h |    8 +++++
 2 files changed, 94 insertions(+)

diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
index e8fe9dc..9b51768 100644
--- a/drivers/dma/of-dma.c
+++ b/drivers/dma/of-dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
+#include <linux/of_address.h>
 
 static LIST_HEAD(of_dma_list);
 static DEFINE_MUTEX(of_dma_lock);
@@ -218,3 +219,88 @@ struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
 			&dma_spec->args[0]);
 }
 EXPORT_SYMBOL_GPL(of_dma_simple_xlate);
+
+/**
+ * of_dma_get_range - Get DMA range info
+ * @np:		device node to get DMA range info
+ * @dma_addr:	pointer to store initial DMA address of DMA range
+ * @paddr:	pointer to store initial CPU address of DMA range
+ * @size:	pointer to store size of DMA range
+ *
+ * Look in bottom up direction for the first "dma-range" property
+ * and parse it.
+ *  dma-ranges format:
+ *	DMA addr (dma_addr)	: naddr cells
+ *	CPU addr (phys_addr_t)	: pna cells
+ *	size			: nsize cells
+ *
+ * It returns -ENODEV if "dma-ranges" property was not found
+ * for this device in DT.
+ */
+extern int of_dma_get_range(struct device_node *np, dma_addr_t *dma_addr,
+		phys_addr_t *paddr, phys_addr_t *size)
+{
+	struct device_node *node = np;
+	const u32 *ranges = NULL;
+	int len, naddr, nsize, pna;
+	int ret = 0;
+
+	if (!node)
+		return -EINVAL;
+
+	while (1) {
+		naddr = of_n_addr_cells(node);
+		nsize = of_n_size_cells(node);
+		node = of_get_next_parent(node);
+		if (!node)
+			break;
+
+		ranges = of_get_property(node, "dma-ranges", &len);
+
+		/* Ignore empty ranges, they imply no translation required */
+		if (ranges && len > 0)
+			break;
+
+		/*
+		 * At least empty ranges has to be defined for parent node if
+		 * DMA is supported
+		 */
+		if (!ranges)
+			break;
+	}
+
+	if (!ranges) {
+		pr_debug("%s: no dma-ranges found for node(%s)\n",
+			 __func__, np->full_name);
+		ret = -ENODEV;
+		goto out;
+	}
+
+	len /= sizeof(u32);
+
+	pna = of_n_addr_cells(node);
+
+	/* dma-ranges format:
+	 * DMA addr	: naddr cells
+	 * CPU addr	: pna cells
+	 * size		: nsize cells
+	 */
+	*dma_addr = of_read_number(ranges, naddr);
+	*paddr = of_translate_dma_address(np, ranges);
+	if (*paddr == OF_BAD_ADDR) {
+		pr_err("%s: translation of DMA address(%#08x) to CPU address failed node(%s)\n",
+		       __func__, *dma_addr, np->full_name);
+		ret = -EINVAL;
+	}
+
+	*size = of_read_number(ranges + naddr + pna, nsize);
+
+	pr_debug("dma_addr(%08x) cpu_addr(%pa) size(%pa)\n",
+		 *dma_addr, paddr, size);
+
+out:
+	of_node_put(node);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_dma_get_range);
diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
index ae36298..f04171a 100644
--- a/include/linux/of_dma.h
+++ b/include/linux/of_dma.h
@@ -41,6 +41,9 @@ extern struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 						     const char *name);
 extern struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
 		struct of_dma *ofdma);
+
+extern int of_dma_get_range(struct device_node *np, dma_addr_t *dma_addr,
+		phys_addr_t *paddr, phys_addr_t *size);
 #else
 static inline int of_dma_controller_register(struct device_node *np,
 		struct dma_chan *(*of_dma_xlate)
@@ -66,6 +69,11 @@ static inline struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_s
 	return NULL;
 }
 
+static inline int of_dma_get_range(struct device_node *np, dma_addr_t *dma_addr,
+		phys_addr_t *paddr, phys_addr_t *size);
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __LINUX_OF_DMA_H */
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
