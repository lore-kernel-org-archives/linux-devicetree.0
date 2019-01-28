From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v8 2/5] media: sun6i: Add A64 CSI block support
Date: Mon, 28 Jan 2019 14:28:44 +0530
Message-ID: <20190128085847.7217-3-jagan@amarulasolutions.com>
References: <20190128085847.7217-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBZMIXPRAKGQES5CDCAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190128085847.7217-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

CSI block in Allwinner A64 has similar features as like in H3,
but the default CSI_SCLK rate cannot work properly to drive the
connected sensor interface.

The tested mod cock rate is 300 MHz and BSP vfe media driver is also
using the same rate. Unfortunately there is no valid information about
clock rate in manual or any other sources except the BSP driver. so more
faith on BSP code, because same has tested in mainline.

So, add support for A64 CSI block by setting updated mod clock rate.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index ee882b66a5ea..5ecdfbf9f6ae 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -15,6 +15,7 @@
 #include <linux/ioctl.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -154,6 +155,7 @@ bool sun6i_csi_is_format_supported(struct sun6i_csi *csi,
 int sun6i_csi_set_power(struct sun6i_csi *csi, bool enable)
 {
 	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
+	struct device *dev = sdev->dev;
 	struct regmap *regmap = sdev->regmap;
 	int ret;
 
@@ -161,6 +163,9 @@ int sun6i_csi_set_power(struct sun6i_csi *csi, bool enable)
 		regmap_update_bits(regmap, CSI_EN_REG, CSI_EN_CSI_EN, 0);
 
 		clk_disable_unprepare(sdev->clk_ram);
+		if (of_device_is_compatible(dev->of_node,
+					    "allwinner,sun50i-a64-csi"))
+			clk_rate_exclusive_put(sdev->clk_mod);
 		clk_disable_unprepare(sdev->clk_mod);
 		reset_control_assert(sdev->rstc_bus);
 		return 0;
@@ -172,6 +177,9 @@ int sun6i_csi_set_power(struct sun6i_csi *csi, bool enable)
 		return ret;
 	}
 
+	if (of_device_is_compatible(dev->of_node, "allwinner,sun50i-a64-csi"))
+		clk_set_rate_exclusive(sdev->clk_mod, 300000000);
+
 	ret = clk_prepare_enable(sdev->clk_ram);
 	if (ret) {
 		dev_err(sdev->dev, "Enable clk_dram_csi clk err %d\n", ret);
@@ -191,6 +199,8 @@ int sun6i_csi_set_power(struct sun6i_csi *csi, bool enable)
 clk_ram_disable:
 	clk_disable_unprepare(sdev->clk_ram);
 clk_mod_disable:
+	if (of_device_is_compatible(dev->of_node, "allwinner,sun50i-a64-csi"))
+		clk_rate_exclusive_put(sdev->clk_mod);
 	clk_disable_unprepare(sdev->clk_mod);
 	return ret;
 }
@@ -895,6 +905,7 @@ static const struct of_device_id sun6i_csi_of_match[] = {
 	{ .compatible = "allwinner,sun6i-a31-csi", },
 	{ .compatible = "allwinner,sun8i-h3-csi", },
 	{ .compatible = "allwinner,sun8i-v3s-csi", },
+	{ .compatible = "allwinner,sun50i-a64-csi", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sun6i_csi_of_match);
-- 
2.18.0.321.gffc6fa0e3
