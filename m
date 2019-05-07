From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 2/3] drm/panel: simple: Add FriendlyELEC HD702E 800x1280 LCD panel
Date: Tue,  7 May 2019 18:37:07 +0530
Message-ID: <20190507130708.11255-2-jagan@amarulasolutions.com>
References: <20190507130708.11255-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507130708.11255-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

HD702E lcd is FriendlyELEC developed eDP LCD panel with 800x1280
resolution. It has built in Goodix, GT9271 captive touchscreen
with backlight adjustable via PWM.

Add support for it.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- separate it from binding patch
- sort the match id and compatible 

 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e8218f6a3f2..93274e270663 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1184,6 +1184,29 @@ static const struct panel_desc foxlink_fl500wvr00_a0t = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode friendlyarm_hd702e_mode = {
+	.clock		= 67185,
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 20,
+	.hsync_end	= 800 + 20 + 24,
+	.htotal		= 800 + 20 + 24 + 20,
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 4,
+	.vsync_end	= 1280 + 4 + 8,
+	.vtotal		= 1280 + 4 + 8 + 4,
+	.vrefresh	= 60,
+	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc friendlyarm_hd702e = {
+	.modes = &friendlyarm_hd702e_mode,
+	.num_modes = 1,
+	.size = {
+		.width	= 94,
+		.height	= 151,
+	},
+};
+
 static const struct drm_display_mode giantplus_gpg482739qs5_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -2637,6 +2660,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "foxlink,fl500wvr00-a0t",
 		.data = &foxlink_fl500wvr00_a0t,
+	}, {
+		.compatible = "friendlyarm,hd702e",
+		.data = &friendlyarm_hd702e,
 	}, {
 		.compatible = "giantplus,gpg482739qs5",
 		.data = &giantplus_gpg482739qs5
-- 
2.18.0.321.gffc6fa0e3
