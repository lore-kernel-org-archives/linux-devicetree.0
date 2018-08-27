From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 2/9] drm/mediatek: fix OF sibling-node lookup
Date: Mon, 27 Aug 2018 10:21:46 +0200
Message-ID: <20180827082153.22537-3-johan@kernel.org>
References: <20180827082153.22537-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827082153.22537-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>, Junzhi Zhao <junzhi.zhao@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>
List-Id: devicetree@vger.kernel.org

Use the new of_get_compatible_child() helper to lookup the sibling
instead of using of_find_compatible_node(), which searches the entire
tree from a given start node and thus can return an unrelated (i.e.
non-sibling) node.

This also addresses a potential use-after-free (e.g. after probe
deferral) as the tree-wide helper drops a reference to its first
argument (i.e. the parent device node).

While at it, also fix the related cec-node reference leak.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
Cc: stable <stable@vger.kernel.org>     # 4.8
Cc: Junzhi Zhao <junzhi.zhao@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: David Airlie <airlied@linux.ie>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 2d45d1dd9554..643f5edd68fe 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1446,8 +1446,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	}
 
 	/* The CEC module handles HDMI hotplug detection */
-	cec_np = of_find_compatible_node(np->parent, NULL,
-					 "mediatek,mt8173-cec");
+	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
 	if (!cec_np) {
 		dev_err(dev, "Failed to find CEC node\n");
 		return -EINVAL;
@@ -1457,8 +1456,10 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	if (!cec_pdev) {
 		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
 			cec_np);
+		of_node_put(cec_np);
 		return -EPROBE_DEFER;
 	}
+	of_node_put(cec_np);
 	hdmi->cec_dev = &cec_pdev->dev;
 
 	/*
-- 
2.18.0
