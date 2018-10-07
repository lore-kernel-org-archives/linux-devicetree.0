From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 21/29] drm/sun4i: dw-hdmi-phy: Reorder quirks
 by family
Date: Sun,  7 Oct 2018 11:38:57 +0200
Message-ID: <20181007093905.11253-22-jernej.skrabec@siol.net>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB65I47OQKGQEW6FUHIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Currently, quirks and compatibles are sorted alphabetically. However,
they should be sorted by family release date and then alphabetically.

Fix that by moving A64 quirks and compatible to bottom. No functional
change is made.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 365cb5a9fb77..adc3ba7df7e3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -403,13 +403,6 @@ static struct regmap_config sun8i_hdmi_phy_regmap_config = {
 	.name		= "phy"
 };
 
-static const struct sun8i_hdmi_phy_variant sun50i_a64_hdmi_phy = {
-	.has_phy_clk = true,
-	.phy_init = &sun8i_hdmi_phy_init_h3,
-	.phy_disable = &sun8i_hdmi_phy_disable_h3,
-	.phy_config = &sun8i_hdmi_phy_config_h3,
-};
-
 static const struct sun8i_hdmi_phy_variant sun8i_a83t_hdmi_phy = {
 	.phy_init = &sun8i_hdmi_phy_init_a83t,
 	.phy_disable = &sun8i_hdmi_phy_disable_a83t,
@@ -431,11 +424,14 @@ static const struct sun8i_hdmi_phy_variant sun8i_r40_hdmi_phy = {
 	.phy_config = &sun8i_hdmi_phy_config_h3,
 };
 
+static const struct sun8i_hdmi_phy_variant sun50i_a64_hdmi_phy = {
+	.has_phy_clk = true,
+	.phy_init = &sun8i_hdmi_phy_init_h3,
+	.phy_disable = &sun8i_hdmi_phy_disable_h3,
+	.phy_config = &sun8i_hdmi_phy_config_h3,
+};
+
 static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
-	{
-		.compatible = "allwinner,sun50i-a64-hdmi-phy",
-		.data = &sun50i_a64_hdmi_phy,
-	},
 	{
 		.compatible = "allwinner,sun8i-a83t-hdmi-phy",
 		.data = &sun8i_a83t_hdmi_phy,
@@ -448,6 +444,10 @@ static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 		.compatible = "allwinner,sun8i-r40-hdmi-phy",
 		.data = &sun8i_r40_hdmi_phy,
 	},
+	{
+		.compatible = "allwinner,sun50i-a64-hdmi-phy",
+		.data = &sun50i_a64_hdmi_phy,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.19.0
