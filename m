From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v3 1/2] drivers/amba: create devices from device tree
Date: Wed, 25 May 2011 16:31:12 -0500
Message-ID: <1306359073-16274-2-git-send-email-robherring2@gmail.com>
References: <1306359073-16274-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1306359073-16274-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Add a function to create amba bus devices (i.e. primecell peripherals) from
device tree nodes. The device tree scanning is done by
of_platform_probe/populate functions which can call of_amba_device_create
based on a match table entry.

Nodes with a "arm,amba-deviceid" property can override the h/w peripheral id
value.

Based on the original work by Jeremy Kerr.

Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 drivers/amba/bus.c       |   51 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/amba/bus.h |    5 ++++
 2 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index 7025593..6438ffd 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -13,6 +13,11 @@
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/amba/bus.h>
@@ -780,3 +785,49 @@ EXPORT_SYMBOL(amba_device_unregister);
 EXPORT_SYMBOL(amba_find_device);
 EXPORT_SYMBOL(amba_request_regions);
 EXPORT_SYMBOL(amba_release_regions);
+
+#ifdef CONFIG_OF
+int of_amba_device_create(struct device_node *node, struct device *parent)
+{
+	struct amba_device *dev;
+	const void *prop;
+	int i, ret;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	/* setup generic device info */
+	dev->dev.coherent_dma_mask = ~0;
+	dev->dev.of_node = node;
+	dev->dev.parent = parent;
+	of_device_make_bus_id(&dev->dev);
+
+	/* setup amba-specific device info */
+	dev->dma_mask = ~0;
+
+	/* Allow the arm,amba-deviceid value to override the h/w value */
+	prop = of_get_property(node, "arm,amba-deviceid", NULL);
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
+	return 0;
+
+err_free:
+	kfree(dev);
+	return ret;
+}
+
+#endif /* CONFIG_OF */
diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
index fcbbe71..08349c3 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -94,4 +94,9 @@ void amba_release_regions(struct amba_device *);
 #define amba_manf(d)	AMBA_MANF_BITS((d)->periphid)
 #define amba_part(d)	AMBA_PART_BITS((d)->periphid)
 
+#ifdef CONFIG_OF
+struct device_node;
+int of_amba_device_create(struct device_node *node, struct device *parent);
+#endif
+
 #endif
-- 
1.7.4.1
