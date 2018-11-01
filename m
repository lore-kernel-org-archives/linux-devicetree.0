From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: [PATCH v2 5/7] drm/panel: simple: Add support for the
 LeMaker BL035-RGB-002 3.5" LCD
Date: Thu,  1 Nov 2018 21:00:43 +0100
Message-ID: <20181101200045.6078-6-contact@paulk.fr>
References: <20181101200045.6078-1-contact@paulk.fr>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC75HK6WUAEBBTFX5XPAKGQEMN3VDNY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181101200045.6078-1-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support for the 3.5" LCD panel from LeMaker, sold for use with
BananaPi boards. It comes with a 24-bit RGB888 parallel interface and
requires an active-low DE signal

Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 90296090340e..8e147cfa7b88 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1562,6 +1562,30 @@ static const struct panel_desc kyo_tcg121xglp = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 };
 
+static const struct drm_display_mode lemaker_bl035_rgb_002_mode = {
+	.clock = 7000,
+	.hdisplay = 320,
+	.hsync_start = 320 + 20,
+	.hsync_end = 320 + 20 + 30,
+	.htotal = 320 + 20 + 30 + 38,
+	.vdisplay = 240,
+	.vsync_start = 240 + 4,
+	.vsync_end = 240 + 4 + 3,
+	.vtotal = 240 + 4 + 3 + 15,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc lemaker_bl035_rgb_002 = {
+	.modes = &lemaker_bl035_rgb_002_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 70,
+		.height = 52,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static const struct drm_display_mode lg_lb070wv8_mode = {
 	.clock = 33246,
 	.hdisplay = 800,
@@ -2569,6 +2593,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "kyo,tcg121xglp",
 		.data = &kyo_tcg121xglp,
+	}, {
+		.compatible = "lemaker,bl035-rgb-002",
+		.data = &lemaker_bl035_rgb_002,
 	}, {
 		.compatible = "lg,lb070wv8",
 		.data = &lg_lb070wv8,
-- 
2.19.1
