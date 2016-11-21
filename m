From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v5 2/2] drm/panel: simple: add support for Sharp LQ150X1LG11 panels
Date: Mon, 21 Nov 2016 16:00:49 +0100
Message-ID: <1479740449-20201-3-git-send-email-peda@axentia.se>
References: <1479740449-20201-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479740449-20201-1-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Gustaf=20Lindstr=C3=B6m?= <gl@axentia.se>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>
List-Id: devicetree@vger.kernel.org

From: Gustaf Lindström <gl@axentia.se>

The Sharp 15" LQ150X1LG11 panel is an XGA TFT LCD panel.

The simple-panel driver is used to get support for essential
functionality of the panel.

Signed-off-by: Gustaf Lindström <gl@axentia.se>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 113db3c4a633..76f0ef7e5b7c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1420,6 +1420,30 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 	},
 };
 
+static const struct drm_display_mode sharp_lq150x1lg11_mode = {
+	.clock = 71100,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 168,
+	.hsync_end = 1024 + 168 + 64,
+	.htotal = 1024 + 168 + 64 + 88,
+	.vdisplay = 768,
+	.vsync_start = 768 + 37,
+	.vsync_end = 768 + 37 + 2,
+	.vtotal = 768 + 37 + 2 + 8,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc sharp_lq150x1lg11 = {
+	.modes = &sharp_lq150x1lg11_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 304,
+		.height = 228,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
+};
+
 static const struct drm_display_mode shelly_sca07010_bfn_lnn_mode = {
 	.clock = 33300,
 	.hdisplay = 800,
@@ -1683,6 +1707,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "sharp,lq123p1jx31",
 		.data = &sharp_lq123p1jx31,
 	}, {
+		.compatible = "sharp,lq150x1lg11",
+		.data = &sharp_lq150x1lg11,
+	}, {
 		.compatible = "shelly,sca07010-bfn-lnn",
 		.data = &shelly_sca07010_bfn_lnn,
 	}, {
-- 
2.1.4
