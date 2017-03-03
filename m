From: Richard Genoud <richard.genoud@gmail.com>
Subject: [PATCH 2/2] drm/panel: simple: Add support for Winstar WF35LTIACD
Date: Fri,  3 Mar 2017 16:21:56 +0100
Message-ID: <20170303152156.31370-2-richard.genoud@gmail.com>
References: <20170303152156.31370-1-richard.genoud@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170303152156.31370-1-richard.genoud@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds support for the Winstar Display Co. WF35LTIACD 3.5" QVGA TFT
LCD panel, which can be supported by the simple panel driver.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 .../bindings/display/panel/winstar,wf35ltiacd      |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd

diff --git a/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
new file mode 100644
index 000000000000..68408adf239f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
@@ -0,0 +1,7 @@
+Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
+
+Required properties:
+- compatible: should be "winstar,wf35ltiacd"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 06aaf79de8c8..5d45664c6c0e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1713,6 +1713,31 @@ static const struct panel_desc urt_umsh_8596md_parallel = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct drm_display_mode winstar_wf35ltiacd_mode = {
+	.clock = 6410,
+	.hdisplay = 320,
+	.hsync_start = 320 + 20,
+	.hsync_end = 320 + 20 + 30,
+	.htotal = 320 + 20 + 30 + 38,
+	.vdisplay = 240,
+	.vsync_start = 240 + 4,
+	.vsync_end = 240 + 4 + 3,
+	.vtotal = 240 + 4 + 3 + 15,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc winstar_wf35ltiacd = {
+	.modes = &winstar_wf35ltiacd_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 70,
+		.height = 53,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+};
+
 static const struct of_device_id platform_of_match[] = {
 	{
 		.compatible = "ampire,am800480r3tmqwa1h",
@@ -1892,6 +1917,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "urt,umsh-8596md-20t",
 		.data = &urt_umsh_8596md_parallel,
 	}, {
+		.compatible = "winstar,wf35ltiacd",
+		.data = &winstar_wf35ltiacd,
+	}, {
 		/* sentinel */
 	}
 };
