From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v5 2/6] media: sun6i: Add mod_rate quirk
Date: Thu, 20 Dec 2018 18:24:34 +0530
Message-ID: <20181220125438.11700-3-jagan@amarulasolutions.com>
References: <20181220125438.11700-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBHFC53QAKGQEJOAYHTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181220125438.11700-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Unfortunately default CSI_SCLK rate cannot work properly to
drive the connected sensor interface, particularly on few
Allwinner SoC's like A64.

So, add mod_rate quirk via driver data so-that the respective
SoC's which require to alter the default mod clock rate can assign
the operating clock rate.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 34 +++++++++++++++----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index ee882b66a5ea..fe002beae09c 100644
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
@@ -28,8 +29,13 @@
 
 #define MODULE_NAME	"sun6i-csi"
 
+struct sun6i_csi_variant {
+	unsigned long			mod_rate;
+};
+
 struct sun6i_csi_dev {
 	struct sun6i_csi		csi;
+	const struct sun6i_csi_variant	*variant;
 	struct device			*dev;
 
 	struct regmap			*regmap;
@@ -822,33 +828,43 @@ static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
 		return PTR_ERR(sdev->clk_mod);
 	}
 
+	if (sdev->variant->mod_rate)
+		clk_set_rate_exclusive(sdev->clk_mod, sdev->variant->mod_rate);
+
 	sdev->clk_ram = devm_clk_get(&pdev->dev, "ram");
 	if (IS_ERR(sdev->clk_ram)) {
 		dev_err(&pdev->dev, "Unable to acquire dram-csi clock\n");
-		return PTR_ERR(sdev->clk_ram);
+		ret = PTR_ERR(sdev->clk_ram);
+		goto err_unprotect_clk;
 	}
 
 	sdev->rstc_bus = devm_reset_control_get_shared(&pdev->dev, NULL);
 	if (IS_ERR(sdev->rstc_bus)) {
 		dev_err(&pdev->dev, "Cannot get reset controller\n");
 		return PTR_ERR(sdev->rstc_bus);
+		goto err_unprotect_clk;
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		dev_err(&pdev->dev, "No csi IRQ specified\n");
 		ret = -ENXIO;
-		return ret;
+		goto err_unprotect_clk;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq, sun6i_csi_isr, 0, MODULE_NAME,
 			       sdev);
 	if (ret) {
 		dev_err(&pdev->dev, "Cannot request csi IRQ\n");
-		return ret;
+		goto err_unprotect_clk;
 	}
 
 	return 0;
+
+err_unprotect_clk:
+	if (sdev->variant->mod_rate)
+		clk_rate_exclusive_put(sdev->clk_mod);
+	return ret;
 }
 
 /*
@@ -871,6 +887,7 @@ static int sun6i_csi_probe(struct platform_device *pdev)
 	sdev->dev = &pdev->dev;
 	/* The DMA bus has the memory mapped at 0 */
 	sdev->dev->dma_pfn_offset = PHYS_OFFSET >> PAGE_SHIFT;
+	sdev->variant = of_device_get_match_data(sdev->dev);
 
 	ret = sun6i_csi_resource_request(sdev, pdev);
 	if (ret)
@@ -887,14 +904,19 @@ static int sun6i_csi_remove(struct platform_device *pdev)
 	struct sun6i_csi_dev *sdev = platform_get_drvdata(pdev);
 
 	sun6i_csi_v4l2_cleanup(&sdev->csi);
+	if (sdev->variant->mod_rate)
+		clk_rate_exclusive_put(sdev->clk_mod);
 
 	return 0;
 }
 
+static const struct sun6i_csi_variant sun6i_a31_csi = {
+};
+
 static const struct of_device_id sun6i_csi_of_match[] = {
-	{ .compatible = "allwinner,sun6i-a31-csi", },
-	{ .compatible = "allwinner,sun8i-h3-csi", },
-	{ .compatible = "allwinner,sun8i-v3s-csi", },
+	{ .compatible = "allwinner,sun6i-a31-csi", .data = &sun6i_a31_csi, },
+	{ .compatible = "allwinner,sun8i-h3-csi", .data = &sun6i_a31_csi, },
+	{ .compatible = "allwinner,sun8i-v3s-csi", .data = &sun6i_a31_csi, },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sun6i_csi_of_match);
-- 
2.18.0.321.gffc6fa0e3
