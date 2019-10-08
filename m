From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2] of: Make of_dma_get_range() work on bus nodes
Date: Tue,  8 Oct 2019 14:43:00 -0500
Message-ID: <20191008194300.12626-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

From: Robin Murphy <robin.murphy@arm.com>

Since the "dma-ranges" property is only valid for a node representing a
bus, of_dma_get_range() currently assumes the node passed in is a leaf
representing a device, and starts the walk from its parent. In cases
like PCI host controllers on typical FDT systems, however, where the PCI
endpoints are probed dynamically the initial leaf node represents the
'bus' itself, and this logic means we fail to consider any "dma-ranges"
describing the host bridge itself. Rework the logic such that
of_dma_get_range() also works correctly starting from a bus node
containing "dma-ranges".

While this does mean "dma-ranges" could incorrectly be in a device leaf
node, there isn't really any way in this function to ensure that a leaf
node is or isn't a bus node.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
[robh: Allow for the bus child node to still be passed in]
Signed-off-by: Rob Herring <robh@kernel.org>

---
v2:
 - Ensure once we find dma-ranges, every parent has it.
 - Only get the #{size,address}-cells after we find non-empty dma-ranges
 - Add a check on the 'dma-ranges' length
---
 drivers/of/address.c | 44 ++++++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 5ce69d026584..99c1b8058559 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -930,47 +930,39 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 	const __be32 *ranges = NULL;
 	int len, naddr, nsize, pna;
 	int ret = 0;
+	bool found_dma_ranges = false;
 	u64 dmaaddr;
 
-	if (!node)
-		return -EINVAL;
-
-	while (1) {
-		struct device_node *parent;
-
-		naddr = of_n_addr_cells(node);
-		nsize = of_n_size_cells(node);
-
-		parent = __of_get_dma_parent(node);
-		of_node_put(node);
-
-		node = parent;
-		if (!node)
-			break;
-
+	while (node) {
 		ranges = of_get_property(node, "dma-ranges", &len);
 
 		/* Ignore empty ranges, they imply no translation required */
 		if (ranges && len > 0)
 			break;
 
-		/*
-		 * At least empty ranges has to be defined for parent node if
-		 * DMA is supported
-		 */
-		if (!ranges)
-			break;
+		/* Once we find 'dma-ranges', then a missing one is an error */
+		if (found_dma_ranges && !ranges) {
+			ret = -ENODEV;
+			goto out;
+		}
+		found_dma_ranges = true;
+
+		node = of_get_next_dma_parent(node);
 	}
 
-	if (!ranges) {
+	if (!node || !ranges) {
 		pr_debug("no dma-ranges found for node(%pOF)\n", np);
 		ret = -ENODEV;
 		goto out;
 	}
 
-	len /= sizeof(u32);
-
+	naddr = of_bus_n_addr_cells(node);
+	nsize = of_bus_n_size_cells(node);
 	pna = of_n_addr_cells(node);
+	if ((len / sizeof(__be32)) % (pna + naddr + nsize)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* dma-ranges format:
 	 * DMA addr	: naddr cells
@@ -978,7 +970,7 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 	 * size		: nsize cells
 	 */
 	dmaaddr = of_read_number(ranges, naddr);
-	*paddr = of_translate_dma_address(np, ranges);
+	*paddr = of_translate_dma_address(node, ranges + naddr);
 	if (*paddr == OF_BAD_ADDR) {
 		pr_err("translation of DMA address(%llx) to CPU address failed node(%pOF)\n",
 		       dmaaddr, np);
-- 
2.20.1
