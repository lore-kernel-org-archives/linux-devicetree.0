From: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 4/7] drm/panel: simple: Add support for KEO TX31D200VM0BAA
Date: Sun,  4 Feb 2018 23:19:28 +0530
Message-ID: <1517766571-409-5-git-send-email-jagan@amarulasolutions.com>
References: <1517766571-409-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517766571-409-1-git-send-email-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support for the Kaohsiung Opto-Electronics.,
TX31D200VM0BAA 12.3" HSXGA LVDS panel, which can be
supported by the simple panel driver.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes for v3:
- collect Rob reiew tag 
Changes for v2:
- Updated binding info about optional properties, node and example

 .../bindings/display/panel/koe,tx31d200vm0baa.txt  | 25 ++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt

diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
new file mode 100644
index 0000000..6a036ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
@@ -0,0 +1,25 @@
+Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
+
+Required properties:
+- compatible: should be "koe,tx31d200vm0baa"
+
+Optional properties:
+- backlight: phandle of the backlight device attached to the panel
+
+Optional nodes:
+- Video port for LVDS panel input.
+
+Example:
+	panel {
+		compatible = "koe,tx31d200vm0baa";
+		backlight = <&backlight_lvds>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2ecc14b..8a0e4a8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1241,6 +1241,30 @@ static const struct panel_desc innolux_zj070na_01p = {
 	},
 };
 
+static const struct display_timing koe_tx31d200vm0baa_timing = {
+	.pixelclock = { 39600000, 43200000, 48000000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 16, 36, 56 },
+	.hback_porch = { 16, 36, 56 },
+	.hsync_len = { 8, 8, 8 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 6, 21, 33.5 },
+	.vback_porch = { 6, 21, 33.5 },
+	.vsync_len = { 8, 8, 8 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc koe_tx31d200vm0baa = {
+	.timings = &koe_tx31d200vm0baa_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 292,
+		.height = 109,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+};
+
 static const struct display_timing kyo_tcg121xglp_timing = {
 	.pixelclock = { 52000000, 65000000, 71000000 },
 	.hactive = { 1024, 1024, 1024 },
@@ -2151,6 +2175,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "innolux,zj070na-01p",
 		.data = &innolux_zj070na_01p,
 	}, {
+		.compatible = "koe,tx31d200vm0baa",
+		.data = &koe_tx31d200vm0baa,
+	}, {
 		.compatible = "kyo,tcg121xglp",
 		.data = &kyo_tcg121xglp,
 	}, {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
