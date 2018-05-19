From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 09/15] drm/sun4i: Add support for R40 mixers
Date: Sat, 19 May 2018 20:31:21 +0200
Message-ID: <20180519183127.2718-10-jernej.skrabec@siol.net>
References: <20180519183127.2718-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBUO3QHMAKGQEHRQ7S3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180519183127.2718-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Both mixers have similar capabilities as others SoCs with DE2.

First mixer has 1 VI and 3 UI planes and supports HW scaling on all
planes.

Second mixer has 1 VI and 1 UI planes and also supports HW scaling on
all planes.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 36d90c76317a..78aa878e305c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -500,6 +500,24 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
+	.ccsc		= 0,
+	.index		= 0,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0xf,
+	.ui_num		= 3,
+	.vi_num		= 1,
+};
+
+static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
+	.ccsc		= 1,
+	.index		= 1,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0x3,
+	.ui_num		= 1,
+	.vi_num		= 1,
+};
+
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.vi_num = 2,
 	.ui_num = 1,
@@ -521,6 +539,14 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun8i-h3-de2-mixer-0",
 		.data = &sun8i_h3_mixer0_cfg,
 	},
+	{
+		.compatible = "allwinner,sun8i-r40-de2-mixer-0",
+		.data = &sun8i_r40_mixer0_cfg,
+	},
+	{
+		.compatible = "allwinner,sun8i-r40-de2-mixer-1",
+		.data = &sun8i_r40_mixer1_cfg,
+	},
 	{
 		.compatible = "allwinner,sun8i-v3s-de2-mixer",
 		.data = &sun8i_v3s_mixer_cfg,
-- 
2.17.0
