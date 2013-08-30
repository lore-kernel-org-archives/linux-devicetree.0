From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] of/platform: add error reporting to of_amba_device_create()
Date: Fri, 30 Aug 2013 13:17:29 +0200
Message-ID: <2891140.lVrJfIiCi5@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add error reporting to of_amba_device_create() so the user knows
when (and why) some device tree nodes fail to initialize.

[ The issue was spotted on Universal C210 board (using revision 0 of
  ARM Exynos4210 SoC) on which initialization was silently failing
  for PL330 MDMA1 device tree node (it was using the wrong addres
  resulting in amba_device_add() returning -ENODEV). ]

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
v2:
* don't change the return value
* don't change the user of of_amba_device_create()

 drivers/of/platform.c |   19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

Index: b/drivers/of/platform.c
===================================================================
--- a/drivers/of/platform.c	2013-08-29 17:04:38.227921054 +0200
+++ b/drivers/of/platform.c	2013-08-30 13:13:31.202813954 +0200
@@ -268,8 +268,11 @@ static struct amba_device *of_amba_devic
 		return NULL;
 
 	dev = amba_device_alloc(NULL, 0, 0);
-	if (!dev)
+	if (!dev) {
+		pr_err("%s(): amba_device_alloc() failed for %s\n",
+		       __func__, node->full_name);
 		return NULL;
+	}
 
 	/* setup generic device info */
 	dev->dev.coherent_dma_mask = ~0;
@@ -294,12 +297,18 @@ static struct amba_device *of_amba_devic
 		dev->irq[i] = irq_of_parse_and_map(node, i);
 
 	ret = of_address_to_resource(node, 0, &dev->res);
-	if (ret)
+	if (ret) {
+		pr_err("%s(): of_address_to_resource() failed (%d) for %s\n",
+		       __func__, ret, node->full_name);
 		goto err_free;
+	}
 
 	ret = amba_device_add(dev, &iomem_resource);
-	if (ret)
+	if (ret) {
+		pr_err("%s(): amba_device_add() failed (%d) for %s\n",
+		       __func__, ret, node->full_name);
 		goto err_free;
+	}
 
 	return dev;
 
@@ -378,6 +387,10 @@ static int of_platform_bus_create(struct
 	}
 
 	if (of_device_is_compatible(bus, "arm,primecell")) {
+		/*
+		 * Don't return an error here to keep compatibility with older
+		 * device tree files.
+		 */
 		of_amba_device_create(bus, bus_id, platform_data, parent);
 		return 0;
 	}
