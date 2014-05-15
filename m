From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3] drm/panel: Add support for EDT ETM0700G0DH6 and
 ET070080DH6 panels
Date: Thu, 15 May 2014 12:25:47 +0200
Message-ID: <1400149547-1541-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <treding@nvidia.com>
Cc: devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

The EDT ETM0700G0DH6 and ET070080DH6 are 7" 800x480 panels,
which can be supported by the simple panel driver.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v2:
 - Added device tree binding documentation. Do we really want to add one little
   file for each panel?
---
 .../devicetree/bindings/panel/edt,et070080dh6.txt  | 10 ++++++++
 .../devicetree/bindings/panel/edt,etm0700g0dh6.txt | 10 ++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/edt,et070080dh6.txt
 create mode 100644 Documentation/devicetree/bindings/panel/edt,etm0700g0dh6.txt

diff --git a/Documentation/devicetree/bindings/panel/edt,et070080dh6.txt b/Documentation/devicetree/bindings/panel/edt,et070080dh6.txt
new file mode 100644
index 0000000..20cb38e
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/edt,et070080dh6.txt
@@ -0,0 +1,10 @@
+Emerging Display Technology Corp. ET070080DH6 7.0" WVGA TFT LCD panel
+
+Required properties:
+- compatible: should be "edt,et070080dh6"
+
+This panel is the same as ETM0700G0DH6 except for the touchscreen.
+ET070080DH6 is the model with resistive touch.
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/panel/edt,etm0700g0dh6.txt b/Documentation/devicetree/bindings/panel/edt,etm0700g0dh6.txt
new file mode 100644
index 0000000..ee4b180
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/edt,etm0700g0dh6.txt
@@ -0,0 +1,10 @@
+Emerging Display Technology Corp. ETM0700G0DH6 7.0" WVGA TFT LCD panel
+
+Required properties:
+- compatible: should be "edt,etm0700g0dh6"
+
+This panel is the same as ET070080DH6 except for the touchscreen.
+ETM0700G0DH6 is the model with capacitive multitouch.
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 309f29e..72da48c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -328,6 +328,29 @@ static const struct panel_desc chunghwa_claa101wb01 = {
 	},
 };
 
+static const struct drm_display_mode edt_etm0700g0dh6_mode = {
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
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc edt_etm0700g0dh6 = {
+	.modes = &edt_etm0700g0dh6_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+};
+
 static const struct drm_display_mode lg_lp129qe_mode = {
 	.clock = 285250,
 	.hdisplay = 2560,
@@ -383,6 +406,12 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "chunghwa,claa101wb01",
 		.data = &chunghwa_claa101wb01
 	}, {
+		.compatible = "edt,et070080dh6",
+		.data = &edt_etm0700g0dh6,
+	}, {
+		.compatible = "edt,etm0700g0dh6",
+		.data = &edt_etm0700g0dh6,
+	}, {
 		.compatible = "lg,lp129qe",
 		.data = &lg_lp129qe,
 	}, {
-- 
2.0.0.rc0
