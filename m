From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 15/27] drm/sun4i: Not all DW HDMI controllers
 has scrambled addresses
Date: Sun,  2 Sep 2018 09:26:31 +0200
Message-ID: <20180902072643.4917-16-jernej.skrabec@siol.net>
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB25BV3OAKGQEXEEG6UI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180902072643.4917-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently supported Allwinner SoCs with DW HDMI controller have
scrambled addresses and read lock. However, that is not true in general.
For example, A80 and H6 have normal addresses and normal read access.

Move code for unscrambling addresses and unlocking read access to it's
own function and call it from init function.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 82502b351aec..ad4ba1cc83b4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -279,8 +279,21 @@ static const struct dw_hdmi_phy_ops sun8i_hdmi_phy_ops = {
 	.setup_hpd = &dw_hdmi_phy_setup_hpd,
 };
 
+static void sun8i_hdmi_phy_unlock(struct sun8i_hdmi_phy *phy)
+{
+	/* enable read access to HDMI controller */
+	regmap_write(phy->regs, SUN8I_HDMI_PHY_READ_EN_REG,
+		     SUN8I_HDMI_PHY_READ_EN_MAGIC);
+
+	/* unscramble register offsets */
+	regmap_write(phy->regs, SUN8I_HDMI_PHY_UNSCRAMBLE_REG,
+		     SUN8I_HDMI_PHY_UNSCRAMBLE_MAGIC);
+}
+
 static void sun8i_hdmi_phy_init_a83t(struct sun8i_hdmi_phy *phy)
 {
+	sun8i_hdmi_phy_unlock(phy);
+
 	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_DBG_CTRL_REG,
 			   SUN8I_HDMI_PHY_DBG_CTRL_PX_LOCK,
 			   SUN8I_HDMI_PHY_DBG_CTRL_PX_LOCK);
@@ -298,6 +311,8 @@ static void sun8i_hdmi_phy_init_h3(struct sun8i_hdmi_phy *phy)
 {
 	unsigned int val;
 
+	sun8i_hdmi_phy_unlock(phy);
+
 	regmap_write(phy->regs, SUN8I_HDMI_PHY_ANA_CFG1_REG, 0);
 	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_ANA_CFG1_REG,
 			   SUN8I_HDMI_PHY_ANA_CFG1_ENBI,
@@ -372,14 +387,6 @@ static void sun8i_hdmi_phy_init_h3(struct sun8i_hdmi_phy *phy)
 
 void sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy)
 {
-	/* enable read access to HDMI controller */
-	regmap_write(phy->regs, SUN8I_HDMI_PHY_READ_EN_REG,
-		     SUN8I_HDMI_PHY_READ_EN_MAGIC);
-
-	/* unscramble register offsets */
-	regmap_write(phy->regs, SUN8I_HDMI_PHY_UNSCRAMBLE_REG,
-		     SUN8I_HDMI_PHY_UNSCRAMBLE_MAGIC);
-
 	phy->variant->phy_init(phy);
 }
 
-- 
2.18.0
