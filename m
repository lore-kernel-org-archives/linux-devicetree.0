From: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Subject: [PATCH 2/2] drm/panel: simple: Add URT UMSH-8596MD-xT panels support
Date: Sat, 13 Feb 2016 22:52:03 +0100
Message-ID: <56BFA583.4040902@maciej.szmigiero.name>
References: <5615885C.5050505@maciej.szmigiero.name> <20151008082444.GC3820@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151008082444.GC3820@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for United Radiant Technology UMSH-8596MD-xT
7.0" WVGA TFT LCD panels in DRM panel-simple driver.

Signed-off-by: Maciej S. Szmigiero <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
---
This replaces "drm: panel-simple: implement URT UMSH-8596MD-xT panel support"
submission.

 drivers/gpu/drm/panel/panel-simple.c | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f88a631c43ab..6530c1ffca2c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1176,6 +1176,42 @@ static const struct panel_desc shelly_sca07010_bfn_lnn = {
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
@@ -1280,6 +1316,24 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "shelly,sca07010-bfn-lnn",
 		.data = &shelly_sca07010_bfn_lnn,
 	}, {
+		.compatible = "urt,umsh-8596md-t",
+		.data = &urt_umsh_8596md_parallel,
+	}, {
+		.compatible = "urt,umsh-8596md-1t",
+		.data = &urt_umsh_8596md_parallel,
+	}, {
+		.compatible = "urt,umsh-8596md-7t",
+		.data = &urt_umsh_8596md_parallel,
+	}, {
+		.compatible = "urt,umsh-8596md-11t",
+		.data = &urt_umsh_8596md_lvds,
+	}, {
+		.compatible = "urt,umsh-8596md-19t",
+		.data = &urt_umsh_8596md_lvds,
+	}, {
+		.compatible = "urt,umsh-8596md-20t",
+		.data = &urt_umsh_8596md_parallel,
+	}, {
 		/* sentinel */
 	}
 };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
