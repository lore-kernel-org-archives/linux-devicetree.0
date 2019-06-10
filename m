From: Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v2 02/12] iommu/mediatek: Add probe_defer for smi-larb
Date: Mon, 10 Jun 2019 20:55:03 +0800
Message-ID: <1560171313-28299-3-git-send-email-yong.wu@mediatek.com>
References: <1560171313-28299-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560171313-28299-1-git-send-email-yong.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@google.com>, Will Deacon <will.deacon@arm.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, yingjoe.chen@mediatek.com, yong.wu@mediatek.com, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com
List-Id: devicetree@vger.kernel.org

The iommu consumer should use device_link to connect with the
smi-larb(supplier). then the smi-larb should run before the iommu
consumer. Here we delay the iommu driver until the smi driver is
ready, then all the iommu consumer always is after the smi driver.

When there is no this patch, if some consumer drivers run before
smi-larb, the supplier link_status is DL_DEV_NO_DRIVER(0) in the
device_link_add, then device_links_driver_bound will use WARN_ON
to complain that the link_status of supplier is not right.

This is a preparing patch for adding device_link.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c    | 2 +-
 drivers/iommu/mtk_iommu_v1.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6fe3369..f7599d8 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -664,7 +664,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			id = i;
 
 		plarbdev = of_find_device_by_node(larbnode);
-		if (!plarbdev) {
+		if (!plarbdev || !plarbdev->dev.driver) {
 			of_node_put(larbnode);
 			return -EPROBE_DEFER;
 		}
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 0b0908c..c43c4a0 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -604,7 +604,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			plarbdev = of_platform_device_create(
 						larb_spec.np, NULL,
 						platform_bus_type.dev_root);
-			if (!plarbdev) {
+			if (!plarbdev || !plarbdev->dev.driver) {
 				of_node_put(larb_spec.np);
 				return -EPROBE_DEFER;
 			}
-- 
1.9.1
