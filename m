From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: [PATCH 2/5] drm/panel: add panel CDTech S070WV95-CT16 to panel-simple
Date: Tue, 31 Jul 2018 01:11:14 +0200
Message-ID: <20180730231117.5631-3-giulio.benetti@micronovasrl.com>
References: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Giulio Benetti <giulio.benetti@micronovasrl.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for CDTech S070WV95-CT16 800x480 7" panel to DRM
simple panel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index cbf1ab404ee7..caa5a01eb8e3 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -787,6 +787,30 @@ static const struct panel_desc boe_nv101wxmn51 = {
 	},
 };
 
+static const struct drm_display_mode cdtech_s070wv95_ct16_mode = {
+	.clock = 35000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 40,
+	.hsync_end = 800 + 40 + 40,
+	.htotal = 800 + 40 + 40 + 48,
+	.vdisplay = 480,
+	.vsync_start = 480 + 29,
+	.vsync_end = 480 + 29 + 13,
+	.vtotal = 480 + 29 + 13 + 3,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc cdtech_s070wv95_ct16 = {
+	.modes = &cdtech_s070wv95_ct16_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 85,
+	},
+};
+
 static const struct drm_display_mode chunghwa_claa070wp03xg_mode = {
 	.clock = 66770,
 	.hdisplay = 800,
@@ -2115,6 +2139,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv101wxmn51",
 		.data = &boe_nv101wxmn51,
+	}, {
+		.compatible = "cdtech,s070wv95-ct16",
+		.data = &cdtech_s070wv95_ct16,
 	}, {
 		.compatible = "chunghwa,claa070wp03xg",
 		.data = &chunghwa_claa070wp03xg,
-- 
2.17.1
