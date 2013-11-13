From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv4][ 4/7] staging: imx-drm: parallel display: add regulator support.
Date: Wed, 13 Nov 2013 10:23:20 +0100
Message-ID: <1384334603-14208-4-git-send-email-denis@eukrea.com>
References: <1384334603-14208-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384334603-14208-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, driverdev-devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: driverdev-devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
ChangeLog v2->v3:
- Added some interested people in the Cc list.
- the lcd-supply is now called display-supply (not all display are LCD)=
=2E
- The code and documentation was updated accordingly.
- regulator_is_enabled now guard the regulator enables/disables because
  regulator_disable does not check the regulator state.
---
 .../bindings/staging/imx-drm/fsl-imx-drm.txt       |    1 +
 drivers/staging/imx-drm/parallel-display.c         |   22 ++++++++++++=
++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-=
drm.txt b/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-drm=
=2Etxt
index 2d24425..4dd7ce5 100644
--- a/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-drm.txt
@@ -28,6 +28,7 @@ Required properties:
 - compatible: Should be "fsl,imx-parallel-display"
 - crtc: the crtc this display is connected to, see below
 Optional properties:
+- display-supply : phandle to the regulator device tree node if needed=
=2E
 - interface_pix_fmt: How this display is connected to the
   crtc. Currently supported types: "rgb24", "rgb565", "bgr666", "rgb66=
6"
 - edid: verbatim EDID data block describing attached display.
diff --git a/drivers/staging/imx-drm/parallel-display.c b/drivers/stagi=
ng/imx-drm/parallel-display.c
index 46b6fce..195ec60 100644
--- a/drivers/staging/imx-drm/parallel-display.c
+++ b/drivers/staging/imx-drm/parallel-display.c
@@ -22,6 +22,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_crtc_helper.h>
+#include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
=20
 #include "imx-drm.h"
@@ -35,6 +36,7 @@ struct imx_parallel_display {
 	struct drm_encoder encoder;
 	struct imx_drm_encoder *imx_drm_encoder;
 	struct device *dev;
+	struct regulator *disp_reg;
 	void *edid;
 	int edid_len;
 	u32 interface_pix_fmt;
@@ -139,6 +141,12 @@ static void imx_pd_encoder_prepare(struct drm_enco=
der *encoder)
 {
 	struct imx_parallel_display *imxpd =3D enc_to_imxpd(encoder);
=20
+	if (imxpd->disp_reg && !regulator_is_enabled(imxpd->disp_reg)) {
+		if (regulator_enable(imxpd->disp_reg))
+			dev_err(imxpd->dev,
+				"Failed to enable regulator.\n");
+	}
+
 	imx_drm_crtc_panel_format(encoder->crtc, DRM_MODE_ENCODER_NONE,
 			imxpd->interface_pix_fmt);
 }
@@ -155,6 +163,12 @@ static void imx_pd_encoder_mode_set(struct drm_enc=
oder *encoder,
=20
 static void imx_pd_encoder_disable(struct drm_encoder *encoder)
 {
+	struct imx_parallel_display *imxpd =3D enc_to_imxpd(encoder);
+
+	if (imxpd->disp_reg && regulator_is_enabled(imxpd->disp_reg)) {
+		if (regulator_disable(imxpd->disp_reg))
+			dev_err(imxpd->dev, "Failed to disable regulator.\n");
+	}
 }
=20
 static void imx_pd_encoder_destroy(struct drm_encoder *encoder)
@@ -258,6 +272,14 @@ static int imx_pd_probe(struct platform_device *pd=
ev)
 	if (ret)
 		return ret;
=20
+	imxpd->disp_reg =3D devm_regulator_get(&pdev->dev, "display");
+	if (IS_ERR(imxpd->disp_reg)) {
+		dev_warn(&pdev->dev, "Operating without display regulator.\n");
+		imxpd->disp_reg =3D NULL;
+	} else {
+		dev_info(&pdev->dev, "Using display regulator.\n");
+	}
+
 	ret =3D imx_drm_encoder_add_possible_crtcs(imxpd->imx_drm_encoder, np=
);
=20
 	platform_set_drvdata(pdev, imxpd);
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
