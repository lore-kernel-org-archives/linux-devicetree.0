From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v5, 27/32] drm/mediatek: add connection from RDMA1 to DSI0
Date: Thu, 29 Aug 2019 22:50:49 +0800
Message-ID: <1567090254-15566-28-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add connection from RDMA1 to DSI0

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 03a46ec..aa6173b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -175,6 +175,7 @@ struct mtk_mmsys_reg_data {
 	u32 rdma0_sout_color0;
 	u32 rdma1_sout_sel_in;
 	u32 rdma1_sout_dpi0;
+	u32 rdma1_sout_dsi0;
 	u32 dpi0_sel_in;
 	u32 dpi0_sel_in_rdma1;
 	u32 dsi0_sel_in;
@@ -433,6 +434,9 @@ static unsigned int mtk_ddp_sout_sel(const struct mtk_mmsys_reg_data *data,
 	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_COLOR0) {
 		*addr = data->rdma0_sout_sel_in;
 		value = data->rdma0_sout_color0;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
+		*addr = data->rdma1_sout_sel_in;
+		value = data->rdma1_sout_dsi0;
 	} else {
 		value = 0;
 	}
-- 
1.8.1.1.dirty
