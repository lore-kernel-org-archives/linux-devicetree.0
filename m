Return-Path: <SRS0=gEAL=WV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:46245 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbfHYOAU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 25 Aug 2019 10:00:20 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 2/2] drm: rcar-du: kms: Expand comment in vsps parsing routine
Date: Sun, 25 Aug 2019 16:01:35 +0200
Message-Id: <20190825140135.12150-3-jacopo+renesas@jmondi.org>
In-Reply-To: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
References: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Exand comment in the 'vsps' parsing routine to specify why the LIF
channel index is defaulted to 0 in case the second cell of the property
is not specified.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 2dc9caee8767..0d59f390de19 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -585,7 +585,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)

 		vsps[j].crtcs_mask |= BIT(i);

-		/* Store the VSP pointer and pipe index in the CRTC. */
+		/*
+		 * Store the VSP pointer and pipe index in the CRTC. If the
+		 * second cell of the 'vsps' specifier isn't present, default
+		 * to 0 to remain compatible with older DT bindings.
+		 */
 		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
 		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
 	}
--
2.23.0
