From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 8/9] drm/imx: enable/disable PRG on CRTC enable/disable
Date: Tue, 14 Mar 2017 11:38:47 +0100
Message-ID: <1489487928-26083-8-git-send-email-p.zabel@pengutronix.de>
References: <1489487928-26083-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489487928-26083-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

On i.MX6 QuadPlus the PRG needs to be clocked in order to pass
through the data access requests from the IDMAC. This call is a
no-op for other all other SoCs.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/gpu/drm/imx/ipuv3-crtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index 82772b8d63216..dab9d50ffd8c1 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -55,6 +55,7 @@ static void ipu_crtc_enable(struct drm_crtc *crtc)
 	struct ipu_crtc *ipu_crtc = to_ipu_crtc(crtc);
 	struct ipu_soc *ipu = dev_get_drvdata(ipu_crtc->dev->parent);
 
+	ipu_prg_enable(ipu);
 	ipu_dc_enable(ipu);
 	ipu_dc_enable_channel(ipu_crtc->dc);
 	ipu_di_enable(ipu_crtc->di);
@@ -95,6 +96,7 @@ static void ipu_crtc_atomic_disable(struct drm_crtc *crtc,
 	 */
 	ipu_crtc_disable_planes(ipu_crtc, old_crtc_state);
 	ipu_dc_disable(ipu);
+	ipu_prg_disable(ipu);
 
 	spin_lock_irq(&crtc->dev->event_lock);
 	if (crtc->state->event) {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
