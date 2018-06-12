From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 15/27] drm/sun4i: Add support for R40 TV TCON
Date: Tue, 12 Jun 2018 22:00:24 +0200
Message-ID: <20180612200036.21483-16-jernej.skrabec@siol.net>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBWGNQDMQKGQEXAU6UNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180612200036.21483-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

R40 TV TCON is similar to the A83T TV TCON, except that it needs
additional gate to be enabled.

Add support for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index c9ffa5381185..f20da2aa2165 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1326,6 +1326,11 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
 	.has_channel_1		= true,
 };
 
+static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
+	.has_channel_1		= true,
+	.has_tcon_top_gate	= true,
+};
+
 static const struct sun4i_tcon_quirks sun8i_v3s_quirks = {
 	.has_channel_0		= true,
 };
@@ -1350,6 +1355,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-lcd", .data = &sun8i_a83t_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-tv", .data = &sun8i_a83t_tv_quirks },
+	{ .compatible = "allwinner,sun8i-r40-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = &sun9i_a80_tcon_tv_quirks },
-- 
2.17.1
