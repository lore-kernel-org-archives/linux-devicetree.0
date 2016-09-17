From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH] drm/panel: simple: add support for Sharp LQ150X1LG11 panels
Date: Sat, 17 Sep 2016 11:28:37 +0200
Message-ID: <1474104517-16874-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Gustaf=20Lindstr=C3=B6m?= <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Sharp 15" LQ150X1LG11 panel is an XGA TFT LCD panel.

Signed-off-by: Gustaf Lindström <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
---
 .../bindings/display/panel/sharp,lq150x1lg11.txt   |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
new file mode 100644
index 000000000000..014428c984c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
@@ -0,0 +1,7 @@
+Sharp 15" LQ150X1LG11 XGA TFT LCD panel
+
+Required properties:
+- compatible: should be "sharp,lq150x1lg11"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 85143d1b9b31..58cfe0a7a9d6 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1386,6 +1386,30 @@ static const struct panel_desc sharp_lq123p1jx31 = {
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
+	.bpc = 8,
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
@@ -1641,6 +1665,9 @@ static const struct of_device_id platform_of_match[] = {
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
