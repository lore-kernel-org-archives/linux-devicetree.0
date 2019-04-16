From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v1 1/4] drm/mediatek: config component output by device node port
Date: Tue, 16 Apr 2019 16:58:45 +0200
Message-ID: <20190416145848.11932-2-frank-w@public-files.de>
References: <20190416145848.11932-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416145848.11932-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, chunhui dai <chunhui.dai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Bibby Hsieh <bibby.hsieh@mediatek.com>

We can select output component by decive node port.
Main path default output component is DSI.
External path default output component is DPI.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
=2D--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 41 ++++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |  4 +--
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/medi=
atek/mtk_drm_drv.c
index 57ce4708ef1b..d3e86426dc65 100644
=2D-- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -22,7 +22,9 @@
 #include <drm/drm_probe_helper.h>
 #include <linux/component.h>
 #include <linux/iommu.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>

@@ -134,7 +136,7 @@ static const struct drm_mode_config_funcs mtk_drm_mode=
_config_funcs =3D {
 	.atomic_commit =3D mtk_atomic_commit,
 };

-static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] =3D {
+static enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] =3D {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_RDMA0,
 	DDP_COMPONENT_COLOR0,
@@ -142,12 +144,12 @@ static const enum mtk_ddp_comp_id mt2701_mtk_ddp_mai=
n[] =3D {
 	DDP_COMPONENT_DSI0,
 };

-static const enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] =3D {
+static enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] =3D {
 	DDP_COMPONENT_RDMA1,
 	DDP_COMPONENT_DPI0,
 };

-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] =3D {
+static enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] =3D {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_AAL0,
@@ -157,7 +159,7 @@ static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[=
] =3D {
 	DDP_COMPONENT_PWM0,
 };

-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] =3D {
+static enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] =3D {
 	DDP_COMPONENT_OVL1,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_AAL1,
@@ -173,7 +175,7 @@ static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third=
[] =3D {
 	DDP_COMPONENT_PWM2,
 };

-static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] =3D {
+static enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] =3D {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_AAL0,
@@ -184,7 +186,7 @@ static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[=
] =3D {
 	DDP_COMPONENT_PWM0,
 };

-static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] =3D {
+static enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] =3D {
 	DDP_COMPONENT_OVL1,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_GAMMA,
@@ -479,6 +481,7 @@ static int mtk_drm_probe(struct platform_device *pdev)

 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(dev->of_node->parent, node) {
+		struct device_node *port, *ep, *remote;
 		const struct of_device_id *of_id;
 		enum mtk_ddp_comp_type comp_type;
 		int comp_id;
@@ -538,6 +541,32 @@ static int mtk_drm_probe(struct platform_device *pdev=
)

 			private->ddp_comp[comp_id] =3D comp;
 		}
+
+		if (comp_type !=3D MTK_DSI && comp_type !=3D MTK_DPI) {
+			port =3D of_graph_get_port_by_id(node, 0);
+			if (!port)
+				continue;
+			ep =3D of_get_child_by_name(port, "endpoint");
+			of_node_put(port);
+			if (!ep)
+				continue;
+			remote =3D of_graph_get_remote_port_parent(ep);
+			of_node_put(ep);
+			if (!remote)
+				continue;
+			of_id =3D of_match_node(mtk_ddp_comp_dt_ids, remote);
+			if (!of_id)
+				continue;
+			comp_type =3D (enum mtk_ddp_comp_type)of_id->data;
+			for (i =3D 0; i < private->data->main_len - 1; i++)
+				if (private->data->main_path[i] =3D=3D comp_id)
+					private->data->main_path[i + 1] =3D
+					mtk_ddp_comp_get_id(node, comp_type);
+			for (i =3D 0; i < private->data->ext_len - 1; i++)
+				if (private->data->ext_path[i] =3D=3D comp_id)
+					private->data->ext_path[i + 1] =3D
+					mtk_ddp_comp_get_id(node, comp_type);
+		}
 	}

 	if (!private->mutex_node) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/medi=
atek/mtk_drm_drv.h
index ecc00ca3221d..256a3ff2e66e 100644
=2D-- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -29,9 +29,9 @@ struct drm_property;
 struct regmap;

 struct mtk_mmsys_driver_data {
-	const enum mtk_ddp_comp_id *main_path;
+	enum mtk_ddp_comp_id *main_path;
 	unsigned int main_len;
-	const enum mtk_ddp_comp_id *ext_path;
+	enum mtk_ddp_comp_id *ext_path;
 	unsigned int ext_len;
 	const enum mtk_ddp_comp_id *third_path;
 	unsigned int third_len;
=2D-
2.17.1
