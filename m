From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 5/5] drm/panel: simple: Add GiantPlus GPM940B0 panel support
Date: Thu, 14 Mar 2019 13:26:22 +0100
Message-ID: <20190314122622.7597-5-paul@crapouillou.net>
References: <20190314122622.7597-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314122622.7597-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The GiantPlus GPM940B0 is a simple 3.0" 320x240 24-bit TFT panel.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v2: Change bus format to MEDIA_BUS_FMT_RGB888_3X8_BE

 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3ab604f5477e..18fa34b88a53 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1208,6 +1208,31 @@ static const struct panel_desc giantplus_gpg482739qs5 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct display_timing giantplus_gpm940b0_timing = {
+	.pixelclock = { 13500000, 27000000, 27500000 },
+	.hactive = { 320, 320, 320 },
+	.hfront_porch = { 14, 686, 718 },
+	.hback_porch = { 50, 70, 255 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 240, 240, 240 },
+	.vfront_porch = { 1, 1, 179 },
+	.vback_porch = { 1, 21, 31 },
+	.vsync_len = { 1, 1, 6 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc giantplus_gpm940b0 = {
+	.timings = &giantplus_gpm940b0_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 60,
+		.height = 45,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_3X8_BE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+};
+
 static const struct display_timing hannstar_hsd070pww1_timing = {
 	.pixelclock = { 64300000, 71100000, 82000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -2666,6 +2691,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "giantplus,gpg482739qs5",
 		.data = &giantplus_gpg482739qs5
 	}, {
+		.compatible = "giantplus,gpm940b0",
+		.data = &giantplus_gpm940b0,
+	}, {
 		.compatible = "hannstar,hsd070pww1",
 		.data = &hannstar_hsd070pww1,
 	}, {
-- 
2.11.0
