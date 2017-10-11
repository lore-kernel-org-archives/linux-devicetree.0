From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH 5/9] drm/panel: simple: add support for EDT ET0350 3.5" QVGA panel
Date: Wed, 11 Oct 2017 13:23:37 +0200
Message-ID: <1507721021-28174-6-git-send-email-LW@KARO-electronics.de>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507721021-28174-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lothar Waßmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 .../bindings/display/panel/edt,et0350g0dh6.txt        |  7 +++++++
 drivers/gpu/drm/panel/panel-simple.c                  | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/edt,et0350g0dh6.txt

diff --git a/Documentation/devicetree/bindings/display/panel/edt,et0350g0dh6.txt b/Documentation/devicetree/bindings/display/panel/edt,et0350g0dh6.txt
new file mode 100644
index 0000000..5546221
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/edt,et0350g0dh6.txt
@@ -0,0 +1,7 @@
+Emerging Display Technology Corp. 3.5" QVGA (320x240) TFT LCD panel
+
+Required properties:
+- compatible: should be "edt,et0350g0dh6"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 7bbb752..f57b463 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -763,6 +763,22 @@ static const struct panel_desc chunghwa_claa101wb01 = {
 	},
 };
 
+static const struct drm_display_mode edt_et0350g0dh6_mode =
+	SP_DISPLAY_MODE(6500, 320, 20, 0, 68, 240, 4, 0, 18, 60,
+			DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
+
+static const struct panel_desc edt_et0350g0dh6 = {
+	.modes = &edt_et0350g0dh6_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 70,
+		.height = 53,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+};
+
 static const struct drm_display_mode edt_et057090dhu_mode =
 	SP_DISPLAY_MODE(25175, 640, 16, 30, 114, 480, 10, 3, 32, 60,
 			DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
@@ -1591,6 +1607,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "chunghwa,claa101wb01",
 		.data = &chunghwa_claa101wb01
 	}, {
+		.compatible = "edt,et0350g0dh6",
+		.data = &edt_et0350g0dh6,
+	}, {
 		.compatible = "edt,et057090dhu",
 		.data = &edt_et057090dhu,
 	}, {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
