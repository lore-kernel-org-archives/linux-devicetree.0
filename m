From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v3 2/2] drm/panel: Add display timing for Okaya RS800480T-7X0GP
Date: Wed, 10 Jun 2015 18:44:23 +0200
Message-ID: <1433954663-31444-3-git-send-email-gary.bisson@boundarydevices.com>
References: <1432827466-8104-1-git-send-email-gary.bisson@boundarydevices.com>
 <1433954663-31444-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433954663-31444-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for the Okaya RS800480T-7X0GP to the DRM simple panel
driver.

The RS800480T-7X0GP is a WVGA (800x480) panel with an 18-bit parallel
LCD interface. It supports pixel clocks in the range of 30-40 MHz.

This panel details can be found at:
http://boundarydevices.com/product/7-800x480-display/

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 .../bindings/panel/okaya,rs800480t_7x0gp.txt       |  7 +++++
 drivers/gpu/drm/panel/panel-simple.c               | 33 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/okaya,rs800480t_7x0gp.txt

diff --git a/Documentation/devicetree/bindings/panel/okaya,rs800480t_7x0gp.txt b/Documentation/devicetree/bindings/panel/okaya,rs800480t_7x0gp.txt
new file mode 100644
index 0000000..f7c729d
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/okaya,rs800480t_7x0gp.txt
@@ -0,0 +1,7 @@
+OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
+
+Required properties:
+- compatible: should be "okaya,rs800480t_7x0gp"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f94201b..5262be1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -943,6 +943,36 @@ static const struct panel_desc lg_lp129qe = {
 	},
 };
 
+static const struct display_timing okaya_rs800480t_7x0gp_timing = {
+	.pixelclock = { 30000000, 30000000, 40000000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 40, 40, 40 },
+	.hback_porch = { 40, 40, 40 },
+	.hsync_len = { 1, 48, 48 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 13, 13, 13 },
+	.vback_porch = { 29, 29, 29 },
+	.vsync_len = { 3, 3, 3 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc okaya_rs800480t_7x0gp = {
+	.timings = &okaya_rs800480t_7x0gp_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 154,
+		.height = 87,
+	},
+	.delay = {
+		.prepare = 41,
+		.enable = 50,
+		.unprepare = 41,
+		.disable = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+};
+
 static const struct drm_display_mode ortustech_com43h4m85ulc_mode  = {
 	.clock = 25000,
 	.hdisplay = 480,
@@ -1113,6 +1143,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "lg,lp129qe",
 		.data = &lg_lp129qe,
 	}, {
+		.compatible = "okaya,rs800480t_7x0gp",
+		.data = &okaya_rs800480t_7x0gp,
+	}, {
 		.compatible = "ortustech,com43h4m85ulc",
 		.data = &ortustech_com43h4m85ulc,
 	}, {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
