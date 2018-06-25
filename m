From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH 2/2] drm/panel: simple: Add support for DataImage SCF0700C48GGU18
Date: Mon, 25 Jun 2018 14:41:30 +0200
Message-ID: <1529930490-11874-2-git-send-email-michal.vokac@ysoft.com>
References: <1529930490-11874-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529930490-11874-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, thierry.reding@gmail.com
Cc: mark.rutland@arm.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
List-Id: devicetree@vger.kernel.org

This adds support for the DataImage SCF0700C48GGU18 7.0" WVGA (800x480)
TFT LCD panel. The panel has 24-bit parallel interface and can be
supported by the simple panel driver.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
 .../display/panel/dataimage,scf0700c48ggu18.txt    |  8 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt

diff --git a/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt b/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt
new file mode 100644
index 0000000..897085e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt
@@ -0,0 +1,8 @@
+DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
+
+Required properties:
+- compatible: should be "dataimage,scf0700c48ggu18"
+- power-supply: as specified in the base binding
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index cbf1ab4..796b091 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -857,6 +857,32 @@ static const struct panel_desc chunghwa_claa101wb01 = {
 	},
 };
 
+static const struct drm_display_mode dataimage_scf0700c48ggu18_mode = {
+	.clock = 33260,
+	.hdisplay = 800,
+	.hsync_start = 800 + 40,
+	.hsync_end = 800 + 40 + 128,
+	.htotal = 800 + 40 + 128 + 88,
+	.vdisplay = 480,
+	.vsync_start = 480 + 10,
+	.vsync_end = 480 + 10 + 2,
+	.vtotal = 480 + 10 + 2 + 33,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc dataimage_scf0700c48ggu18 = {
+	.modes = &dataimage_scf0700c48ggu18_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+};
+
 static const struct drm_display_mode edt_et057090dhu_mode = {
 	.clock = 25175,
 	.hdisplay = 640,
@@ -2125,6 +2151,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "chunghwa,claa101wb01",
 		.data = &chunghwa_claa101wb01
 	}, {
+		.compatible = "dataimage,scf0700c48ggu18",
+		.data = &dataimage_scf0700c48ggu18,
+	}, {
 		.compatible = "edt,et057090dhu",
 		.data = &edt_et057090dhu,
 	}, {
-- 
2.1.4
