From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 3/8] drm/panel: simple: Add support for LG
 LP097x02-slq2 panel
Date: Sat, 11 Feb 2017 19:44:00 +0200
Message-ID: <20170211174405.28395-4-plaes@plaes.org>
References: <20170211174405.28395-1-plaes@plaes.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJLTBEBXENBB6427XCAKGQEQYVWSGI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170211174405.28395-1-plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add simple-panel support for the LG LP097x02-slq2, which is 10"
1024x768 LVDS panel.

Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 06aaf79..2948fed 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1205,6 +1205,28 @@ static const struct panel_desc lg_lp097qx1_spa1 = {
 	},
 };
 
+static const struct drm_display_mode lg_lp097x02_slq2_mode = {
+    .clock = 100000,
+    .hdisplay = 1024,
+    .hsync_start = 1024 + 260,
+    .hsync_end = 1024 + 260 + 1,
+    .htotal = 1024 + 260 + 1 + 799,
+    .vdisplay = 768,
+    .vsync_start = 768 + 16,
+    .vsync_end = 768 + 16 + 1,
+    .vtotal = 768 + 16 + 1 + 15,
+    .vrefresh = 60,
+};
+
+static const struct panel_desc lg_lp097x02_slq2 = {
+    .modes = &lg_lp097x02_slq2_mode,
+    .num_modes = 1,
+    .size = {
+        .width = 197,
+        .height = 147,
+    },
+};
+
 static const struct drm_display_mode lg_lp120up1_mode = {
 	.clock = 162300,
 	.hdisplay = 1920,
@@ -1817,6 +1839,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "lg,lp097qx1-spa1",
 		.data = &lg_lp097qx1_spa1,
 	}, {
+		.compatible = "lg,lp097x02-slq2",
+		.data = &lg_lp097x02_slq2,
+	}, {
 		.compatible = "lg,lp120up1",
 		.data = &lg_lp120up1,
 	}, {
-- 
2.9.3
