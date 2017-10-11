From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 2/9] drm/panel: simple: simplify display_mode definitions by using macro
Date: Wed, 11 Oct 2017 13:23:34 +0200
Message-ID: <1507721021-28174-3-git-send-email-LW@KARO-electronics.de>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Use the newly defined macro to generate the display_mode data entries
for all panels. This reduces the code size significantly and makes the
code more readable.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 799 ++++++-----------------------------
 1 file changed, 134 insertions(+), 665 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index dec639d..fde9c41 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -89,6 +89,20 @@ struct panel_simple {
 	struct gpio_desc *enable_gpio;
 };
 
+#define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr, flgs) { \
+	.clock = freq,							\
+	.hdisplay = ha,							\
+	.hsync_start = (ha) + (hfp),					\
+	.hsync_end = (ha) + (hfp) + (hs),				\
+	.htotal = (ha) + (hfp) + (hs) + (hbp),				\
+	.vdisplay = (va),						\
+	.vsync_start = (va) + (vfp),					\
+	.vsync_end = (va) + (vfp) + (vs),				\
+	.vtotal = (va) + (vfp) + (vs) + (vbp),				\
+	.vrefresh = vr,							\
+	.flags = flgs,							\
+}
+
 static inline struct panel_simple *to_panel_simple(struct drm_panel *panel)
 {
 	return container_of(panel, struct panel_simple, base);
@@ -386,19 +400,9 @@ static void panel_simple_shutdown(struct device *dev)
 	panel_simple_unprepare(&panel->base);
 }
 
