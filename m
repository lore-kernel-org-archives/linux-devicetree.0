From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH 01/17] of: add dma-mask binding
Date: Mon, 12 Nov 2012 16:52:21 +0800
Message-ID: <1352710357-3265-2-git-send-email-wenyou.yang@atmel.com>
References: <1352710357-3265-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1352710357-3265-1-git-send-email-wenyou.yang@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: JM.Lin@atmel.com, nicolas.ferre@atmel.com, rob.herring@calxeda.com, wenyou.yang@atmel.com, grant.likely@secretlab.ca, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

This will allow each device to specify its dma-mask for this we use the
coherent_dma_mask as pointer. By default the dma-mask will be set to
DMA_BIT_MASK(32).
The microblaze architecture hook is drop

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: grant.likely@secretlab.ca
Cc: rob.herring@calxeda.com
Cc: devicetree-discuss@lists.ozlabs.org
---
 drivers/of/platform.c |   23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index b80891b..31ed405 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -130,6 +130,21 @@ void of_device_make_bus_id(struct device *dev)
 	dev_set_name(dev, "%s.%d", node->name, magic - 1);
 }
 
+static void of_get_dma_mask(struct device *dev, struct device_node *np)
+{
+	const __be32 *prop;
+	int len;
+
+	prop = of_get_property(np, "dma-mask", &len);
+
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	if (!prop)
+		dev->coherent_dma_mask = DMA_BIT_MASK(32);
+	else
+		dev->coherent_dma_mask = of_read_number(prop, len / 4);
+}
+
 /**
  * of_device_alloc - Allocate and initialize an of_device
  * @np: device node to assign to device
@@ -171,10 +186,8 @@ struct platform_device *of_device_alloc(struct device_node *np,
 		WARN_ON(of_irq_to_resource_table(np, res, num_irq) != num_irq);
 	}
 
+	of_get_dma_mask(&dev->dev, np);
 	dev->dev.of_node = of_node_get(np);
-#if defined(CONFIG_MICROBLAZE)
-	dev->dev.dma_mask = &dev->archdata.dma_mask;
-#endif
 	dev->dev.parent = parent;
 
 	if (bus_id)
@@ -211,10 +224,6 @@ struct platform_device *of_platform_device_create_pdata(
 	if (!dev)
 		return NULL;
 
-#if defined(CONFIG_MICROBLAZE)
-	dev->archdata.dma_mask = 0xffffffffUL;
-#endif
-	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 	dev->dev.bus = &platform_bus_type;
 	dev->dev.platform_data = platform_data;
 
-- 
1.7.9.5
