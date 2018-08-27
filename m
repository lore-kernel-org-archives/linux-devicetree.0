From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 5/9] mtd: nand: atmel: fix OF child-node lookup
Date: Mon, 27 Aug 2018 10:21:49 +0200
Message-ID: <20180827082153.22537-6-johan@kernel.org>
References: <20180827082153.22537-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827082153.22537-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Josh Wu <rainyfeeling@outlook.com>, Boris Brezillon <boris.brezillon@bootlin.com>
List-Id: devicetree@vger.kernel.org

Use the new of_get_compatible_child() helper to lookup the nfc child
node instead of using of_find_compatible_node(), which searches the
entire tree from a given start node and thus can return an unrelated
(i.e. non-child) node.

This also addresses a potential use-after-free (e.g. after probe
deferral) as the tree-wide helper drops a reference to its first
argument (i.e. the node of the device being probed).

While at it, also fix a related nfc-node reference leak.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: stable <stable@vger.kernel.org>     # 4.11
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Josh Wu <rainyfeeling@outlook.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index a068b214ebaa..d3dfe63956ac 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2061,8 +2061,7 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 	int ret;
 
 	nand_np = dev->of_node;
-	nfc_np = of_find_compatible_node(dev->of_node, NULL,
-					 "atmel,sama5d3-nfc");
+	nfc_np = of_get_compatible_child(dev->of_node, "atmel,sama5d3-nfc");
 
 	nc->clk = of_clk_get(nfc_np, 0);
 	if (IS_ERR(nc->clk)) {
@@ -2472,15 +2471,19 @@ static int atmel_nand_controller_probe(struct platform_device *pdev)
 	}
 
 	if (caps->legacy_of_bindings) {
+		struct device_node *nfc_node;
 		u32 ale_offs = 21;
 
 		/*
 		 * If we are parsing legacy DT props and the DT contains a
 		 * valid NFC node, forward the request to the sama5 logic.
 		 */
-		if (of_find_compatible_node(pdev->dev.of_node, NULL,
-					    "atmel,sama5d3-nfc"))
+		nfc_node = of_get_compatible_child(pdev->dev.of_node,
+						   "atmel,sama5d3-nfc");
+		if (nfc_node) {
 			caps = &atmel_sama5_nand_caps;
+			of_node_put(nfc_node);
+		}
 
 		/*
 		 * Even if the compatible says we are dealing with an
-- 
2.18.0
