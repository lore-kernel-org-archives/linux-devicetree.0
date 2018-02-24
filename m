From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 08/15] drm/sun4i: Fix polarity configuration for
 DW HDMI PHY
Date: Sat, 24 Feb 2018 22:45:38 +0100
Message-ID: <20180224214545.3740-9-jernej.skrabec@siol.net>
References: <20180224214545.3740-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBJF2Y7KAKGQE7TXWEUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180224214545.3740-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
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
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index e5bfcdd43ec9..f48e8b70fabe 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -35,10 +35,11 @@ static int sun8i_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
 	struct sun8i_hdmi_phy *phy = (struct sun8i_hdmi_phy *)data;
 	u32 val = 0;
 
-	if ((mode->flags & DRM_MODE_FLAG_NHSYNC) &&
-	    (mode->flags & DRM_MODE_FLAG_NHSYNC)) {
-		val = 0x03;
-	}
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		val |= 0x01;
+
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		val |= 0x02;
 
 	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_DBG_CTRL_REG,
 			   SUN8I_HDMI_PHY_DBG_CTRL_POL_MASK,
-- 
2.16.2
