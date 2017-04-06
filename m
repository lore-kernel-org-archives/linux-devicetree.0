From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/4] drm: zte: do not enable clock auto-gating by default
Date: Thu,  6 Apr 2017 23:01:07 +0800
Message-ID: <1491490870-6330-2-git-send-email-shawnguo@kernel.org>
References: <1491490870-6330-1-git-send-email-shawnguo@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491490870-6330-1-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Xin Zhou <zhou.xin8-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Some VOU modules do not work well with clock auto-gating.  For example,
VGA I2C bus will fail to read EDID data from monitor.  Let's not enable
this feature by default, and leave it to the possible future low-power
optimization.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/zte/zx_vou.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_vou.c b/drivers/gpu/drm/zte/zx_vou.c
index cf92d675feaa..2a2d90bd9425 100644
--- a/drivers/gpu/drm/zte/zx_vou.c
+++ b/drivers/gpu/drm/zte/zx_vou.c
@@ -720,9 +720,6 @@ static void vou_hw_init(struct zx_vou_hw *vou)
 	/* Release reset for all VOU modules */
 	zx_writel(vou->vouctl + VOU_SOFT_RST, ~0);
 
-	/* Enable clock auto-gating for all VOU modules */
-	zx_writel(vou->vouctl + VOU_CLK_REQEN, ~0);
-
 	/* Enable all VOU module clocks */
 	zx_writel(vou->vouctl + VOU_CLK_EN, ~0);
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
