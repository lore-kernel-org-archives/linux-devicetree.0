From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH 4/9] drm/panel: simple: add support for overriding the pixel clock polarity
Date: Wed, 11 Oct 2017 13:23:36 +0200
Message-ID: <1507721021-28174-5-git-send-email-LW@KARO-electronics.de>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507721021-28174-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Ka-Ro electronics MB7 baseboard has an on-board LCD->LVDS
converter that requires a fixed pixelclk polarity, no matter what the
panel's display_mode specifies. Add an option to override the pixelclk
polarity defined in the panel's display_mode via DTB.

Signed-off-by: Lothar Waßmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 .../bindings/display/panel/simple-panel.txt        |  3 +++
 drivers/gpu/drm/panel/panel-simple.c               | 30 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
index e2308c3..dcaf9a7 100644
--- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
+++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
@@ -9,6 +9,9 @@ Optional properties:
 - backlight: phandle of the backlight device attached to the panel
 - bus-format-override: override the bus_format setting of the panel's
   display_mode settings
+- pixelclk-active: override the pixelclock polarity defined in the
+  panel's display_mode settings
+
 
 Example:
 
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f356a7b..7bbb752 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -89,6 +89,12 @@ struct panel_simple {
 	struct gpio_desc *enable_gpio;
 
 	u32 bus_fmt_override;
+	u32 quirks;
+};
+
+enum {
+	PANEL_QUIRK_PIXDATA_NEGEDGE = BIT(0),
+	PANEL_QUIRK_PIXDATA_POSEDGE = BIT(1),
 };
 
 #define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr, flgs) { \
@@ -110,6 +116,15 @@ static inline struct panel_simple *to_panel_simple(struct drm_panel *panel)
 	return container_of(panel, struct panel_simple, base);
 }
 
+static inline void panel_simple_apply_quirks(struct panel_simple *panel,
+					     struct drm_display_info *info)
+{
+	if (panel->quirks & PANEL_QUIRK_PIXDATA_NEGEDGE)
+		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_NEGEDGE;
+	if (panel->quirks & PANEL_QUIRK_PIXDATA_POSEDGE)
+		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_POSEDGE;
+}
+
 static int panel_simple_get_fixed_modes(struct panel_simple *panel)
 {
 	struct drm_connector *connector = panel->base.connector;
@@ -175,6 +190,8 @@ static int panel_simple_get_fixed_modes(struct panel_simple *panel)
 		drm_display_info_set_bus_formats(&connector->display_info,
 						 &panel->desc->bus_format, 1);
 	connector->display_info.bus_flags = panel->desc->bus_flags;
+	if (panel->quirks)
+		panel_simple_apply_quirks(panel, &connector->display_info);
 
 	return num;
 }
@@ -308,6 +325,7 @@ static inline int panel_simple_check_quirks(struct device *dev,
 					    struct panel_simple *p)
 {
 	const char *bus_fmt;
+	u32 clkpol;
 
 	if (of_property_read_string(dev->of_node, "bus-format-override",
 				    &bus_fmt) == 0) {
@@ -329,6 +347,18 @@ static inline int panel_simple_check_quirks(struct device *dev,
 				bus_fmt);
 		return p->bus_fmt_override ? 0 : -EINVAL;
 	}
+
+	if (of_property_read_u32(dev->of_node, "pixelclk-active",
+				 &clkpol) == 0) {
+		if (clkpol & ~1) {
+			dev_err(dev,
+				"Invalid value for pixelclk-active: '%u' (should be <0> or <1>)\n",
+				clkpol);
+			return -EINVAL;
+		}
+		p->quirks |= clkpol ? PANEL_QUIRK_PIXDATA_POSEDGE :
+			PANEL_QUIRK_PIXDATA_NEGEDGE;
+	}
 	return 0;
 }
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
