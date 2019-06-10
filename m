From: Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v7 09/21] iommu/mediatek: Refine protect memory definition
Date: Mon, 10 Jun 2019 20:17:48 +0800
Message-ID: <1560169080-27134-10-git-send-email-yong.wu@mediatek.com>
References: <1560169080-27134-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560169080-27134-1-git-send-email-yong.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Will Deacon <will.deacon@arm.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, yingjoe.chen@mediatek.com, yong.wu@mediatek.com, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The protect memory setting is a little different in the different SoCs.
In the register REG_MMU_CTRL_REG(0x110), the TF_PROT(translation fault
protect) shift bit is normally 4 while it shift 5 bits only in the
mt8173. This patch delete the complex MACRO and use a common if-else
instead.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 drivers/iommu/mtk_iommu.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index ad838b9..d38dfa2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -52,12 +52,9 @@
 #define REG_MMU_DCM_DIS				0x050
 
 #define REG_MMU_CTRL_REG			0x110
+#define F_MMU_TF_PROT_TO_PROGRAM_ADDR		(2 << 4)
 #define F_MMU_PREFETCH_RT_REPLACE_MOD		BIT(4)
-#define F_MMU_TF_PROTECT_SEL_SHIFT(data) \
-	((data)->plat_data->m4u_plat == M4U_MT2712 ? 4 : 5)
-/* It's named by F_MMU_TF_PROT_SEL in mt2712. */
-#define F_MMU_TF_PROTECT_SEL(prot, data) \
-	(((prot) & 0x3) << F_MMU_TF_PROTECT_SEL_SHIFT(data))
+#define F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173	(2 << 5)
 
 #define REG_MMU_IVRP_PADDR			0x114
 
@@ -519,9 +516,11 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 		return ret;
 	}
 
-	regval = F_MMU_TF_PROTECT_SEL(2, data);
 	if (data->plat_data->m4u_plat == M4U_MT8173)
-		regval |= F_MMU_PREFETCH_RT_REPLACE_MOD;
+		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
+			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
+	else
+		regval = F_MMU_TF_PROT_TO_PROGRAM_ADDR;
 	writel_relaxed(regval, data->base + REG_MMU_CTRL_REG);
 
 	regval = F_L2_MULIT_HIT_EN |
-- 
1.9.1
