Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43046 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfAHOwa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 8 Jan 2019 09:52:30 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2 06/13] media: mt9m001: introduce multi_reg_write()
Date: Tue,  8 Jan 2019 23:51:43 +0900
Message-Id: <1546959110-19445-7-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Introduce multi_reg_write() to write multiple registers to the device and
use it where possible.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
* No changes from v1

 drivers/media/i2c/mt9m001.c | 88 +++++++++++++++++++++++++++++----------------
 1 file changed, 57 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 3864d88..7ba11a8 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -47,6 +47,8 @@
 #define MT9M001_MIN_HEIGHT		32
 #define MT9M001_COLUMN_SKIP		20
 #define MT9M001_ROW_SKIP		12
+#define MT9M001_DEFAULT_HBLANK		9
+#define MT9M001_DEFAULT_VBLANK		25
 
 /* MT9M001 has only one fixed colorspace per pixelcode */
 struct mt9m001_datafmt {
@@ -137,25 +139,65 @@ static int reg_clear(struct i2c_client *client, const u8 reg,
 	return reg_write(client, reg, ret & ~data);
 }
 
+struct mt9m001_reg {
+	u8 reg;
+	u16 data;
+};
+
+static int multi_reg_write(struct i2c_client *client,
+			   const struct mt9m001_reg *regs, int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++) {
+		int ret = reg_write(client, regs[i].reg, regs[i].data);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int mt9m001_init(struct i2c_client *client)
 {
-	int ret;
+	const struct mt9m001_reg init_regs[] = {
+		/*
+		 * Issue a soft reset. This returns all registers to their
+		 * default values.
+		 */
+		{ MT9M001_RESET, 1 },
+		{ MT9M001_RESET, 0 },
+		/* Disable chip, synchronous option update */
+		{ MT9M001_OUTPUT_CONTROL, 0 }
+	};
 
 	dev_dbg(&client->dev, "%s\n", __func__);
 
-	/*
-	 * We don't know, whether platform provides reset, issue a soft reset
-	 * too. This returns all registers to their default values.
-	 */
-	ret = reg_write(client, MT9M001_RESET, 1);
-	if (!ret)
-		ret = reg_write(client, MT9M001_RESET, 0);
+	return multi_reg_write(client, init_regs, ARRAY_SIZE(init_regs));
+}
 
-	/* Disable chip, synchronous option update */
-	if (!ret)
-		ret = reg_write(client, MT9M001_OUTPUT_CONTROL, 0);
+static int mt9m001_apply_selection(struct v4l2_subdev *sd,
+				    struct v4l2_rect *rect)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct mt9m001 *mt9m001 = to_mt9m001(client);
+	const struct mt9m001_reg regs[] = {
+		/* Blanking and start values - default... */
+		{ MT9M001_HORIZONTAL_BLANKING, MT9M001_DEFAULT_HBLANK },
+		{ MT9M001_VERTICAL_BLANKING, MT9M001_DEFAULT_VBLANK },
+		/*
+		 * The caller provides a supported format, as verified per
+		 * call to .set_fmt(FORMAT_TRY).
+		 */
+		{ MT9M001_COLUMN_START, rect->left },
+		{ MT9M001_ROW_START, rect->top },
+		{ MT9M001_WINDOW_WIDTH, rect->width - 1 },
+		{ MT9M001_WINDOW_HEIGHT,
+			rect->height + mt9m001->y_skip_top - 1 },
+	};
 
-	return ret;
+	return multi_reg_write(client, regs, ARRAY_SIZE(regs));
 }
 
 static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
@@ -175,7 +217,6 @@ static int mt9m001_set_selection(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
 	struct v4l2_rect rect = sel->r;
-	const u16 hblank = 9, vblank = 25;
 	int ret;
 
 	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE ||
@@ -199,26 +240,11 @@ static int mt9m001_set_selection(struct v4l2_subdev *sd,
 	soc_camera_limit_side(&rect.top, &rect.height,
 		     MT9M001_ROW_SKIP, MT9M001_MIN_HEIGHT, MT9M001_MAX_HEIGHT);
 
-	mt9m001->total_h = rect.height + mt9m001->y_skip_top + vblank;
+	mt9m001->total_h = rect.height + mt9m001->y_skip_top +
+			   MT9M001_DEFAULT_VBLANK;
 
-	/* Blanking and start values - default... */
-	ret = reg_write(client, MT9M001_HORIZONTAL_BLANKING, hblank);
-	if (!ret)
-		ret = reg_write(client, MT9M001_VERTICAL_BLANKING, vblank);
 
-	/*
-	 * The caller provides a supported format, as verified per
-	 * call to .set_fmt(FORMAT_TRY).
-	 */
-	if (!ret)
-		ret = reg_write(client, MT9M001_COLUMN_START, rect.left);
-	if (!ret)
-		ret = reg_write(client, MT9M001_ROW_START, rect.top);
-	if (!ret)
-		ret = reg_write(client, MT9M001_WINDOW_WIDTH, rect.width - 1);
-	if (!ret)
-		ret = reg_write(client, MT9M001_WINDOW_HEIGHT,
-				rect.height + mt9m001->y_skip_top - 1);
+	ret = mt9m001_apply_selection(sd, &rect);
 	if (!ret && v4l2_ctrl_g_ctrl(mt9m001->autoexposure) == V4L2_EXPOSURE_AUTO)
 		ret = reg_write(client, MT9M001_SHUTTER_WIDTH, mt9m001->total_h);
 
-- 
2.7.4
