From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 5/5] drm: rockchip: add fixed screen size DVI-D support for rk3066 hdmi
Date: Thu, 21 Mar 2019 01:14:40 +0100
Message-ID: <20190321001440.31057-6-jbx6244@gmail.com>
References: <20190321001440.31057-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321001440.31057-1-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: hjc@rock-chips.com, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add fixed screen size DVI-D support
for rk3066 hdmi with an extra patch.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ff8f86152..f656da769 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -349,11 +349,12 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 	if (hdmi->hdmi_data.sink_is_hdmi) {
 		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK,
 			  HDMI_VIDEO_MODE_HDMI);
-		rk3066_hdmi_config_avi(hdmi, mode);
 	} else {
 		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK, 0);
 	}
 
+	rk3066_hdmi_config_avi(hdmi, mode);
+
 	rk3066_hdmi_config_phy(hdmi);
 
 	rk3066_hdmi_set_power_mode(hdmi, HDMI_SYS_POWER_MODE_E);
@@ -462,15 +463,26 @@ rk3066_hdmi_connector_detect(struct drm_connector *connector, bool force)
 		connector_status_connected : connector_status_disconnected;
 }
 
+static const struct drm_display_mode edid_cea_modes[] = {
+	/* 4 - 1280x720@60Hz 16:9 */
+	{ DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 74250, 1280, 1390,
+		   1430, 1650, 0, 720, 725, 730, 750, 0,
+		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
+	  .vrefresh = 60, .picture_aspect_ratio = HDMI_PICTURE_ASPECT_16_9, },
+};
+
 static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct rk3066_hdmi *hdmi = to_rk3066_hdmi(connector);
+	struct drm_display_mode *mode = NULL;
 	struct edid *edid;
 	int ret = 0;
 
 	if (!hdmi->ddc)
 		return 0;
 
+	hdmi->hdmi_data.sink_is_hdmi = false;
+
 	edid = drm_get_edid(connector, hdmi->ddc);
 	if (edid) {
 		hdmi->hdmi_data.sink_is_hdmi = drm_detect_hdmi_monitor(edid);
@@ -479,6 +491,17 @@ static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
 		kfree(edid);
 	}
 
+	if ((ret == 0) || (hdmi->hdmi_data.sink_is_hdmi == false)) {
+		hdmi->hdmi_data.sink_is_hdmi = false;
+
+		mode = drm_mode_duplicate(hdmi->drm_dev, &edid_cea_modes[0]);
+		if (!mode)
+			return ret;
+		mode->type |= DRM_MODE_TYPE_PREFERRED;
+		drm_mode_probed_add(connector, mode);
+		ret++;
+	}
+
 	return ret;
 }
 
-- 
2.11.0
