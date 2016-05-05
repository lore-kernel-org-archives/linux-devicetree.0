From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Subject: [PATCH] drm/panel: Add display timings for TPK U.S.A. LLC Fusion 7", 10.1" panels
Date: Thu, 5 May 2016 11:47:07 +0530
Message-ID: <1462429027-18496-1-git-send-email-bhuvanchandra.dv@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: airlied@linux.ie, stefan@agner.ch, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawnguo@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
List-Id: devicetree@vger.kernel.org

Add support for TPK U.S.A. LLC Fusion 7", 10.1"
panels to the DRM simple panel driver.

Signed-off-by: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
---

This patch is based on top of Stefan's clock polarity patches[1]

[1] https://lkml.org/lkml/2016/5/5/20


 .../bindings/display/panel/tpk,f07a-0102.txt       |  8 ++++
 .../bindings/display/panel/tpk,f10a-0102.txt       |  8 ++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 drivers/gpu/drm/panel/panel-simple.c               | 51 ++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt

diff --git a/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt b/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt
new file mode 100644
index 0000000..a2613b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt
@@ -0,0 +1,8 @@
+TPK U.S.A. LLC Fusion 7" integrated projected capacitive touch display with,
+800 x 480 (WVGA) LCD panel.
+
+Required properties:
+- compatible: should be "tpk,f07a-0102"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt b/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt
new file mode 100644
index 0000000..b9d0511
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt
@@ -0,0 +1,8 @@
+TPK U.S.A. LLC Fusion 10.1" integrated projected capacitive touch display with,
+1024 x 600 (WSVGA) LCD panel.
+
+Required properties:
+- compatible: should be "tpk,f10a-0102"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 86740d4..141aae4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -247,6 +247,7 @@ toradex	Toradex AG
 toshiba	Toshiba Corporation
 toumaz	Toumaz
 tplink	TP-LINK Technologies Co., Ltd.
+tpk	TPK U.S.A. LLC
 tronfy	Tronfy
 tronsmart	Tronsmart
 truly	Truly Semiconductors Limited
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b19c88f..b8778b1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1204,6 +1204,51 @@ static const struct panel_desc shelly_sca07010_bfn_lnn = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct drm_display_mode tpk_f07a_0102_mode = {
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
+};
+
+static const struct panel_desc tpk_f07a_0102 = {
+	.modes = &tpk_f07a_0102_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
+};
+
+static const struct drm_display_mode tpk_f10a_0102_mode = {
+	.clock = 45000,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 176,
+	.hsync_end = 1024 + 176 + 5,
+	.htotal = 1024 + 176 + 5 + 88,
+	.vdisplay = 600,
+	.vsync_start = 600 + 20,
+	.vsync_end = 600 + 20 + 5,
+	.vtotal = 600 + 20 + 5 + 25,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc tpk_f10a_0102 = {
+	.modes = &tpk_f10a_0102_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 223,
+		.height = 125,
+	},
+};
+
 static const struct display_timing urt_umsh_8596md_timing = {
 	.pixelclock = { 33260000, 33260000, 33260000 },
 	.hactive = { 800, 800, 800 },
@@ -1347,6 +1392,12 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "shelly,sca07010-bfn-lnn",
 		.data = &shelly_sca07010_bfn_lnn,
 	}, {
+		.compatible = "tpk,f07a-0102",
+		.data = &tpk_f07a_0102,
+	}, {
+		.compatible = "tpk,f10a-0102",
+		.data = &tpk_f10a_0102,
+	}, {
 		.compatible = "urt,umsh-8596md-t",
 		.data = &urt_umsh_8596md_parallel,
 	}, {
-- 
2.8.2
