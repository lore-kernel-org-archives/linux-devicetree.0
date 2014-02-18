From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [RFC PATCH v3 1/9] staging: imx-drm-core: don't request probe
 deferral in imx_drm_encoder_parse_of
Date: Tue, 18 Feb 2014 12:36:02 +0100
Message-ID: <1392723370-4772-2-git-send-email-p.zabel@pengutronix.de>
References: <1392723370-4772-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1392723370-4772-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach@pengutronix.de>

Since imx_drm_encoder_parse_of is called from the encoder bind callbacks,
it is too late to request probe deferral. Rather the core should make sure
that the crtcs are bound before the encoders, after all needed components
are probed.

This fixes probe failure when using the LDB on i.MX6.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/imx-drm/imx-drm-core.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/imx-drm/imx-drm-core.c b/drivers/staging/imx-drm/imx-drm-core.c
index dcba518..98a97a2 100644
--- a/drivers/staging/imx-drm/imx-drm-core.c
+++ b/drivers/staging/imx-drm/imx-drm-core.c
@@ -457,21 +457,13 @@ int imx_drm_encoder_parse_of(struct drm_device *drm,
 			return ret;
 
 		id = args.args_count > 0 ? args.args[0] : 0;
-		mask = imx_drm_find_crtc_mask(imxdrm, args.np, id);
+		crtc_mask |= imx_drm_find_crtc_mask(imxdrm, args.np, id);
 		of_node_put(args.np);
-
-		/*
-		 * If we failed to find the CRTC(s) which this encoder is
-		 * supposed to be connected to, it's because the CRTC has
-		 * not been registered yet.  Defer probing, and hope that
-		 * the required CRTC is added later.
-		 */
-		if (mask == 0)
-			return -EPROBE_DEFER;
-
-		crtc_mask |= mask;
 	}
 
+	if (i == 0 || !crtc_mask)
+		return -ENOENT;
+
 	encoder->possible_crtcs = crtc_mask;
 
 	/* FIXME: this is the mask of outputs which can clone this output. */
-- 
1.8.5.3
