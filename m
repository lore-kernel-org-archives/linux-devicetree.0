From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 2/4] drm/panel: simple: Add support for OSD101T2045-53TS
Date: Fri, 15 Feb 2019 16:03:13 +0200
Message-ID: <20190215140315.18046-3-peter.ujfalusi@ti.com>
References: <20190215140315.18046-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215140315.18046-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tomi.valkeinen@ti.com
List-Id: devicetree@vger.kernel.org

Add support for the OSD101T2045-53TS 10.1" 1920x1200 panel from One Stop
Displays to the panel-simple driver

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e8218f6a3f2..0337583ffa49 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2996,6 +2996,37 @@ static const struct panel_desc_dsi panasonic_vvx10f004b00 = {
 	.lanes = 4,
 };
 
+static const struct drm_display_mode osd101t2045_53ts_mode = {
+	.clock = 154500,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 112,
+	.hsync_end = 1920 + 112 + 16,
+	.htotal = 1920 + 112 + 16 + 32,
+	.vdisplay = 1200,
+	.vsync_start = 1200 + 16,
+	.vsync_end = 1200 + 16 + 2,
+	.vtotal = 1200 + 16 + 2 + 16,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc_dsi osd101t2045_53ts = {
+	.desc = {
+		.modes = &osd101t2045_53ts_mode,
+		.num_modes = 1,
+		.bpc = 8,
+		.size = {
+			.width = 217,
+			.height = 136,
+		},
+	},
+	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		 MIPI_DSI_MODE_EOT_PACKET,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+};
+
 static const struct of_device_id dsi_of_match[] = {
 	{
 		.compatible = "auo,b080uan01",
@@ -3012,6 +3043,9 @@ static const struct of_device_id dsi_of_match[] = {
 	}, {
 		.compatible = "panasonic,vvx10f004b00",
 		.data = &panasonic_vvx10f004b00
+	}, {
+		.compatible = "osd,osd101t2045-53ts",
+		.data = &osd101t2045_53ts
 	}, {
 		/* sentinel */
 	}
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
