From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 4/9] drm/bridge: dw-hdmi: export hotplug functions
Date: Mon,  5 Feb 2018 15:34:30 +0100
Message-ID: <20180205143435.4723-5-heiko@sntech.de>
References: <20180205143435.4723-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205143435.4723-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, algea.cao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Algea Cao <algea.cao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

External phys may not provide their own hotplug-related
routines but instead rely on the dw-hdmi ones.
Export these functions so that external hdmi-phys can
use them if necessary.

Signed-off-by: Algea Cao <algea.cao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
[export all 3 hotplug-related functions]
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 +++++++----
 include/drm/bridge/dw_hdmi.h              |  6 +++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 7255fafce089..2760e1b51422 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1251,14 +1251,15 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi, void *data)
 	dw_hdmi_phy_power_off(hdmi);
 }
 
-static enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
-						      void *data)
+enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
+					       void *data)
 {
 	return hdmi_readb(hdmi, HDMI_PHY_STAT0) & HDMI_PHY_HPD ?
 		connector_status_connected : connector_status_disconnected;
 }
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_read_hpd);
 
-static void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
+void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
 				   bool force, bool disabled, bool rxsense)
 {
 	u8 old_mask = hdmi->phy_mask;
@@ -1271,8 +1272,9 @@ static void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
 	if (old_mask != hdmi->phy_mask)
 		hdmi_writeb(hdmi, hdmi->phy_mask, HDMI_PHY_MASK0);
 }
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_update_hpd);
 
-static void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data)
+void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data)
 {
 	/*
 	 * Configure the PHY RX SENSE and HPD interrupts polarities and clear
@@ -1291,6 +1293,7 @@ static void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data)
 	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
 		    HDMI_IH_MUTE_PHY_STAT0);
 }
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_setup_hpd);
 
 static const struct dw_hdmi_phy_ops dw_hdmi_synopsys_phy_ops = {
 	.init = dw_hdmi_phy_init,
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index c5bc2804b29e..d9d7c75b3bfb 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -152,7 +152,11 @@ int dw_hdmi_bind(struct platform_device *pdev, struct drm_encoder *encoder,
 		 const struct dw_hdmi_plat_data *plat_data);
 
 void dw_hdmi_setup_rx_sense(struct device *dev, bool hpd, bool rx_sense);
-
+enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
+					       void *data);
+void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
+				   bool force, bool disabled, bool rxsense);
+void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
 void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
 void dw_hdmi_audio_enable(struct dw_hdmi *hdmi);
 void dw_hdmi_audio_disable(struct dw_hdmi *hdmi);
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
