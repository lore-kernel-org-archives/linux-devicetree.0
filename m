From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 10/28] drm/sun4i: Fix DE2 mixer size
Date: Sun,  4 Nov 2018 19:26:47 +0100
Message-ID: <20181104182705.18047-11-jernej.skrabec@siol.net>
References: <20181104182705.18047-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBL7U7TPAKGQELHQJEAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181104182705.18047-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org
List-Id: devicetree@vger.kernel.org

DE2 mixer is always 0x6000 bytes in size on all known SoCs.

While at it, introduce a macro for that.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 6129c350f7bd..6769ec08c0d3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -460,7 +460,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	base = sun8i_blender_base(mixer);
 
 	/* Reset the registers */
-	for (i = 0x0; i < 0x20000; i += 4)
+	for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
 		regmap_write(mixer->engine.regs, i, 0);
 
 	/* Enable the mixer */
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 025550a1f539..09e0f4428c1e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -29,6 +29,8 @@
 
 #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
 
+#define DE2_MIXER_UNIT_SIZE			0x6000
+
 #define DE2_BLD_BASE				0x1000
 #define DE2_CH_BASE				0x2000
 #define DE2_CH_SIZE				0x1000
-- 
2.19.1
