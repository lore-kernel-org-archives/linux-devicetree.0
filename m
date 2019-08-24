From: Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v11 02/23] iommu/mediatek: Use a struct as the platform data
Date: Sat, 24 Aug 2019 11:01:47 +0800
Message-ID: <1566615728-26388-3-git-send-email-yong.wu@mediatek.com>
References: <1566615728-26388-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1566615728-26388-1-git-send-email-yong.wu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com, linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, yong.wu@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use a struct as the platform special data instead of the enumeration.
This is a prepare patch for adding mt8183 iommu support.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 drivers/iommu/mtk_iommu.c | 24 ++++++++++++++++--------
 drivers/iommu/mtk_iommu.h |  6 +++++-
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 82e4be4..c6e6dc3 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -46,7 +46,7 @@
 #define REG_MMU_CTRL_REG			0x110
 #define F_MMU_PREFETCH_RT_REPLACE_MOD		BIT(4)
 #define F_MMU_TF_PROTECT_SEL_SHIFT(data) \
-	((data)->m4u_plat == M4U_MT2712 ? 4 : 5)
+	((data)->plat_data->m4u_plat == M4U_MT2712 ? 4 : 5)
 /* It's named by F_MMU_TF_PROT_SEL in mt2712. */
 #define F_MMU_TF_PROTECT_SEL(prot, data) \
 	(((prot) & 0x3) << F_MMU_TF_PROTECT_SEL_SHIFT(data))
@@ -512,7 +512,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 
 	regval = F_MMU_TF_PROTECT_SEL(2, data);
-	if (data->m4u_plat == M4U_MT8173)
+	if (data->plat_data->m4u_plat == M4U_MT8173)
 		regval |= F_MMU_PREFETCH_RT_REPLACE_MOD;
 	writel_relaxed(regval, data->base + REG_MMU_CTRL_REG);
 
@@ -533,14 +533,14 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
 	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
 
-	if (data->m4u_plat == M4U_MT8173)
+	if (data->plat_data->m4u_plat == M4U_MT8173)
 		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
 	else
 		regval = lower_32_bits(data->protect_base) |
 			 upper_32_bits(data->protect_base);
 	writel_relaxed(regval, data->base + REG_MMU_IVRP_PADDR);
 
-	if (data->enable_4GB && data->m4u_plat != M4U_MT8173) {
+	if (data->enable_4GB && data->plat_data->m4u_plat != M4U_MT8173) {
 		/*
 		 * If 4GB mode is enabled, the validate PA range is from
 		 * 0x1_0000_0000 to 0x1_ffff_ffff. here record bit[32:30].
@@ -551,7 +551,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
 
 	/* It's MISC control register whose default value is ok except mt8173.*/
-	if (data->m4u_plat == M4U_MT8173)
+	if (data->plat_data->m4u_plat == M4U_MT8173)
 		writel_relaxed(0, data->base + REG_MMU_STANDARD_AXI_MODE);
 
 	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
@@ -584,7 +584,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 	data->dev = dev;
-	data->m4u_plat = (enum mtk_iommu_plat)of_device_get_match_data(dev);
+	data->plat_data = of_device_get_match_data(dev);
 
 	/* Protect memory. HW will access here while translation fault.*/
 	protect = devm_kzalloc(dev, MTK_PROTECT_PA_ALIGN * 2, GFP_KERNEL);
@@ -732,9 +732,17 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_iommu_suspend, mtk_iommu_resume)
 };
 
+static const struct mtk_iommu_plat_data mt2712_data = {
+	.m4u_plat     = M4U_MT2712,
+};
+
+static const struct mtk_iommu_plat_data mt8173_data = {
+	.m4u_plat     = M4U_MT8173,
+};
+
 static const struct of_device_id mtk_iommu_of_ids[] = {
-	{ .compatible = "mediatek,mt2712-m4u", .data = (void *)M4U_MT2712},
-	{ .compatible = "mediatek,mt8173-m4u", .data = (void *)M4U_MT8173},
+	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
+	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{}
 };
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 59337323..9725b08 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -32,6 +32,10 @@ enum mtk_iommu_plat {
 	M4U_MT8173,
 };
 
+struct mtk_iommu_plat_data {
+	enum mtk_iommu_plat m4u_plat;
+};
+
 struct mtk_iommu_domain;
 
 struct mtk_iommu_data {
@@ -48,7 +52,7 @@ struct mtk_iommu_data {
 	bool				tlb_flush_active;
 
 	struct iommu_device		iommu;
-	enum mtk_iommu_plat		m4u_plat;
+	const struct mtk_iommu_plat_data *plat_data;
 
 	struct list_head		list;
 };
-- 
1.9.1
