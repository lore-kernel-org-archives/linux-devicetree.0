From: Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v3 09/14] memory: mtk-smi: Get rid of mtk_smi_larb_get/put
Date: Tue, 3 Sep 2019 17:37:31 +0800
Message-ID: <1567503456-24725-10-git-send-email-yong.wu@mediatek.com>
References: <1567503456-24725-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567503456-24725-1-git-send-email-yong.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@google.com>, Will Deacon <will.deacon@arm.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, yong.wu@mediatek.com, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com, cui.zhang@mediatek.com, chao.hao@mediatek.com, ming-fan.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

After adding device_link between the iommu consumer and smi-larb,
the pm_runtime_get(_sync) of smi-larb and smi-common will be called
automatically. we can get rid of mtk_smi_larb_get/put.

CC: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 drivers/memory/mtk-smi.c   | 14 --------------
 include/soc/mediatek/smi.h | 20 --------------------
 2 files changed, 34 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 5dab56c..3df9036 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -125,20 +125,6 @@ static void mtk_smi_clk_disable(const struct mtk_smi *smi)
 	clk_disable_unprepare(smi->clk_apb);
 }
 
-int mtk_smi_larb_get(struct device *larbdev)
-{
-	int ret = pm_runtime_get_sync(larbdev);
-
-	return (ret < 0) ? ret : 0;
-}
-EXPORT_SYMBOL_GPL(mtk_smi_larb_get);
-
-void mtk_smi_larb_put(struct device *larbdev)
-{
-	pm_runtime_put_sync(larbdev);
-}
-EXPORT_SYMBOL_GPL(mtk_smi_larb_put);
-
 static int
 mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
 {
diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
index 5a34b87..f8bf595 100644
--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -20,26 +20,6 @@ struct mtk_smi_larb_iommu {
 	unsigned int   mmu;
 };
 
-/*
- * mtk_smi_larb_get: Enable the power domain and clocks for this local arbiter.
- *                   It also initialize some basic setting(like iommu).
- * mtk_smi_larb_put: Disable the power domain and clocks for this local arbiter.
- * Both should be called in non-atomic context.
- *
- * Returns 0 if successful, negative on failure.
- */
-int mtk_smi_larb_get(struct device *larbdev);
-void mtk_smi_larb_put(struct device *larbdev);
-
-#else
-
-static inline int mtk_smi_larb_get(struct device *larbdev)
-{
-	return 0;
-}
-
-static inline void mtk_smi_larb_put(struct device *larbdev) { }
-
 #endif
 
 #endif
-- 
1.9.1
