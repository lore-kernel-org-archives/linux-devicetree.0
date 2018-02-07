From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 3/5] drm/panel: simple: Add ability to override typical timing
Date: Wed,  7 Feb 2018 12:23:57 -0500
Message-ID: <20180207172404.107358-4-seanpaul@chromium.org>
References: <20180207172404.107358-1-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180207172404.107358-1-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the ability to override the typical display timing for a
given panel. This is useful for devices which have timing constraints
that do not apply across the entire display driver (eg: to avoid
crosstalk between panel and digitizer on certain laptops). The rules are
as follows:

- panel must not specify fixed mode (since the override mode will
  either be the same as the fixed mode, or we'll be unable to
  check the bounds of the overried)
- panel must specify at least one display_timing range which will be
  used to ensure the override mode fits within its bounds

Changes in v2:
 - Parse the full display-timings node (using the native-mode) (Rob)

Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stéphane Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 77 +++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5591984a392b..c1635b35f97e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -34,6 +34,7 @@
 #include <drm/drm_panel.h>
 
 #include <video/display_timing.h>
+#include <video/of_display_timing.h>
 #include <video/videomode.h>
 
 struct panel_desc {
@@ -87,6 +88,8 @@ struct panel_simple {
 	struct i2c_adapter *ddc;
 
 	struct gpio_desc *enable_gpio;
+
+	struct drm_display_mode override_mode;
 };
 
 static inline struct panel_simple *to_panel_simple(struct drm_panel *panel)
@@ -99,11 +102,22 @@ static int panel_simple_get_fixed_modes(struct panel_simple *panel)
 	struct drm_connector *connector = panel->base.connector;
 	struct drm_device *drm = panel->base.drm;
 	struct drm_display_mode *mode;
+	bool has_override = panel->override_mode.type;
 	unsigned int i, num = 0;
 
 	if (!panel->desc)
 		return 0;
 
+	if (has_override) {
+		mode = drm_mode_duplicate(drm, &panel->override_mode);
+		if (mode) {
+			drm_mode_probed_add(connector, mode);
+			num++;
+		} else {
+			dev_err(drm->dev, "failed to add override mode\n");
+		}
+	}
+
 	for (i = 0; i < panel->desc->num_timings; i++) {
 		const struct display_timing *dt = &panel->desc->timings[i];
 		struct videomode vm;
@@ -120,7 +134,7 @@ static int panel_simple_get_fixed_modes(struct panel_simple *panel)
 
 		mode->type |= DRM_MODE_TYPE_DRIVER;
 
-		if (panel->desc->num_timings == 1)
+		if (panel->desc->num_timings == 1 && !has_override)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
@@ -291,10 +305,58 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.get_timings = panel_simple_get_timings,
 };
 
+#define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
+	(to_check->field.typ >= bounds->field.min && \
+	 to_check->field.typ <= bounds->field.max)
+static void panel_simple_add_override_mode(struct device *dev,
+					   struct panel_simple *panel,
+					   const struct display_timing *ot)
+{
+	const struct panel_desc *desc = panel->desc;
+	struct videomode vm;
+	int i;
+
+	if (desc->num_modes) {
+		dev_err(dev, "Reject override mode: panel has a fixed mode\n");
+		return;
+	}
+	if (!desc->num_timings) {
+		dev_err(dev, "Reject override mode: no timings specified\n");
+		return;
+	}
+
+	for (i = 0; i < panel->desc->num_timings; i++) {
+		const struct display_timing *dt = &panel->desc->timings[i];
+
+		if (!PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hactive) ||
+		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hfront_porch) ||
+		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hback_porch) ||
+		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hsync_len) ||
+		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vactive) ||
+		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vfront_porch) ||
+		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vback_porch) ||
+		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vsync_len))
+			continue;
+
+		if (ot->flags != dt->flags)
+			continue;
+
+		videomode_from_timing(ot, &vm);
+		drm_display_mode_from_videomode(&vm, &panel->override_mode);
+		panel->override_mode.type |= DRM_MODE_TYPE_DRIVER |
+					     DRM_MODE_TYPE_PREFERRED;
+		return;
+	}
+
+	dev_err(dev, "Reject override mode: No display_timing found\n");
+	return;
+}
+
 static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 {
 	struct device_node *backlight, *ddc;
 	struct panel_simple *panel;
+	struct display_timings *dt;
 	int err;
 
 	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
@@ -338,6 +400,19 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		}
 	}
 
+	dt = of_get_display_timings(dev->of_node);
+	if (dt && dt->num_timings) {
+		/*
+		 * Only attempt adding the native mode from the provided display
+		 * timings. It doesn't really make sense to try multiple modes
+		 * since the override is meant to be tailored to the
+		 * device/panel.
+		 */
+		panel_simple_add_override_mode(dev, panel,
+					       dt->timings[dt->native_mode]);
+		display_timings_release(dt);
+	}
+
 	drm_panel_init(&panel->base);
 	panel->base.dev = dev;
 	panel->base.funcs = &panel_simple_funcs;
-- 
2.16.0.rc1.238.g530d649a79-goog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
