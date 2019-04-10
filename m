From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [PATCH 1/2] drm: panel-simple: Add simple-panel driver.
Date: Wed, 10 Apr 2019 16:10:44 +0200
Message-ID: <20190410141045.58097-1-christoph.muellner@theobroma-systems.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: heiko@sntech.de, Christoph Muellner <christoph.muellner@theobroma-systems.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On our RK3399-Q7 EVK base board we have the option to connect an arbitrary
monitor via DP cable. The actual monitor is therefore not known in advance.
This means, we don't have any panel information besides the EDID
data from the device itself.

The functionality for a 'simple-panel' has been remove a couple
of years ago with 81cf32b. This patch brings this feature back.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e8218f6a3f2..1f69283f3e4b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -176,7 +176,7 @@ static int panel_simple_disable(struct drm_panel *panel)
 		backlight_update_status(p->backlight);
 	}
 
-	if (p->desc->delay.disable)
+	if (p->desc && p->desc->delay.disable)
 		msleep(p->desc->delay.disable);
 
 	p->enabled = false;
@@ -195,7 +195,7 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 
 	regulator_disable(p->supply);
 
-	if (p->desc->delay.unprepare)
+	if (p->desc && p->desc->delay.unprepare)
 		msleep(p->desc->delay.unprepare);
 
 	p->prepared = false;
@@ -220,11 +220,13 @@ static int panel_simple_prepare(struct drm_panel *panel)
 
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
-	delay = p->desc->delay.prepare;
-	if (p->no_hpd)
-		delay += p->desc->delay.hpd_absent_delay;
-	if (delay)
-		msleep(delay);
+	if (p->desc) {
+		delay = p->desc->delay.prepare;
+		if (p->no_hpd)
+			delay += p->desc->delay.hpd_absent_delay;
+		if (delay)
+			msleep(delay);
+	}
 
 	p->prepared = true;
 
@@ -238,7 +240,7 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->enabled)
 		return 0;
 
-	if (p->desc->delay.enable)
+	if (p->desc && p->desc->delay.enable)
 		msleep(p->desc->delay.enable);
 
 	if (p->backlight) {
@@ -280,6 +282,9 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	struct panel_simple *p = to_panel_simple(panel);
 	unsigned int i;
 
+	if (!p->desc)
+		return 0;
+
 	if (p->desc->num_timings < num_timings)
 		num_timings = p->desc->num_timings;
 
@@ -2536,6 +2541,9 @@ static const struct panel_desc arm_rtsm = {
 
 static const struct of_device_id platform_of_match[] = {
 	{
+		.compatible = "simple-panel",
+		.data = NULL,
+	}, {
 		.compatible = "ampire,am-480272h3tmqw-t01h",
 		.data = &ampire_am_480272h3tmqw_t01h,
 	}, {
-- 
2.11.0
