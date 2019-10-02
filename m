From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 1/3] media: ov5640: add PIXEL_RATE control
Date: Wed, 2 Oct 2019 08:51:32 -0500
Message-ID: <20191002135134.12273-2-bparrot@ti.com>
References: <20191002135134.12273-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002135134.12273-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

Add v4l2 controls to report the pixel rates of each mode. This is
needed by some CSI2 receiver in order to perform proper DPHY
configuration.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 500d9bbff10b..5198dc887400 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -193,6 +193,9 @@ struct ov5640_mode_info {
 
 struct ov5640_ctrls {
 	struct v4l2_ctrl_handler handler;
+	struct {
+		struct v4l2_ctrl *pixel_rate;
+	};
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -2194,6 +2197,16 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static u64 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
+{
+	u64 rate;
+
+	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
+	rate *= ov5640_framerates[sensor->current_fr];
+
+	return rate;
+}
+
 static int ov5640_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_pad_config *cfg,
 			  struct v4l2_subdev_format *format)
@@ -2233,6 +2246,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	if (mbus_fmt->code != sensor->fmt.code)
 		sensor->pending_fmt_change = true;
 
+	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
+				 ov5640_calc_pixel_rate(sensor));
 out:
 	mutex_unlock(&sensor->lock);
 	return ret;
@@ -2657,6 +2672,13 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	/* we can use our own mutex for the ctrl lock */
 	hdl->lock = &sensor->lock;
 
+	/* Clock related controls */
+	ctrls->pixel_rate =
+		v4l2_ctrl_new_std(hdl, ops,
+				  V4L2_CID_PIXEL_RATE, 0, INT_MAX, 1,
+				  ov5640_calc_pixel_rate(sensor));
+	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
@@ -2816,6 +2838,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 		sensor->frame_interval = fi->interval;
 		sensor->current_mode = mode;
 		sensor->pending_mode_change = true;
+
+		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
+					 ov5640_calc_pixel_rate(sensor));
 	}
 out:
 	mutex_unlock(&sensor->lock);
-- 
2.17.1
