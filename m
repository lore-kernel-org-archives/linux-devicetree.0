From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 08/16] drm/sun4i: Add support for H3 mixer 0
Date: Thu,  1 Mar 2018 22:34:34 +0100
Message-ID: <20180301213442.16677-9-jernej.skrabec@siol.net>
References: <20180301213442.16677-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBEXE4HKAKGQE2IFPDFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180301213442.16677-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: jernej.skrabec-gGgVlfcn5nU@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This mixer supports 1 VI plane, 3 UI plane and HW scaling on all planes.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 9b0256d31a61..126899d6f0d3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -492,6 +492,14 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
+	.ccsc		= 0,
+	.mod_rate	= 432000000,
+	.scaler_mask	= 0xf,
+	.ui_num		= 3,
+	.vi_num		= 1,
+};
+
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.vi_num = 2,
 	.ui_num = 1,
@@ -509,6 +517,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun8i-a83t-de2-mixer-1",
 		.data = &sun8i_a83t_mixer1_cfg,
 	},
+	{
+		.compatible = "allwinner,sun8i-h3-de2-mixer-0",
+		.data = &sun8i_h3_mixer0_cfg,
+	},
 	{
 		.compatible = "allwinner,sun8i-v3s-de2-mixer",
 		.data = &sun8i_v3s_mixer_cfg,
-- 
2.16.2
