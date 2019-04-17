From: Florent TOMASIN <tomasin.florent@gmail.com>
Subject: [PATCH 2/2] drm/panel: add panel CDTech S050WV43-CT5 to panel-simple
Date: Thu, 18 Apr 2019 00:38:45 +0100
Message-ID: <20190417233846.11880-2-tomasin.florent@gmail.com>
References: <20190417233846.11880-1-tomasin.florent@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417233846.11880-1-tomasin.florent@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: tomasin.florent@gmail.com, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds support for CDTech S050WV43-CT5 800x480 5" panel to DRM
simple panel driver.

Signed-off-by: Florent TOMASIN <tomasin.florent@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e8218f6a3f2..486f61d324fb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -917,6 +917,30 @@ static const struct panel_desc cdtech_s043wq26h_ct7 = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
 };
 
+static const struct drm_display_mode cdtech_s050wv43_ct5_mode = {
+	.clock = 30000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 40,
+	.hsync_end = 800 + 40 + 48,
+	.htotal = 800 + 40 + 48 + 88,
+	.vdisplay = 480,
+	.vsync_start = 480 + 13,
+	.vsync_end = 480 + 13 + 3,
+	.vtotal = 480 + 13 + 3 + 32,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc cdtech_s050wv43_ct5 = {
+	.modes = &cdtech_s050wv43_ct5_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 108,
+		.height = 64,
+	},
+};
+
 static const struct drm_display_mode cdtech_s070wv95_ct16_mode = {
 	.clock = 35000,
 	.hdisplay = 800,
@@ -2598,6 +2622,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "cdtech,s043wq26h-ct7",
 		.data = &cdtech_s043wq26h_ct7,
+	}, {
+		.compatible = "cdtech,s050wv43-ct5",
+		.data = &cdtech_s050wv43_ct5,
 	}, {
 		.compatible = "cdtech,s070wv95-ct16",
 		.data = &cdtech_s070wv95_ct16,
-- 
2.17.1
