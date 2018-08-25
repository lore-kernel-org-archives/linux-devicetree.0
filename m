From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v9 3/4] drm/atmel-hlcdc: always iterate over the first 4 output endpoints
Date: Sat, 25 Aug 2018 10:56:19 +0200
Message-ID: <20180825085620.10566-4-peda@axentia.se>
References: <20180825085620.10566-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180825085620.10566-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Boris Brezillon <boris.brezillon@bootlin.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jyri Sarha <jsarha@ti.com>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Sakari Ailus <sakari.ailus@iki.fi>
List-Id: devicetree@vger.kernel.org

This enables more flexible devicetrees. You can e.g. have two output
nodes where one is not enabled, without the ordering affecting things.

Prior to this patch the active nodes had to have endpoint id zero and
upwards consecutively.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index 8db51fb131db..c05c2b744981 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -78,12 +78,23 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 int atmel_hlcdc_create_outputs(struct drm_device *dev)
 {
 	int endpoint, ret = 0;
+	int attached = 0;
 
-	for (endpoint = 0; !ret; endpoint++)
+	/*
+	 * Always scan the first few endpoints even if we get -ENODEV,
+	 * but keep going after that as long as we keep getting hits.
+	 */
+	for (endpoint = 0; !ret || endpoint < 4; endpoint++) {
 		ret = atmel_hlcdc_attach_endpoint(dev, endpoint);
+		if (ret == -ENODEV)
+			continue;
+		if (ret)
+			break;
+		attached++;
+	}
 
 	/* At least one device was successfully attached.*/
-	if (ret == -ENODEV && endpoint)
+	if (ret == -ENODEV && attached)
 		return 0;
 
 	return ret;
-- 
2.11.0
