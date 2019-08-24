From: Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v11 18/23] iommu/mediatek: Add mmu1 support
Date: Sat, 24 Aug 2019 11:02:03 +0800
Message-ID: <1566615728-26388-19-git-send-email-yong.wu@mediatek.com>
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

Normally the M4U HW connect EMI with smi. the diagram is like below:
              EMI
               |
              M4U
               |
            smi-common
               |
       -----------------
       |    |    |     |    ...
    larb0 larb1  larb2 larb3

Actually there are 2 mmu cells in the M4U HW, like this diagram:

              EMI
           ---------
            |     |
           mmu0  mmu1     <- M4U
            |     |
           ---------
               |
            smi-common
               |
       -----------------
       |    |    |     |    ...
    larb0 larb1  larb2 larb3

This patch add support for mmu1. In order to get better performance,
we could adjust some larbs go to mmu1 while the others still go to
mmu0. This is controlled by a SMI COMMON register SMI_BUS_SEL(0x220).

mt2712, mt8173 and mt8183 M4U HW all have 2 mmu cells. the default
value of that register is 0 which means all the larbs go to mmu0
defaultly.

This is a preparing patch for adjusting SMI_BUS_SEL for mt8183.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/iommu/mtk_iommu.c | 46 +++++++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index ee3a664..470de8b 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -64,26 +64,32 @@
 #define F_INT_CLR_BIT				BIT(12)
 
 #define REG_MMU_INT_MAIN_CONTROL		0x124
-#define F_INT_TRANSLATION_FAULT			BIT(0)
-#define F_INT_MAIN_MULTI_HIT_FAULT		BIT(1)
-#define F_INT_INVALID_PA_FAULT			BIT(2)
-#define F_INT_ENTRY_REPLACEMENT_FAULT		BIT(3)
-#define F_INT_TLB_MISS_FAULT			BIT(4)
-#define F_INT_MISS_TRANSACTION_FIFO_FAULT	BIT(5)
-#define F_INT_PRETETCH_TRANSATION_FIFO_FAULT	BIT(6)
+						/* mmu0 | mmu1 */
+#define F_INT_TRANSLATION_FAULT			(BIT(0) | BIT(7))
+#define F_INT_MAIN_MULTI_HIT_FAULT		(BIT(1) | BIT(8))
+#define F_INT_INVALID_PA_FAULT			(BIT(2) | BIT(9))
+#define F_INT_ENTRY_REPLACEMENT_FAULT		(BIT(3) | BIT(10))
+#define F_INT_TLB_MISS_FAULT			(BIT(4) | BIT(11))
+#define F_INT_MISS_TRANSACTION_FIFO_FAULT	(BIT(5) | BIT(12))
+#define F_INT_PRETETCH_TRANSATION_FIFO_FAULT	(BIT(6) | BIT(13))
 
 #define REG_MMU_CPE_DONE			0x12C
 
 #define REG_MMU_FAULT_ST1			0x134
+#define F_REG_MMU0_FAULT_MASK			GENMASK(6, 0)
+#define F_REG_MMU1_FAULT_MASK			GENMASK(13, 7)
 
-#define REG_MMU_FAULT_VA			0x13c
+#define REG_MMU0_FAULT_VA			0x13c
 #define F_MMU_FAULT_VA_WRITE_BIT		BIT(1)
 #define F_MMU_FAULT_VA_LAYER_BIT		BIT(0)
 
-#define REG_MMU_INVLD_PA			0x140
-#define REG_MMU_INT_ID				0x150
-#define F_MMU0_INT_ID_LARB_ID(a)		(((a) >> 7) & 0x7)
-#define F_MMU0_INT_ID_PORT_ID(a)		(((a) >> 2) & 0x1f)
+#define REG_MMU0_INVLD_PA			0x140
+#define REG_MMU1_FAULT_VA			0x144
+#define REG_MMU1_INVLD_PA			0x148
+#define REG_MMU0_INT_ID				0x150
+#define REG_MMU1_INT_ID				0x154
+#define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
+#define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
 
 #define MTK_PROTECT_PA_ALIGN			128
 
@@ -226,13 +232,19 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 
 	/* Read error info from registers */
 	int_state = readl_relaxed(data->base + REG_MMU_FAULT_ST1);
-	fault_iova = readl_relaxed(data->base + REG_MMU_FAULT_VA);
+	if (int_state & F_REG_MMU0_FAULT_MASK) {
+		regval = readl_relaxed(data->base + REG_MMU0_INT_ID);
+		fault_iova = readl_relaxed(data->base + REG_MMU0_FAULT_VA);
+		fault_pa = readl_relaxed(data->base + REG_MMU0_INVLD_PA);
+	} else {
+		regval = readl_relaxed(data->base + REG_MMU1_INT_ID);
+		fault_iova = readl_relaxed(data->base + REG_MMU1_FAULT_VA);
+		fault_pa = readl_relaxed(data->base + REG_MMU1_INVLD_PA);
+	}
 	layer = fault_iova & F_MMU_FAULT_VA_LAYER_BIT;
 	write = fault_iova & F_MMU_FAULT_VA_WRITE_BIT;
-	fault_pa = readl_relaxed(data->base + REG_MMU_INVLD_PA);
-	regval = readl_relaxed(data->base + REG_MMU_INT_ID);
-	fault_larb = F_MMU0_INT_ID_LARB_ID(regval);
-	fault_port = F_MMU0_INT_ID_PORT_ID(regval);
+	fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+	fault_port = F_MMU_INT_ID_PORT_ID(regval);
 
 	fault_larb = data->plat_data->larbid_remap[fault_larb];
 
-- 
1.9.1
