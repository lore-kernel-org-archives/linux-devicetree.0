From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v4, 27/33] drm/mediatek: add connection from RDMA0 to COLOR0
Date: Tue, 9 Jul 2019 06:34:07 +0800
Message-ID: <1562625253-29254-28-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add connection from RDMA0 to COLOR0

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index fe4a458..c87bc4c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -439,6 +439,9 @@ static unsigned int mtk_ddp_sout_sel(const struct mtk_mmsys_reg_data *data,
 	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
 		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
 		value = RDMA2_SOUT_DSI3;
+	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_COLOR0) {
+		*addr = data->rdma0_sout_sel_in;
+		value = data->rdma0_sout_color0;
 	} else {
 		value = 0;
 	}
-- 
1.8.1.1.dirty
