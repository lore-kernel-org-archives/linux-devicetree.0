From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] drm/panel: Add support for Chungwa CLAA101WA01A panel
Date: Tue,  7 Jan 2014 16:46:26 -0700
Message-ID: <1389138386-4618-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Chungwa CLAA101WA01A is a 10.1" 1366x768 panel, which can be
supported by the simple panel driver.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/panel/chunghwa,claa101wa01a.txt       |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 25 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/chunghwa,claa101wa01a.txt

diff --git a/Documentation/devicetree/bindings/panel/chunghwa,claa101wa01a.txt b/Documentation/devicetree/bindings/panel/chunghwa,claa101wa01a.txt
new file mode 100644
index 000000000000..f24614e4d5ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/chunghwa,claa101wa01a.txt
@@ -0,0 +1,7 @@
+Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
+
+Required properties:
+- compatible: should be "chunghwa,claa101wa01a"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a2d5e3f1205e..d68a9635ab9e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -316,6 +316,28 @@ static const struct panel_desc auo_b101aw03 = {
 	},
 };
 
+static const struct drm_display_mode chungwa_claa101wa01a_mode = {
+	.clock = 72070,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 58,
+	.hsync_end = 1366 + 58 + 58,
+	.htotal = 1366 + 58 + 58 + 58,
+	.vdisplay = 768,
+	.vsync_start = 768 + 4,
+	.vsync_end = 768 + 4 + 4,
+	.vtotal = 768 + 4 + 4 + 4,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc chungwa_claa101wa01a = {
+	.modes = &chungwa_claa101wa01a_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 220,
+		.height = 120,
+	},
+};
+
 static const struct drm_display_mode chunghwa_claa101wb01_mode = {
 	.clock = 69300,
 	.hdisplay = 1366,
@@ -365,6 +387,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "auo,b101aw03",
 		.data = &auo_b101aw03,
 	}, {
+		.compatible = "chungwa,claa101wa01a",
+		.data = &chungwa_claa101wa01a
+	}, {
 		.compatible = "chunghwa,claa101wb01",
 		.data = &chunghwa_claa101wb01
 	}, {
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
