From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 1/9] drm/sun4i: sun6i-drc: Support DRC on A31 and A31s
Date: Fri,  7 Oct 2016 00:06:21 +0800
Message-ID: <20161006160629.11198-2-wens@csie.org>
References: <20161006160629.11198-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161006160629.11198-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The A31 and A31s also have the DRC as part of the display pipeline.
As we know virtually nothing about them, just add compatible strings
for both SoCs to the stub driver.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 2 ++
 drivers/gpu/drm/sun4i/sun6i_drc.c                             | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index b95696d748c7..5368961cd727 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -64,6 +64,8 @@ adaptive backlight control.
 
 Required properties:
   - compatible: value must be one of:
+    * allwinner,sun6i-a31-drc
+    * allwinner,sun6i-a31s-drc
     * allwinner,sun8i-a33-drc
   - reg: base address and size of the memory-mapped region.
   - interrupts: interrupt associated to this IP
diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
index bf6d846d8132..6ef707c5a719 100644
--- a/drivers/gpu/drm/sun4i/sun6i_drc.c
+++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
@@ -98,6 +98,8 @@ static int sun6i_drc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id sun6i_drc_of_table[] = {
+	{ .compatible = "allwinner,sun6i-a31-drc" },
+	{ .compatible = "allwinner,sun6i-a31s-drc" },
 	{ .compatible = "allwinner,sun8i-a33-drc" },
 	{ }
 };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
