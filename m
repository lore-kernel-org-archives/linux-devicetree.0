From: Rob Herring <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH v5] drivers/amba: create devices from device tree
Date: Fri, 10 Jun 2011 17:26:42 -0600
Message-ID: <20110610232246.30375.44324.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a function to create amba_devices (i.e. primecell peripherals)
from device tree nodes. The device tree scanning is done by the
of_platform_populate() function which can call of_amba_device_create
based on a match table entry.

Nodes with a "arm,primecell-periphid" property can override the h/w
peripheral id value.

Based on the original work by Jeremy Kerr.

v5: - restored Jeremy's original s-o-b line
    - changed to using arm,primecell compatible value
    - moved all code to driver/of/platform.c so platform and amba
      devices are created in the same way.
(v4 was posted by Rob Herring)

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
[grant.likely: add Jeremy's original s-o-b line, changes from review
               comments, and moved all code to drivers/of/platform.c]
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

Hey Rob.  I took a good look at the patches you posted, and how all
this stuff was being done, and it turns out to be a lot less impact if
all of it is rolled into driver/of/platform.c.  Take a look and let me
know what you think.

g.

 .../devicetree/bindings/arm/primecell.txt          |   21 +++++++
 drivers/of/platform.c                              |   58 ++++++++++++++++++++
 2 files changed, 79 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/primecell.txt

diff --git a/Documentation/devicetree/bindings/arm/primecell.txt b/Documentation/devicetree/bindings/arm/primecell.txt
new file mode 100644
index 0000000..1d5d7a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/primecell.txt
@@ -0,0 +1,21 @@
+* ARM Primecell Peripherals
+
+ARM, Ltd. Primecell peripherals have a standard id register that can be used to
+identify the peripheral type, vendor, and revision. This value can be used for
+driver matching.
+
+Required properties:
+
+- compatible : should be a specific value for peripheral and "arm,primecell"
+
+Optional properties:
+
+- arm,primecell-periphid : Value to override the h/w value with
+
+Example:
+
+serial@fff36000 {
+	compatible = "arm,pl011", "arm,primecell";
+	arm,primecell-periphid = <0x00341011>;
+};
+
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 899e959..acb7f98 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -13,6 +13,7 @@
  */
 #include <linux/errno.h>
 #include <linux/module.h>
+#include <linux/amba/bus.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
@@ -210,6 +211,58 @@ struct platform_device *of_platform_device_create(struct device_node *np,
 }
 EXPORT_SYMBOL(of_platform_device_create);
 
+#ifdef CONFIG_ARM_AMBA
+static struct amba_device *of_amba_device_create(struct device_node *node,
+						 struct device *parent)
+{
+	struct amba_device *dev;
+	const void *prop;
+	int i, ret;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return NULL;
+
+	/* setup generic device info */
+	dev->dev.coherent_dma_mask = ~0;
+	dev->dev.of_node = of_node_get(node);
+	dev->dev.parent = parent;
+	of_device_make_bus_id(&dev->dev);
+
+	/* setup amba-specific device info */
+	dev->dma_mask = ~0;
+
+	/* Allow the HW Peripheral ID to be overridden */
+	prop = of_get_property(node, "arm,primecell-periphid", NULL);
+	if (prop)
+		dev->periphid = of_read_ulong(prop, 1);
+
+	/* Decode the IRQs and address ranges */
+	for (i = 0; i < AMBA_NR_IRQS; i++)
+		dev->irq[i] = irq_of_parse_and_map(node, i);
+
+	ret = of_address_to_resource(node, 0, &dev->res);
+	if (ret)
+		goto err_free;
+
+	ret = amba_device_register(dev, &iomem_resource);
+	if (ret)
+		goto err_free;
+
+	return dev;
+
+err_free:
+	kfree(dev);
+	return NULL;
+}
+#else /* CONFIG_ARM_AMBA */
+static struct amba_device *of_amba_device_create(struct device_node *node,
+						 struct device *parent)
+{
+	return NULL;
+}
+#endif /* CONFIG_ARM_AMBA */
+
 struct of_platform_prepare_data {
 	struct list_head list;
 	struct device_node *node;
@@ -463,6 +516,11 @@ static int of_platform_bus_create(struct device_node *bus,
 		return 0;
 	}
 
+	if (of_device_is_compatible(bus, "arm,primecell")) {
+		of_amba_device_create(bus, parent);
+		return 0;
+	}
+
 	dev = of_platform_device_create(bus, NULL, parent);
 	if (!dev || !of_match_node(matches, bus))
 		return 0;
