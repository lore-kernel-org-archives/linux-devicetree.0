From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: [PATCH 2/8] drm/tilcdc: panel: Add missing of_node_put
Date: Fri, 11 Jul 2014 11:18:48 -0300
Message-ID: <1405088334-11215-3-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1405088334-11215-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405088334-11215-1-git-send-email-ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, daniel.vetter-/w4YWyX8dFk@public.gmane.org, =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds the missing calls to of_node_put to release the node
that's currently held by the of_get_child_by_name() call in the panel
info parsing code.

Signed-off-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 4c7aa1d..d581c53 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -311,6 +311,7 @@ static struct tilcdc_panel_info *of_get_panel_info(struct device_node *np)
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info) {
 		pr_err("%s: allocation failed\n", __func__);
+		of_node_put(info_np);
 		return NULL;
 	}
 
@@ -331,8 +332,10 @@ static struct tilcdc_panel_info *of_get_panel_info(struct device_node *np)
 	if (ret) {
 		pr_err("%s: error reading panel-info properties\n", __func__);
 		kfree(info);
+		of_node_put(info_np);
 		return NULL;
 	}
+	of_node_put(info_np);
 
 	return info;
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
