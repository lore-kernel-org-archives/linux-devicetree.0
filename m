From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] staging: imx_drm: imx_ldb: fix 18 bit format
Date: Fri,  7 Jun 2013 10:37:08 +0200
Message-ID: <1370594228-2869-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Markus Niebel <Markus.Niebel-77yLcl8UjJQ@public.gmane.org>, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Markus Niebel <Markus.Niebel-77yLcl8UjJQ@public.gmane.org>

Since 18 bit is supported as datawidth in device tree it should be
supported in driver. Beside the LDB channel the IPU channel has also
to be configured to use BGR666.

Signed-off-by: Markus Niebel <Markus.Niebel-77yLcl8UjJQ@public.gmane.org>
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
This is based on the series: "staging: drm/imx: Add LDB support"
by Philipp.


 drivers/staging/imx-drm/imx-ldb.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/imx-drm/imx-ldb.c b/drivers/staging/imx-drm/imx-ldb.c
index d8fc93c..84bf7d3 100644
--- a/drivers/staging/imx-drm/imx-ldb.c
+++ b/drivers/staging/imx-drm/imx-ldb.c
@@ -179,6 +179,7 @@ static void imx_ldb_encoder_prepare(struct drm_encoder *encoder)
 	struct imx_ldb_channel *imx_ldb_ch = enc_to_imx_ldb_ch(encoder);
 	struct imx_ldb *ldb = imx_ldb_ch->ldb;
 	struct drm_display_mode *mode = &encoder->crtc->mode;
+	u32 pixel_fmt;
 	unsigned long serial_clk;
 	unsigned long di_clk = mode->clock * 1000;
 	int mux = imx_drm_encoder_get_mux_id(imx_ldb_ch->imx_drm_encoder,
@@ -194,8 +195,23 @@ static void imx_ldb_encoder_prepare(struct drm_encoder *encoder)
 		imx_ldb_set_clock(ldb, mux, imx_ldb_ch->chno, serial_clk, di_clk);
 	}
 
+	switch (imx_ldb_ch->chno) {
+	case 0:
+		pixel_fmt = (ldb->ldb_ctrl & LDB_DATA_WIDTH_CH0_24) ?
+			V4L2_PIX_FMT_RGB24 : V4L2_PIX_FMT_BGR666;
+		break;
+	case 1:
+		pixel_fmt = (ldb->ldb_ctrl & LDB_DATA_WIDTH_CH1_24) ?
+			V4L2_PIX_FMT_RGB24 : V4L2_PIX_FMT_BGR666;
+		break;
+	default:
+		dev_err(ldb->dev, "unable to config di%d panel format\n",
+			imx_ldb_ch->chno);
+		pixel_fmt = V4L2_PIX_FMT_RGB24;
+	}
+
 	imx_drm_crtc_panel_format_pins(encoder->crtc, DRM_MODE_ENCODER_LVDS,
-			V4L2_PIX_FMT_RGB24, 2, 3);
+			pixel_fmt, 2, 3);
 }
 
 static void imx_ldb_encoder_commit(struct drm_encoder *encoder)
-- 
1.8.2.rc2
