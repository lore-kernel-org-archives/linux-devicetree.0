From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v6 03/29] drm/mediatek: add ddp component AAL1
Date: Tue, 19 Jun 2018 15:34:04 +0800
Message-ID: <1529393670-26862-4-git-send-email-stu.hsieh@mediatek.com>
References: <1529393670-26862-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1529393670-26862-1-git-send-email-stu.hsieh@mediatek.com>
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

This patch add component AAL1 and
rename AAL to AAL0

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 3 ++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 3 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 47ffa240bd25..7217665f4b5d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -110,7 +110,7 @@ static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 };
 
 static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
-	[DDP_COMPONENT_AAL] = MT8173_MUTEX_MOD_DISP_AAL,
+	[DDP_COMPONENT_AAL0] = MT8173_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_COLOR0] = MT8173_MUTEX_MOD_DISP_COLOR0,
 	[DDP_COMPONENT_COLOR1] = MT8173_MUTEX_MOD_DISP_COLOR1,
 	[DDP_COMPONENT_GAMMA] = MT8173_MUTEX_MOD_DISP_GAMMA,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 4672317e3ad1..0919039805aa 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -218,7 +218,8 @@ struct mtk_ddp_comp_match {
 };
 
 static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
-	[DDP_COMPONENT_AAL]	= { MTK_DISP_AAL,	0, &ddp_aal },
+	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal },
+	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
 	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
 	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, NULL },
 	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, NULL },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 0828cf8bf85c..eee3c0cc2632 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -41,7 +41,8 @@ enum mtk_ddp_comp_type {
 };
 
 enum mtk_ddp_comp_id {
-	DDP_COMPONENT_AAL,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_AAL1,
 	DDP_COMPONENT_BLS,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_COLOR1,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a2ca90fc403c..a415260f3d5f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -149,7 +149,7 @@ static const enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {
 static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
-	DDP_COMPONENT_AAL,
+	DDP_COMPONENT_AAL0,
 	DDP_COMPONENT_OD,
 	DDP_COMPONENT_RDMA0,
 	DDP_COMPONENT_UFOE,
-- 
2.12.5
