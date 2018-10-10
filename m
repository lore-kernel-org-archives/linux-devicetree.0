From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 2/4] drm/panel: simple: Add support for the Lemaker BL035 3.5" LCD
Date: Wed, 10 Oct 2018 13:41:32 +0200
Message-ID: <20181010114134.8211-2-contact@paulk.fr>
References: <20181010114134.8211-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010114134.8211-1-contact@paulk.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com, Mark Van den Borre <mark@fosdem.org>, Gerry Demaret <gerry@fosdem.org>, Luc Verhaegen <libv@skynet.be>, Paul Kocialkowski <contact@paulk.fr>
List-Id: devicetree@vger.kernel.org

This adds support for the 3.5" LCD panel from Lemaker, sold for use with
BananaPi boards. It comes with a 24-bit RGB888 parallel interface and
requires an active-low DE signal

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 97964f7f2ace..229080fcf65e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1461,6 +1461,30 @@ static const struct panel_desc kyo_tcg121xglp = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 };
 
+static const struct drm_display_mode lemaker_bl035_mode = {
+	.clock = 7000,
+	.hdisplay = 320,
+	.hsync_start = 320 + 20,
+	.hsync_end = 320 + 20 + 30,
+	.htotal = 320 + 20 + 30 + 38,
+	.vdisplay = 240,
+	.vsync_start = 240 + 4,
+	.vsync_end = 240 + 4 + 3,
+	.vtotal = 240 + 4 + 3 + 15,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc lemaker_bl035 = {
+	.modes = &lemaker_bl035_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 70,
+		.height = 52,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static const struct drm_display_mode lg_lb070wv8_mode = {
 	.clock = 33246,
 	.hdisplay = 800,
@@ -2456,6 +2480,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "kyo,tcg121xglp",
 		.data = &kyo_tcg121xglp,
+	}, {
+		.compatible = "lemaker,bl035",
+		.data = &lemaker_bl035,
 	}, {
 		.compatible = "lg,lb070wv8",
 		.data = &lg_lb070wv8,
-- 
2.19.0
