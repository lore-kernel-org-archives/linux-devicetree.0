From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 16/24] drm/sun4i: Enable DW HDMI PHY clock
Date: Mon, 25 Jun 2018 14:02:56 +0200
Message-ID: <20180625120304.7543-17-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBCNVYPMQKGQERL2BKSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180625120304.7543-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Current DW HDMI PHY code never prepares and enables PHY clock after it is
created. It's just used as it is. This may work in some cases, but it's
clearly wrong. Fix it by adding proper calls to enable/disable PHY
clock.

Fixes: 4f86e81748fe ("drm/sun4i: Add support for H3 HDMI PHY variant")

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 5a52fc489a9d..966688f04741 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -477,13 +477,15 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
 			dev_err(dev, "Couldn't create the PHY clock\n");
 			goto err_put_clk_pll0;
 		}
+
+		clk_prepare_enable(phy->clk_phy);
 	}
 
 	phy->rst_phy = of_reset_control_get_shared(node, "phy");
 	if (IS_ERR(phy->rst_phy)) {
 		dev_err(dev, "Could not get phy reset control\n");
 		ret = PTR_ERR(phy->rst_phy);
-		goto err_put_clk_pll0;
+		goto err_disable_clk_phy;
 	}
 
 	ret = reset_control_deassert(phy->rst_phy);
@@ -514,6 +516,8 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
 	reset_control_assert(phy->rst_phy);
 err_put_rst_phy:
 	reset_control_put(phy->rst_phy);
+err_disable_clk_phy:
+	clk_disable_unprepare(phy->clk_phy);
 err_put_clk_pll0:
 	if (phy->variant->has_phy_clk)
 		clk_put(phy->clk_pll0);
@@ -531,6 +535,7 @@ void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi)
 
 	clk_disable_unprepare(phy->clk_mod);
 	clk_disable_unprepare(phy->clk_bus);
+	clk_disable_unprepare(phy->clk_phy);
 
 	reset_control_assert(phy->rst_phy);
 
-- 
2.18.0
