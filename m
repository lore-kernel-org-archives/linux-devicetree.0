From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH v4 2/2] drm/panel: simple: add support for Sharp LQ150X1LG11 panels
Date: Tue, 4 Oct 2016 17:29:21 +0200
Message-ID: <1475594961-5713-3-git-send-email-peda@axentia.se>
References: <1475594961-5713-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475594961-5713-1-git-send-email-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Gustaf=20Lindstr=C3=B6m?= <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Gustaf Lindström <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>

The Sharp 15" LQ150X1LG11 panel is an XGA TFT LCD panel.

The simple-panel driver is used to get support for essential
functionality of the panel.

Signed-off-by: Gustaf Lindström <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

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
