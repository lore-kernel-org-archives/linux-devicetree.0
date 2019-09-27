From: Rob Herring <robh@kernel.org>
Subject: [PATCH 08/11] of: Factor out #{addr,size}-cells parsing
Date: Thu, 26 Sep 2019 19:24:52 -0500
Message-ID: <20190927002455.13169-9-robh@kernel.org>
References: <20190927002455.13169-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Robin Murphy <robin.murphy@arm.com>

In some cases such as PCI host controllers, we may have a "parent bus"
which is an OF leaf node, but still need to correctly parse ranges from
the point of view of that bus. For that, factor out variants of the
"#addr-cells" and "#size-cells" parsers which do not assume they have a
device node and thus immediately traverse upwards before reading the
relevant property.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
[robh: don't make of_bus_n_{addr,size}_cells() public]
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c    |  2 ++
 drivers/of/base.c       | 32 ++++++++++++++++++++++----------
 drivers/of/of_private.h |  3 +++
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 3fd34f7ad772..887c0413f648 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -14,6 +14,8 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#include "of_private.h"
+
 /* Max address size we deal with */
 #define OF_MAX_ADDR_CELLS	4
 #define OF_CHECK_ADDR_COUNT(na)	((na) > 0 && (na) <= OF_MAX_ADDR_CELLS)
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 55e7f5bb0549..12b2e9287117 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -86,34 +86,46 @@ static bool __of_node_is_type(const struct device_node *np, const char *type)
 	return np && match && type && !strcmp(match, type);
 }
 
-int of_n_addr_cells(struct device_node *np)
+int of_bus_n_addr_cells(struct device_node *np)
 {
 	u32 cells;
 
-	do {
-		if (np->parent)
-			np = np->parent;
+	for (; np; np = np->parent)
 		if (!of_property_read_u32(np, "#address-cells", &cells))
 			return cells;
-	} while (np->parent);
+
 	/* No #address-cells property for the root node */
 	return OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
 }
+
+int of_n_addr_cells(struct device_node *np)
+{
+	if (np->parent)
+		np = np->parent;
+
+	return of_bus_n_addr_cells(np);
+}
 EXPORT_SYMBOL(of_n_addr_cells);
 
-int of_n_size_cells(struct device_node *np)
+int of_bus_n_size_cells(struct device_node *np)
 {
 	u32 cells;
 
-	do {
-		if (np->parent)
-			np = np->parent;
+	for (; np; np = np->parent)
 		if (!of_property_read_u32(np, "#size-cells", &cells))
 			return cells;
-	} while (np->parent);
+
 	/* No #size-cells property for the root node */
 	return OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
 }
+
+int of_n_size_cells(struct device_node *np)
+{
+	if (np->parent)
+		np = np->parent;
+
+	return of_bus_n_size_cells(np);
+}
 EXPORT_SYMBOL(of_n_size_cells);
 
 #ifdef CONFIG_NUMA
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index f8c58615c393..66294d29942a 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -158,6 +158,9 @@ extern void __of_sysfs_remove_bin_file(struct device_node *np,
 #define for_each_transaction_entry_reverse(_oft, _te) \
 	list_for_each_entry_reverse(_te, &(_oft)->te_list, node)
 
+extern int of_bus_n_addr_cells(struct device_node *np);
+extern int of_bus_n_size_cells(struct device_node *np);
+
 #ifdef CONFIG_OF_ADDRESS
 extern int of_dma_get_range(struct device_node *np, u64 *dma_addr,
 			    u64 *paddr, u64 *size);
-- 
2.20.1
