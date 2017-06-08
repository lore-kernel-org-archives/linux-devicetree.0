From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 3/4] drm/panel: simple: add support for NLT NL192108AC18-02D
Date: Thu,  8 Jun 2017 20:07:57 +0200
Message-ID: <20170608180758.31020-3-l.stach@pengutronix.de>
References: <20170608180758.31020-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170608180758.31020-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds support for the NLT Technologies NL192108AC18-02D
15.6" LVDS FullHD TFT LCD panel, which can be supported
by the simple panel driver.

Timings are taken from the preliminary datasheet, as a final
one is not yet available.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
v2: mention power-supply property
---
 .../display/panel/nlt,nl192108ac18-02d.txt         |  8 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt

diff --git a/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt b/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
new file mode 100644
index 000000000000..1a639fd8778d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
@@ -0,0 +1,8 @@
+NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
+
+Required properties:
+- compatible: should be "nlt,nl192108ac18-02d"
+- power-supply: as specified in the base binding
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 585b37f9171a..99758e38525e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1398,6 +1398,32 @@ static const struct panel_desc netron_dy_e231732 = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct display_timing nlt_nl192108ac18_02d_timing = {
+	.pixelclock = { 130000000, 148350000, 163000000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 80, 100, 100 },
+	.hback_porch = { 100, 120, 120 },
+	.hsync_len = { 50, 60, 60 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 12, 30, 30 },
+	.vback_porch = { 4, 10, 10 },
+	.vsync_len = { 4, 5, 5 },
+};
+
+static const struct panel_desc nlt_nl192108ac18_02d = {
+	.timings = &nlt_nl192108ac18_02d_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 344,
+		.height = 194,
+	},
+	.delay = {
+		.unprepare = 500,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+};
+
 static const struct drm_display_mode nvd_9128_mode = {
 	.clock = 29500,
 	.hdisplay = 800,
@@ -2008,6 +2034,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "netron-dy,e231732",
 		.data = &netron_dy_e231732,
 	}, {
+		.compatible = "nlt,nl192108ac18-02d",
+		.data = &nlt_nl192108ac18_02d,
+	}, {
 		.compatible = "nvd,9128",
 		.data = &nvd_9128,
 	}, {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
