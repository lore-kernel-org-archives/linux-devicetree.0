From: Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v8 05/21] iommu/mediatek: Fix iova_to_phys PA start for 4GB mode
Date: Sat, 29 Jun 2019 10:09:11 +0800
Message-ID: <1561774167-24141-6-git-send-email-yong.wu@mediatek.com>
References: <1561774167-24141-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561774167-24141-1-git-send-email-yong.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Will Deacon <will.deacon@arm.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, yingjoe.chen@mediatek.com, yong.wu@mediatek.com, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

In the 4GB mode, the physical address is remapped,

Here is the detailed remap relationship.
CPU PA         ->    HW PA
0x4000_0000          0x1_4000_0000 (Add bit32)
0x8000_0000          0x1_8000_0000 ...
0xc000_0000          0x1_c000_0000 ...
0x1_0000_0000        0x1_0000_0000 (No change)

The PA in the iova_to_phys that is got from v7s always is u32, But
from the CPU point of view, PA should add BIT(32) when PA < 0x4000_0000.

Fixes: 30e2fccf9512 ("iommu/mediatek: Enlarge the validate PA range
for 4GB mode")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 1ddb2b7..fefc2e0 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -115,6 +115,19 @@ struct mtk_iommu_domain {
 
 static const struct iommu_ops mtk_iommu_ops;
 
+/*
+ * In M4U 4GB mode, the physical address is remapped as below:
+ *  CPU PA         ->   M4U HW PA
+ *  0x4000_0000         0x1_4000_0000 (Add bit32)
+ *  0x8000_0000         0x1_8000_0000 ...
+ *  0xc000_0000         0x1_c000_0000 ...
+ *  0x1_0000_0000       0x1_0000_0000 (No change)
+ *
+ * The PA in the iova_to_phys that is got from v7s always is u32, But from
+ * the CPU point of view, PA should add BIT(32) when PA < 0x4000_0000.
+ */
+#define MTK_IOMMU_4GB_MODE_REMAP_BASE	 0x40000000
+
 static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
 
 #define for_each_m4u(data)	list_for_each_entry(data, &m4ulist, list)
@@ -409,7 +422,7 @@ static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
 	pa = dom->iop->iova_to_phys(dom->iop, iova);
 	spin_unlock_irqrestore(&dom->pgtlock, flags);
 
-	if (data->enable_4GB)
+	if (data->enable_4GB && pa < MTK_IOMMU_4GB_MODE_REMAP_BASE)
 		pa |= BIT_ULL(32);
 
 	return pa;
-- 
1.9.1
