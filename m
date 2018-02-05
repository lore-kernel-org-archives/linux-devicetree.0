From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 8/9] drm/rockchip: dw_hdmi: store rockchip_hdmi reference in phy_data object
Date: Mon,  5 Feb 2018 15:34:34 +0100
Message-ID: <20180205143435.4723-9-heiko@sntech.de>
References: <20180205143435.4723-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205143435.4723-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, algea.cao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When using special phy handling operations we'll often need access to
the rockchip_hdmi struct. As the chip-data that occupies the phy_data
pointer initially gets assigned to the rockchip_hdmi struct we can not
re-use this phy_data pointer to hold the reference to the rockchip_hdmi
struct, similar to how meson-hdmi does it for example.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 512f8556e7c0..5a62328887d5 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -342,7 +342,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 				 void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	const struct dw_hdmi_plat_data *plat_data;
+	struct dw_hdmi_plat_data *plat_data;
 	const struct of_device_id *match;
 	struct drm_device *drm = data;
 	struct drm_encoder *encoder;
@@ -357,9 +357,14 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		return -ENOMEM;
 
 	match = of_match_node(dw_hdmi_rockchip_dt_ids, pdev->dev.of_node);
-	plat_data = match->data;
+	plat_data = devm_kmemdup(&pdev->dev, match->data,
+					     sizeof(*plat_data), GFP_KERNEL);
+	if (!plat_data)
+		return -ENOMEM;
+
 	hdmi->dev = &pdev->dev;
 	hdmi->chip_data = plat_data->phy_data;
+	plat_data->phy_data = hdmi;
 	encoder = &hdmi->encoder;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
