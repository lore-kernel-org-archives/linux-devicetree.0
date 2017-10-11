From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 7/9] drm/panel: simple: add support for NLT NL12880 12.1" WXGA LVDS panel
Date: Wed, 11 Oct 2017 13:23:39 +0200
Message-ID: <1507721021-28174-8-git-send-email-LW@KARO-electronics.de>
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
 .../bindings/display/panel/nlt,nl12880bc20.txt     | 14 +++++++
 drivers/gpu/drm/panel/panel-simple.c               | 45 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/nlt,nl12880bc20.txt

diff --git a/Documentation/devicetree/bindings/display/panel/nlt,nl12880bc20.txt b/Documentation/devicetree/bindings/display/panel/nlt,nl12880bc20.txt
new file mode 100644
index 0000000..071b065
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/nlt,nl12880bc20.txt
@@ -0,0 +1,14 @@
+NLT Technologies Ltd. NL12880BC20 12.1" WXGA LVDS panel
+
+Note: The output format of the display can be configured via two
+      control pins (FRC, MSL). Depending on the strapping of those
+      pins the appropriate 'compatible' string has to be used.
+
+Required properties:
+- compatible: should be one of:
+   - "nlt,nl12880bc20-spwg-18" for SPWG (18bpp) FRC: Low or open, MSL: Low or open
+   - "nlt,nl12880bc20-spwg-24" for SPWG (24bpp) FRC: High, MSL: High
+   - "nlt,nl12880bc20-jeida" for JEIDA          FRC: High, MSL: High
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0b8fd55..52e0cb6 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1234,6 +1234,42 @@ static const struct panel_desc nlt_nl192108ac18_02d = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 };
 
+static const struct drm_display_mode nlt_nl12880bc20_mode =
+	SP_DISPLAY_MODE(71000, 1280, 50, 60, 50, 800, 5, 13, 5, 0, 0);
+
+static const struct panel_desc nlt_nl12880bc20_jeida = {
+	.modes = &nlt_nl12880bc20_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 261,
+		.height = 163,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+};
+
+static const struct panel_desc nlt_nl12880bc20_spwg_18 = {
+	.modes = &nlt_nl12880bc20_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 261,
+		.height = 163,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+};
+
+static const struct panel_desc nlt_nl12880bc20_spwg_24 = {
+	.modes = &nlt_nl12880bc20_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 261,
+		.height = 163,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+};
+
 static const struct drm_display_mode nvd_9128_mode =
 	SP_DISPLAY_MODE(29500, 800, 130, 98, 0, 480, 10, 50, 0, 0, 0);
 
@@ -1707,6 +1743,15 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "nlt,nl192108ac18-02d",
 		.data = &nlt_nl192108ac18_02d,
 	}, {
+		.compatible = "nlt,nl12880bc20-jeida",
+		.data = &nlt_nl12880bc20_jeida,
+	}, {
+		.compatible = "nlt,nl12880bc20-spwg-18",
+		.data = &nlt_nl12880bc20_spwg_18,
+	}, {
+		.compatible = "nlt,nl12880bc20-spwg-24",
+		.data = &nlt_nl12880bc20_spwg_24,
+	}, {
 		.compatible = "nvd,9128",
 		.data = &nvd_9128,
 	}, {
-- 
2.1.4
