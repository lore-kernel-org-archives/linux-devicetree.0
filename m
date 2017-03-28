From: Tobias Regnery <tobias.regnery@gmail.com>
Subject: [PATCH v2] of: add stubs for of_n_{addr, size}_cells
Date: Tue, 28 Mar 2017 11:37:42 +0200
Message-ID: <20170328093742.21528-1-tobias.regnery@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: horms@verge.net.au, arnd@arndb.de, Tobias Regnery <tobias.regnery@gmail.com>
List-Id: devicetree@vger.kernel.org

With CONFIG_OF=n and CONFIG_COMPILE_TEST=y the rcar pci-e driver fails to
build on arm:

drivers/pci/host/pcie-rcar.c: In function 'pci_dma_range_parser_init':
drivers/pci/host/pcie-rcar.c:1035:16: error: implicit declaration of function 'of_n_addr_cells' [-Werror=implicit-function-declaration]
  parser->pna = of_n_addr_cells(node);
                ^~~~~~~~~~~~~~~

Fix this by adding an inline stub for of_n_addr_cells

While at it also provide a stub for of_n_size_cells for consistency reasons.

Signed-off-by: Tobias Regnery <tobias.regnery@gmail.com>
---
Changes in v2:
	- add a stub for of_n_size_cells as suggested by Arnd

 include/linux/of.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 21e6323de0f3..27727355e199 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -710,6 +710,16 @@ static inline struct device_node *of_get_cpu_node(int cpu,
 	return NULL;
 }
 
+static inline int of_n_addr_cells(struct device_node *np)
+{
+	return 0;
+}
+
+static inline int of_n_size_cells(struct device_node *np)
+{
+	return 0;
+}
+
 static inline int of_property_read_u64(const struct device_node *np,
 				       const char *propname, u64 *out_value)
 {
-- 
2.11.0
