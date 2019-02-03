From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RESEND v2 07/12] drm/panel: simple: don't fail
 if we don't have panel desc
Date: Sun,  3 Feb 2019 10:54:56 -0800
Message-ID: <20190203185501.8958-8-anarsoul@gmail.com>
References: <20190203185501.8958-1-anarsoul@gmail.com>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBLPS3TRAKGQECCXD2IQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190203185501.8958-1-anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is preparation for addition of generic eDP panel that
doesn't have any modes or delays defined.

Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9c69e739a524..2f2cb2d81f2b 100644
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
 
-- 
2.20.1
