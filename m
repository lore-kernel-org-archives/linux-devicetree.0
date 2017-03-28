From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv6 14/14] em28xx: drop last soc_camera link
Date: Tue, 28 Mar 2017 10:23:47 +0200
Message-ID: <20170328082347.11159-15-hverkuil@xs4all.nl>
References: <20170328082347.11159-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170328082347.11159-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

The em28xx driver still used the soc_camera.h header for the ov2640
driver. Since this driver no longer uses soc_camera, that include can
be removed.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/media/usb/em28xx/em28xx-camera.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-camera.c b/drivers/media/usb/em28xx/em28xx-camera.c
index 89c890ba7dd6..63aaa577a742 100644
--- a/drivers/media/usb/em28xx/em28xx-camera.c
+++ b/drivers/media/usb/em28xx/em28xx-camera.c
@@ -23,7 +23,6 @@
 
 #include <linux/i2c.h>
 #include <linux/usb.h>
-#include <media/soc_camera.h>
 #include <media/i2c/mt9v011.h>
 #include <media/v4l2-clk.h>
 #include <media/v4l2-common.h>
@@ -43,13 +42,6 @@ static unsigned short omnivision_sensor_addrs[] = {
 	I2C_CLIENT_END
 };
 
-static struct soc_camera_link camlink = {
-	.bus_id = 0,
-	.flags = 0,
-	.module_name = "em28xx",
-	.unbalanced_power = true,
-};
-
 /* FIXME: Should be replaced by a proper mt9m111 driver */
 static int em28xx_initialize_mt9m111(struct em28xx *dev)
 {
@@ -421,7 +413,6 @@ int em28xx_init_camera(struct em28xx *dev)
 			.type = "ov2640",
 			.flags = I2C_CLIENT_SCCB,
 			.addr = client->addr,
-			.platform_data = &camlink,
 		};
 		struct v4l2_subdev_format format = {
 			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
