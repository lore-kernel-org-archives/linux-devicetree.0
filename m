From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] gpu:drm:tilcdc: backlight node never found
Date: Thu, 13 Feb 2014 14:47:38 +0100
Message-ID: <1392299258-16968-1-git-send-email-hs@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In panel_probe() the backlight node is never found, correct this.

Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 86c6732..0b97cf4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -356,6 +356,7 @@ static struct of_device_id panel_of_match[];
 static int panel_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
+	struct device_node *backlight_node;
 	struct panel_module *panel_mod;
 	struct tilcdc_module *mod;
 	struct pinctrl *pinctrl;
@@ -395,9 +396,15 @@ static int panel_probe(struct platform_device *pdev)
 
 	mod->preferred_bpp = panel_mod->info->bpp;
 
-	panel_mod->backlight = of_find_backlight_by_node(node);
-	if (panel_mod->backlight)
-		dev_info(&pdev->dev, "found backlight\n");
+	backlight_node = of_parse_phandle(pdev->dev.of_node, "backlight", 0);
+	if (backlight_node) {
+		panel_mod->backlight =
+			of_find_backlight_by_node(backlight_node);
+		if (panel_mod->backlight)
+			dev_info(&pdev->dev, "found backlight\n");
+	} else {
+		dev_warn(&pdev->dev, "backlight node missing...\n");
+	}
 
 	return 0;
 
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
