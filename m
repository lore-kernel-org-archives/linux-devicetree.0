From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 6/9] drm/panel: simple: add support for EDT ET0430 4.3" HVGA panel
Date: Wed, 11 Oct 2017 13:23:38 +0200
Message-ID: <1507721021-28174-7-git-send-email-LW@KARO-electronics.de>
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

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 .../bindings/display/panel/edt,et0430g0dh6.txt        |  7 +++++++
 drivers/gpu/drm/panel/panel-simple.c                  | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/edt,et0430g0dh6.txt

diff --git a/Documentation/devicetree/bindings/display/panel/edt,et0430g0dh6.txt b/Documentation/devicetree/bindings/display/panel/edt,et0430g0dh6.txt
new file mode 100644
index 0000000..d1bdd1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/edt,et0430g0dh6.txt
@@ -0,0 +1,7 @@
+Emerging Display Technology Corp. 4.3" HVGA (480x272) TFT LCD panel
+
+Required properties:
+- compatible: should be "edt,et0430g0dh6"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f57b463..0b8fd55 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -779,6 +779,22 @@ static const struct panel_desc edt_et0350g0dh6 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
 };
 
+static const struct drm_display_mode edt_et0430g0dh6_mode =
+	SP_DISPLAY_MODE(9000, 480, 2, 41, 2, 272, 2, 10, 2, 60,
+			DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
+
+static const struct panel_desc edt_et0430g0dh6 = {
+	.modes = &edt_et0430g0dh6_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 95,
+		.height = 54,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+};
+
 static const struct drm_display_mode edt_et057090dhu_mode =
 	SP_DISPLAY_MODE(25175, 640, 16, 30, 114, 480, 10, 3, 32, 60,
 			DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC);
@@ -1610,6 +1626,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "edt,et0350g0dh6",
 		.data = &edt_et0350g0dh6,
 	}, {
+		.compatible = "edt,et0430g0dh6",
+		.data = &edt_et0430g0dh6,
+	}, {
 		.compatible = "edt,et057090dhu",
 		.data = &edt_et057090dhu,
 	}, {
-- 
2.1.4
