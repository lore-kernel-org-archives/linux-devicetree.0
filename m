From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH v3 2/2] drm: panel: simple: add QiaoDian qd43003c0-40
Date: Thu,  8 Oct 2015 17:42:41 +0200
Message-ID: <1444318961-31103-2-git-send-email-alexandre.belloni@free-electrons.com>
References: <1444318961-31103-1-git-send-email-alexandre.belloni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444318961-31103-1-git-send-email-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Josh Wu <josh.wu@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

From: Josh Wu <josh.wu@atmel.com>

The QiaoDian Xianshi QD43003C0-40 is a 4"3 TFT LCD panel.

Timings from the OTA5180A document, ver 0.9, section
10.1.1:
  http://www.orientdisplay.com/pdf/OTA5180A.pdf

Signed-off-by: Josh Wu <josh.wu@atmel.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 .../bindings/panel/qiaodian,qd43003c0-40.txt       |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/qiaodian,qd43003c0-40.txt

diff --git a/Documentation/devicetree/bindings/panel/qiaodian,qd43003c0-40.txt b/Documentation/devicetree/bindings/panel/qiaodian,qd43003c0-40.txt
new file mode 100644
index 000000000000..0fbdab89ac3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/qiaodian,qd43003c0-40.txt
@@ -0,0 +1,7 @@
+QiaoDian XianShi Corporation 4"3 TFT LCD panel
+
+Required properties:
+- compatible: should be "qiaodian,qd43003c0-40"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f97b73ec4713..c93ffa615005 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1027,6 +1027,30 @@ static const struct panel_desc ortustech_com43h4m85ulc = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode qd43003c0_40_mode = {
+	.clock = 9000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 8,
+	.hsync_end = 480 + 8 + 4,
+	.htotal = 480 + 8 + 4 + 39,
+	.vdisplay = 272,
+	.vsync_start = 272 + 4,
+	.vsync_end = 272 + 4 + 10,
+	.vtotal = 272 + 4 + 10 + 2,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc qd43003c0_40 = {
+	.modes = &qd43003c0_40_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 95,
+		.height = 53,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+};
+
 static const struct drm_display_mode samsung_ltn101nt05_mode = {
 	.clock = 54030,
 	.hdisplay = 1024,
@@ -1182,6 +1206,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "ortustech,com43h4m85ulc",
 		.data = &ortustech_com43h4m85ulc,
 	}, {
+		.compatible = "qiaodian,qd43003c0-40",
+		.data = &qd43003c0_40,
+	}, {
 		.compatible = "samsung,ltn101nt05",
 		.data = &samsung_ltn101nt05,
 	}, {
-- 
2.1.4
