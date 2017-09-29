From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 06/14] drm/sun4i: hdmi: create a regmap for
 later use
Date: Fri, 29 Sep 2017 16:22:58 +0800
Message-ID: <20170929082306.16193-7-wens@csie.org>
References: <20170929082306.16193-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6MFXDHAKGQETNOODXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170929082306.16193-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The HDMI driver is written with readl/writel I/O to the registers.
However, to support the A31 variant, which has a different layout
for the DDC registers, it was recommended to use regfields to have
a cleaner implementation. To use regfields, we need to create an
underlying regmap.

This patch only adds the regmap. It does not convert the existing
driver accesses to use regmap.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi.h     |  1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
index 1457750988da..b95512ec8eb6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
@@ -163,6 +163,7 @@ struct sun4i_hdmi {
 	struct device		*dev;
 
 	void __iomem		*base;
+	struct regmap		*regmap;
 
 	/* Parent clocks */
 	struct clk		*bus_clk;
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 3cf1a6932fac..5ab811cda00e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -22,6 +22,7 @@
 #include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 
 #include "sun4i_backend.h"
 #include "sun4i_crtc.h"
@@ -267,6 +268,13 @@ static const struct cec_pin_ops sun4i_hdmi_cec_pin_ops = {
 };
 #endif
 
+static const struct regmap_config sun4i_hdmi_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x580,
+};
+
 static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 			   void *data)
 {
@@ -321,6 +329,13 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_mod_clk;
 	}
 
+	hdmi->regmap = devm_regmap_init_mmio(dev, hdmi->base,
+					     &sun4i_hdmi_regmap_config);
+	if (IS_ERR(hdmi->regmap)) {
+		dev_err(dev, "Couldn't create HDMI encoder regmap\n");
+		return PTR_ERR(hdmi->regmap);
+	}
+
 	ret = sun4i_tmds_create(hdmi);
 	if (ret) {
 		dev_err(dev, "Couldn't create the TMDS clock\n");
-- 
2.14.2
