From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 2/3] [media] mt9v032: Do not unset master_mode
Date: Mon, 14 Dec 2015 15:41:52 +0100
Message-ID: <1450104113-6392-2-git-send-email-mpa@pengutronix.de>
References: <1450104113-6392-1-git-send-email-mpa@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450104113-6392-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The power_on function of the driver resets the chip and sets the
CHIP_CONTROL register to 0. This switches the operating mode to slave.
The s_stream function sets the correct mode. But this caused problems on
a board where the camera chip is operated as master. The camera started
after a random amount of time streaming an image, I observed between 10
and 300 seconds.

The STRFM_OUT and STLN_OUT pins are not connected on this board which
may cause some issues in slave mode. I could not find any documentation
about this.

Keeping the chip in master mode after the reset helped to fix this
issue for me.

Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/media/i2c/mt9v032.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index c1bc564a0979..cc16acf001de 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -349,7 +349,8 @@ static int mt9v032_power_on(struct mt9v032 *mt9v032)
 	if (ret < 0)
 		return ret;
 
-	return regmap_write(map, MT9V032_CHIP_CONTROL, 0);
+	return regmap_write(map, MT9V032_CHIP_CONTROL,
+			    MT9V032_CHIP_CONTROL_MASTER_MODE);
 }
 
 static void mt9v032_power_off(struct mt9v032 *mt9v032)
@@ -421,8 +422,7 @@ __mt9v032_get_pad_crop(struct mt9v032 *mt9v032, struct v4l2_subdev_pad_config *c
 
 static int mt9v032_s_stream(struct v4l2_subdev *subdev, int enable)
 {
-	const u16 mode = MT9V032_CHIP_CONTROL_MASTER_MODE
-		       | MT9V032_CHIP_CONTROL_DOUT_ENABLE
+	const u16 mode = MT9V032_CHIP_CONTROL_DOUT_ENABLE
 		       | MT9V032_CHIP_CONTROL_SEQUENTIAL;
 	struct mt9v032 *mt9v032 = to_mt9v032(subdev);
 	struct v4l2_rect *crop = &mt9v032->crop;
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
