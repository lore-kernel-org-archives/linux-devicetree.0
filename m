From: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Subject: [PATCH 1/1] video/atmel_lcdfb: Introduce regulator support
Date: Tue, 15 Jul 2014 14:33:25 +0200
Message-ID: <1405427605-5288-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds regulator support to enable/disable the LCD voltage, using
'lcd-supply' as regulator name.

Signed-off-by: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
---
 .../devicetree/bindings/video/atmel,lcdc.txt         |  3 +++
 drivers/video/fbdev/atmel_lcdfb.c                    | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/video/atmel,lcdc.txt b/Documentation/devicetree/bindings/video/atmel,lcdc.txt
index 1ec175eddca8..5ae0faf443c3 100644
--- a/Documentation/devicetree/bindings/video/atmel,lcdc.txt
+++ b/Documentation/devicetree/bindings/video/atmel,lcdc.txt
@@ -20,6 +20,9 @@ Required nodes:
 - default-mode: a videomode within the display with timing parameters
 	as specified below.
 
+Optional properties:
+- lcd-supply: Regulator for LCD supply voltage.
+
 Example:
 
 	fb0: fb@0x00500000 {
diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index d36e830d6fc6..59fd2e062d4f 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -24,6 +24,7 @@
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <video/of_display_timing.h>
+#include <linux/regulator/consumer.h>
 #include <video/videomode.h>
 
 #include <mach/cpu.h>
@@ -60,6 +61,7 @@ struct atmel_lcdfb_info {
 	struct atmel_lcdfb_pdata pdata;
 
 	struct atmel_lcdfb_config *config;
+	struct regulator	*reg_lcd;
 };
 
 struct atmel_lcdfb_power_ctrl_gpio {
@@ -302,10 +304,24 @@ static void init_contrast(struct atmel_lcdfb_info *sinfo)
 
 static inline void atmel_lcdfb_power_control(struct atmel_lcdfb_info *sinfo, int on)
 {
+	int ret;
 	struct atmel_lcdfb_pdata *pdata = &sinfo->pdata;
 
 	if (pdata->atmel_lcdfb_power_control)
 		pdata->atmel_lcdfb_power_control(pdata, on);
+	else if (sinfo->reg_lcd) {
+		if (on) {
+			ret = regulator_enable(sinfo->reg_lcd);
+			if (ret)
+				dev_err(&sinfo->pdev->dev,
+					"lcd regulator enable failed:	%d\n", ret);
+		} else {
+			ret = regulator_disable(sinfo->reg_lcd);
+			if (ret)
+				dev_err(&sinfo->pdev->dev,
+					"lcd regulator disable failed: %d\n", ret);
+		}
+	}
 }
 
 static struct fb_fix_screeninfo atmel_lcdfb_fix __initdata = {
@@ -1192,6 +1208,10 @@ static int __init atmel_lcdfb_probe(struct platform_device *pdev)
 	if (!sinfo->config)
 		goto free_info;
 
+	sinfo->reg_lcd = devm_regulator_get(&pdev->dev, "lcd");
+	if (IS_ERR(sinfo->reg_lcd))
+		sinfo->reg_lcd = NULL;
+
 	info->flags = ATMEL_LCDFB_FBINFO_DEFAULT;
 	info->pseudo_palette = sinfo->pseudo_palette;
 	info->fbops = &atmel_lcdfb_ops;
-- 
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
