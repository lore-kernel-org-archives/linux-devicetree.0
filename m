From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 3/8] drm/bridge: dw-hdmi: allow overriding of phy-type reading
Date: Fri, 16 Feb 2018 21:41:53 +0100
Message-ID: <20180216204158.29839-4-heiko@sntech.de>
References: <20180216204158.29839-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180216204158.29839-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, algea.cao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In some IP implementations the reading of the phy-type may be broken.
One example are the Rockchip rk3228 and rk3328 socs that use a separate
phy from Innosilicon but still report the HDMI20_TX type.

So allow the glue driver to force a specific type, like the vendor-phy
for these cases.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 +++-
 include/drm/bridge/dw_hdmi.h              | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index f9802399cc0d..50d231626c4d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2218,7 +2218,9 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 	unsigned int i;
 	u8 phy_type;
 
-	phy_type = hdmi_readb(hdmi, HDMI_CONFIG2_ID);
+	phy_type = (hdmi->plat_data->phy_force_type) ?
+				hdmi->plat_data->phy_force_type :
+				hdmi_readb(hdmi, HDMI_CONFIG2_ID);
 
 	if (phy_type == DW_HDMI_PHY_VENDOR_PHY) {
 		/* Vendor PHYs require support from the glue layer. */
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index dd2a8cf7d20b..3c1dddb09b95 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -133,6 +133,7 @@ struct dw_hdmi_plat_data {
 	const struct dw_hdmi_phy_ops *phy_ops;
 	const char *phy_name;
 	void *phy_data;
+	u8 phy_force_type;
 
 	/* Synopsys PHY support */
 	const struct dw_hdmi_mpll_config *mpll_cfg;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
