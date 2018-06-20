From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v7 07/29] drm/mediatek: add component DPI1
Date: Wed, 20 Jun 2018 16:19:09 +0800
Message-ID: <1529482771-2153-8-git-send-email-stu.hsieh@mediatek.com>
References: <1529482771-2153-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1529482771-2153-1-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch add the component DPI1

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 86e8c9e5df41..cc74b1a7278c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -224,6 +224,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, NULL },
 	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, NULL },
 	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, NULL },
+	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, NULL },
 	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, NULL },
 	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, NULL },
 	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
@@ -275,6 +276,7 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 
 	if (comp_id == DDP_COMPONENT_BLS ||
 	    comp_id == DDP_COMPONENT_DPI0 ||
+	    comp_id == DDP_COMPONENT_DPI1 ||
 	    comp_id == DDP_COMPONENT_DSI0 ||
 	    comp_id == DDP_COMPONENT_PWM0) {
 		comp->regs = NULL;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index e00c2e798abd..54c99c169093 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -47,6 +47,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_DPI0,
+	DDP_COMPONENT_DPI1,
 	DDP_COMPONENT_DSI0,
 	DDP_COMPONENT_DSI1,
 	DDP_COMPONENT_GAMMA,
-- 
2.12.5
