From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/2] uio/pdrv_genirq: Refactor probe routine to expose a
	generic part
Date: Fri, 12 Jun 2009 02:04:21 +0200
Message-ID: <1244765062-14144-2-git-send-email-w.sang@pengutronix.de>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1244765062-14144-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch refactors the probe routine, so that an of-version of a similiar
driver can pick it up later.

Signed-off-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans J. Koch <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
---
 drivers/uio/uio_pdrv_genirq.c   |   60 ++++++++++++++++++++------------------
 include/linux/uio_pdrv_genirq.h |   13 ++++++++
 2 files changed, 45 insertions(+), 28 deletions(-)
 create mode 100644 include/linux/uio_pdrv_genirq.h

diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
index 3f06818..8f8a0f9 100644
--- a/drivers/uio/uio_pdrv_genirq.c
+++ b/drivers/uio/uio_pdrv_genirq.c
@@ -20,15 +20,10 @@
 #include <linux/bitops.h>
 #include <linux/interrupt.h>
 #include <linux/stringify.h>
+#include <linux/uio_pdrv_genirq.h>
 
 #define DRIVER_NAME "uio_pdrv_genirq"
 
-struct uio_pdrv_genirq_platdata {
-	struct uio_info *uioinfo;
-	spinlock_t lock;
-	unsigned long flags;
-};
-
 static irqreturn_t uio_pdrv_genirq_handler(int irq, struct uio_info *dev_info)
 {
 	struct uio_pdrv_genirq_platdata *priv = dev_info->priv;
@@ -68,29 +63,18 @@ static int uio_pdrv_genirq_irqcontrol(struct uio_info *dev_info, s32 irq_on)
 	return 0;
 }
 
-static int uio_pdrv_genirq_probe(struct platform_device *pdev)
+int __uio_pdrv_genirq_probe(struct device *dev, struct uio_info *uioinfo,
+		struct resource *resources, unsigned int num_resources)
 {
-	struct uio_info *uioinfo = pdev->dev.platform_data;
 	struct uio_pdrv_genirq_platdata *priv;
 	struct uio_mem *uiomem;
-	int ret = -EINVAL;
-	int i;
-
-	if (!uioinfo || !uioinfo->name || !uioinfo->version) {
-		dev_err(&pdev->dev, "missing platform_data\n");
-		goto bad0;
-	}
-
-	if (uioinfo->handler || uioinfo->irqcontrol ||
-	    uioinfo->irq_flags & IRQF_SHARED) {
-		dev_err(&pdev->dev, "interrupt configuration error\n");
-		goto bad0;
-	}
+	unsigned int i;
+	int ret;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		ret = -ENOMEM;
-		dev_err(&pdev->dev, "unable to kmalloc\n");
+		dev_err(dev, "unable to kmalloc\n");
 		goto bad0;
 	}
 
@@ -100,14 +84,14 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
 
 	uiomem = &uioinfo->mem[0];
 
-	for (i = 0; i < pdev->num_resources; ++i) {
-		struct resource *r = &pdev->resource[i];
+	for (i = 0; i < num_resources; ++i) {
+		struct resource *r = resources + i;
 
 		if (r->flags != IORESOURCE_MEM)
 			continue;
 
 		if (uiomem >= &uioinfo->mem[MAX_UIO_MAPS]) {
-			dev_warn(&pdev->dev, "device has more than "
+			dev_warn(dev, "device has more than "
 					__stringify(MAX_UIO_MAPS)
 					" I/O memory resources.\n");
 			break;
@@ -138,19 +122,39 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
 	uioinfo->irqcontrol = uio_pdrv_genirq_irqcontrol;
 	uioinfo->priv = priv;
 
-	ret = uio_register_device(&pdev->dev, priv->uioinfo);
+	ret = uio_register_device(dev, priv->uioinfo);
 	if (ret) {
-		dev_err(&pdev->dev, "unable to register uio device\n");
+		dev_err(dev, "unable to register uio device\n");
 		goto bad1;
 	}
 
-	platform_set_drvdata(pdev, priv);
+	dev_set_drvdata(dev, priv);
 	return 0;
  bad1:
 	kfree(priv);
  bad0:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(__uio_pdrv_genirq_probe);
+
+static int uio_pdrv_genirq_probe(struct platform_device *pdev)
+{
+	struct uio_info *uioinfo = pdev->dev.platform_data;
+
+	if (!uioinfo || !uioinfo->name || !uioinfo->version) {
+		dev_err(&pdev->dev, "missing platform_data\n");
+		return -EINVAL;
+	}
+
+	if (uioinfo->handler || uioinfo->irqcontrol ||
+	    uioinfo->irq_flags & IRQF_SHARED) {
+		dev_err(&pdev->dev, "interrupt configuration error\n");
+		return -EINVAL;
+	}
+
+	return __uio_pdrv_genirq_probe(&pdev->dev, uioinfo, pdev->resource,
+			pdev->num_resources);
+}
 
 static int uio_pdrv_genirq_remove(struct platform_device *pdev)
 {
diff --git a/include/linux/uio_pdrv_genirq.h b/include/linux/uio_pdrv_genirq.h
new file mode 100644
index 0000000..a410390
--- /dev/null
+++ b/include/linux/uio_pdrv_genirq.h
@@ -0,0 +1,13 @@
+#ifndef _LINUX_UIO_PDRV_GENIRQ_H
+#define _LINUX_UIO_PDRV_GENIRQ_H
+
+struct uio_pdrv_genirq_platdata {
+	struct uio_info *uioinfo;
+	spinlock_t lock;
+	unsigned long flags;
+};
+
+extern int __uio_pdrv_genirq_probe(struct device *dev, struct uio_info *uioinfo,
+	struct resource *resources, unsigned int num_resources);
+
+#endif
-- 
1.6.3.1
