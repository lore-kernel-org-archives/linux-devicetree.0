From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 2/2] drm/panel: simple: add lg,acx467akm-7 panel
Date: Sat, 24 Nov 2018 15:06:28 -0500
Message-ID: <20181124200628.24393-2-masneyb@onstation.org>
References: <20181124200628.24393-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181124200628.24393-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonathan@marek.ca
List-Id: devicetree@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add ACX467AKM-7 4.95" 1080×1920 LCD panel that is found on the LG Nexus
5 (hammerhead) phone.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
[masneyb@onstation.org: checkpatch fixes; rename jdi,1080p-hammerhead
binding to lg,acx467akm-7.]
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
See patch 1 in this series for why I went with the LG model number.

 drivers/gpu/drm/panel/panel-simple.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 97964f7f2ace..a772a8cc1eae 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2761,6 +2761,34 @@ static const struct panel_desc_dsi panasonic_vvx10f004b00 = {
 	.lanes = 4,
 };
 
+static const struct drm_display_mode lg_acx467akm_7_mode = {
+	.clock = 150000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 2,
+	.hsync_end = 1080 + 2 + 2,
+	.htotal = 1080 + 2 + 2 + 2,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 2,
+	.vsync_end = 1920 + 2 + 2,
+	.vtotal = 1920 + 2 + 2 + 2,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc_dsi lg_acx467akm_7 = {
+	.desc = {
+		.modes = &lg_acx467akm_7_mode,
+		.num_modes = 1,
+		.bpc = 8,
+		.size = {
+			.width = 62,
+			.height = 110,
+		},
+	},
+	.flags = 0,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+};
+
 static const struct of_device_id dsi_of_match[] = {
 	{
 		.compatible = "auo,b080uan01",
@@ -2777,6 +2805,9 @@ static const struct of_device_id dsi_of_match[] = {
 	}, {
 		.compatible = "panasonic,vvx10f004b00",
 		.data = &panasonic_vvx10f004b00
+	}, {
+		.compatible = "lg,acx467akm-7",
+		.data = &lg_acx467akm_7
 	}, {
 		/* sentinel */
 	}
-- 
2.17.2
