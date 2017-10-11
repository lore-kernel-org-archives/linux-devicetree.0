From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 3/9] drm/panel: simple: make it possible to override LCD bus format
Date: Wed, 11 Oct 2017 13:23:35 +0200
Message-ID: <1507721021-28174-4-git-send-email-LW@KARO-electronics.de>
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

The baseboards for the Ka-Ro electronics series of i.MX modules
use a 24bit LCD interface, no matter what LCD bus width the SoC on the
module provides and what the LCD panel expects. LCDs with 6bit per color
will ignore the 2 LSBs of each color lane, and modules using a SoC
that provides only 6bit per color, drive the display information on the
6 MSBs of each color lane and tie the 2 LSBs of each color lane to GND.

Thus, no matter what combination of LCD and SoC is used, the LCD port
can be used without shuffling bit lanes by always configuring the LCD
output to 24bit mode.

Add a function to handle certain quirks of the LCD interface to the
panel driver to be able to override the bus format specified in a
panel's display_mode.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 .../bindings/display/panel/simple-panel.txt        |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 40 +++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
index 1341bbf..e2308c3 100644
--- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
+++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
@@ -7,6 +7,8 @@ Optional properties:
 - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
 - enable-gpios: GPIO pin to enable or disable the panel
 - backlight: phandle of the backlight device attached to the panel
+- bus-format-override: override the bus_format setting of the panel's
+  display_mode settings
 
 Example:
 
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index fde9c41..f356a7b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -87,6 +87,8 @@ struct panel_simple {
 	struct i2c_adapter *ddc;
 
 	struct gpio_desc *enable_gpio;
+
+	u32 bus_fmt_override;
 };
 
 #define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr, flgs) { \
@@ -165,7 +167,11 @@ static int panel_simple_get_fixed_modes(struct panel_simple *panel)
 	connector->display_info.bpc = panel->desc->bpc;
 	connector->display_info.width_mm = panel->desc->size.width;
 	connector->display_info.height_mm = panel->desc->size.height;
-	if (panel->desc->bus_format)
+
+	if (panel->bus_fmt_override)
+		drm_display_info_set_bus_formats(&connector->display_info,
+						 &panel->bus_fmt_override, 1);
+	else if (panel->desc->bus_format)
 		drm_display_info_set_bus_formats(&connector->display_info,
 						 &panel->desc->bus_format, 1);
 	connector->display_info.bus_flags = panel->desc->bus_flags;
@@ -298,6 +304,34 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static inline int panel_simple_check_quirks(struct device *dev,
+					    struct panel_simple *p)
+{
+	const char *bus_fmt;
+
+	if (of_property_read_string(dev->of_node, "bus-format-override",
+				    &bus_fmt) == 0) {
+		if (strcmp(bus_fmt, "rgb24") == 0)
+			p->bus_fmt_override = MEDIA_BUS_FMT_RGB888_1X24;
+		else if (strcmp(bus_fmt, "rgb666") == 0)
+			p->bus_fmt_override = MEDIA_BUS_FMT_RGB666_1X18;
+		else if (strcmp(bus_fmt, "rgb565") == 0)
+			p->bus_fmt_override = MEDIA_BUS_FMT_RGB565_1X16;
+		else if (strcmp(bus_fmt, "spwg-18") == 0)
+			p->bus_fmt_override = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
+		else if (strcmp(bus_fmt, "spwg-24") == 0)
+			p->bus_fmt_override = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
+		else if (strcmp(bus_fmt, "jeida-24") == 0)
+			p->bus_fmt_override = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+		else
+			dev_err(dev,
+				"Unsupported bus-format-override value: '%s'\n",
+				bus_fmt);
+		return p->bus_fmt_override ? 0 : -EINVAL;
+	}
+	return 0;
+}
+
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
@@ -353,6 +387,10 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		}
 	}
 
+	err = panel_simple_check_quirks(dev, panel);
+	if (err)
+		goto free_ddc;
+
 	drm_panel_init(&panel->base);
 	panel->base.dev = dev;
 	panel->base.funcs = &panel_simple_funcs;
-- 
2.1.4
