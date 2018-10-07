From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 22/29] drm/sun4i: Add support for Synopsys
 HDMI PHY
Date: Sun,  7 Oct 2018 11:38:58 +0200
Message-ID: <20181007093905.11253-23-jernej.skrabec@siol.net>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB7NI47OQKGQEHEM5DYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Currently sun8i-hdmi-phy driver supports only custom PHYs connected to
DW HDMI controller. Since newest Allwinner SoCs have unmodified Synopsys
PHY, driver has to be reorganized to support them.

Variant structure is expanded to allow differentiation between custom
and Sysnopsys PHYs and to hold Synopsys PHY settings.

Since DW HDMI bridge platform data has different fields for custom and
Sysnopsys PHY, function sun8i_hdmi_phy_get_ops() is replaced with
sun8i_hdmi_phy_set_ops().

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  |  4 +---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  7 ++++++-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 19 +++++++++++++++++--
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 0306a51e1b35..492c938f119d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -185,9 +185,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	sun8i_hdmi_phy_init(hdmi->phy);
 
 	plat_data->mode_valid = hdmi->quirks->mode_valid;
-	plat_data->phy_ops = sun8i_hdmi_phy_get_ops();
-	plat_data->phy_name = "sun8i_dw_hdmi_phy";
-	plat_data->phy_data = hdmi->phy;
+	sun8i_hdmi_phy_set_ops(hdmi->phy, plat_data);
 
 	platform_set_drvdata(pdev, hdmi);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index f9eb663865a4..37646ff9a7a2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -150,6 +150,10 @@ struct sun8i_hdmi_phy;
 struct sun8i_hdmi_phy_variant {
 	bool has_phy_clk;
 	bool has_second_pll;
+	bool is_custom_phy;
+	const struct dw_hdmi_curr_ctrl *cur_ctr;
+	const struct dw_hdmi_mpll_config *mpll_cfg;
+	const struct dw_hdmi_phy_config *phy_cfg;
 	void (*phy_init)(struct sun8i_hdmi_phy *phy);
 	void (*phy_disable)(struct dw_hdmi *hdmi,
 			    struct sun8i_hdmi_phy *phy);
@@ -198,7 +202,8 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node);
 void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi);
 
 void sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy);
-const struct dw_hdmi_phy_ops *sun8i_hdmi_phy_get_ops(void);
+void sun8i_hdmi_phy_set_ops(struct sun8i_hdmi_phy *phy,
+			    struct dw_hdmi_plat_data *plat_data);
 
 int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device *dev,
 			 bool second_parent);
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index adc3ba7df7e3..635825b55648 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -390,9 +390,20 @@ void sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy)
 	phy->variant->phy_init(phy);
 }
 
-const struct dw_hdmi_phy_ops *sun8i_hdmi_phy_get_ops(void)
+void sun8i_hdmi_phy_set_ops(struct sun8i_hdmi_phy *phy,
+			    struct dw_hdmi_plat_data *plat_data)
 {
-	return &sun8i_hdmi_phy_ops;
+	struct sun8i_hdmi_phy_variant *variant = phy->variant;
+
+	if (variant->is_custom_phy) {
+		plat_data->phy_ops = &sun8i_hdmi_phy_ops;
+		plat_data->phy_name = "sun8i_dw_hdmi_phy";
+		plat_data->phy_data = phy;
+	} else {
+		plat_data->mpll_cfg = variant->mpll_cfg;
+		plat_data->cur_ctr = variant->cur_ctr;
+		plat_data->phy_config = variant->phy_cfg;
+	}
 }
 
 static struct regmap_config sun8i_hdmi_phy_regmap_config = {
@@ -404,6 +415,7 @@ static struct regmap_config sun8i_hdmi_phy_regmap_config = {
 };
 
 static const struct sun8i_hdmi_phy_variant sun8i_a83t_hdmi_phy = {
+	.is_custom_phy = true,
 	.phy_init = &sun8i_hdmi_phy_init_a83t,
 	.phy_disable = &sun8i_hdmi_phy_disable_a83t,
 	.phy_config = &sun8i_hdmi_phy_config_a83t,
@@ -411,6 +423,7 @@ static const struct sun8i_hdmi_phy_variant sun8i_a83t_hdmi_phy = {
 
 static const struct sun8i_hdmi_phy_variant sun8i_h3_hdmi_phy = {
 	.has_phy_clk = true,
+	.is_custom_phy = true,
 	.phy_init = &sun8i_hdmi_phy_init_h3,
 	.phy_disable = &sun8i_hdmi_phy_disable_h3,
 	.phy_config = &sun8i_hdmi_phy_config_h3,
@@ -419,6 +432,7 @@ static const struct sun8i_hdmi_phy_variant sun8i_h3_hdmi_phy = {
 static const struct sun8i_hdmi_phy_variant sun8i_r40_hdmi_phy = {
 	.has_phy_clk = true,
 	.has_second_pll = true,
+	.is_custom_phy = true,
 	.phy_init = &sun8i_hdmi_phy_init_h3,
 	.phy_disable = &sun8i_hdmi_phy_disable_h3,
 	.phy_config = &sun8i_hdmi_phy_config_h3,
@@ -426,6 +440,7 @@ static const struct sun8i_hdmi_phy_variant sun8i_r40_hdmi_phy = {
 
 static const struct sun8i_hdmi_phy_variant sun50i_a64_hdmi_phy = {
 	.has_phy_clk = true,
+	.is_custom_phy = true,
 	.phy_init = &sun8i_hdmi_phy_init_h3,
 	.phy_disable = &sun8i_hdmi_phy_disable_h3,
 	.phy_config = &sun8i_hdmi_phy_config_h3,
-- 
2.19.0
