From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 12/29] drm/sun4i: Disable unused DE2 sub-engines
Date: Sun,  7 Oct 2018 11:38:48 +0200
Message-ID: <20181007093905.11253-13-jernej.skrabec@siol.net>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBZNI47OQKGQE7G4AUZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181007093905.11253-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some sub-engines are unused. Disable them explicitly.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 8 ++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 7beb3065a522..2cb24d987005 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -462,6 +462,14 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	/* Reset the registers */
 	for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
 		regmap_write(mixer->engine.regs, i, 0);
+	/* Disable unused sub-engines */
+	regmap_write(mixer->engine.regs, DE2_MIXER_FCE_EN, 0);
+	regmap_write(mixer->engine.regs, DE2_MIXER_BWS_EN, 0);
+	regmap_write(mixer->engine.regs, DE2_MIXER_LTI_EN, 0);
+	regmap_write(mixer->engine.regs, DE2_MIXER_PEAK_EN, 0);
+	regmap_write(mixer->engine.regs, DE2_MIXER_ASE_EN, 0);
+	regmap_write(mixer->engine.regs, DE2_MIXER_FCC_EN, 0);
+	regmap_write(mixer->engine.regs, DE2_MIXER_DCSC_EN, 0);
 
 	/* Enable the mixer */
 	regmap_write(mixer->engine.regs, DE2_MIXER_GLOBAL_CTL,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index e2aa42e8f715..f26ee6af6cba 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -101,8 +101,8 @@
 #define DE2_MIXER_FBFMT_YUV411		14
 
 /*
- * These sub-engines are still unknown now, the EN registers are here only to
- * be used to disable these sub-engines.
+ * Sub-engines listed bellow are unused for now. The EN registers are here only
+ * to be used to disable these sub-engines.
  */
 #define DE2_MIXER_FCE_EN			0xa0000
 #define DE2_MIXER_BWS_EN			0xa2000
-- 
2.19.0