-static const struct drm_display_mode ampire_am_480272h3tmqw_t01h_mode = {
-	.clock = 9000,
-	.hdisplay = 480,
-	.hsync_start = 480 + 2,
-	.hsync_end = 480 + 2 + 41,
-	.htotal = 480 + 2 + 41 + 2,
-	.vdisplay = 272,
-	.vsync_start = 272 + 2,
-	.vsync_end = 272 + 2 + 10,
-	.vtotal = 272 + 2 + 10 + 2,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
-};
+static const struct drm_display_mode ampire_am_480272h3tmqw_t01h_mode =
+	SP_DISPLAY_MODE(9000, 480, 2, 41, 2, 272, 2, 10, 2, 60,
+			DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 
 static const struct panel_desc ampire_am_480272h3tmqw_t01h = {
 	.modes = &ampire_am_480272h3tmqw_t01h_mode,
@@ -411,33 +415,9 @@ static const struct panel_desc ampire_am_480272h3tmqw_t01h = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
-#define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr, flgs) { \
-	.clock = freq,							\
-	.hdisplay = ha,							\
-	.hsync_start = (ha) + (hfp),					\
-	.hsync_end = (ha) + (hfp) + (hs),				\
-	.htotal = (ha) + (hfp) + (hs) + (hbp),				\
-	.vdisplay = (va),						\
-	.vsync_start = (va) + (vfp),					\
-	.vsync_end = (va) + (vfp) + (vs),				\
-	.vtotal = (va) + (vfp) + (vs) + (vbp),				\
-	.vrefresh = vr,							\
-	.flags = flgs,							\
-	}
-
-static const struct drm_display_mode ampire_am800480r3tmqwa1h_mode = {
-	.clock = 33333,
-	.hdisplay = 800,
-	.hsync_start = 800 + 0,
-	.hsync_end = 800 + 0 + 255,
-	.htotal = 800 + 0 + 255 + 0,
-	.vdisplay = 480,
-	.vsync_start = 480 + 2,
-	.vsync_end = 480 + 2 + 45,
-	.vtotal = 480 + 2 + 45 + 0,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
-};
+static const struct drm_display_mode ampire_am800480r3tmqwa1h_mode =
+	SP_DISPLAY_MODE(33333, 800, 0, 255, 0, 480, 2, 45, 0, 60,
+			DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 
 static const struct panel_desc ampire_am800480r3tmqwa1h = {
 	.modes = &ampire_am800480r3tmqwa1h_mode,
@@ -450,18 +430,8 @@ static const struct panel_desc ampire_am800480r3tmqwa1h = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
-static const struct drm_display_mode auo_b101aw03_mode = {
-	.clock = 51450,
-	.hdisplay = 1024,
-	.hsync_start = 1024 + 156,
-	.hsync_end = 1024 + 156 + 8,
-	.htotal = 1024 + 156 + 8 + 156,
-	.vdisplay = 600,
-	.vsync_start = 600 + 16,
-	.vsync_end = 600 + 16 + 6,
-	.vtotal = 600 + 16 + 6 + 16,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode auo_b101aw03_mode =
+	SP_DISPLAY_MODE(51450, 1024, 156, 8, 156, 600, 16, 6, 16, 60, 0);
 
 static const struct panel_desc auo_b101aw03 = {
 	.modes = &auo_b101aw03_mode,
@@ -473,18 +443,8 @@ static const struct panel_desc auo_b101aw03 = {
 	},
 };
 
-static const struct drm_display_mode auo_b101ean01_mode = {
-	.clock = 72500,
-	.hdisplay = 1280,
-	.hsync_start = 1280 + 119,
-	.hsync_end = 1280 + 119 + 32,
-	.htotal = 1280 + 119 + 32 + 21,
-	.vdisplay = 800,
-	.vsync_start = 800 + 4,
-	.vsync_end = 800 + 4 + 20,
-	.vtotal = 800 + 4 + 20 + 8,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode auo_b101ean01_mode =
+	SP_DISPLAY_MODE(72500, 1280, 119, 32, 21, 800, 4, 20, 8, 60, 0);
 
 static const struct panel_desc auo_b101ean01 = {
 	.modes = &auo_b101ean01_mode,
@@ -496,19 +456,9 @@ static const struct panel_desc auo_b101ean01 = {
 	},
 };
 
-static const struct drm_display_mode auo_b101xtn01_mode = {
-	.clock = 72000,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 20,
-	.hsync_end = 1366 + 20 + 70,
-	.htotal = 1366 + 20 + 70,
-	.vdisplay = 768,
-	.vsync_start = 768 + 14,
-	.vsync_end = 768 + 14 + 42,
-	.vtotal = 768 + 14 + 42,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
+static const struct drm_display_mode auo_b101xtn01_mode =
+	SP_DISPLAY_MODE(72000, 1366, 20, 70, 0, 768, 14, 42, 0, 60,
+			DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
 
 static const struct panel_desc auo_b101xtn01 = {
 	.modes = &auo_b101xtn01_mode,
@@ -520,18 +470,8 @@ static const struct panel_desc auo_b101xtn01 = {
 	},
 };
 
-static const struct drm_display_mode auo_b116xw03_mode = {
-	.clock = 70589,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 40,
-	.hsync_end = 1366 + 40 + 40,
-	.htotal = 1366 + 40 + 40 + 32,
-	.vdisplay = 768,
-	.vsync_start = 768 + 10,
-	.vsync_end = 768 + 10 + 12,
-	.vtotal = 768 + 10 + 12 + 6,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode auo_b116xw03_mode =
+	SP_DISPLAY_MODE(70589, 1366, 40, 40, 32, 768, 10, 12, 6, 60, 0);
 
 static const struct panel_desc auo_b116xw03 = {
 	.modes = &auo_b116xw03_mode,
@@ -543,18 +483,8 @@ static const struct panel_desc auo_b116xw03 = {
 	},
 };
 
-static const struct drm_display_mode auo_b133xtn01_mode = {
-	.clock = 69500,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 48,
-	.hsync_end = 1366 + 48 + 32,
-	.htotal = 1366 + 48 + 32 + 20,
-	.vdisplay = 768,
-	.vsync_start = 768 + 3,
-	.vsync_end = 768 + 3 + 6,
-	.vtotal = 768 + 3 + 6 + 13,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode auo_b133xtn01_mode =
+	SP_DISPLAY_MODE(69500, 1366, 48, 32, 20, 768, 3, 6, 13, 60, 0);
 
 static const struct panel_desc auo_b133xtn01 = {
 	.modes = &auo_b133xtn01_mode,
@@ -566,18 +496,8 @@ static const struct panel_desc auo_b133xtn01 = {
 	},
 };
 
-static const struct drm_display_mode auo_b133htn01_mode = {
-	.clock = 150660,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 172,
-	.hsync_end = 1920 + 172 + 80,
-	.htotal = 1920 + 172 + 80 + 60,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 25,
-	.vsync_end = 1080 + 25 + 10,
-	.vtotal = 1080 + 25 + 10 + 10,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode auo_b133htn01_mode =
+	SP_DISPLAY_MODE(150660, 1920, 172, 80, 60, 1080, 25, 10, 10, 60, 0);
 
 static const struct panel_desc auo_b133htn01 = {
 	.modes = &auo_b133htn01_mode,
@@ -680,18 +600,8 @@ static const struct panel_desc auo_p320hvn03 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
 };
 
-static const struct drm_display_mode auo_t215hvn01_mode = {
-	.clock = 148800,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 88,
-	.hsync_end = 1920 + 88 + 44,
-	.htotal = 1920 + 88 + 44 + 148,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 4,
-	.vsync_end = 1080 + 4 + 5,
-	.vtotal = 1080 + 4 + 5 + 36,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode auo_t215hvn01_mode =
+	SP_DISPLAY_MODE(148800, 1920, 88, 44, 148, 1080, 4, 5, 36, 60, 0);
 
 static const struct panel_desc auo_t215hvn01 = {
 	.modes = &auo_t215hvn01_mode,
@@ -707,18 +617,8 @@ static const struct panel_desc auo_t215hvn01 = {
 	}
 };
 
-static const struct drm_display_mode avic_tm070ddh03_mode = {
-	.clock = 51200,
-	.hdisplay = 1024,
-	.hsync_start = 1024 + 160,
-	.hsync_end = 1024 + 160 + 4,
-	.htotal = 1024 + 160 + 4 + 156,
-	.vdisplay = 600,
-	.vsync_start = 600 + 17,
-	.vsync_end = 600 + 17 + 1,
-	.vtotal = 600 + 17 + 1 + 17,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode avic_tm070ddh03_mode =
+	SP_DISPLAY_MODE(51200, 1024, 160, 4, 156, 600, 17, 1, 17, 60, 0);
 
 static const struct panel_desc avic_tm070ddh03 = {
 	.modes = &avic_tm070ddh03_mode,
@@ -736,30 +636,8 @@ static const struct panel_desc avic_tm070ddh03 = {
 };
 
 static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
-	{
-		.clock = 71900,
-		.hdisplay = 1280,
-		.hsync_start = 1280 + 48,
-		.hsync_end = 1280 + 48 + 32,
-		.htotal = 1280 + 48 + 32 + 80,
-		.vdisplay = 800,
-		.vsync_start = 800 + 3,
-		.vsync_end = 800 + 3 + 5,
-		.vtotal = 800 + 3 + 5 + 24,
-		.vrefresh = 60,
-	},
-	{
-		.clock = 57500,
-		.hdisplay = 1280,
-		.hsync_start = 1280 + 48,
-		.hsync_end = 1280 + 48 + 32,
-		.htotal = 1280 + 48 + 32 + 80,
-		.vdisplay = 800,
-		.vsync_start = 800 + 3,
-		.vsync_end = 800 + 3 + 5,
-		.vtotal = 800 + 3 + 5 + 24,
-		.vrefresh = 48,
-	},
+	SP_DISPLAY_MODE(71900, 1280, 48, 32, 80, 800, 3, 5, 24, 60, 0),
+	SP_DISPLAY_MODE(57500, 1280, 48, 32, 80, 800, 3, 5, 24, 48, 0),
 };
 
 static const struct panel_desc boe_nv101wxmn51 = {
@@ -777,19 +655,9 @@ static const struct panel_desc boe_nv101wxmn51 = {
 	},
 };
 
-static const struct drm_display_mode chunghwa_claa070wp03xg_mode = {
-	.clock = 66770,
-	.hdisplay = 800,
-	.hsync_start = 800 + 49,
-	.hsync_end = 800 + 49 + 33,
-	.htotal = 800 + 49 + 33 + 17,
-	.vdisplay = 1280,
-	.vsync_start = 1280 + 1,
-	.vsync_end = 1280 + 1 + 7,
-	.vtotal = 1280 + 1 + 7 + 15,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
+static const struct drm_display_mode chunghwa_claa070wp03xg_mode =
+	SP_DISPLAY_MODE(66770, 800, 49, 33, 17, 1280, 1, 7, 15, 60,
+			DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
 
 static const struct panel_desc chunghwa_claa070wp03xg = {
 	.modes = &chunghwa_claa070wp03xg_mode,
@@ -801,18 +669,8 @@ static const struct panel_desc chunghwa_claa070wp03xg = {
 	},
 };
 
-static const struct drm_display_mode chunghwa_claa101wa01a_mode = {
-	.clock = 72070,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 58,
-	.hsync_end = 1366 + 58 + 58,
-	.htotal = 1366 + 58 + 58 + 58,
-	.vdisplay = 768,
-	.vsync_start = 768 + 4,
-	.vsync_end = 768 + 4 + 4,
-	.vtotal = 768 + 4 + 4 + 4,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode chunghwa_claa101wa01a_mode =
+	SP_DISPLAY_MODE(72070, 1366, 58, 58, 58, 768, 4, 4, 4, 60, 0);
 
 static const struct panel_desc chunghwa_claa101wa01a = {
 	.modes = &chunghwa_claa101wa01a_mode,
@@ -824,18 +682,8 @@ static const struct panel_desc chunghwa_claa101wa01a = {
 	},
 };
 
-static const struct drm_display_mode chunghwa_claa101wb01_mode = {
-	.clock = 69300,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 48,
-	.hsync_end = 1366 + 48 + 32,
-	.htotal = 1366 + 48 + 32 + 20,
-	.vdisplay = 768,
-	.vsync_start = 768 + 16,
-	.vsync_end = 768 + 16 + 8,
-	.vtotal = 768 + 16 + 8 + 16,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode chunghwa_claa101wb01_mode =
+	SP_DISPLAY_MODE(69300, 1366, 48, 32, 20, 768, 16, 8, 16, 60, 0);
 
 static const struct panel_desc chunghwa_claa101wb01 = {
 	.modes = &chunghwa_claa101wb01_mode,
@@ -847,19 +695,9 @@ static const struct panel_desc chunghwa_claa101wb01 = {
 	},
 };
 
-static const struct drm_display_mode edt_et057090dhu_mode = {
-	.clock = 25175,
-	.hdisplay = 640,
-	.hsync_start = 640 + 16,
-	.hsync_end = 640 + 16 + 30,
-	.htotal = 640 + 16 + 30 + 114,
-	.vdisplay = 480,
-	.vsync_start = 480 + 10,
-	.vsync_end = 480 + 10 + 3,
-	.vtotal = 480 + 10 + 3 + 32,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
+static const struct drm_display_mode edt_et057090dhu_mode =
+	SP_DISPLAY_MODE(25175, 640, 16, 30, 114, 480, 10, 3, 32, 60,
+			DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
 
 static const struct panel_desc edt_et057090dhu = {
 	.modes = &edt_et057090dhu_mode,
@@ -873,19 +711,9 @@ static const struct panel_desc edt_et057090dhu = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
 };
 
-static const struct drm_display_mode edt_etm0700g0dh6_mode = {
-	.clock = 33260,
-	.hdisplay = 800,
-	.hsync_start = 800 + 40,
-	.hsync_end = 800 + 40 + 128,
-	.htotal = 800 + 40 + 128 + 88,
-	.vdisplay = 480,
-	.vsync_start = 480 + 10,
-	.vsync_end = 480 + 10 + 2,
-	.vtotal = 480 + 10 + 2 + 33,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
-};
+static const struct drm_display_mode edt_etm0700g0dh6_mode =
+	SP_DISPLAY_MODE(33260, 800, 40, 128, 88, 480, 10, 2, 33, 60,
+			DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
 
 static const struct panel_desc edt_etm0700g0dh6 = {
 	.modes = &edt_etm0700g0dh6_mode,
@@ -899,18 +727,8 @@ static const struct panel_desc edt_etm0700g0dh6 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
 };
 
-static const struct drm_display_mode foxlink_fl500wvr00_a0t_mode = {
-	.clock = 32260,
-	.hdisplay = 800,
-	.hsync_start = 800 + 168,
-	.hsync_end = 800 + 168 + 64,
-	.htotal = 800 + 168 + 64 + 88,
-	.vdisplay = 480,
-	.vsync_start = 480 + 37,
-	.vsync_end = 480 + 37 + 2,
-	.vtotal = 480 + 37 + 2 + 8,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode foxlink_fl500wvr00_a0t_mode =
+	SP_DISPLAY_MODE(32260, 800, 168, 64, 88, 480, 37, 2, 8, 60, 0);
 
 static const struct panel_desc foxlink_fl500wvr00_a0t = {
 	.modes = &foxlink_fl500wvr00_a0t_mode,
@@ -923,18 +741,8 @@ static const struct panel_desc foxlink_fl500wvr00_a0t = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
-static const struct drm_display_mode giantplus_gpg482739qs5_mode = {
-	.clock = 9000,
-	.hdisplay = 480,
-	.hsync_start = 480 + 5,
-	.hsync_end = 480 + 5 + 1,
-	.htotal = 480 + 5 + 1 + 40,
-	.vdisplay = 272,
-	.vsync_start = 272 + 8,
-	.vsync_end = 272 + 8 + 1,
-	.vtotal = 272 + 8 + 1 + 8,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode giantplus_gpg482739qs5_mode =
+	SP_DISPLAY_MODE(9000, 480, 5, 1, 40, 272, 8, 1, 8, 60, 0);
 
 static const struct panel_desc giantplus_gpg482739qs5 = {
 	.modes = &giantplus_gpg482739qs5_mode,
@@ -1000,18 +808,8 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
 };
 
-static const struct drm_display_mode hitachi_tx23d38vm0caa_mode = {
-	.clock = 33333,
-	.hdisplay = 800,
-	.hsync_start = 800 + 85,
-	.hsync_end = 800 + 85 + 86,
-	.htotal = 800 + 85 + 86 + 85,
-	.vdisplay = 480,
-	.vsync_start = 480 + 16,
-	.vsync_end = 480 + 16 + 13,
-	.vtotal = 480 + 16 + 13 + 16,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode hitachi_tx23d38vm0caa_mode =
+	SP_DISPLAY_MODE(33333, 800, 85, 86, 85, 480, 16, 13, 16, 60, 0);
 
 static const struct panel_desc hitachi_tx23d38vm0caa = {
 	.modes = &hitachi_tx23d38vm0caa_mode,
@@ -1023,19 +821,9 @@ static const struct panel_desc hitachi_tx23d38vm0caa = {
 	},
 };
 
-static const struct drm_display_mode innolux_at043tn24_mode = {
-	.clock = 9000,
-	.hdisplay = 480,
-	.hsync_start = 480 + 2,
-	.hsync_end = 480 + 2 + 41,
-	.htotal = 480 + 2 + 41 + 2,
-	.vdisplay = 272,
-	.vsync_start = 272 + 2,
-	.vsync_end = 272 + 2 + 11,
-	.vtotal = 272 + 2 + 11 + 2,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
-};
+static const struct drm_display_mode innolux_at043tn24_mode =
+	SP_DISPLAY_MODE(9000, 480, 2, 41, 2, 272, 2, 11, 2, 60,
+			DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
 
 static const struct panel_desc innolux_at043tn24 = {
 	.modes = &innolux_at043tn24_mode,
@@ -1048,18 +836,8 @@ static const struct panel_desc innolux_at043tn24 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
-static const struct drm_display_mode innolux_at070tn92_mode = {
-	.clock = 33333,
-	.hdisplay = 800,
-	.hsync_start = 800 + 210,
-	.hsync_end = 800 + 210 + 20,
-	.htotal = 800 + 210 + 20 + 46,
-	.vdisplay = 480,
-	.vsync_start = 480 + 22,
-	.vsync_end = 480 + 22 + 10,
-	.vtotal = 480 + 22 + 23 + 10,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode innolux_at070tn92_mode =
+	SP_DISPLAY_MODE(33333, 800, 210, 20, 46, 480, 22, 10, 23, 60, 0);
 
 static const struct panel_desc innolux_at070tn92 = {
 	.modes = &innolux_at070tn92_mode,
@@ -1126,19 +904,9 @@ static const struct panel_desc innolux_g121i1_l01 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 };
 
-static const struct drm_display_mode innolux_g121x1_l03_mode = {
-	.clock = 65000,
-	.hdisplay = 1024,
-	.hsync_start = 1024 + 0,
-	.hsync_end = 1024 + 1,
-	.htotal = 1024 + 0 + 1 + 320,
-	.vdisplay = 768,
-	.vsync_start = 768 + 38,
-	.vsync_end = 768 + 38 + 1,
-	.vtotal = 768 + 38 + 1 + 0,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
-};
+static const struct drm_display_mode innolux_g121x1_l03_mode =
+	SP_DISPLAY_MODE(65000, 1024, 0, 1, 320, 768, 38, 1, 0, 60,
+			DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
 
 static const struct panel_desc innolux_g121x1_l03 = {
 	.modes = &innolux_g121x1_l03_mode,
@@ -1155,19 +923,9 @@ static const struct panel_desc innolux_g121x1_l03 = {
 	},
 };
 
-static const struct drm_display_mode innolux_n116bge_mode = {
-	.clock = 76420,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 136,
-	.hsync_end = 1366 + 136 + 30,
-	.htotal = 1366 + 136 + 30 + 60,
-	.vdisplay = 768,
-	.vsync_start = 768 + 8,
-	.vsync_end = 768 + 8 + 12,
-	.vtotal = 768 + 8 + 12 + 12,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
-};
+static const struct drm_display_mode innolux_n116bge_mode =
+	SP_DISPLAY_MODE(76420, 1366, 136, 30, 60, 768, 8, 12, 12, 60,
+			DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
 
 static const struct panel_desc innolux_n116bge = {
 	.modes = &innolux_n116bge_mode,
@@ -1179,18 +937,8 @@ static const struct panel_desc innolux_n116bge = {
 	},
 };
 
-static const struct drm_display_mode innolux_n156bge_l21_mode = {
-	.clock = 69300,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 16,
-	.hsync_end = 1366 + 16 + 34,
-	.htotal = 1366 + 16 + 34 + 50,
-	.vdisplay = 768,
-	.vsync_start = 768 + 2,
-	.vsync_end = 768 + 2 + 6,
-	.vtotal = 768 + 2 + 6 + 12,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode innolux_n156bge_l21_mode =
+	SP_DISPLAY_MODE(69300, 1366, 16, 34, 50, 768, 2, 6, 12, 60, 0);
 
 static const struct panel_desc innolux_n156bge_l21 = {
 	.modes = &innolux_n156bge_l21_mode,
@@ -1202,18 +950,8 @@ static const struct panel_desc innolux_n156bge_l21 = {
 	},
 };
 
-static const struct drm_display_mode innolux_zj070na_01p_mode = {
-	.clock = 51501,
-	.hdisplay = 1024,
-	.hsync_start = 1024 + 128,
-	.hsync_end = 1024 + 128 + 64,
-	.htotal = 1024 + 128 + 64 + 128,
-	.vdisplay = 600,
-	.vsync_start = 600 + 16,
-	.vsync_end = 600 + 16 + 4,
-	.vtotal = 600 + 16 + 4 + 16,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode innolux_zj070na_01p_mode =
+	SP_DISPLAY_MODE(51501, 1024, 128, 64, 128, 600, 16, 4, 16, 60, 0);
 
 static const struct panel_desc innolux_zj070na_01p = {
 	.modes = &innolux_zj070na_01p_mode,
@@ -1249,18 +987,8 @@ static const struct panel_desc kyo_tcg121xglp = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 };
 
-static const struct drm_display_mode lg_lb070wv8_mode = {
-	.clock = 33246,
-	.hdisplay = 800,
-	.hsync_start = 800 + 88,
-	.hsync_end = 800 + 88 + 80,
-	.htotal = 800 + 88 + 80 + 88,
-	.vdisplay = 480,
-	.vsync_start = 480 + 10,
-	.vsync_end = 480 + 10 + 25,
-	.vtotal = 480 + 10 + 25 + 10,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode lg_lb070wv8_mode =
+	SP_DISPLAY_MODE(33246, 800, 88, 80, 88, 480, 10, 25, 10, 60, 0);
 
 static const struct panel_desc lg_lb070wv8 = {
 	.modes = &lg_lb070wv8_mode,
@@ -1273,19 +1001,9 @@ static const struct panel_desc lg_lb070wv8 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 };
 
-static const struct drm_display_mode lg_lp079qx1_sp0v_mode = {
-	.clock = 200000,
-	.hdisplay = 1536,
-	.hsync_start = 1536 + 12,
-	.hsync_end = 1536 + 12 + 16,
-	.htotal = 1536 + 12 + 16 + 48,
-	.vdisplay = 2048,
-	.vsync_start = 2048 + 8,
-	.vsync_end = 2048 + 8 + 4,
-	.vtotal = 2048 + 8 + 4 + 8,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
+static const struct drm_display_mode lg_lp079qx1_sp0v_mode =
+	SP_DISPLAY_MODE(200000, 1536, 12, 16, 48, 2048, 8, 4, 8, 60,
+			 DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
 
 static const struct panel_desc lg_lp079qx1_sp0v = {
 	.modes = &lg_lp079qx1_sp0v_mode,
@@ -1296,18 +1014,8 @@ static const struct panel_desc lg_lp079qx1_sp0v = {
 	},
 };
 
-static const struct drm_display_mode lg_lp097qx1_spa1_mode = {
-	.clock = 205210,
-	.hdisplay = 2048,
-	.hsync_start = 2048 + 150,
-	.hsync_end = 2048 + 150 + 5,
-	.htotal = 2048 + 150 + 5 + 5,
-	.vdisplay = 1536,
-	.vsync_start = 1536 + 3,
-	.vsync_end = 1536 + 3 + 1,
-	.vtotal = 1536 + 3 + 1 + 9,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode lg_lp097qx1_spa1_mode =
+	SP_DISPLAY_MODE(205210, 2048, 150, 5, 5, 1536, 3, 1, 9, 60, 0);
 
 static const struct panel_desc lg_lp097qx1_spa1 = {
 	.modes = &lg_lp097qx1_spa1_mode,
@@ -1318,18 +1026,8 @@ static const struct panel_desc lg_lp097qx1_spa1 = {
 	},
 };
 
-static const struct drm_display_mode lg_lp120up1_mode = {
-	.clock = 162300,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 40,
-	.hsync_end = 1920 + 40 + 40,
-	.htotal = 1920 + 40 + 40+ 80,
-	.vdisplay = 1280,
-	.vsync_start = 1280 + 4,
-	.vsync_end = 1280 + 4 + 4,
-	.vtotal = 1280 + 4 + 4 + 12,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode lg_lp120up1_mode =
+	SP_DISPLAY_MODE(162300, 1920, 40, 40, 80, 1280, 4, 4, 12, 60, 0);
 
 static const struct panel_desc lg_lp120up1 = {
 	.modes = &lg_lp120up1_mode,
@@ -1341,18 +1039,8 @@ static const struct panel_desc lg_lp120up1 = {
 	},
 };
 
-static const struct drm_display_mode lg_lp129qe_mode = {
-	.clock = 285250,
-	.hdisplay = 2560,
-	.hsync_start = 2560 + 48,
-	.hsync_end = 2560 + 48 + 32,
-	.htotal = 2560 + 48 + 32 + 80,
-	.vdisplay = 1700,
-	.vsync_start = 1700 + 3,
-	.vsync_end = 1700 + 3 + 10,
-	.vtotal = 1700 + 3 + 10 + 36,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode lg_lp129qe_mode =
+	SP_DISPLAY_MODE(285250, 2560, 48, 32, 80, 1700, 3, 10, 36, 60, 0);
 
 static const struct panel_desc lg_lp129qe = {
 	.modes = &lg_lp129qe_mode,
@@ -1391,19 +1079,9 @@ static const struct panel_desc nec_nl12880bc20_05 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 };
 
-static const struct drm_display_mode nec_nl4827hc19_05b_mode = {
-	.clock = 10870,
-	.hdisplay = 480,
-	.hsync_start = 480 + 2,
-	.hsync_end = 480 + 2 + 41,
-	.htotal = 480 + 2 + 41 + 2,
-	.vdisplay = 272,
-	.vsync_start = 272 + 2,
-	.vsync_end = 272 + 2 + 4,
-	.vtotal = 272 + 2 + 4 + 2,
-	.vrefresh = 74,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
+static const struct drm_display_mode nec_nl4827hc19_05b_mode =
+	SP_DISPLAY_MODE(10870, 480, 2, 41, 2, 272, 2, 4, 2, 74,
+			 DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
 
 static const struct panel_desc nec_nl4827hc19_05b = {
 	.modes = &nec_nl4827hc19_05b_mode,
@@ -1417,18 +1095,8 @@ static const struct panel_desc nec_nl4827hc19_05b = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
 };
 
-static const struct drm_display_mode netron_dy_e231732_mode = {
-	.clock = 66000,
-	.hdisplay = 1024,
-	.hsync_start = 1024 + 160,
-	.hsync_end = 1024 + 160 + 70,
-	.htotal = 1024 + 160 + 70 + 90,
-	.vdisplay = 600,
-	.vsync_start = 600 + 127,
-	.vsync_end = 600 + 127 + 20,
-	.vtotal = 600 + 127 + 20 + 3,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode netron_dy_e231732_mode =
+	SP_DISPLAY_MODE(66000, 1024, 160, 70, 90, 600, 127, 20, 3, 60, 0);
 
 static const struct panel_desc netron_dy_e231732 = {
 	.modes = &netron_dy_e231732_mode,
@@ -1466,17 +1134,8 @@ static const struct panel_desc nlt_nl192108ac18_02d = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 };
 
-static const struct drm_display_mode nvd_9128_mode = {
-	.clock = 29500,
-	.hdisplay = 800,
-	.hsync_start = 800 + 130,
-	.hsync_end = 800 + 130 + 98,
-	.htotal = 800 + 0 + 130 + 98,
-	.vdisplay = 480,
-	.vsync_start = 480 + 10,
-	.vsync_end = 480 + 10 + 50,
-	.vtotal = 480 + 0 + 10 + 50,
-};
+static const struct drm_display_mode nvd_9128_mode =
+	SP_DISPLAY_MODE(29500, 800, 130, 98, 0, 480, 10, 50, 0, 0, 0);
 
 static const struct panel_desc nvd_9128 = {
 	.modes = &nvd_9128_mode,
@@ -1519,18 +1178,8 @@ static const struct panel_desc okaya_rs800480t_7x0gp = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
-static const struct drm_display_mode olimex_lcd_olinuxino_43ts_mode = {
-	.clock = 9000,
-	.hdisplay = 480,
-	.hsync_start = 480 + 5,
-	.hsync_end = 480 + 5 + 30,
-	.htotal = 480 + 5 + 30 + 10,
-	.vdisplay = 272,
-	.vsync_start = 272 + 8,
-	.vsync_end = 272 + 8 + 5,
-	.vtotal = 272 + 8 + 5 + 3,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode olimex_lcd_olinuxino_43ts_mode =
+	SP_DISPLAY_MODE(9000, 480, 5, 30, 10, 272, 8, 5, 3, 60, 0);
 
 static const struct panel_desc olimex_lcd_olinuxino_43ts = {
 	.modes = &olimex_lcd_olinuxino_43ts_mode,
@@ -1547,19 +1196,9 @@ static const struct panel_desc olimex_lcd_olinuxino_43ts = {
  * pixel clocks, but this is the timing that was being used in the Adafruit
  * installation instructions.
  */
-static const struct drm_display_mode ontat_yx700wv03_mode = {
-	.clock = 29500,
-	.hdisplay = 800,
-	.hsync_start = 824,
-	.hsync_end = 896,
-	.htotal = 992,
-	.vdisplay = 480,
-	.vsync_start = 483,
-	.vsync_end = 493,
-	.vtotal = 500,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
+static const struct drm_display_mode ontat_yx700wv03_mode =
+	SP_DISPLAY_MODE(29500, 800, 24, 72, 96, 480, 3, 10, 7, 60,
+			DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
 
 /*
  * Specification at:
@@ -1576,18 +1215,8 @@ static const struct panel_desc ontat_yx700wv03 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
-static const struct drm_display_mode ortustech_com43h4m85ulc_mode  = {
-	.clock = 25000,
-	.hdisplay = 480,
-	.hsync_start = 480 + 10,
-	.hsync_end = 480 + 10 + 10,
-	.htotal = 480 + 10 + 10 + 15,
-	.vdisplay = 800,
-	.vsync_start = 800 + 3,
-	.vsync_end = 800 + 3 + 3,
-	.vtotal = 800 + 3 + 3 + 3,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode ortustech_com43h4m85ulc_mode  =
+	SP_DISPLAY_MODE(25000, 480, 10, 10, 15, 800, 3, 3, 3, 60, 0);
 
 static const struct panel_desc ortustech_com43h4m85ulc = {
 	.modes = &ortustech_com43h4m85ulc_mode,
@@ -1601,18 +1230,8 @@ static const struct panel_desc ortustech_com43h4m85ulc = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
 };
 
-static const struct drm_display_mode qd43003c0_40_mode = {
-	.clock = 9000,
-	.hdisplay = 480,
-	.hsync_start = 480 + 8,
-	.hsync_end = 480 + 8 + 4,
-	.htotal = 480 + 8 + 4 + 39,
-	.vdisplay = 272,
-	.vsync_start = 272 + 4,
-	.vsync_end = 272 + 4 + 10,
-	.vtotal = 272 + 4 + 10 + 2,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode qd43003c0_40_mode =
+	SP_DISPLAY_MODE(9000, 480, 8, 4, 39, 272, 4, 10, 2, 60, 0);
 
 static const struct panel_desc qd43003c0_40 = {
 	.modes = &qd43003c0_40_mode,
@@ -1625,18 +1244,8 @@ static const struct panel_desc qd43003c0_40 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
-static const struct drm_display_mode samsung_lsn122dl01_c01_mode = {
-	.clock = 271560,
-	.hdisplay = 2560,
-	.hsync_start = 2560 + 48,
-	.hsync_end = 2560 + 48 + 32,
-	.htotal = 2560 + 48 + 32 + 80,
-	.vdisplay = 1600,
-	.vsync_start = 1600 + 2,
-	.vsync_end = 1600 + 2 + 5,
-	.vtotal = 1600 + 2 + 5 + 57,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode samsung_lsn122dl01_c01_mode =
+	SP_DISPLAY_MODE(271560, 2560, 48, 32, 80, 1600, 2, 5, 57, 60, 0);
 
 static const struct panel_desc samsung_lsn122dl01_c01 = {
 	.modes = &samsung_lsn122dl01_c01_mode,
@@ -1647,18 +1256,8 @@ static const struct panel_desc samsung_lsn122dl01_c01 = {
 	},
 };
 
-static const struct drm_display_mode samsung_ltn101nt05_mode = {
-	.clock = 54030,
-	.hdisplay = 1024,
-	.hsync_start = 1024 + 24,
-	.hsync_end = 1024 + 24 + 136,
-	.htotal = 1024 + 24 + 136 + 160,
-	.vdisplay = 600,
-	.vsync_start = 600 + 3,
-	.vsync_end = 600 + 3 + 6,
-	.vtotal = 600 + 3 + 6 + 61,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode samsung_ltn101nt05_mode =
+	SP_DISPLAY_MODE(54030, 1024, 24, 136, 160, 600, 3, 6, 61, 60, 0);
 
 static const struct panel_desc samsung_ltn101nt05 = {
 	.modes = &samsung_ltn101nt05_mode,
@@ -1670,18 +1269,8 @@ static const struct panel_desc samsung_ltn101nt05 = {
 	},
 };
 
-static const struct drm_display_mode samsung_ltn140at29_301_mode = {
-	.clock = 76300,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 64,
-	.hsync_end = 1366 + 64 + 48,
-	.htotal = 1366 + 64 + 48 + 128,
-	.vdisplay = 768,
-	.vsync_start = 768 + 2,
-	.vsync_end = 768 + 2 + 5,
-	.vtotal = 768 + 2 + 5 + 17,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode samsung_ltn140at29_301_mode =
+	SP_DISPLAY_MODE(76300, 1366, 64, 48, 128, 768, 2, 5, 17, 60, 0);
 
 static const struct panel_desc samsung_ltn140at29_301 = {
 	.modes = &samsung_ltn140at29_301_mode,
@@ -1717,19 +1306,9 @@ static const struct panel_desc sharp_lq101k1ly04 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
 };
 
-static const struct drm_display_mode sharp_lq123p1jx31_mode = {
-	.clock = 252750,
-	.hdisplay = 2400,
-	.hsync_start = 2400 + 48,
-	.hsync_end = 2400 + 48 + 32,
-	.htotal = 2400 + 48 + 32 + 80,
-	.vdisplay = 1600,
-	.vsync_start = 1600 + 3,
-	.vsync_end = 1600 + 3 + 10,
-	.vtotal = 1600 + 3 + 10 + 33,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
+static const struct drm_display_mode sharp_lq123p1jx31_mode =
+	SP_DISPLAY_MODE(252750, 2400, 48, 32, 80, 1600, 3, 10, 33, 60,
+			 DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
 
 static const struct panel_desc sharp_lq123p1jx31 = {
 	.modes = &sharp_lq123p1jx31_mode,
@@ -1746,18 +1325,8 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 	},
 };
 
-static const struct drm_display_mode sharp_lq150x1lg11_mode = {
-	.clock = 71100,
-	.hdisplay = 1024,
-	.hsync_start = 1024 + 168,
-	.hsync_end = 1024 + 168 + 64,
-	.htotal = 1024 + 168 + 64 + 88,
-	.vdisplay = 768,
-	.vsync_start = 768 + 37,
-	.vsync_end = 768 + 37 + 2,
-	.vtotal = 768 + 37 + 2 + 8,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode sharp_lq150x1lg11_mode =
+	SP_DISPLAY_MODE(71100, 1024, 168, 64, 88, 768, 37, 2, 8, 60, 0);
 
 static const struct panel_desc sharp_lq150x1lg11 = {
 	.modes = &sharp_lq150x1lg11_mode,
@@ -1770,18 +1339,8 @@ static const struct panel_desc sharp_lq150x1lg11 = {
 	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
 };
 
-static const struct drm_display_mode shelly_sca07010_bfn_lnn_mode = {
-	.clock = 33300,
-	.hdisplay = 800,
-	.hsync_start = 800 + 1,
-	.hsync_end = 800 + 1 + 64,
-	.htotal = 800 + 1 + 64 + 64,
-	.vdisplay = 480,
-	.vsync_start = 480 + 1,
-	.vsync_end = 480 + 1 + 23,
-	.vtotal = 480 + 1 + 23 + 22,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode shelly_sca07010_bfn_lnn_mode =
+	SP_DISPLAY_MODE(33300, 800, 1, 64, 64, 480, 1, 23, 22, 60, 0);
 
 static const struct panel_desc shelly_sca07010_bfn_lnn = {
 	.modes = &shelly_sca07010_bfn_lnn_mode,
@@ -1793,19 +1352,9 @@ static const struct panel_desc shelly_sca07010_bfn_lnn = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
-static const struct drm_display_mode starry_kr122ea0sra_mode = {
-	.clock = 147000,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 16,
-	.hsync_end = 1920 + 16 + 16,
-	.htotal = 1920 + 16 + 16 + 32,
-	.vdisplay = 1200,
-	.vsync_start = 1200 + 15,
-	.vsync_end = 1200 + 15 + 2,
-	.vtotal = 1200 + 15 + 2 + 18,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
+static const struct drm_display_mode starry_kr122ea0sra_mode =
+	SP_DISPLAY_MODE(147000, 1920, 16, 16, 32, 1200, 15, 2, 18, 60,
+			 DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
 
 static const struct panel_desc starry_kr122ea0sra = {
 	.modes = &starry_kr122ea0sra_mode,
@@ -1845,18 +1394,8 @@ static const struct panel_desc tianma_tm070jdhg30 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 };
 
-static const struct drm_display_mode tpk_f07a_0102_mode = {
-	.clock = 33260,
-	.hdisplay = 800,
-	.hsync_start = 800 + 40,
-	.hsync_end = 800 + 40 + 128,
-	.htotal = 800 + 40 + 128 + 88,
-	.vdisplay = 480,
-	.vsync_start = 480 + 10,
-	.vsync_end = 480 + 10 + 2,
-	.vtotal = 480 + 10 + 2 + 33,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode tpk_f07a_0102_mode =
+	SP_DISPLAY_MODE(33260, 800, 40, 128, 88, 480, 10, 2, 33, 60, 0);
 
 static const struct panel_desc tpk_f07a_0102 = {
 	.modes = &tpk_f07a_0102_mode,
@@ -1868,18 +1407,8 @@ static const struct panel_desc tpk_f07a_0102 = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
 };
 
-static const struct drm_display_mode tpk_f10a_0102_mode = {
-	.clock = 45000,
-	.hdisplay = 1024,
-	.hsync_start = 1024 + 176,
-	.hsync_end = 1024 + 176 + 5,
-	.htotal = 1024 + 176 + 5 + 88,
-	.vdisplay = 600,
-	.vsync_start = 600 + 20,
-	.vsync_end = 600 + 20 + 5,
-	.vtotal = 600 + 20 + 5 + 25,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode tpk_f10a_0102_mode =
+	SP_DISPLAY_MODE(45000, 1024, 176, 5, 88, 600, 20, 5, 25, 60, 0);
 
 static const struct panel_desc tpk_f10a_0102 = {
 	.modes = &tpk_f10a_0102_mode,
@@ -1926,19 +1455,9 @@ static const struct panel_desc urt_umsh_8596md_parallel = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
-static const struct drm_display_mode winstar_wf35ltiacd_mode = {
-	.clock = 6410,
-	.hdisplay = 320,
-	.hsync_start = 320 + 20,
-	.hsync_end = 320 + 20 + 30,
-	.htotal = 320 + 20 + 30 + 38,
-	.vdisplay = 240,
-	.vsync_start = 240 + 4,
-	.vsync_end = 240 + 4 + 3,
-	.vtotal = 240 + 4 + 3 + 15,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
+static const struct drm_display_mode winstar_wf35ltiacd_mode =
+	SP_DISPLAY_MODE(6410, 320, 20, 30, 38, 240, 4, 3, 15, 60,
+			DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
 
 static const struct panel_desc winstar_wf35ltiacd = {
 	.modes = &winstar_wf35ltiacd_mode,
@@ -2198,18 +1717,8 @@ struct panel_desc_dsi {
 	unsigned int lanes;
 };
 
-static const struct drm_display_mode auo_b080uan01_mode = {
-	.clock = 154500,
-	.hdisplay = 1200,
-	.hsync_start = 1200 + 62,
-	.hsync_end = 1200 + 62 + 4,
-	.htotal = 1200 + 62 + 4 + 62,
-	.vdisplay = 1920,
-	.vsync_start = 1920 + 9,
-	.vsync_end = 1920 + 9 + 2,
-	.vtotal = 1920 + 9 + 2 + 8,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode auo_b080uan01_mode =
+	SP_DISPLAY_MODE(154500, 1200, 62, 4, 62, 1920, 9, 2, 8, 60, 0);
 
 static const struct panel_desc_dsi auo_b080uan01 = {
 	.desc = {
@@ -2226,19 +1735,9 @@ static const struct panel_desc_dsi auo_b080uan01 = {
 	.lanes = 4,
 };
 
-static const struct drm_display_mode boe_tv080wum_nl0_mode = {
-	.clock = 160000,
-	.hdisplay = 1200,
-	.hsync_start = 1200 + 120,
-	.hsync_end = 1200 + 120 + 20,
-	.htotal = 1200 + 120 + 20 + 21,
-	.vdisplay = 1920,
-	.vsync_start = 1920 + 21,
-	.vsync_end = 1920 + 21 + 3,
-	.vtotal = 1920 + 21 + 3 + 18,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
+static const struct drm_display_mode boe_tv080wum_nl0_mode =
+	SP_DISPLAY_MODE(160000, 1200, 120, 20, 21, 1920, 21, 3, 18, 60,
+			 DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
 
 static const struct panel_desc_dsi boe_tv080wum_nl0 = {
 	.desc = {
@@ -2256,18 +1755,8 @@ static const struct panel_desc_dsi boe_tv080wum_nl0 = {
 	.lanes = 4,
 };
 
-static const struct drm_display_mode lg_ld070wx3_sl01_mode = {
-	.clock = 71000,
-	.hdisplay = 800,
-	.hsync_start = 800 + 32,
-	.hsync_end = 800 + 32 + 1,
-	.htotal = 800 + 32 + 1 + 57,
-	.vdisplay = 1280,
-	.vsync_start = 1280 + 28,
-	.vsync_end = 1280 + 28 + 1,
-	.vtotal = 1280 + 28 + 1 + 14,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode lg_ld070wx3_sl01_mode =
+	SP_DISPLAY_MODE(71000, 800, 32, 1, 57, 1280, 28, 1, 14, 60, 0);
 
 static const struct panel_desc_dsi lg_ld070wx3_sl01 = {
 	.desc = {
@@ -2284,18 +1773,8 @@ static const struct panel_desc_dsi lg_ld070wx3_sl01 = {
 	.lanes = 4,
 };
 
-static const struct drm_display_mode lg_lh500wx1_sd03_mode = {
-	.clock = 67000,
-	.hdisplay = 720,
-	.hsync_start = 720 + 12,
-	.hsync_end = 720 + 12 + 4,
-	.htotal = 720 + 12 + 4 + 112,
-	.vdisplay = 1280,
-	.vsync_start = 1280 + 8,
-	.vsync_end = 1280 + 8 + 4,
-	.vtotal = 1280 + 8 + 4 + 12,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode lg_lh500wx1_sd03_mode =
+	SP_DISPLAY_MODE(67000, 720, 12, 4, 112, 1280, 8, 4, 12, 60, 0);
 
 static const struct panel_desc_dsi lg_lh500wx1_sd03 = {
 	.desc = {
@@ -2312,18 +1791,8 @@ static const struct panel_desc_dsi lg_lh500wx1_sd03 = {
 	.lanes = 4,
 };
 
-static const struct drm_display_mode panasonic_vvx10f004b00_mode = {
-	.clock = 157200,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 154,
-	.hsync_end = 1920 + 154 + 16,
-	.htotal = 1920 + 154 + 16 + 32,
-	.vdisplay = 1200,
-	.vsync_start = 1200 + 17,
-	.vsync_end = 1200 + 17 + 2,
-	.vtotal = 1200 + 17 + 2 + 16,
-	.vrefresh = 60,
-};
+static const struct drm_display_mode panasonic_vvx10f004b00_mode =
+	SP_DISPLAY_MODE(157200, 1920, 154, 16, 32, 1200, 17, 2, 16, 60, 0);
 
 static const struct panel_desc_dsi panasonic_vvx10f004b00 = {
 	.desc = {
-- 
2.1.4
