From: Tobias Regnery <tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: add stub for of_n_addr_cells
Date: Fri, 24 Mar 2017 11:39:40 +0100
Message-ID: <20170324103940.30902-1-tobias.regnery@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, Tobias Regnery <tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With CONFIG_OF=n and CONFIG_COMPILE_TEST=y the rcar pci-e driver fails to
build on arm:

drivers/pci/host/pcie-rcar.c: In function 'pci_dma_range_parser_init':
drivers/pci/host/pcie-rcar.c:1035:16: error: implicit declaration of function 'of_n_addr_cells' [-Werror=implicit-function-declaration]
  parser->pna = of_n_addr_cells(node);
                ^~~~~~~~~~~~~~~

Fix this by adding an inline stub for of_n_addr_cells

Signed-off-by: Tobias Regnery <tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
This is against next-20140324

 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 21e6323de0f3..9978c918222e 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -710,6 +710,11 @@ static inline struct device_node *of_get_cpu_node(int cpu,
 	return NULL;
 }
 
+static inline int of_n_addr_cells(struct device_node *np)
+{
+	return 0;
+}
+
 static inline int of_property_read_u64(const struct device_node *np,
 				       const char *propname, u64 *out_value)
 {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
