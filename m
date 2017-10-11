From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 8/9] drm/panel: simple: add support for EDT ETM0700G0EDH6 7" WVGA panel
Date: Wed, 11 Oct 2017 13:23:40 +0200
Message-ID: <1507721021-28174-9-git-send-email-LW@KARO-electronics.de>
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

This panel is the same as ETM0700g0DH6 with an inverted pixel clock.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 .../bindings/display/panel/edt,etm0700g0edh6.txt          |  9 +++++++++
 drivers/gpu/drm/panel/panel-simple.c                      | 15 +++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/edt,etm0700g0edh6.txt

diff --git a/Documentation/devicetree/bindings/display/panel/edt,etm0700g0edh6.txt b/Documentation/devicetree/bindings/display/panel/edt,etm0700g0edh6.txt
new file mode 100644
index 0000000..e6e8ef5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/edt,etm0700g0edh6.txt
@@ -0,0 +1,9 @@
+Emerging Display Technology Corp. ETM0700G0EDH6 7.0" WVGA TFT LCD panel
+
+Required properties:
+- compatible: should be "edt,etm0700g0edh6"
+
+This panel is the same as ETM0700g0DH6 with and inverted pixel clock.
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 52e0cb6..d4d2a89 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -827,6 +827,18 @@ static const struct panel_desc edt_etm0700g0dh6 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
 };
 
+static const struct panel_desc edt_etm0700g0edh6 = {
+	.modes = &edt_etm0700g0dh6_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+};
+
 static const struct drm_display_mode foxlink_fl500wvr00_a0t_mode =
 	SP_DISPLAY_MODE(32260, 800, 168, 64, 88, 480, 37, 2, 8, 60, 0);
 
@@ -1674,6 +1686,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "edt,etm0700g0dh6",
 		.data = &edt_etm0700g0dh6,
 	}, {
+		.compatible = "edt,etm0700g0edh6",
+		.data = &edt_etm0700g0edh6,
+	}, {
 		.compatible = "foxlink,fl500wvr00-a0t",
 		.data = &foxlink_fl500wvr00_a0t,
 	}, {
-- 
2.1.4
