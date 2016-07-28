From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 04/10] drm/mediatek: update display module connections
Date: Thu, 28 Jul 2016 17:27:58 +0800
Message-ID: <1469698084-20185-5-git-send-email-yt.shen@mediatek.com>
References: <1469698084-20185-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469698084-20185-1-git-send-email-yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

update connections for OVL, RDMA, BLS, DSI

Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index b77d456..329da541 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -32,6 +32,10 @@
 #define DISP_REG_CONFIG_DISP_RDMA1_MOUT_EN	0x0c8
 #define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
 
+#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
+#define DISP_REG_CONFIG_OUT_SEL			0x04c
+#define DISP_REG_CONFIG_DSI_SEL			0x050
+
 #define DISP_REG_MUTEX_EN(n)	(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)	(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)	(0x28 + 0x20 * (n))
@@ -71,6 +75,10 @@
 #define DPI0_SEL_IN_RDMA1		0x1
 #define COLOR1_SEL_IN_OVL1		0x1
 
+#define OVL_MOUT_EN_RDMA		0x1
+#define BLS_TO_DSI_RDMA1_TO_DPI1	0x8
+#define DSI_SEL_IN_BLS			0x0
+
 struct mtk_disp_mutex {
 	int id;
 	bool claimed;
@@ -111,6 +119,9 @@ static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
 	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
 		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
 		value = OVL0_MOUT_EN_COLOR0;
+	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
+		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
+		value = OVL_MOUT_EN_RDMA;
 	} else if (cur == DDP_COMPONENT_OD && next == DDP_COMPONENT_RDMA0) {
 		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
 		value = OD_MOUT_EN_RDMA0;
@@ -148,6 +159,9 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
 	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
 		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
 		value = COLOR1_SEL_IN_OVL1;
+	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
+		*addr = DISP_REG_CONFIG_DSI_SEL;
+		value = DSI_SEL_IN_BLS;
 	} else {
 		value = 0;
 	}
@@ -155,6 +169,14 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
 	return value;
 }
 
+static void mtk_ddp_sout_sel(void __iomem *config_regs,
+			    enum mtk_ddp_comp_id cur, enum mtk_ddp_comp_id next)
+{
+	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0)
+		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
+			       config_regs + DISP_REG_CONFIG_OUT_SEL);
+}
+
 void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next)
@@ -167,6 +189,8 @@ void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
 		writel_relaxed(reg, config_regs + addr);
 	}
 
+	mtk_ddp_sout_sel(config_regs, cur, next);
+
 	value = mtk_ddp_sel_in(cur, next, &addr);
 	if (value) {
 		reg = readl_relaxed(config_regs + addr) | value;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
