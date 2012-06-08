From: Jia Hongtao <B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH V3 5/6] Avoid duplicate probe for of platform devices
Date: Fri, 8 Jun 2012 17:43:05 +0800
Message-ID: <1339148585-16947-1-git-send-email-B38951@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: b38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

We changed the pcie controller driver to platform driver so that the PCI
of platform devices need to be created earlier in the arch_initcall stage
according to the original timing of calling fsl_add_bridge(). So we do PCI
probing separately from other devices. But probing more than once could
cause duplication warning. We add check if the devices have already probed
before probing any devices to avoid duplication warning.

Signed-off-by: Jia Hongtao <B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/of/platform.c |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index a37330e..3aab01f 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -139,6 +139,18 @@ struct platform_device *of_device_alloc(struct device_node *np,
 	if (!dev)
 		return NULL;
 
+	dev->dev.of_node = of_node_get(np);
+	if (bus_id)
+		dev_set_name(&dev->dev, "%s", bus_id);
+	else
+		of_device_make_bus_id(&dev->dev);
+
+	if (kset_find_obj(dev->dev.kobj.kset, kobject_name(&dev->dev.kobj))) {
+		kfree(dev);
+		of_node_put(np);
+		return NULL;
+	}
+
 	/* count the io and irq resources */
 	while (of_address_to_resource(np, num_reg, &temp_res) == 0)
 		num_reg++;
@@ -161,17 +173,11 @@ struct platform_device *of_device_alloc(struct device_node *np,
 		WARN_ON(of_irq_to_resource_table(np, res, num_irq) != num_irq);
 	}
 
-	dev->dev.of_node = of_node_get(np);
 #if defined(CONFIG_MICROBLAZE)
 	dev->dev.dma_mask = &dev->archdata.dma_mask;
 #endif
 	dev->dev.parent = parent;
 
-	if (bus_id)
-		dev_set_name(&dev->dev, "%s", bus_id);
-	else
-		of_device_make_bus_id(&dev->dev);
-
 	return dev;
 }
 EXPORT_SYMBOL(of_device_alloc);
-- 
1.7.5.1
