From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 13/26] drm/fb_cma_helper: Remove implicit
 call to disable_unused_functions
Date: Thu, 14 Jan 2016 16:24:56 +0100
Message-ID: <1452785109-6172-14-git-send-email-maxime.ripard@free-electrons.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBAP4322AKGQEFVHFSUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1452785109-6172-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The drm_fbdev_cma_init function always calls the
drm_helper_disable_unused_functions. Since it's part of the usual probe
process, all the drivers using that helper will end up having their encoder
and CRTC disable functions called at probe if their device has not been
reported as enabled.

This could be fixed by reading out from the registers the current state of
the device if it is enabled, but even that will not handle the case where
the device is actually disabled.

Moreover, the drivers using the atomic modesetting expect that their enable
and disable callback to be called when the device is already enabled or
disabled (respectively).

We can however fix this issue by moving the call to
drm_helper_disable_unused_functions out of drm_fbdev_cma_init and make the
drivers needing it (all the drivers calling drm_fbdev_cma_init and not
using the atomic modesetting) explicitly call it.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/drm_fb_cma_helper.c | 3 ---
 drivers/gpu/drm/imx/imx-drm-core.c  | 1 +
 drivers/gpu/drm/sti/sti_drv.c       | 1 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 1 +
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
index c19a62561183..daa98d881142 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
@@ -348,9 +348,6 @@ struct drm_fbdev_cma *drm_fbdev_cma_init(struct drm_device *dev,
 
 	}
 
-	/* disable all the possible outputs/crtcs before entering KMS mode */
-	drm_helper_disable_unused_functions(dev);
-
 	ret = drm_fb_helper_initial_config(helper, preferred_bpp);
 	if (ret < 0) {
 		dev_err(dev->dev, "Failed to set initial hw configuration.\n");
diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 7b990b4e96d2..e1db57791fc9 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -312,6 +312,7 @@ static int imx_drm_driver_load(struct drm_device *drm, unsigned long flags)
 		dev_warn(drm->dev, "Invalid legacyfb_depth.  Defaulting to 16bpp\n");
 		legacyfb_depth = 16;
 	}
+	drm_helper_disable_unused_functions(drm);
 	imxdrm->fbhelper = drm_fbdev_cma_init(drm, legacyfb_depth,
 				drm->mode_config.num_crtc, MAX_CRTC);
 	if (IS_ERR(imxdrm->fbhelper)) {
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 1469987949d8..506b5626f3ed 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -160,6 +160,7 @@ static int sti_load(struct drm_device *dev, unsigned long flags)
 
 	drm_mode_config_reset(dev);
 
+	drm_helper_disable_unused_functions(dev);
 	drm_fbdev_cma_init(dev, 32,
 			   dev->mode_config.num_crtc,
 			   dev->mode_config.num_connector);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 876cad58b1f9..24be31d69701 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -294,6 +294,7 @@ static int tilcdc_load(struct drm_device *dev, unsigned long flags)
 			break;
 	}
 
+	drm_helper_disable_unused_functions(dev);
 	priv->fbdev = drm_fbdev_cma_init(dev, bpp,
 			dev->mode_config.num_crtc,
 			dev->mode_config.num_connector);
-- 
2.6.4
