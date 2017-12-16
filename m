From: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2] drm/panel: Add support for AUO G104SN02 V2 panel
Date: Sat, 16 Dec 2017 14:13:36 +0100
Message-ID: <1513430016.1930.4.camel@googlemail.com>
References: <1513173656.2322.16.camel@googlemail.com>
         <20171215230754.cnepbs34t5gp2rsf@rob-hp-laptop>
Reply-To: chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215230754.cnepbs34t5gp2rsf@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stefan =?ISO-8859-1?Q?Riedm=FCller?= <S.Riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for AUO G104SN02 V2 800x600 10.4" panel to DRM
simple panel driver.

Signed-off-by: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Signed-off-by: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
---
Changes since v1:
 - be explicit as to which properties apply
 - adapt indenting

 .../bindings/display/panel/auo,g104sn02.txt        | 12 ++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt

diff --git a/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt b/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
new file mode 100644
index 0000000..85626ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
@@ -0,0 +1,12 @@
+AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
+
+Required properties:
+- compatible: should be "auo,g104sn02"
+- power-supply: as specified in the base binding
+
+Optional properties:
+- backlight: as specified in the base binding
+- enable-gpios: as specified in the base binding
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b7c4709..8599905 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -581,6 +581,29 @@ static const struct panel_desc auo_b133htn01 = {
 	},
 };
 
+static const struct drm_display_mode auo_g104sn02_mode = {
+	.clock = 40000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 40,
+	.hsync_end = 800 + 40 + 216,
+	.htotal = 800 + 40 + 216 + 128,
+	.vdisplay = 600,
+	.vsync_start = 600 + 10,
+	.vsync_end = 600 + 10 + 35,
+	.vtotal = 600 + 10 + 35 + 2,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc auo_g104sn02 = {
+	.modes = &auo_g104sn02_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 211,
+		.height = 158,
+	},
+};
+
 static const struct display_timing auo_g133han01_timings = {
 	.pixelclock = { 134000000, 141200000, 149000000 },
 	.hactive = { 1920, 1920, 1920 },
@@ -1993,6 +2016,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "auo,b133xtn01",
 		.data = &auo_b133xtn01,
 	}, {
+		.compatible = "auo,g104sn02",
+		.data = &auo_g104sn02,
+	}, {
 		.compatible = "auo,g133han01",
 		.data = &auo_g133han01,
 	}, {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
