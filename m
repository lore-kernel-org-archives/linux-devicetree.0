From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 2/2] drm/panel: simple: Add support for Sharp LD-D5116Z01B panel
Date: Fri,  5 Jul 2019 09:57:55 -0700
Message-ID: <20190705165755.515-1-jeffrey.l.hugo@gmail.com>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
Cc: robh+dt@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5a93c4edf1e4..e6f578667324 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2354,6 +2354,29 @@ static const struct panel_desc samsung_ltn140at29_301 = {
 	},
 };
 
+static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
+	.clock = 168480,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 48,
+	.hsync_end = 1920 + 48 + 32,
+	.htotal = 1920 + 48 + 32 + 80,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 3,
+	.vsync_end = 1280 + 3 + 10,
+	.vtotal = 1280 + 3 + 10 + 57,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc sharp_ld_d5116z01b = {
+	.modes = &sharp_ld_d5116z01b_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 260,
+		.height = 120,
+	},
+};
+
 static const struct drm_display_mode sharp_lq035q7db03_mode = {
 	.clock = 5500,
 	.hdisplay = 240,
@@ -3002,6 +3025,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "samsung,ltn140at29-301",
 		.data = &samsung_ltn140at29_301,
+	}, {
+		.compatible = "sharp,ld-d5116z01b",
+		.data = &sharp_ld_d5116z01b,
 	}, {
 		.compatible = "sharp,lq035q7db03",
 		.data = &sharp_lq035q7db03,
-- 
2.17.1
