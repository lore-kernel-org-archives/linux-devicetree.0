From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch 09/13] media: am437x-vpfe: fix function trace debug log
Date: Mon, 9 Sep 2019 11:27:39 -0500
Message-ID: <20190909162743.30114-10-bparrot@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909162743.30114-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

checkpatch.pl nows reports several:
WARNING: Prefer using '"%s...", __func__' to using '<function name>',
this function's name, in a string

So fix these for the whole driver.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 70 ++++++++++-----------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index a8f6cf1d06a0..93f92097602c 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -443,8 +443,8 @@ static int vpfe_ccdc_set_params(struct vpfe_ccdc *ccdc, void __user *params)
 	x = copy_from_user(&raw_params, params, sizeof(raw_params));
 	if (x) {
 		vpfe_dbg(1, vpfe,
-			"vpfe_ccdc_set_params: error in copying ccdc params, %d\n",
-			x);
+			 "%s: error in copying ccdc params, %d\n",
+			 __func__, x);
 		return -EFAULT;
 	}
 
@@ -466,7 +466,7 @@ static void vpfe_ccdc_config_ycbcr(struct vpfe_ccdc *ccdc)
 	struct ccdc_params_ycbcr *params = &ccdc->ccdc_cfg.ycbcr;
 	u32 syn_mode;
 
-	vpfe_dbg(3, vpfe, "vpfe_ccdc_config_ycbcr:\n");
+	vpfe_dbg(3, vpfe, "%s:\n", __func__);
 	/*
 	 * first restore the CCDC registers to default values
 	 * This is important since we assume default values to be set in
@@ -598,7 +598,7 @@ static void vpfe_ccdc_config_raw(struct vpfe_ccdc *ccdc)
 	unsigned int syn_mode;
 	unsigned int val;
 
-	vpfe_dbg(3, vpfe, "vpfe_ccdc_config_raw:\n");
+	vpfe_dbg(3, vpfe, "%s:\n", __func__);
 
 	/* Reset CCDC */
 	vpfe_ccdc_restore_defaults(ccdc);
