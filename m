From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC PATCH v3 9/9] staging: imx-drm: Update TODO
Date: Tue, 18 Feb 2014 12:36:10 +0100
Message-ID: <1392723370-4772-10-git-send-email-p.zabel@pengutronix.de>
References: <1392723370-4772-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392723370-4772-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The device tree bindings are updated regardless of the common display
framework and in the meantime the HDMI driver was included.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/staging/imx-drm/TODO | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/imx-drm/TODO b/drivers/staging/imx-drm/TODO
index 6a9da94..29636fb 100644
--- a/drivers/staging/imx-drm/TODO
+++ b/drivers/staging/imx-drm/TODO
@@ -1,15 +1,10 @@
 TODO:
 - get DRM Maintainer review for this code
-- Wait for common display framework to hit mainline and update the IPU
-  driver to use it. This will most probably make changes to the devicetree
-  bindings necessary.
-- Factor out more code to common helper functions
 - decide where to put the base driver. It is not specific to a subsystem
   and would be used by DRM/KMS and media/V4L2
 
 Missing features (not necessarily for moving out of staging):
 
-- Add i.MX6 HDMI support
 - Add support for IC (Image converter)
 - Add support for CSI (CMOS Sensor interface)
 - Add support for VDIC (Video Deinterlacer)
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
