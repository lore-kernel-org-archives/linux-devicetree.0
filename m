From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v4 4/8] drm/i2c: tda998x: find the drm_device via the drm_connector
Date: Mon, 23 Apr 2018 09:22:57 +0200
Message-ID: <20180423072301.11962-5-peda@axentia.se>
References: <20180423072301.11962-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180423072301.11962-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Russell King <linux@armlinux.org.uk>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This prepares for being a drm_bridge which will not register the
encoder. That makes the connector the better choice.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index cd3f0873bbdd..8f6e013f2b87 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -630,7 +630,7 @@ static void tda998x_detect_work(struct work_struct *work)
 {
 	struct tda998x_priv *priv =
 		container_of(work, struct tda998x_priv, detect_work);
-	struct drm_device *dev = priv->encoder.dev;
+	struct drm_device *dev = priv->connector.dev;
 
 	if (dev)
 		drm_kms_helper_hotplug_event(dev);
-- 
2.11.0
