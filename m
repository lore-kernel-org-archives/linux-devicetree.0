From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH v13 10/12] drm/mediatek: add non-continuous clock mode and EOT packet control
Date: Fri, 31 Mar 2017 19:30:37 +0800
Message-ID: <1490959839-39816-11-git-send-email-yt.shen@mediatek.com>
References: <1490959839-39816-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490959839-39816-1-git-send-email-yt.shen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, yingjoe.chen@mediatek.com, emil.l.velikov@gmail.com, thierry.reding@gmail.com, Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>, shaoming chen <shaoming.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch will update dsi clock control method.
1. dsi non-continue clock mode will enhance antistatic effect for panel
2. EOT packet control will judge whether dsi send end of packet or not
by customize

Signed-off-by: shaoming chen <shaoming.chen@mediatek.com>
Signed-off-by: YT Shen <yt.shen@mediatek.com>
Acked-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 2e2cc3a..09528e2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -431,6 +431,9 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 		break;
 	}
 
+	tmp_reg |= (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) << 6;
+	tmp_reg |= (dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET) >> 3;
+
 	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
 }
 
-- 
1.9.1
