From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 22/22] iommu/mediatek: Use of_device_match()
Date: Mon,  6 Jun 2016 10:32:04 +0200
Message-ID: <20160606083204.19760-23-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the common implementation instead of the driver-private variant.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/mtk_iommu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index c036df1c49ca..80e7b7a79343 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -24,6 +24,7 @@
 #include <linux/iopoll.h>
 #include <linux/list.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_iommu.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
@@ -552,11 +553,6 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	return 0;
 }
 
-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static void release_of(struct device *dev, void *data)
 {
 	of_node_put(data);
@@ -647,7 +643,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		data->smi_imu.larb_imu[i].dev = &plarbdev->dev;
 
 		component_match_add_release(dev, &match, release_of,
-					    compare_of, larbnode);
+					    of_device_match, larbnode);
 	}
 
 	platform_set_drvdata(pdev, data);
-- 
2.8.3
