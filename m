From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 1/3] media: ov5640: add PIXEL_RATE control
Date: Wed, 9 Oct 2019 07:35:08 -0500
Message-ID: <20191009123510.19106-2-bparrot@ti.com>
References: <20191009123510.19106-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009123510.19106-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

Add v4l2 controls to report the pixel rates of each mode. This is
needed by some CSI2 receiver in order to perform proper DPHY
configuration.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 500d9bbff10b..b93b61baace5 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -193,6 +193,7 @@ struct ov5640_mode_info {
 
 struct ov5640_ctrls {
 	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *pixel_rate;
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -1614,6 +1615,16 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	return mode;
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
 /*
  * sensor changes between scaling and subsampling, go through
  * exposure calculation
@@ -1818,8 +1829,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 	 * All the formats we support have 16 bits per pixel, seems to require
 	 * the same rate than YUV, so we can just use 16 bpp all the time.
 	 */
-	rate = mode->vtot * mode->htot * 16;
-	rate *= ov5640_framerates[sensor->current_fr];
+	rate = ov5640_calc_pixel_rate(sensor) * 16;
 	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
 		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
 		ret = ov5640_set_mipi_pclk(sensor, rate);
@@ -2233,6 +2243,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	if (mbus_fmt->code != sensor->fmt.code)
 		sensor->pending_fmt_change = true;
 
+	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
+				 ov5640_calc_pixel_rate(sensor));
 out:
 	mutex_unlock(&sensor->lock);
 	return ret;
@@ -2657,6 +2669,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	/* we can use our own mutex for the ctrl lock */
 	hdl->lock = &sensor->lock;
 
+	/* Clock related controls */
+	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
+					      0, INT_MAX, 1,
+					      ov5640_calc_pixel_rate(sensor));
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
@@ -2704,6 +2721,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 		goto free_ctrls;
 	}
 
+	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
@@ -2816,6 +2834,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
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