@@ -700,8 +700,8 @@ static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
 {
 	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
 
-	vpfe_dbg(1, vpfe, "vpfe_ccdc_set_pixel_format: if_type: %d, pixfmt:%s\n",
-		 ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
+	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
+		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
 
 	if (ccdc->ccdc_cfg.if_type == VPFE_RAW_BAYER) {
 		ccdc->ccdc_cfg.bayer.pix_fmt = CCDC_PIXFMT_RAW;
@@ -987,7 +987,7 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
 	enum ccdc_frmfmt frm_fmt = CCDC_FRMFMT_INTERLACED;
 	int ret = 0;
 
-	vpfe_dbg(2, vpfe, "vpfe_config_ccdc_image_format\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
 		print_fourcc(vpfe->v_fmt.fmt.pix.pixelformat));
@@ -1363,7 +1363,7 @@ static int vpfe_querycap(struct file *file, void  *priv,
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
-	vpfe_dbg(2, vpfe, "vpfe_querycap\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	strscpy(cap->driver, VPFE_MODULE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, "TI AM437x VPFE", sizeof(cap->card));
@@ -1409,7 +1409,7 @@ static int __vpfe_get_format(struct vpfe_device *vpfe,
 	format->type = vpfe->v_fmt.type;
 
 	vpfe_dbg(1, vpfe,
-		 "%s size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
+		 "%s: size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
 		 __func__, format->fmt.pix.width, format->fmt.pix.height,
 		 print_fourcc(format->fmt.pix.pixelformat),
 		 format->fmt.pix.bytesperline, format->fmt.pix.sizeimage, *bpp);
@@ -1425,7 +1425,7 @@ static int __vpfe_set_format(struct vpfe_device *vpfe,
 	struct v4l2_subdev_format fmt;
 	int ret;
 
-	vpfe_dbg(2, vpfe, "__vpfe_set_format\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	sdinfo = vpfe->current_subdev;
 	if (!sdinfo->sd)
@@ -1459,7 +1459,7 @@ static int vpfe_g_fmt(struct file *file, void *priv,
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
-	vpfe_dbg(2, vpfe, "vpfe_g_fmt\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	*fmt = vpfe->v_fmt;
 
@@ -1473,8 +1473,7 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 	struct vpfe_subdev_info *sdinfo;
 	struct vpfe_fmt *fmt;
 
-	vpfe_dbg(2, vpfe, "vpfe_enum_format index:%d\n",
-		f->index);
+	vpfe_dbg(2, vpfe, "%s: index:%d\n", __func__, f->index);
 
 	sdinfo = vpfe->current_subdev;
 	if (!sdinfo->sd)
@@ -1487,8 +1486,8 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 
 	f->pixelformat = fmt->fourcc;
 
-	vpfe_dbg(1, vpfe, "vpfe_enum_format: mbus index: %d code: %x pixelformat: %s\n",
-		 f->index, fmt->code, print_fourcc(fmt->fourcc));
+	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: %s\n",
+		 __func__, f->index, fmt->code, print_fourcc(fmt->fourcc));
 
 	return 0;
 }
@@ -1499,7 +1498,7 @@ static int vpfe_try_fmt(struct file *file, void *priv,
 	struct vpfe_device *vpfe = video_drvdata(file);
 	unsigned int bpp;
 
-	vpfe_dbg(2, vpfe, "vpfe_try_fmt\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	return __vpfe_get_format(vpfe, fmt, &bpp);
 }
@@ -1513,7 +1512,7 @@ static int vpfe_s_fmt(struct file *file, void *priv,
 	unsigned int bpp;
 	int ret;
 
-	vpfe_dbg(2, vpfe, "vpfe_s_fmt\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	/* If streaming is started, return error */
 	if (vb2_is_busy(&vpfe->buffer_queue)) {
@@ -1567,7 +1566,7 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 	const struct vpfe_fmt *fmt;
 	int ret;
 
-	vpfe_dbg(2, vpfe, "vpfe_enum_size\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	/* check for valid format */
 	fmt = find_format_by_pix(vpfe, fsize->pixel_format);
@@ -1601,17 +1600,17 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 	if (ret)
 		return -EINVAL;
 
-	vpfe_dbg(1, vpfe, "vpfe_enum_size: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
-		fse.index, fse.code, fse.min_width, fse.max_width,
+	vpfe_dbg(1, vpfe, "%s: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
+		__func__, fse.index, fse.code, fse.min_width, fse.max_width,
 		fse.min_height, fse.max_height);
 
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
 	fsize->discrete.width = fse.max_width;
 	fsize->discrete.height = fse.max_height;
 
-	vpfe_dbg(1, vpfe, "vpfe_enum_size: index: %d pixformat: %s size: %dx%d\n",
-		fsize->index, print_fourcc(fsize->pixel_format),
-		fsize->discrete.width, fsize->discrete.height);
+	vpfe_dbg(1, vpfe, "%s: index: %d pixformat: %4.4s size: %dx%d\n",
+		 __func__, fsize->index, (char *)&fsize->pixel_format,
+		 fsize->discrete.width, fsize->discrete.height);
 
 	return 0;
 }
@@ -1676,7 +1675,7 @@ static int vpfe_enum_input(struct file *file, void *priv,
 	struct vpfe_subdev_info *sdinfo;
 	int subdev, index;
 
-	vpfe_dbg(2, vpfe, "vpfe_enum_input\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	if (vpfe_get_subdev_input_index(vpfe, &subdev, &index,
 					inp->index) < 0) {
@@ -1694,7 +1693,7 @@ static int vpfe_g_input(struct file *file, void *priv, unsigned int *index)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
-	vpfe_dbg(2, vpfe, "vpfe_g_input\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	return vpfe_get_app_input_index(vpfe, index);
 }
@@ -1708,7 +1707,7 @@ static int vpfe_set_input(struct vpfe_device *vpfe, unsigned int index)
 	u32 input, output;
 	int ret;
 
-	vpfe_dbg(2, vpfe, "vpfe_set_input: index: %d\n", index);
+	vpfe_dbg(2, vpfe, "%s: index: %d\n", __func__, index);
 
 	/* If streaming is started, return error */
 	if (vb2_is_busy(&vpfe->buffer_queue)) {
@@ -1765,8 +1764,7 @@ static int vpfe_s_input(struct file *file, void *priv, unsigned int index)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
-	vpfe_dbg(2, vpfe,
-		"vpfe_s_input: index: %d\n", index);
+	vpfe_dbg(2, vpfe, "%s: index: %d\n", __func__, index);
 
 	return vpfe_set_input(vpfe, index);
 }
@@ -1776,7 +1774,7 @@ static int vpfe_querystd(struct file *file, void *priv, v4l2_std_id *std_id)
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct vpfe_subdev_info *sdinfo;
 
-	vpfe_dbg(2, vpfe, "vpfe_querystd\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	sdinfo = vpfe->current_subdev;
 	if (!(sdinfo->inputs[0].capabilities & V4L2_IN_CAP_STD))
@@ -1793,7 +1791,7 @@ static int vpfe_s_std(struct file *file, void *priv, v4l2_std_id std_id)
 	struct vpfe_subdev_info *sdinfo;
 	int ret;
 
-	vpfe_dbg(2, vpfe, "vpfe_s_std\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	sdinfo = vpfe->current_subdev;
 	if (!(sdinfo->inputs[0].capabilities & V4L2_IN_CAP_STD))
@@ -1826,7 +1824,7 @@ static int vpfe_g_std(struct file *file, void *priv, v4l2_std_id *std_id)
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct vpfe_subdev_info *sdinfo;
 
-	vpfe_dbg(2, vpfe, "vpfe_g_std\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	sdinfo = vpfe->current_subdev;
 	if (sdinfo->inputs[0].capabilities != V4L2_IN_CAP_STD)
@@ -1845,7 +1843,7 @@ static void vpfe_calculate_offsets(struct vpfe_device *vpfe)
 {
 	struct v4l2_rect image_win;
 
-	vpfe_dbg(2, vpfe, "vpfe_calculate_offsets\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	vpfe_ccdc_get_image_window(&vpfe->ccdc, &image_win);
 	vpfe->field_off = image_win.height * image_win.width;
@@ -2047,7 +2045,7 @@ static int vpfe_g_pixelaspect(struct file *file, void *priv,
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
-	vpfe_dbg(2, vpfe, "vpfe_g_pixelaspect\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
 	    vpfe->std_index >= ARRAY_SIZE(vpfe_standards))
@@ -2152,7 +2150,7 @@ static long vpfe_ioctl_default(struct file *file, void *priv,
 	struct vpfe_device *vpfe = video_drvdata(file);
 	int ret;
 
-	vpfe_dbg(2, vpfe, "vpfe_ioctl_default\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	if (!valid_prio) {
 		vpfe_err(vpfe, "%s device busy\n", __func__);
@@ -2264,7 +2262,7 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
 	bool found = false;
 	int i, j, k;
 
-	vpfe_dbg(1, vpfe, "vpfe_async_bound\n");
+	vpfe_dbg(1, vpfe, "%s:\n", __func__);
 
 	for (i = 0; i < ARRAY_SIZE(vpfe->cfg->asd); i++) {
 		if (vpfe->cfg->asd[i]->match.fwnode ==
@@ -2597,7 +2595,7 @@ static int vpfe_remove(struct platform_device *pdev)
 {
 	struct vpfe_device *vpfe = platform_get_drvdata(pdev);
 
-	vpfe_dbg(2, vpfe, "vpfe_remove\n");
+	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.17.1
