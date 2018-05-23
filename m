From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v5 4/7] drm/i2c: tda998x: find the drm_device via the drm_connector
Date: Wed, 23 May 2018 11:31:19 +0200
Message-ID: <20180523093122.27859-5-peda@axentia.se>
References: <20180523093122.27859-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180523093122.27859-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Russell King <linux@armlinux.org.uk>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jyri Sarha <jsarha@ti.com>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org

This prepares for being a drm_bridge which will not register the
encoder. That makes the connector the better choice.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 421c8a72369e..933d309d2e0f 100644
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
