From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 09/16] drm/sun4i: Fix polarity configuration
 for DW HDMI PHY
Date: Thu,  1 Mar 2018 22:34:35 +0100
Message-ID: <20180301213442.16677-10-jernej.skrabec@siol.net>
References: <20180301213442.16677-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBFPE4HKAKGQE3NUZ2UQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Current polarity configuration code is cleary wrong since it compares
same flag two times. However, even if flag name is fixed, it won't work
well for resolutions which have one polarity positive and another
negative.

Fix that by properly set each bit according to each polarity. Since
those two bits are not described in any documentation, relationships
were obtained by experimentation.

Fixes: b7c7436a5ff0 ("drm/sun4i: Implement A83T HDMI driver")

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index e5bfcdd43ec9..9d2f11ca3538 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -10,7 +10,8 @@
 #define SUN8I_HDMI_PHY_DBG_CTRL_REG	0x0000
 #define SUN8I_HDMI_PHY_DBG_CTRL_PX_LOCK		BIT(0)
 #define SUN8I_HDMI_PHY_DBG_CTRL_POL_MASK	GENMASK(15, 8)
-#define SUN8I_HDMI_PHY_DBG_CTRL_POL(val)	(val << 8)
+#define SUN8I_HDMI_PHY_DBG_CTRL_POL_NHSYNC	BIT(8)
+#define SUN8I_HDMI_PHY_DBG_CTRL_POL_NVSYNC	BIT(9)
 #define SUN8I_HDMI_PHY_DBG_CTRL_ADDR_MASK	GENMASK(23, 16)
 #define SUN8I_HDMI_PHY_DBG_CTRL_ADDR(addr)	(addr << 16)
 
@@ -35,14 +36,14 @@ static int sun8i_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
 	struct sun8i_hdmi_phy *phy = (struct sun8i_hdmi_phy *)data;
 	u32 val = 0;
 
-	if ((mode->flags & DRM_MODE_FLAG_NHSYNC) &&
-	    (mode->flags & DRM_MODE_FLAG_NHSYNC)) {
-		val = 0x03;
-	}
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		val |= SUN8I_HDMI_PHY_DBG_CTRL_POL_NHSYNC;
+
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		val |= SUN8I_HDMI_PHY_DBG_CTRL_POL_NVSYNC;
 
 	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_DBG_CTRL_REG,
-			   SUN8I_HDMI_PHY_DBG_CTRL_POL_MASK,
-			   SUN8I_HDMI_PHY_DBG_CTRL_POL(val));
+			   SUN8I_HDMI_PHY_DBG_CTRL_POL_MASK, val);
 
 	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_REXT_CTRL_REG,
 			   SUN8I_HDMI_PHY_REXT_CTRL_REXT_EN,
-- 
2.16.2
