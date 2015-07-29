From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: [PATCH] drm: panel-simple: add URT UMSH-8596MD-xT panel support
Date: Wed, 29 Jul 2015 21:58:54 +0200
Message-ID: <55B9307E.7070707@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee.jones@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for United Radiant Technology
UMSH-8596MD-xT 7.0" WVGA TFT LCD panels
(both LVDS and parallel versions) to DRM
panel-simple driver.

Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
---
 .../devicetree/bindings/panel/urt,umsh-8596md.txt  |   11 +++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/gpu/drm/panel/panel-simple.c               |   42 ++++++++++++++++++++
 3 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt

diff --git a/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
new file mode 100644
index 0000000..2990e6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
@@ -0,0 +1,11 @@
+United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
+
+Supported are LVDS versions (-11T, -19T) and parallel ones
+(-T, -1T, -7T, -20T).
+
+Required properties:
+- compatible: should be "urt,umsh-8596md-lvds" for LVDS versions,
+  "urt,umsh-8596md-parallel" for parallel ones.
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index d247994..f2bb617 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -212,6 +212,7 @@ toshiba	Toshiba Corporation
 toumaz	Toumaz
 tplink	TP-LINK Technologies Co., Ltd.
 truly	Truly Semiconductors Limited
+urt	United Radiant Technology Corporation
 usi	Universal Scientific Industrial Co., Ltd.
 v3	V3 Semiconductor
 variscite	Variscite Ltd.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f94201b..be47fd7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1036,6 +1036,42 @@ static const struct panel_desc shelly_sca07010_bfn_lnn = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct display_timing urt_umsh_8596md_timing = {
+	.pixelclock = { 33260000, 33260000, 33260000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 41, 41, 41 },
+	.hback_porch = { 216 - 128, 216 - 128, 216 - 128 },
+	.hsync_len = { 71, 128, 128 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 10, 10, 10 },
+	.vback_porch = { 35 - 2, 35 - 2, 35 - 2 },
+	.vsync_len = { 2, 2, 2 },
+	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_NEGEDGE |
+		DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc urt_umsh_8596md_lvds = {
+	.timings = &urt_umsh_8596md_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+};
+
+static const struct panel_desc urt_umsh_8596md_parallel = {
+	.timings = &urt_umsh_8596md_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+};
+
 static const struct of_device_id platform_of_match[] = {
 	{
 		.compatible = "ampire,am800480r3tmqwa1h",
@@ -1125,6 +1161,12 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "shelly,sca07010-bfn-lnn",
 		.data = &shelly_sca07010_bfn_lnn,
 	}, {
+		.compatible = "urt,umsh-8596md-lvds",
+		.data = &urt_umsh_8596md_lvds,
+	}, {
+		.compatible = "urt,umsh-8596md-parallel",
+		.data = &urt_umsh_8596md_parallel,
+	}, {
 		/* sentinel */
 	}
 };
