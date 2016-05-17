From: Jan Viktorin <viktorin@rehivetech.com>
Subject: [PATCH 4/4] uio: bind uio_pdrv_genirq via OF
Date: Tue, 17 May 2016 11:22:20 +0200
Message-ID: <1463476940-26791-5-git-send-email-viktorin@rehivetech.com>
References: <1463476940-26791-1-git-send-email-viktorin@rehivetech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463476940-26791-1-git-send-email-viktorin@rehivetech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jan Viktorin <viktorin@rehivetech.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

The uio_dmem_genirq works in a similar way as uio_pdrv_genirq now.
It accepts the of_id module parameter to bind to a specific device.
The information about dynamic memory is obtained from OF.

This patch implements the two OF bindings:

 * uio,number-of-dynamic-regions
 * uio,dynamic-regions-sizes

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 drivers/uio/uio_dmem_genirq.c | 76 +++++++++++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 18 deletions(-)

diff --git a/drivers/uio/uio_dmem_genirq.c b/drivers/uio/uio_dmem_genirq.c
index 945515d..ade650a 100644
--- a/drivers/uio/uio_dmem_genirq.c
+++ b/drivers/uio/uio_dmem_genirq.c
@@ -144,29 +144,70 @@ static int uio_dmem_genirq_irqcontrol(struct uio_info *dev_info, s32 irq_on)
 	return 0;
 }
 
+static int uio_dmem_genirq_alloc_platdata(struct platform_device *pdev)
+{
+	struct uio_dmem_genirq_pdata pdata;
+	u32 regions;
+	u32 sizes[MAX_UIO_MAPS];
+	int ret;
+
+	memset(&pdata, 0, sizeof(pdata));
+
+	ret = of_property_read_u32(pdev->dev.of_node,
+		"uio,number-of-dynamic-regions", &regions);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Missing property uio,number-of-dynamic-regions\n");
+		return ret;
+	}
+
+	regions = min_t(u32, regions, MAX_UIO_MAPS);
+
+	ret = of_property_read_u32_array(pdev->dev.of_node,
+		"uio,dynamic-regions-sizes", sizes, regions);
+	if (ret) {
+		dev_err(&pdev->dev, "Missing or invalid property "
+			"uio,dynamic-regions-sizes\n");
+		return ret;
+	}
+
+	pdata.dynamic_region_sizes = devm_kzalloc(&pdev->dev,
+			sizeof(*pdata.dynamic_region_sizes) *
+			pdata.num_dynamic_regions, GFP_KERNEL);
+	if (!pdata.dynamic_region_sizes) {
+		dev_err(&pdev->dev, "Unable to alloc dynamic_region_sizes\n");
+		ret = -ENOMEM;
+		return ret;
+	}
+
+	pdata.num_dynamic_regions = regions;
+	while (regions--)
+		pdata.dynamic_region_sizes[regions] = sizes[regions];
+
+	pdata.uioinfo.name = pdev->dev.of_node->name;
+	pdata.uioinfo.version = "devicetree";
+
+	return platform_device_add_data(pdev, &pdata, sizeof(pdata));
+}
+
 static int uio_dmem_genirq_probe(struct platform_device *pdev)
 {
-	struct uio_dmem_genirq_pdata *pdata = dev_get_platdata(&pdev->dev);
-	struct uio_info *uioinfo = &pdata->uioinfo;
+	struct uio_dmem_genirq_pdata *pdata;
+	struct uio_info *uioinfo;
 	struct uio_dmem_genirq_platdata *priv;
 	struct uio_mem *uiomem;
 	int ret = -EINVAL;
 	int i;
 
 	if (pdev->dev.of_node) {
-		int irq;
-
-		/* alloc uioinfo for one device */
-		uioinfo = kzalloc(sizeof(*uioinfo), GFP_KERNEL);
-		if (!uioinfo) {
-			ret = -ENOMEM;
-			dev_err(&pdev->dev, "unable to kmalloc\n");
+		ret = uio_dmem_genirq_alloc_platdata(pdev);
+		if (ret)
 			goto bad2;
-		}
-		uioinfo->name = pdev->dev.of_node->name;
-		uioinfo->version = "devicetree";
 	}
 
+	pdata = dev_get_platdata(&pdev->dev);
+	uioinfo = &pdata->uioinfo;
+
 	if (!uioinfo || !uioinfo->name || !uioinfo->version) {
 		dev_err(&pdev->dev, "missing platform_data\n");
 		goto bad0;
@@ -298,10 +339,6 @@ static int uio_dmem_genirq_remove(struct platform_device *pdev)
 	priv->uioinfo->handler = NULL;
 	priv->uioinfo->irqcontrol = NULL;
 
-	/* kfree uioinfo for OF */
-	if (pdev->dev.of_node)
-		kfree(priv->uioinfo);
-
 	kfree(priv);
 	return 0;
 }
@@ -329,10 +366,13 @@ static const struct dev_pm_ops uio_dmem_genirq_dev_pm_ops = {
 };
 
 #ifdef CONFIG_OF
-static const struct of_device_id uio_of_genirq_match[] = {
-	{ /* empty for now */ },
+static struct of_device_id uio_of_genirq_match[] = {
+	{ /* This is filled with module_parm */ },
+	{ /* end of list */ },
 };
 MODULE_DEVICE_TABLE(of, uio_of_genirq_match);
+module_param_string(of_id, uio_of_genirq_match[0].compatible, 128, 0);
+MODULE_PARM_DESC(of_id, "Openfirmware id of the device to be handled by uio");
 #endif
 
 static struct platform_driver uio_dmem_genirq = {
-- 
2.8.0
