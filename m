Return-Path: <SRS0=qJz7=W2=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v10 07/14] media: tvp5150: fix set_selection rectangle handling
Date: Fri, 30 Aug 2019 12:16:39 +0200
Message-Id: <20190830101646.6530-8-m.felsch@pengutronix.de>
In-Reply-To: <20190830101646.6530-1-m.felsch@pengutronix.de>
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Currently a local copy of sel->r is made and adapted to the hardware
constraints. After the adaption the value is applied to the hardware but
the driver forgot to reflect the adapted value to the user space.

Drop the local copy and work directly on the requested rectangle
instead to fix this.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---

v10:
- new patch

 drivers/media/i2c/tvp5150.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 477a929d4f89..c1542a89e8c8 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1024,7 +1024,7 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
-	struct v4l2_rect rect = sel->r;
+	struct v4l2_rect *rect = &sel->r;
 	v4l2_std_id std;
 	int hmax;
 
@@ -1033,11 +1033,11 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	dev_dbg_lvl(sd->dev, 1, debug, "%s left=%d, top=%d, width=%d, height=%d\n",
-		__func__, rect.left, rect.top, rect.width, rect.height);
+		__func__, rect->left, rect->top, rect->width, rect->height);
 
 	/* tvp5150 has some special limits */
-	rect.left = clamp(rect.left, 0, TVP5150_MAX_CROP_LEFT);
-	rect.top = clamp(rect.top, 0, TVP5150_MAX_CROP_TOP);
+	rect->left = clamp(rect->left, 0, TVP5150_MAX_CROP_LEFT);
+	rect->top = clamp(rect->top, 0, TVP5150_MAX_CROP_TOP);
 
 	/* Calculate height based on current standard */
 	if (decoder->norm == V4L2_STD_ALL)
@@ -1055,26 +1055,26 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
 	 *  - width = 2 due to UYVY colorspace
 	 *  - height, image = no special alignment
 	 */
-	v4l_bound_align_image(&rect.width,
-			      TVP5150_H_MAX - TVP5150_MAX_CROP_LEFT - rect.left,
-			      TVP5150_H_MAX - rect.left, 1, &rect.height,
-			      hmax - TVP5150_MAX_CROP_TOP - rect.top,
-			      hmax - rect.top, 0, 0);
+	v4l_bound_align_image(&rect->width,
+			      TVP5150_H_MAX - TVP5150_MAX_CROP_LEFT - rect->left,
+			      TVP5150_H_MAX - rect->left, 1, &rect->height,
+			      hmax - TVP5150_MAX_CROP_TOP - rect->top,
+			      hmax - rect->top, 0, 0);
 
-	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect.top);
+	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect->top);
 	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
-		     rect.top + rect.height - hmax);
+		     rect->top + rect->height - hmax);
 	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
-		     rect.left >> TVP5150_CROP_SHIFT);
+		     rect->left >> TVP5150_CROP_SHIFT);
 	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
-		     rect.left | (1 << TVP5150_CROP_SHIFT));
+		     rect->left | (1 << TVP5150_CROP_SHIFT));
 	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
-		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
+		     (rect->left + rect->width - TVP5150_MAX_CROP_LEFT) >>
 		     TVP5150_CROP_SHIFT);
 	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
-		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
+		     rect->left + rect->width - TVP5150_MAX_CROP_LEFT);
 
-	decoder->rect = rect;
+	decoder->rect = *rect;
 
 	return 0;
 }
-- 
2.20.1
