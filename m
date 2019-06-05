From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v3, 22/27] drm/mediatek: distinguish ovl and ovl_2l by layer_nr
Date: Wed, 5 Jun 2019 19:43:01 +0800
Message-ID: <1559734986-7379-23-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

distinguish ovl and ovl_2l by layer_nr when get comp
id

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index b5a9907..63072d1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -327,7 +327,12 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_OVL);
+	priv->data = of_device_get_match_data(dev);
+
+	comp_id = mtk_ddp_comp_get_id(dev->of_node,
+				      priv->data->layer_nr == 4 ?
+				      MTK_DISP_OVL :
+				      MTK_DISP_OVL_2L);
 	if (comp_id < 0) {
 		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
 		return comp_id;
@@ -340,8 +345,6 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	priv->data = of_device_get_match_data(dev);
-
 	platform_set_drvdata(pdev, priv);
 
 	ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
-- 
1.8.1.1.dirty
