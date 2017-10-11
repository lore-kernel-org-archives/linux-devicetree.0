From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 9/9] drm/panel: simple: add support for EDT ET1010G0DSA/ETML1010G0DKA 10.1" WXGA LVDS panels
Date: Wed, 11 Oct 2017 13:23:41 +0200
Message-ID: <1507721021-28174-10-git-send-email-LW@KARO-electronics.de>
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

This adds support for the Emerging Display Technologies Corporation
10.1" WXGA LVDS panel ET1010G0DSA (without a touch panel) and
ETML1010G0DKA (with capacitive touch panel).

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 .../bindings/display/panel/edt,et1010g0dsa.txt     |  7 +++++++
 .../bindings/display/panel/edt,etml1010g0dka.txt   |  9 +++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 22 ++++++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/edt,et1010g0dsa.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/edt,etml1010g0dka.txt

diff --git a/Documentation/devicetree/bindings/display/panel/edt,et1010g0dsa.txt b/Documentation/devicetree/bindings/display/panel/edt,et1010g0dsa.txt
new file mode 100644
index 0000000..f76e070
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/edt,et1010g0dsa.txt
@@ -0,0 +1,7 @@
+Emerging Display Technology Corp. ET1010G0DSA 10.1" WXGA TFT LVDS display panel
+
+Required properties:
+- compatible: should be "edt,et1010g0dsa"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/edt,etml1010g0dka.txt b/Documentation/devicetree/bindings/display/panel/edt,etml1010g0dka.txt
new file mode 100644
index 0000000..1413ea9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/edt,etml1010g0dka.txt
@@ -0,0 +1,9 @@
+Emerging Display Technology Corp. ETML1010G0DKA 10.1" WXGA TFT LVDS display panel
+
+Required properties:
+- compatible: should be "edt,etml1010g0dka"
+
+This panel is the same as ET101G0DSA with an integrated capacitive multitouch panel.
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d4d2a89..5154cb9 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -839,6 +839,22 @@ static const struct panel_desc edt_etm0700g0edh6 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
 };
 
+static const struct drm_display_mode edt_et1010g0dsa_mode =
+	SP_DISPLAY_MODE(71100, 1280, 25, 80, 55, 800, 5, 2, 16, 60,
+			DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+
+static const struct panel_desc edt_et1010g0dsa = {
+	.modes = &edt_et1010g0dsa_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+};
+
 static const struct drm_display_mode foxlink_fl500wvr00_a0t_mode =
 	SP_DISPLAY_MODE(32260, 800, 168, 64, 88, 480, 37, 2, 8, 60, 0);
 
@@ -1683,6 +1699,12 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "edt,et070080dh6",
 		.data = &edt_etm0700g0dh6,
 	}, {
+		.compatible = "edt,et1010g0dsa",
+		.data = &edt_et1010g0dsa,
+	}, {
+		.compatible = "edt,etml1010g0dka",
+		.data = &edt_et1010g0dsa,
+	}, {
 		.compatible = "edt,etm0700g0dh6",
 		.data = &edt_etm0700g0dh6,
 	}, {
-- 
2.1.4
