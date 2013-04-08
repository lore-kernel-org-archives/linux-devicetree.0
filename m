From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/7] staging: drm/imx: ipu-dc: add 24-bit GBR support to DC
Date: Mon,  8 Apr 2013 18:04:32 +0200
Message-ID: <1365437078-22579-2-git-send-email-p.zabel@pengutronix.de>
References: <1365437078-22579-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365437078-22579-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

24-bit GBR order is needed on the display interface connected
to the Television Encoder (TVEv2) on i.MX53.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/staging/imx-drm/imx-drm.h       | 10 ++++++++++
 drivers/staging/imx-drm/ipu-v3/ipu-dc.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/staging/imx-drm/imx-drm.h b/drivers/staging/imx-drm/imx-drm.h
index ae28a49..a24508f 100644
--- a/drivers/staging/imx-drm/imx-drm.h
+++ b/drivers/staging/imx-drm/imx-drm.h
@@ -1,8 +1,18 @@
 #ifndef _IMX_DRM_H_
 #define _IMX_DRM_H_
 
+#include <linux/videodev2.h>
+
+#define IPU_PIX_FMT_GBR24	v4l2_fourcc('G', 'B', 'R', '3')
+
+struct drm_crtc;
+struct drm_connector;
+struct drm_device;
+struct drm_encoder;
 struct imx_drm_crtc;
 struct drm_fbdev_cma;
+struct drm_framebuffer;
+struct platform_device;
 
 struct imx_drm_crtc_helper_funcs {
 	int (*enable_vblank)(struct drm_crtc *crtc);
diff --git a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c b/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
index 93c7579..fad5057 100644
--- a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
+++ b/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
@@ -20,6 +20,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 
+#include "../imx-drm.h"
 #include "imx-ipu-v3.h"
 #include "ipu-prv.h"
 
@@ -86,6 +87,7 @@ struct ipu_dc_priv;
 enum ipu_dc_map {
 	IPU_DC_MAP_RGB24,
 	IPU_DC_MAP_RGB565,
+	IPU_DC_MAP_GBR24, /* TVEv2 */
 };
 
 struct ipu_dc {
@@ -136,6 +138,8 @@ static int ipu_pixfmt_to_map(u32 fmt)
 		return IPU_DC_MAP_RGB24;
 	case V4L2_PIX_FMT_RGB565:
 		return IPU_DC_MAP_RGB565;
+	case IPU_PIX_FMT_GBR24:
+		return IPU_DC_MAP_GBR24;
 	default:
 		return -EINVAL;
 	}
@@ -364,6 +368,12 @@ int ipu_dc_init(struct ipu_soc *ipu, struct device *dev,
 	ipu_dc_map_config(priv, IPU_DC_MAP_RGB565, 1, 10, 0xfc); /* green */
 	ipu_dc_map_config(priv, IPU_DC_MAP_RGB565, 2, 15, 0xf8); /* red */
 
+	/* gbr24 */
+	ipu_dc_map_clear(priv, IPU_DC_MAP_GBR24);
+	ipu_dc_map_config(priv, IPU_DC_MAP_GBR24, 2, 15, 0xff); /* green */
+	ipu_dc_map_config(priv, IPU_DC_MAP_GBR24, 1, 7, 0xff); /* blue */
+	ipu_dc_map_config(priv, IPU_DC_MAP_GBR24, 0, 23, 0xff); /* red */
+
 	return 0;
 }
 
-- 
1.8.2.rc2
